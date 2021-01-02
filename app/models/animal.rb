class Animal < ApplicationRecord
    has_many :sightings, inverse_of: :animal
end
