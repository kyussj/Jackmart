require 'spec_helper'

describe "Base pages" do

describe "Home page" do

  it "should have the content 'Home'" do
    visit '/jackmart/home'
    page.should have_content('Home')
  end
  
   it "should have the title 'Home'" do
      visit '/jackmart/home'
      page.should have_selector('title',
                        :text => "Jackmart | Home")
    end
  end


  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/jackmart/help'
      page.should have_content('Help')
    end
  end
  
    describe "Contact page" do

    it "should have the content 'Contact'" do
      visit '/jackmart/contact'
      page.should have_content('Contact')
    end
  end
  
      describe "Products page" do

    it "should have the content 'Products'" do
      visit '/jackmart/products'
      page.should have_content('Products')
    end
  end
end