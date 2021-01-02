class Sighting < ApplicationRecord
    belongs_to :animal, inverse_of: :sightings
end
