class ReviewInstructor < ApplicationRecord
  belongs_to :review
  belongs_to :instructor
end
