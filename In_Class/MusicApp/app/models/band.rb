# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ApplicationRecord
  has_many :albums
  has_many :tracks, through: :albums, source: :tracks
end
