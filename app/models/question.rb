class Question < ActiveRecord::Base
  has_many :allowed_question_tags
  has_many :tags, :through => :allowed_question_tags
  
  has_many :answers
  
  belongs_to :expertise
end
