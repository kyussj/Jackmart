require 'spec_helper'


describe Post do

  let(:user) { FactoryGirl.create(:user) }
  before { @post = user.posts.build(content: "This is a test post") }

  subject { @post }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Post.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "with no content in post content" do
    before { @post.content = " " }
    it { should_not be_valid }
  end

  describe "from_users_followed_by" do

    let(:user) { FactoryGirl.create(:user) }
    let(:other_user) { FactoryGirl.create(:user) }
    let(:third_user) { FactoryGirl.create(:user) }

    before { user.follow!(other_user) }

    let(:own_post) { user.posts.create!(content: "easy") }
    let(:followed_post) { other_user.posts.create!(content: "as") }
    let(:unfollowed_post) { third_user.posts.create!(content: "pie") }

    subject { Post.from_users_followed_by(user) }

    it { should include(own_post) }
    it { should include(followed_post) }
    it { should_not include(unfollowed_post) }
  end
end