class Campaign < ActiveRecord::Base
  belongs_to :initiator, :class_name => 'User'
  has_many :campaign_supporters
  has_many :supporters, :through => :campaign_supporters, :class_name => 'User', :conditions => ['campaign_supporters.confirmed_at is not null']
  belongs_to :location, :polymorphic => true
  belongs_to :transport_mode
  has_many :assignments
  has_one :problem
  has_many :incoming_messages
  has_many :outgoing_messages
  has_many :campaign_updates
  has_many :comments, :as => :commented, :order => 'confirmed_at asc'
  has_many :campaign_events, :order => 'created_at asc'
  has_many :campaign_photos
  validates_presence_of :title, :description, :on => :update
  validates_associated :initiator, :on => :update
  cattr_reader :per_page
  delegate :transport_mode_text, :to => :problem
  accepts_nested_attributes_for :campaign_photos, :allow_destroy => true
  has_friendly_id :title,
                  :use_slug => true,
                  :strip_non_ascii => true,
                  :cache_column => 'subdomain',
                  :allow_nil => true,
                  :max_length => 16

  has_paper_trail

  @@per_page = 10

  has_status({ 0 => 'New',
               1 => 'Confirmed',
               2 => 'Successful',
               3 => 'Hidden' })
  named_scope :visible, :conditions => ["status_code in (?)", [self.symbol_to_status_code[:confirmed],
                                                               self.symbol_to_status_code[:successful]]]

  # instance methods

  # Once a slug has been generated, we'll be using it for email address generation, so it can't be regenerated
  # if the campaign title changes
  def new_slug_needed?
    (!slug? && !slug_text.blank?)
  end

  # Try to generate a string that will make a better slug than the title itself, falling 
  # back to the title on failure
  def short_title
    short_title = []
    character_count = 0
    stop_words = ['the', 'in', 'a', 'an', 'of', 'at', 'this']
    title.split(" ").each do |word|
      if character_count + word.size + short_title.size <= 16
        if !stop_words.include?(word)
          short_title << word
          character_count += word.size
        end 
      else 
        break
      end
    end
    short_title = short_title.join(" ")
    if short_title.blank?
      return title
    else
      return short_title
    end
  end

  def confirm
    return unless self.status == :new
    self.status = :confirmed
    self.confirmed_at = Time.now
  end

  def visible?
    [:confirmed, :successful].include?(self.status)
  end

  def editable?
    [:new, :confirmed, :successful].include?(self.status)
  end

  def supporter_count
    campaign_supporters.confirmed.count
  end
  
  def recommended_assignments
    priority_assignments = ['find_transport_organization', 
                            'find_transport_organization_contact_details']
    recommended_assignments =  self.assignments.select do |assignment| 
      assignment.status == :new && priority_assignments.include?(assignment.task_type)
    end
    recommended_assignments
  end

  def assignments_with_contacts
    assignments_with_contacts = self.assignments.select do |assignment|
      assignment.status == :new && assignment.task_type == 'write_to_other'
    end
    assignments_with_contacts
  end

  def responsible_org_descriptor
    if problem.operators_responsible?
      if problem.operator
        problem.operator.name
      else
        "the operator of the #{problem.location.description}"
      end
    elsif problem.pte_responsible?
      problem.passenger_transport_executive.name
    elsif problem.councils_responsible?
      problem.responsible_organizations.map{ |org| org.name }.to_sentence
    end
  end

  def add_supporter(user, supporter_confirmed=false, token=nil)
    if ! supporters.include?(user)
      supporter_attributes = { :supporter => user }
      if supporter_confirmed
        supporter_attributes[:confirmed_at] = Time.now
      end
      campaign_supporter = campaign_supporters.create!(supporter_attributes)
      if token
        campaign_supporter.update_attributes(:token => token)
      end
      return campaign_supporter
    end
  end

  def call_to_action
    "Please help me persuade #{responsible_org_descriptor} to #{title}"
  end
  
  def short_call_to_action
    "Campaign to #{title}"
  end
  
  def supporter_call_to_action
    "I just joined the campaign to persuade #{responsible_org_descriptor} to #{title}"
  end
  
  def add_comment(user, text, comment_confirmed=false, token=nil)
    comment = comments.build(:text => text,
                             :user => user)
    comment.status = :new
    comment.save
    if comment_confirmed
      comment.confirm!
    end
    if token
      comment.update_attributes(:token => token)
    end
    comment
  end

  def remove_supporter(user)
    if supporters.include?(user)
      supporters.delete(user)
    end
  end

  def to_param
    (subdomain && !subdomain_changed?) ? subdomain : id.to_s
  end

  def domain
    return "#{subdomain}.#{Campaign.email_domain}"
  end

  def valid_local_parts
    [initiator.email_local_part]
  end

  def get_recipient(email_address)
    initiator
  end

  def write_mail_conf
    return false unless subdomain
    local_user = MySociety::Config.get('INCOMING_EMAIL_LOCAL_USER', 'incoming@localhost')
    base_domain = MySociety::Config.get('INCOMING_EMAIL_BASE_DOMAIN', 'localhost')
    virtual_domain_file = File.join(Campaign.mail_conf_staging_dir, domain)
    File.open(virtual_domain_file, 'w') do |mail_config_file|
      hostname = `hostname`
      mail_config_file.write("#DO NOT EDIT: Autogenerated by FixMyTransport: #{hostname.chomp} #{__FILE__}\n")
      valid_local_parts.each do |local_part|
        mail_config_file.write("#{local_part}:\t#{local_user}@#{base_domain}\n")
      end
    end
  end

  def existing_recipients
    problem.recipients.select{ |recipient| ! recipient.deleted? }
  end

  # get an array of assignments for the 'write-to-other' assignments
  # associated with this campaign
  def write_to_other_assignments
    assignments.find(:all, :conditions => ['task_type_name = ?', 'write-to-other'])
  end

  # class methods

  def self.mail_conf_staging_dir
    dir = "#{RAILS_ROOT}/data/mail_conf"
    FileUtils.mkdir_p(dir)
  end

  # Synchronize the local mail_conf dir with the live mail conf dirs
  # on the mail servers
  def self.sync_mail_confs
    find(:all).each{ |campaign| campaign.write_mail_conf }
    mail_conf_live_dir = MySociety::Config.get('MAIL_CONF_LIVE_DIR', 'data/mail_conf')
    mailservers = MySociety::Config.get('MAILSERVERS', '').split('|').compact
    mailservers.each do |mailserver|
      system("rsync -r #{mail_conf_staging_dir}/ #{mailserver}:#{mail_conf_live_dir}")
    end
  end

  def self.find_by_campaign_email(email)
    local_part, domain = email.split("@")
    subdomain = domain.gsub(/\.#{email_domain}$/, '')
    campaign = find(:first, :conditions => ['subdomain = ?', subdomain])
  end

  def self.email_domain
    MySociety::Config.get('INCOMING_EMAIL_DOMAIN', 'localhost')
  end

  def self.find_by_subdomain(subdomain)
    find(:first, :conditions => ['lower(subdomain) = ?', subdomain.downcase])
  end

  def self.find_recent(number, options={})
    visible.find(:all, :order => 'latest_event_at desc',
                       :limit => number,
                       :include => [:location, :initiator, :campaign_events],
                       :offset => options[:offset])
  end


end
