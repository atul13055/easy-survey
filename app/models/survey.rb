class Survey < ApplicationRecord
	validates :name, presence: true 
	has_many :components, dependent: :destroy
end
