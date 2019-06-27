class Course < ApplicationRecord
  has_many :assignments
  belongs_to :user
end
