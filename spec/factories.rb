FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example20.com"}
    password "foobar"
    password_confirmation "foobar"
	
	    factory :admin do
      admin true
    end
  end
  
  factory :post do
    content "Test Post"
    user
  end
end