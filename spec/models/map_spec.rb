require 'spec_helper'

describe Map do
  
  it 'should give the lat of the top of a map correctly for an example value at zoom level 17' do 
    Map.top(51.5010403096676, 17, MAP_HEIGHT).should be_close(51.5023761971862, 0.0000000001)
  end 
  
  it 'should give the lat of the bottom of a map correctly for an example value at zoom level 17' do 
    Map.bottom(51.5010403096676, 17, MAP_HEIGHT).should be_close(51.4997047151851, 0.0000000001)
  end
  
  it 'should give the long of the left edge of a map correctly for an example value at zoom level 17' do 
    Map.left(-0.0914398192630478, 17, MAP_WIDTH).should be_close(-0.0935856252908707, 0.0000000001)
  end
  
  it 'should give the long of the right edge of a map correctly for an example value at zoom level 17' do 
    Map.right(-0.0914398192630478, 17, MAP_WIDTH).should be_close(-0.0892940908670425, 0.0000000001)
  end
  
  it 'should give the correct zoom level for some example coords' do
    Map.zoom_to_coords(-0.0914398192630478, -0.0888722778623277, 51.5057200938463, 51.5010403096676, MAP_HEIGHT, MAP_WIDTH).should == 16
  end
  
  it 'should give the correct zoom level for some example coords very close to each other' do
    Map.zoom_to_coords(-1.55394, -1.55371, 52.51866, 52.51869, MAP_HEIGHT, MAP_WIDTH).should == 16
  end
  
  it 'should give the max visible zoom level if the real zoom level for the coords is higher than the max visible level' do
    Map.zoom_to_coords(-0.09144, -0.09028, 51.50104, 51.50098, MAP_HEIGHT, MAP_WIDTH).should == MAX_VISIBLE_ZOOM
  end
  
  describe 'when asked for issue data' do 
  
    before do 
      @coords = { :bottom => 51.50098, 
                  :left => -0.09144, 
                  :top => 51.50104, 
                  :right => -0.09028 }
      @options = { :lat => 51.50100, 
                   :lon => -0.09100, 
                   :zoom => 16, 
                   :map_height => 300,
                   :map_width => 300 }
    end
    
    it 'should get issues in the bounding box' do
      Problem.should_receive(:find_issues_in_bounding_box).with(@coords).and_return({ :locations => [], 
                                                                                      :issues => [] })
      
      Map.issue_data(@coords, @options)
    end
    
    describe 'when there are less than ten issues in the bounding box' do 
      
      it 'should ask for nearest issues, passing the distance from the center to the corner of a map twice the size and the ids of any problems to exclude' do 
        problem = mock_model(Problem)
        Problem.stub!(:find_issues_in_bounding_box).and_return({ :locations => [], 
                                                                 :issues => [problem, problem, problem],
                                                                 :problem_ids => [33,44,55]})
        expected_params = [@options[:lat], @options[:lon], 0.6,  { :exclude_ids => [33,44,55] }]
        Problem.should_receive(:find_nearest_issues).with(*expected_params).and_return({ :issues => [], 
                                                                                         :distance => nil })
        Map.issue_data(@coords, @options)
      end
      
    end
    
  end
  
  describe 'when asked for other locations' do 

    describe 'when the current zoom level is >= the minimum zoom level for showing other markers' do 
    
      describe 'if no highlight param is passed' do 
    
        it 'should ask for stops and stop areas in the bounding box passing an empty list of ids to exclude' do 
          expected_options = { :exclude_ids => [] }
          expected_params = [anything(), expected_options]
          [Stop, StopArea].each do |model|
            model.should_receive(:find_in_bounding_box).with(*expected_params).and_return([])
          end
          Map.other_locations(51.505720, -0.088872, MIN_ZOOM_FOR_OTHER_MARKERS, MAP_HEIGHT, MAP_WIDTH)
        end
      
      end
      
      describe 'if a highlight param is passed' do 
      
        it 'should ask for issues ' do 
          Map.should_receive(:issue_data).and_return({:locations => [],
                                                      :issues => [], 
                                                      :stop_ids => [22], 
                                                      :stop_area_ids => [44]})
          Map.other_locations(51.505720, -0.088872, MIN_ZOOM_FOR_OTHER_MARKERS, MAP_HEIGHT, MAP_WIDTH, highlight=:has_content)
        end
      
        it 'should ask for stops and stop areas in the bounding box, passing a list of ids to exclude from the issues' do 
          Map.stub!(:issue_data).and_return({:locations => [],
                                             :issues => [], 
                                             :stop_ids => [22], 
                                             :stop_area_ids => [44]})
          expected_options = { :exclude_ids => [22] }
          expected_params = [anything(), expected_options]
          Stop.should_receive(:find_in_bounding_box).with(*expected_params).and_return([])
          
          expected_options = { :exclude_ids => [44] }
          expected_params = [anything(), expected_options]
          StopArea.should_receive(:find_in_bounding_box).with(*expected_params).and_return([])          
          Map.other_locations(51.505720, -0.088872, MIN_ZOOM_FOR_OTHER_MARKERS, MAP_HEIGHT, MAP_WIDTH, highlight=:has_content)
        end
        
      end
      
    end
    
    describe 'when the current zoom level is < the minimum zoom level for showing other markers' do 
    
      describe 'when no highlight param is passed' do 
        
        it 'should not ask for stops and stop areas in the bounding box' do 
          Stop.should_not_receive(:find_in_bounding_box)
          StopArea.should_not_receive(:find_in_bounding_box)
          Map.other_locations(51.505720, -0.088872, MIN_ZOOM_FOR_OTHER_MARKERS - 1, MAP_HEIGHT, MAP_WIDTH)
        end
      
      end
      
      describe 'when a highlight param is passed' do 
      
        it 'should ask for issues in the bounding box' do 
          issue_data = { :locations => [], :issues => [] }
          Problem.should_receive(:find_issues_in_bounding_box).and_return(issue_data)
          Map.other_locations(51.505720, 
                              -0.088872,
                              MIN_ZOOM_FOR_OTHER_MARKERS - 1, 
                              MAP_HEIGHT, 
                              MAP_WIDTH, 
                              :has_content)
        end
        
      end
    
    end
    
  end
  
end
