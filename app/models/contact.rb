class Contact < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :content, presence: true
    validates :age, presence: true
end
