class Image < ApplicationRecord

    # active storage
    has_one_attached :image

    # associations
    belongs_to :product

    # validations
    validates_presence_of :image, message: 'هذا الحقل مطلوب.'
end
