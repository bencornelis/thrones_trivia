FactoryGirl.define do
  factory :question do
    sequence(:quote) { |n| "#{n} is the true king!" }

    after(:create) do |question|
      create :answer, correct: true, question: question
      create_list :answer, 3, question: question
    end
  end

  factory :answer do
    character
    question
    correct false
  end

  factory :response do
    question
    answer
  end

  factory :character do
    sequence(:name) { |n| "Stark ##{n}" }
  end
end