class Category < ApplicationRecord

    # kaminari
    paginates_per 3

    # active storage
    has_one_attached :image

    # scopes
    scope :latest, -> { order(created_at: :desc) }

    # validations
    validates_presence_of :name, message: 'هذا الحقل مطلوب.'
    validates_presence_of :code, message: 'هذا الحقل مطلوب.'
    validates_presence_of :image, message: 'هذا الحقل مطلوب.'

end
