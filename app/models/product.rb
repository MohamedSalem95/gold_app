class Product < ApplicationRecord

    # associations
    belongs_to :category

    # scopes
    scope :latest, -> { order(created_at: :desc) }

    # valications
    validates_presence_of :name, message: 'هذا الحقل مطلوب.'
    validates_presence_of :code, message: 'هذا الحقل مطلوب.'
    validates_uniqueness_of :code, message: 'هذا الكود موجود من قبل.'
    validates_presence_of :stock, message: 'هذا الحقل مطلوب.'
    validates_presence_of :price, message: 'هذا الحقل مطلوب.'
    validates_presence_of :gold_type, message: 'هذا الحقل مطلوب.'
    validates_presence_of :category_code, message: 'هذا الحقل مطلوب.'
    
end
