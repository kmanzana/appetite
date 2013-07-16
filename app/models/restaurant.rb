class Restaurant < ActiveRecord::Base

	has_many :dishes, dependent: :destroy

	validates :name, presence: true

end
