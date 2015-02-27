require 'faker'

FactoryGirl.define do 
  factory :user do  
    email       "dpulliam@customink.com"
    first_name  "dylan"
    last_name   "pulliam"

    factory :user_fake do 
      email       { Faker::Internet.email }
      first_name  { Faker::Name.first_name  }  
      last_name   { Faker::Name.last_name   }
    end
  end 
end 