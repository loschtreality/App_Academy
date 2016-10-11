require 'date'

class Cat < ActiveRecord::Base

  COLORS = %w(red green purple blue magenta cyan brown)

  validates :color, inclusion: { in: %w(red green purple blue magenta cyan brown),
    message: "%{value} is not a valid color" }, presence: true
  validates :sex, inclusion: { in: %w(M F),
    message: "%{value} is not a valid sex" }, presence: true
  validates :birth_day, :name, presence: true

  def age
    start = self.birth_day.year
    Time.now.year - start
  end
end
