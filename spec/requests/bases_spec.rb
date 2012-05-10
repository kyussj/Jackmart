require 'spec_helper'

describe "Base pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Welcome') }
    it { should have_selector('title', text: full_title('')) }
	
	describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:post, user: user, content: "Test post 1")
        FactoryGirl.create(:post, user: user, content: "Test post 2")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "Subcribed blogs/friends" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 Subscribed Blogs", href: following_user_path(user)) }
        it { should have_link("1 Friends", href: followers_user_path(user)) }
      end
    end
  end
  
  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1', text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end
  
  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1', text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }
	end
  end