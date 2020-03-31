class Event < ApplicationRecord
    has_and_belongs_to_many :users,  -> { distinct }
    belongs_to :organizer, class_name: 'User'
end
