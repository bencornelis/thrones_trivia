FactoryGirl.define do
  factory :question do
    sequence(:quote) { |n| "#{n} is the true king!" }

    factory :question_with_answers do
      transient do
        answer_count 4
      end

      after(:create) do |question, evaluator|
        create :answer, correct: true, question: question
        create_list :answer, (evaluator.answer_count - 1), question: question
      end
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