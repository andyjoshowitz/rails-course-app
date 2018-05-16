class Course < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :instructor, optional: true

  validates_presence_of :title
  validates :title, length: { maximum: 60 }
  validates_presence_of :description

  def instructor_attributes=(instructor_attributes)
    self.build_instructor(instructor_attributes)
  end

  def self.most_popular
    joins(:reviews).group("courses.id").order("(sum(reviews.course_quality)/count(*)) desc")
  end

  def avg_difficulty
    if !reviews.empty?
      self.reviews.collect{|r| r.difficulty}.inject(0){|sum,x| sum + x }/self.reviews.count.to_f
    else
      "No reviews"
    end
  end

  def self.no_reviews
    Activity.includes(:reviews).where( :reviews => { :id => nil } )
  end

  def self.first_ten
    limit(10)
  end

  def self.recently_added
    order(created_at: :desc)
  end
end
