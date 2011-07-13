require 'spec_helper'
require 'digest'

describe ProblemsController do

  describe 'GET #frontpage' do 
    
    def make_request(params={})
      get :frontpage, params
    end  
    
    describe 'when the app is in closed beta' do 
      
      before do 
        @controller.stub!(:app_status).and_return('closed_beta')
        MySociety::Config.stub!(:get).with('BETA_USERNAME', 'username').and_return('username')
        MySociety::Config.stub!(:get).with('BETA_PASSWORD', 'password').and_return(Digest::MD5.hexdigest('password'))
      end
      
      describe 'if the user has not authenticated with the beta credentials' do
        
        describe 'if the "beta" param is passed' do   
         
         it 'should challenge the user for beta credentials' do 
           make_request(:beta => 1)
           response.status.should == "401 Unauthorized"
           response.headers['WWW-Authenticate'].should == 'Basic realm="Closed Beta"'
         end
         
        end
        
        describe 'if the beta param is not passed' do 
        
           it 'should show the "beta" template' do 
            make_request
            response.status.should == '200 OK'
            response.should render_template('problems/beta')
           end
           
        end
        
      end
    
      describe 'if the user has authenticated with the beta credentials' do 
      
        it 'should show the frontpage template' do 
          @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("username:password")
          make_request
          response.status.should == '200 OK'
          response.should render_template('problems/frontpage')
        end
      end
      
    end
    
  end
  
  describe 'GET #issues_index' do 
      
    def make_request
      get :issues_index
    end
    
    describe 'when the app is in closed beta' do 

      before do 
        @controller.stub!(:app_status).and_return('closed_beta')
      end
      
      it 'should require http authentication' do 
        make_request
        response.status.should == '401 Unauthorized'
      end
    
    end
    
    it 'should render the issues_index template' do 
      make_request
      response.should render_template('issues_index')
    end
    
    it 'should ask for recent issues' do 
      Problem.should_receive(:find_recent_issues).and_return([])
      make_request
    end
  
  end
  
  
  describe 'GET #show' do 
  
    def make_request(params={})
      get :show, params
    end
    
    it 'should look for a visible problem with the id passed' do 
      visible_problems = mock('visible problems')
      mock_problem = mock_model(Problem, :location => mock_model(Stop, :points => []),
                                         :to_i => 22)
      @controller.stub!(:map_params_from_location)
      Problem.should_receive(:visible).and_return(visible_problems)
      visible_problems.should_receive(:find).with('22').and_return(mock_problem)
      make_request(:id => "22")
    end
  
  end
  
  describe "GET #find_train_route" do 
  
    def make_request(params={})
      get :find_train_route, params
    end
  
    before do 
      @mock_route = mock_model(Route, :region => mock_model(Region, :name => 'Great Britain'))
    end
    
    describe 'when the "to" or "from" param is present but empty' do 
    
      it 'should render the "find_train_route" template' do 
        make_request({:to => '', :from => ''})
        response.should render_template("find_train_route")
      end
      
      it 'should display an error message' do 
        make_request({:to => '', :from => ''})
        expected_message = 'Please enter the names of the stations where you got on and off the train.'
        assigns[:error_messages][:base].should == [expected_message]
      end
      
    end
    
    describe 'when the "to" and "from" params are supplied' do
    
      before do 
        @sub_route = mock_model(SubRoute, :type => SubRoute)
        SubRoute.stub!(:make_sub_route).and_return(@sub_route)
      end
    
      it 'should ask the gazetteer for routes' do 
        Gazetteer.should_receive(:train_route_from_stations).and_return({:routes => [], 
                                                                         :from_stops => [],
                                                                         :to_stops => []})
        make_request({:to => "london euston", :from => 'birmingham new street'})
      end
      
      describe 'when no errors are returned' do 

        before do 
          @from_stop = mock_model(StopArea, :name => 'London Euston')
          @to_stop = mock_model(StopArea, :name => 'Birmingham New Street')
          RouteSubRoute.stub!(:create!).and_return(true)
          @transport_mode = mock_model(TransportMode)
          TransportMode.stub!(:find).and_return(@transport_mode)
          Gazetteer.stub!(:train_route_from_stations).and_return(:routes => [@mock_route, @mock_route],
                                                                 :from_stops => [@from_stop],
                                                                 :to_stops => [@to_stop])
        end
        
        it 'should find or create a sub-route for the stations' do 
          SubRoute.should_receive(:make_sub_route).with(@from_stop, @to_stop, @transport_mode, [@mock_route, @mock_route])
          make_request({:to => "london euston", :from => 'birmingham new street'})
        end
        
        it 'should redirect to the new problem URL, passing the sub-route ID and type' do 
          make_request({:to => "london euston", :from => 'birmingham new street'})
          response.should redirect_to(new_problem_url(:location_id => @sub_route.id, :location_type => 'SubRoute'))
        end
        
      end
      
    end
    
  end
  
  describe "GET #find_bus_route" do 
  
    def make_request(params={})
      get :find_bus_route, params
    end
    
    describe 'when a route_number parameter is not supplied' do 
  
      it 'should render the template "find_bus_route"' do 
        make_request
        response.should render_template('find_bus_route')
      end
  
    end
    
    describe 'when a route_number parameter is supplied' do 
      
      it 'should ask the gazetteer for up to ten routes from the route_number and area' do 
        Gazetteer.should_receive(:bus_route_from_route_number).with('C10', 
                                                                    'London', 
                                                                    10, 
                                                                    ignore_area=false,
                                                                    area_type=nil).and_return({ :routes => [] })
        make_request(:route_number => 'C10', :area => 'London')
      end
      
    end
    
    describe 'when the gazetteer finds multiple routes' do 
    
      before do 
        @mock_route = mock_model(Route, :show_as_point= => true, 
                                        :show_as_point => true,
                                        :lat => 51.1,
                                        :lon => 0.1)
        Gazetteer.stub!(:bus_route_from_route_number).and_return({ :routes => [@mock_route, @mock_route]})
      end
    
      it 'should show the choose route template' do 
        make_request(:route_number => 'C10', :area => 'London')
        response.should render_template("choose_route")
      end
      
      describe 'if there is an error' do 
      
        it 'should pass an appropriate error message to the template' do 
          Gazetteer.stub!(:bus_route_from_route_number).and_return( { :routes => [@mock_route, @mock_route], 
                                                                      :error => :postcode_not_found })
          make_request(:route_number => 'C10', :area => 'London')
          assigns[:error_message].should == "The postcode you entered wasn't recognised. Please modify it and try again!"
        end
      
      end
    
      it 'should set the "display as point" flag on each route' do
        @mock_route.should_receive(:show_as_point=).with(true).exactly(2).times
        make_request(:route_number => 'C10', :area => 'London')
      end
      
      it 'should set the map params from the routes' do 
        @controller.should_receive(:map_params_from_location).with([@mock_route, @mock_route], find_other_locations=false)
        make_request(:route_number => 'C10', :area => 'London')
      end
      
    end
    
  end
  
  describe "GET #find_stop" do 
  
    def make_request(params={})
      get :find_stop, params
    end
    
    describe 'when a name parameter is not supplied' do 
      
      it 'should render the template "find_stop"' do 
        make_request
        response.should render_template('find_stop')
      end
      
    end
    
    describe 'when a name parameter is supplied' do 
      
      it 'should ask the Gazetteer for a place from the name' do 
        Gazetteer.should_receive(:place_from_name).with('Euston', nil).and_return({})
        make_request({:name => 'Euston'})
      end
      
      describe 'when localities are returned by the gazetteer' do 
                
        describe 'when there is only one locality returned' do 
        
          before do
            @mock_locality = mock_model(Locality, :lat => 51.1, :lon => 0.01)
            Gazetteer.stub!(:place_from_name).and_return({:localities => [@mock_locality]})
          end
            
          it 'should set map params based on the locality' do 
            @controller.should_receive(:map_params_from_location).with([@mock_locality], 
                                                                        find_other_locations=true,
                                                                        LARGE_MAP_HEIGHT,
                                                                        LARGE_MAP_WIDTH)
            make_request({:name => 'Euston'})
          end
        
          it 'should set the list of primary locations to display to empty' do 
            make_request({:name => 'Euston'})
            assigns[:locations].should == []
          end
    
          it 'should render the "choose_location" template' do 
            make_request({:name => 'Euston'})
            response.should render_template('problems/choose_location')
          end
        
        end
        
        describe 'when there is more than one locality returned' do 
          
          before do 
            @mock_locality = mock_model(Locality, :lat => 51.1, :lon => 0.01)
            Gazetteer.stub!(:place_from_name).and_return({:localities => [@mock_locality, @mock_locality]})
          end
          
          it 'should render the "choose_locality" template' do 
            make_request({:name => 'Euston'})
            response.should render_template('choose_locality')
          end
          
          it 'should assign the localities for the view' do 
            make_request({:name => 'Euston'})
            assigns[:localities].should == [@mock_locality, @mock_locality]
          end
        
        end
        
        describe 'when locations are returned by the gazetteer' do 
          
          before do 
            @mock_stop = mock_model(Stop, :lat => 51.1, :lon => 0.01)
            Gazetteer.stub!(:place_from_name).and_return({:locations => [@mock_stop]})
          end
          
          it 'should set the map params based on the locations' do 
            @controller.should_receive(:map_params_from_location).with([@mock_stop], 
                                                                       find_other_locations=true,
                                                                       LARGE_MAP_HEIGHT,
                                                                       LARGE_MAP_WIDTH)
            make_request({:name => 'Euston'})
          end
          
          it 'should set the list of primary locations to display to the locations' do 
            make_request({:name => 'Euston'})
            assigns[:locations].should == [@mock_stop]
          end
          
          it 'should render the "choose_location" template' do 
            make_request({:name => 'Euston'})
            response.should render_template('choose_location')
          end
          
        end
        
        describe 'when the gazeteer returns postcode information' do 
        
          describe 'when the postcode information includes an error' do 
         
            before do 
              Gazetteer.stub!(:place_from_name).and_return({:postcode_info => {:error => :bad_request }})
            end
            
            it 'should render the "find_stop" template' do 
              make_request({:name => 'ZZ9 9ZZ'})
              response.should render_template('find_stop')
            end
             
            it 'should display an appropriate error message' do 
              make_request({:name => 'ZZ9 9ZZ'})
              assigns[:error_message].should == "That postcode wasn't recognised. Please modify it and try again!"
            end

          end
          
          describe 'when the postcode information includes a lat value' do 
            
            before do 
              Gazetteer.stub!(:place_from_name).and_return({:postcode_info => {:lat => 51.1, 
                                                                               :lon => 0.10, 
                                                                               :zoom => 15}})
            end
            
            it 'should assign the lat, lon and zoom for the view based on the postcode info' do 
              make_request({:name => 'ZZ9 9ZZ'})
              assigns[:lat].should == 51.1
              assigns[:lon].should == 0.10
              assigns[:zoom].should == 15
            end
            
            it 'should assign the list of primary locations to display to empty' do 
              make_request({:name => 'ZZ9 9ZZ'})
              assigns[:locations].should == []              
            end
            
            it 'should set the other locations based on the lat lon and zoom for the postcode' do 
              mock_location = mock('location')
              Map.should_receive(:other_locations).with(51.1, 0.10, 15, LARGE_MAP_HEIGHT, LARGE_MAP_WIDTH).and_return([mock_location])
              make_request({:name => 'ZZ9 9ZZ'})
              assigns[:other_locations].should == [mock_location]
            end
            
            it 'should ask the view to find other locations' do 
              make_request({:name => 'ZZ9 9ZZ'})
              assigns[:find_other_locations].should be_true
            end
            
            it 'should render the "choose_locations" template' do 
              make_request({:name => 'ZZ9 9ZZ'})
              response.should render_template("problems/choose_location")
            end
            
          end
        end
        
      end
      
    end

  end
  
  describe "POST #create" do 

    before do 
      @stop = mock_model(Stop, :points => [mock_model(Stop, :lat => 50, :lon => 0)])
      @mock_user = mock_model(User)
      @mock_problem = mock_model(Problem, :valid? => true, 
                                          :save => true, 
                                          :save_reporter => true,
                                          :location => @stop,
                                          :reporter => @mock_user, 
                                          :confirm! => true,
                                          :campaign => nil,
                                          :status= => true,
                                          :subject => nil, 
                                          :description => nil, 
                                          :location_id => nil, 
                                          :location_type => nil,
                                          :category => nil,
                                          :operator_id => nil, 
                                          :passenger_transport_executive_id => nil, 
                                          :council_info => nil,
                                          :is_campaign= => true, 
                                          :is_campaign => '0',
                                          :errors => [],
                                          :create_assignments => true)
      Problem.stub!(:new).and_return(@mock_problem)
      @mock_assignment = mock_model(Assignment)
      @controller.stub!(:setup_problem_advice)
      Assignment.stub!(:create_assignments).and_return(@mock_assignment)
      @problem_attributes = { "location_id" => 55, "location_type" => 'Stop' }
      @default_params = { :problem => @problem_attributes }
    end
    
    def make_request(params=@default_params)
      post :create, params
    end
    
    it 'should create a new problem using the attributes passed to it' do 
      Problem.should_receive(:new).with(@problem_attributes)
      make_request
    end
    
    it 'should set the status of the problem to :new' do 
      @mock_problem.should_receive(:status=).with(:new)
      make_request
    end
    

    describe 'if the problem is not valid' do
    
      before do
        @mock_problem.stub!(:valid?).and_return(false)
        @mock_problem.stub!(:errors).and_return([[:text, "Please enter some text"]])
      end
      
      describe 'if the request asks for HTML' do 
        
        it 'should render the "new" template' do 
          make_request
          response.should render_template('problems/new')
        end
        
      end
      
      describe 'if the request asks for JSON' do 
      
        it 'should return a JSON hash with the success key set to false' do 
          make_request(@default_params.merge(:format => 'json'))
          JSON.parse(response.body)['success'].should == false
        end
        
        it 'should return a JSON hash with the errors key populated' do 
          make_request(@default_params.merge(:format => 'json'))
          JSON.parse(response.body)['errors'].should == {'text' => 'Please enter some text'}
        end
        
      end
    
    end
    
    describe 'if the problem is valid' do
    
      describe 'if there is no logged in user' do 
      
        it 'should save the problem data to the session' do 
          @controller.should_receive(:data_to_string)
          make_request
        end
      
        describe 'if the request asks for HTML' do
        
          it 'should show a notice asking the user to login' do 
            make_request
            flash[:notice].should == 'Please create an account to finish reporting your problem.'
          end
        
          it 'should redirect to the login URL' do 
            make_request
            response.should redirect_to(login_url)
          end
        
        end
      
        describe 'if the request asks for JSON' do 
      
          it 'should return a hash with the success key set to true' do 
            make_request(@default_params.merge(:format => 'json'))
            JSON.parse(response.body)['success'].should == true
          end
        
          it 'should return a hash with the requires_login key set to true' do 
            make_request(@default_params.merge(:format => 'json'))
            JSON.parse(response.body)['requires_login'].should == true
          end
        
          it 'should return a hash with the notice key set to a message asking the user to login' do
            make_request(@default_params.merge(:format => 'json'))
            JSON.parse(response.body)['notice'].should == 'Please create an account to finish reporting your problem.'
          end

        end
    
      end
    
      describe 'if there is a logged in user' do 
      
        before do 
          @controller.stub!(:current_user).and_return(@mock_user)
        end
        
        it 'should try to save the problem if it is valid' do 
          @mock_problem.should_receive(:save)
          make_request
        end
       
        describe 'if the request asks for HTML' do

          it 'should redirect to the problem conversion url' do 
            make_request
            response.should redirect_to(convert_problem_url(@mock_problem))
          end
      
        end
      
        describe 'if the request asks for JSON' do 
        
          it 'should return a hash with the success key set to true' do 
            make_request(@default_params.merge(:format => 'json'))
            JSON.parse(response.body)['success'].should == true
          end
        
          it 'should return a hash with the redirect set to the problem conversion url' do 
            make_request(@default_params.merge(:format => 'json'))
            JSON.parse(response.body)['redirect'].should == convert_problem_url(@mock_problem)
          end
        
        end
          
      end

    end
  end

  describe 'GET #add_comment' do 
    
    before do
      @mock_problem = mock_model(Problem, :visible? => true)
      Problem.stub!(:find).and_return(@mock_problem)
      @mock_user = mock_model(User)
      @controller.stub!(:current_user).and_return(@mock_user)
    end

    def make_request(params=nil)
      params = { :id => 55 } if !params
      get :add_comment, params
    end

    it 'should render the template "add_comment"' do
      make_request
      response.should render_template('shared/add_comment')
    end

  end
  
  describe 'POST #add_comment' do 
    
    before do
      @mock_user = mock_model(User)
      @mock_problem = mock_model(Problem, :visible? => true)
      Problem.stub!(:find).and_return(@mock_problem)
      @mock_comment = mock_model(Comment, :save => true,
                                          :valid? => true,
                                          :user= => true,
                                          :commented_id => 55,
                                          :commented_type => 'Problem',
                                          :commented => @mock_problem,
                                          :text => 'comment text',
                                          :confirm! => true,
                                          :skip_name_validation= => true,
                                          :mark_fixed => true, 
                                          :mark_open => true,
                                          :status= => true)
      @mock_problem.stub!(:comments).and_return(mock('comments', :build => @mock_comment))
      @expected_notice = "Please sign in or create an account to add your comment to this problem"
      @expected_redirect = problem_url(@mock_problem)
    end

    def make_request params
      post :add_comment, params
    end
    
    def default_params
      { :id => 55,
        :comment => { :commentable_id => 55,
                      :commentable_type => 'Problem'} }
    end
    
    it_should_behave_like "an action that receives a POSTed comment"
    
  end
  
  
  describe '#GET convert' do 
    
    def make_request(params=default_params)
      get :convert, params
    end
  
    def default_params
      { :id => 22 }
    end
    
    before do 
      @mock_reporter = mock_model(User)
      @mock_campaign = mock_model(Campaign)
      @mock_problem = mock_model(Problem, :campaign => @mock_campaign, 
                                          :confirm! => true, 
                                          :status => :new,
                                          :reporter => @mock_reporter,
                                          :create_new_campaign => @mock_campaign)
      Problem.stub!(:find).and_return(@mock_problem)
      
    end
    
    describe 'if the user is not the problem reporter' do 
    
      it 'should return a 404' do 
        make_request
        response.status.should == '404 Not Found'
      end
      
    end
  
    describe 'if the user is the problem reporter' do 
      
      before do 
        @controller.stub!(:current_user).and_return(@mock_reporter)
      end
      
      it 'should show the "convert" template' do 
        make_request
        response.should render_template("convert")
      end

      describe 'if the "convert" param is "yes"' do 
        
        it 'should confirm the problem' do
          @mock_problem.should_receive(:confirm!)
          make_request({:id => 22, :convert => 'yes'})
        end
        
        it 'should create a campaign for the problem' do 
          @mock_problem.should_receive(:create_new_campaign)
          make_request({:id => 22, :convert => 'yes'})
        end
        
        it 'should redirect to the campaign add details url' do 
          make_request({:id => 22, :convert => 'yes'})
          response.should redirect_to(add_details_campaign_url(@mock_campaign))
        end
        
      end
      
      describe 'if the "convert" param is "no"' do 
        
        it 'should confirm the problem' do 
          @mock_problem.should_receive(:confirm!)
          make_request({:id => 22, :convert => 'no'})
        end
        
        it 'should redirect to the problem url' do 
          make_request({:id => 22, :convert => 'no'})
          response.should redirect_to(problem_url(@mock_problem))
        end
      
      end
      
    end
  end
  
  describe 'when setting up problem advice' do 
    
    before do 
      # set up the controller and template by making a request
      get :frontpage
    end
    
    def expect_advice(mock_problem, advice)
      controller.send(:setup_problem_advice, mock_problem).should == advice
    end
  
    it 'should generate advice text for a bus/coach stop covered by a PTE' do 
      mock_pte = mock_model(PassengerTransportExecutive, :emailable? => true, 
                                                         :name => 'test PTE')      
      mock_stop = mock_model(Stop, :transport_mode_names => ['Bus', 'Coach'])
      mock_problem = mock_model(Problem, :location => mock_stop,
                                         :responsible_organizations => [mock_pte])
      expected = ["We'll then send it to <strong>test PTE</strong>. Your message will be public."].join(' ')
      expect_advice(mock_problem, expected)
    end
    
    it 'should generate advice text for a bus/coach stop with multiple uncontactable councils' do 
      mock_council_one = mock_model(Council, :emailable? => false, :name => "Test Council One")
      mock_council_two = mock_model(Council, :emailable? => false, :name => "Test Council Two")      
      mock_stop = mock_model(Stop, :transport_mode_names => ['Bus', 'Coach'])
    
      mock_problem = mock_model(Problem, :location => mock_stop, 
                                         :responsible_organizations => [mock_council_one, mock_council_two],
                                         :operators_responsible? => false)                                         
      
      expected = ["IMPORTANT: We do not yet have contact details for <strong>Test Council",
                  "One</strong> or <strong>Test Council Two</strong>, and so your message",
                  "will <strong>not be sent until an email address is found</strong>.",
                  "However, if you write a message we will a) keep it ready to send when",
                  "an email address is found and b) publish it online for others to see."].join(' ')
      expect_advice(mock_problem, expected)
    end
    
    it 'should generate advice text for a bus/coach stop with one uncontactable council' do 
      mock_council = mock_model(Council, :emailable? => false, :name => "Test Council")
      mock_stop = mock_model(Stop, :transport_mode_names => ['Bus', 'Coach'])
      mock_problem = mock_model(Problem, :location => mock_stop, 
                                         :responsible_organizations => [mock_council])
        
      expected = ["IMPORTANT: We do not yet have contact details for <strong>Test Council</strong>. Your message",
                  "will be public, but it will <strong>not be sent</strong> to Test Council. However, if you write a message",
                  "we will a) keep it ready to send when an email address is found and b) publish it online for others to see."].join(' ')
      expect_advice(mock_problem, expected)
    end
    
    it 'should generate advice text for a bus/coach stop with one contactable council' do 
      mock_council = mock_model(Council, :emailable? => true, :name => "Test Council")
      mock_stop = mock_model(Stop, :transport_mode_names => ['Bus', 'Coach'])
      mock_problem = mock_model(Problem, :location => mock_stop, 
                                         :responsible_organizations => [mock_council])
      expected = ["We'll then send it to <strong>Test Council</strong>. Your message will be public."].join(' ')
      expect_advice(mock_problem, expected)
    end
    
    it 'should generate advice text for a bus/coach stop with multiple contactable councils' do 
      mock_council_one = mock_model(Council, :emailable? => true, :name => "Test Council One")
      mock_council_two = mock_model(Council, :emailable? => true, :name => "Test Council Two")  
      mock_stop = mock_model(Stop, :transport_mode_names => ['Bus', 'Coach'])
      mock_problem = mock_model(Problem, :location => mock_stop, 
                                         :responsible_organizations => [mock_council_one, mock_council_two],
                                         :operators_responsible? => false)
      expected = ["We'll then send it to <strong>Test Council One</strong> or <strong>Test Council",
                  "Two</strong>. Your message will be public."].join(' ')
      expect_advice(mock_problem, expected)
    end
    
    it 'should generate advice text for a bus/coach stop with multiple councils, some contactable' do 
      mock_council_one = mock_model(Council, :emailable? => false, :name => "Test Council One")
      mock_council_two = mock_model(Council, :emailable? => true, :name => "Test Council Two")  
      mock_stop = mock_model(Stop, :transport_mode_names => ['Bus', 'Coach'])
      mock_problem = mock_model(Problem, :location => mock_stop,
                                         :responsible_organizations => [mock_council_one, mock_council_two],
                                         :emailable_organizations => [mock_council_two], 
                                         :unemailable_organizations => [mock_council_one],
                                         :operators_responsible? => false, 
                                         :councils_responsible? => true)
      expected = ["We'll then send it to <strong>Test Council One</strong> or <strong>Test",
                  "Council Two</strong>. Your message will be public."].join(' ')
      expect_advice(mock_problem, expected)
    end
    
    it 'should generate advice text for a bus/coach stop with no responsible organization' do 
      mock_stop = mock_model(Stop, :transport_mode_names => ['Bus', 'Coach'])
      mock_problem = mock_model(Problem, :location => mock_stop, 
                                         :responsible_organizations => [])
      expected = ["IMPORTANT: We do not yet know who is responsible for this stop. Your message",
                  "will be public, but will not be sent to the responsible organization.",
                  "However, if you write a message we will a) keep it ready to send when",
                  "the organization is found and b) publish it online for others to see."].join(' ')
      expect_advice(mock_problem, expected)
    end

    it 'should generate advice text for a sub route with no operators' do
      mock_sub_route = mock_model(SubRoute, :transport_mode_names => ['Train'])
      mock_problem = mock_model(Problem, :location => mock_sub_route, 
                                         :responsible_organizations => [])
         
      expected = ["IMPORTANT: We do not yet know who is responsible for this route. Your message",
                  "will be public, but will not be sent to the responsible organization. However, if you write",
                  "a message we will a) keep it ready to send when the organization is found",
                  "and b) publish it online for others to see."].join(' ')
      expect_advice(mock_problem, expected)
    end
        
    it 'should generate advice text for a bus route with no operators' do
      mock_route = mock_model(Route, :transport_mode_names => ['Bus'])
      mock_problem = mock_model(Problem, :location => mock_route, 
                                         :responsible_organizations => [])
        
      expected = ["IMPORTANT: We do not yet know who is responsible for this route. Your message",
                  "will be public, but will not be sent to the responsible organization. However, if you",
                  "write a message we will a) keep it ready to send when the organization is",
                  "found and b) publish it online for others to see."].join(' ')
      expect_advice(mock_problem, expected)
    end
    
    it 'should generate advice text for a bus route with multiple emailable operators' do 
      mock_operator_one = mock_model(Operator, :name => 'Test Operator One', :emailable? => true)
      mock_operator_two = mock_model(Operator, :name => 'Test Operator Two', :emailable? => true)
      mock_route = mock_model(Route, :transport_mode_names => ['Bus'])
      mock_problem = mock_model(Problem, :location => mock_route, 
                                         :responsible_organizations => [mock_operator_one, mock_operator_two],
                                         :emailable_organizations => [mock_operator_one],
                                         :unemailable_organizations => [mock_operator_two],
                                         :operators_responsible? => true)
    
    expected = ["More than one company operates this route. Your problem <strong>will be sent",
                "to the operator</strong> you select below. Your message will be public."].join(' ')
    expect_advice(mock_problem, expected)
    end
    
    it 'should generate advice text for a bus route with multiple operators, some emailable' do 
      mock_operator_one = mock_model(Operator, :name => 'Test Operator One', :emailable? => true)
      mock_operator_two = mock_model(Operator, :name => 'Test Operator Two', :emailable? => false)
      mock_route = mock_model(Route, :transport_mode_names => ['Bus'])
      mock_problem = mock_model(Problem, :location => mock_route, 
                                         :responsible_organizations => [mock_operator_one, mock_operator_two],
                                         :emailable_organizations => [mock_operator_one],
                                         :unemailable_organizations => [mock_operator_two],
                                         :operators_responsible? => true)
      expected = ["We do not yet have all the contact details for this route. If your message is for",
                  "<strong>Test Operator Two</strong>, it will be public, but it will <strong>not</strong>",
                  "be sent to them until an email address for them is found. If your problem relates to",
                  "<strong>Test Operator One</strong>, it will be sent straight away."].join(' ')
      expect_advice(mock_problem, expected)
    end
        
    it 'should generate advice text for a train station with no operators' do 
      mock_station = mock_model(Stop, :transport_mode_names => ['Train'])
      mock_problem = mock_model(Problem, :location => mock_station, 
                                         :responsible_organizations => [])
      
         
      expected = ["IMPORTANT: We do not yet know who is responsible for this station. Your message will be",
                  "public, but will not be sent to the responsible organization. However, if you write a message we will a)",
                  "keep it ready to send when the organization is found and b) publish it online for others to see."].join(' ')
      expect_advice(mock_problem, expected)
    end
    
  end
  
end