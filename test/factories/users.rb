FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "dpulliam#{n}@customink.com" }
    password "12345678"

    factory :invalid_user do
      password nil
    end

    factory :nathan do
      email "nhessler@customink.com"
      password "theprofessler"
    end


  end

end
