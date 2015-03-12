FactoryGirl.define do
  factory :submission do
    composite_id "ant0-0016-abmp"
    user
    showdown

    factory :submission_with_votes do
      composite_id "vrq0-0015-1b0t"
      after(:create) do |submission|
        3.times do 
          user = create(:user)
          create(:vote, submission: submission, user: user) 
        end
      end
    end
  end 
end
