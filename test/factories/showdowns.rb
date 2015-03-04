FactoryGirl.define do
  factory :showdown do
    theme 'Atari themed shirts'
    winning_submission 1
    end_date '2015-03-02'
    closed false
    user
    factory :showdown_invalid_user do 
      association :user, factory: :invalid_user, strategy: :build
    end
  end
end
