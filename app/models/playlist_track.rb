class PlaylistTrack < ApplicationRecord
  belongs_to :playlist, optional: true
  belongs_to :track
end