FactoryGirl.define do
  factory :showdown do
    theme 'Atari themed shirts'
    end_date Date.today().to_s
    closed false
    user
    
    factory :showdown_invalid_user do 
      association :user, factory: :invalid_user, strategy: :build
    end

    factory :showdown_expired do
      end_date '2014-03-02'
    end

    factory :showdown_expires_soon do
      end_date Date.tomorrow().to_s
    end
  end
end
