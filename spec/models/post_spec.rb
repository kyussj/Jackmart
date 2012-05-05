require 'spec_helper'

describe Post do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is wrong!
    @post = Post.new(content: "Lorem ipsum", user_id: user.id)
  end

  subject { @post }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }
  
    describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Micropost.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
end
	  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end
  
    describe "with blank content" do
    before { @post.content = " " }
    it { should_not be_valid }
  end
end