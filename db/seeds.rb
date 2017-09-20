class Seed
  def self.begin
    seed = Seed.new
    seed.generate_characters
    seed.generate_questions
  end

  def generate_characters
    names = seed_file['quotes'].map { |quote| quote.slice('name') }.uniq
    Character.create(names)
  end

  def generate_questions
    seed_file['quotes'].each do |quote|
      question = Question.create(quote: quote['quote'])

      correct_char_id = Character.find_by(name: quote['name']).id
      correct_answer = { character_id: correct_char_id, correct: true }

      wrong_char_ids = Character.where.not(id: correct_char_id).order("RANDOM()").limit(3).pluck(:id)
      wrong_answers = wrong_char_ids.map { |id| { character_id: id, correct: false } }

      answers = [correct_answer, *wrong_answers].shuffle
      question.answers = Answer.create(answers)
    end
  end

  def seed_file
    @seed_file ||= load_file
  end

  def load_file
    file = File.join(Rails.root, 'db', 'seed.yml')
    YAML::load_file(file)
  end
end

Seed.begin