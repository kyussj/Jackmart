FactoryGirl.define do
  factory :user do
    name     "Jack Booth"
    email    "jack@testing.com"
    password "password"
    password_confirmation "password"
	
	    factory :admin do
      admin true
    end
  end
  
  factory :post do
    content "Test Post"
    user
  end
end