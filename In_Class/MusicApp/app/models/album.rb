# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string
#  band_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  has_many :tracks
  belons_to :band
end
