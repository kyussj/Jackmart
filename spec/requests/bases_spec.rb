require 'spec_helper'

describe "Base pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Welcome') }
    it { should have_selector('title', text: full_title('')) }


	end
	
  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/help'
      page.should have_content('Help')
    end

	   it "should have the title 'Help'" do
      visit '/help'
      page.should have_selector('title',
                        :text => "Jackmart | Help")
    end
  end
  
    describe "Contact page" do

    it "should have the content 'Contact'" do
      visit '/contact'
      page.should have_content('Contact')
    end
  
     it "should have the title 'Home'" do
      visit '/contact'
      page.should have_selector('title',
                        :text => "Jackmart | Contact")
    end
  end
end