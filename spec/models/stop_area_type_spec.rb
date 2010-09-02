# == Schema Information
# Schema version: 20100707152350
#
# Table name: stop_area_types
#
#  id          :integer         not null, primary key
#  code        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe StopAreaType do
  before(:each) do
    @valid_attributes = {
      :code => "value for code",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    StopAreaType.create!(@valid_attributes)
  end
  
  describe "when giving conditions for transport modes" do 
  
    it 'should return conditions specifying a set of stop types for buses' do 
      StopAreaType.conditions_for_transport_mode(1).should == ['area_type in (?)', [["GBCS", "GPBS", "GCLS"]]]
    end
  
    it 'should return conditions specifying area type "GTMU" tram/metro stations (excluding the on-street area types)' do 
      StopAreaType.conditions_for_transport_mode(7).should == ["area_type in (?)", [['GTMU']]]
    end
      
  end

end
