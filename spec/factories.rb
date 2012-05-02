FactoryGirl.define do
  factory :user do
    name     "Jack Booth"
    email    "jack@example.com"
    password "password"
    password_confirmation "password"
	
	    factory :admin do
      admin true
    end
  end
end