class UserResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :test
end
