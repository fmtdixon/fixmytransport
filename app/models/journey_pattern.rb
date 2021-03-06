class JourneyPattern < ActiveRecord::Base
  belongs_to :route
  # virtual attribute used for adding new journey patterns
  attr_accessor :_add
  has_many :route_segments, :order => 'segment_order asc', :dependent => :destroy
  accepts_nested_attributes_for :route_segments, :allow_destroy => true, :reject_if => :route_segment_invalid

  has_paper_trail

  def route_segment_invalid(attributes)
    (attributes['_add'] != "1" and attributes['_destroy'] != "1") or \
    attributes['from_stop_id'].blank? or attributes['to_stop_id'].blank?
  end

  def stop_list()
    stops = []
    route_segments.each do |route_segment|
      stops << route_segment.from_stop unless stops.last == route_segment.from_stop
      stops << route_segment.to_stop
    end
    stops
  end

  def identical_segments?(other)
    route_segments.all? do |route_segment|
      other.route_segments.detect do |other_segment|
        other_segment.from_stop == route_segment.from_stop &&
        other_segment.to_stop == route_segment.to_stop &&
        other_segment.from_terminus == route_segment.from_terminus &&
        other_segment.to_terminus == route_segment.to_terminus &&
        other_segment.segment_order == route_segment.segment_order
      end
    end
  end

end