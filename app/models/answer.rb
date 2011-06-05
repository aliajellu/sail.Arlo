class Answer < ActiveRecord::Base
  has_many :answer_tags
  has_many :tags, :through => :answer_tags
  
  belongs_to :question
end
