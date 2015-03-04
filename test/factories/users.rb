FactoryGirl.define do
  factory :user do
    email "dpulliam@customink.com"
    password "12345678"
    factory :invalid_user do
      password nil
    end
  end
end
