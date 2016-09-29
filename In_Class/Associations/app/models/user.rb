class User < ActiveRecord::Base
  has_many :enrolled_courses,
    foreign_key: :instructor_id,
    class_name: :Course

  has_many :enrollments,
    foreign_key: :student_id,
    class_name: :Enrollment

end
