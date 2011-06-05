class Tag < ActiveRecord::Base
  has_many :answer_tags
  has_many :answers, :through => :answer_tags
  
  has_many :allowed_question_tags
  has_many :questions, :through => :allowed_question_tags
end
