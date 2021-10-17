class SubCategory < ApplicationRecord

    # kaminai
    paginates_per 7

    # active storage
    has_one_attached :image

    # associations
    belongs_to :category

    # validations
    validates_presence_of :name, message: 'هذا الحقل مطلوب.'
    validates_presence_of :code, message: 'هذا الحقل مطلوب.'
    validates_uniqueness_of :code, message: 'هذا الكود موجودمن قبل'
    validates_presence_of :image, message: 'هذا الحقل مطلوب.'


end
