class Test < ActiveRecord::Base
  has_many :questions
  has_many :user_results
  accepts_nested_attributes_for :questions
end
