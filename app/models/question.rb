class Question < ActiveRecord::Base
  attr_accessible :poll_id, :text

  validates :poll_id, :text, :presence => true

  has_many :answer_choices
  belongs_to :poll

  def results
    answer_choices = self.answer_choices.includes(:responses)

    {}.tap do |results|
      answer_choices.each do |answer_choice|
        results[answer_choice.text] = answer_choice.responses.length
      end
    end
  end
end
