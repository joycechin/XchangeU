require 'spec_helper'

describe Academic do
  before(:each) do
    @user = Factory(:user)
    @attr = {
      :learn => "value for learn",
      :teach => "value for teach"
    }
  end
  
  it "should create a new instance given valid attributes" do
    @user.academics.create!(@attr)
  end
  
  describe "user associations" do
    it "should have a user attribute" do
      @academic.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @academic.user_id.should == @user.id
      @academic.user.should == @user
    end
  end
  
  describe "validations" do

    it "should require a user id" do
      Academic.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @user.academics.build(:learn => "  " || :teach => "  ").should_not be_valid
    end
    
  end
  
end
