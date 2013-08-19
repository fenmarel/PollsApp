class AnswerChoice < ActiveRecord::Base
  attr_accessible :question_id, :text

  validates :question_id, :text, :presence => true

  belongs_to :question
  has_many :responses
end
