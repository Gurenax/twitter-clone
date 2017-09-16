class Profile < ApplicationRecord
    validates :avatar, presence: true
    validates :first_name, presence: true

    belongs_to :user
end