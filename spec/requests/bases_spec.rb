require 'spec_helper'

describe "Base pages" do


describe "Home page" do

  it "should have the content 'Home'" do
    visit '/'
    page.should have_content('Home')
  end
  
   it "should have the title 'Home'" do
      visit '/'
      page.should have_selector('title',
                        :text => "Jackmart | Home")
    end
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
  
      describe "Products page" do

    it "should have the content 'Products'" do
      visit '/products'
      page.should have_content('Products')
    end
  
     it "should have the title 'Products'" do
      visit '/products'
      page.should have_selector('title',
                        :text => "Jackmart | Products")
    end
  end
end