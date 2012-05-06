require 'spec_helper'

describe "Post pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  describe "post destruction" do
    before { FactoryGirl.create(:post, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a post" do
        expect { click_link "delete" }.should change(Post, :count).by(-1)
      end
    end
  end
end