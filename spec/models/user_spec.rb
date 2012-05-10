require 'spec_helper'

describe User do

before do
  @user = User.new(name: "Example User", email: "user@example.com", 
                   password: "password", password_confirmation: "password")
end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }  
  it { should respond_to(:admin) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:posts) }
  it { should respond_to(:feed) }
  it { should respond_to(:relationships) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }


  it { should be_valid }
  it { should_not be_admin }

  describe "when name is not entered (dofus)" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
    describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
    describe "when name is far tooooooooooooooo long for this application" do
    before { @user.name = "a" * 41 }
    it { should_not be_valid }
  end
  
   describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@fail,com user_at_fail.org example.user@fail.]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end      
    end
  end

  describe "when email format is legit" do
    it "should be valid" do
      addresses = %w[user@pass.com A_USER@f.b.org frst.lst@pass.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end      
    end
  end
  
  describe "when email address is already taken by some other user" do
    before do
      user_with_same_email = @user.dup
	  user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
  
  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end
  
   describe "with a password that is 2 shrt" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
  
    describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
  
    describe "with admin attribute set to 'true'" do
    before { @user.toggle!(:admin) }

    it { should be_admin }
  end
  
   it "should destroy associated blog entries" do
      posts = @user.posts
      @user.destroy
      posts.each do |post|
        Post.find_by_id(post.id).should be_nil
      end
    end
end