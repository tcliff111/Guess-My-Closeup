class Choice < ActiveRecord::Base

	has_many :answers
	belongs_to :sound

	validates :text, :presence => true, :uniqueness => {scope: :sound}, length: { maximum: 24 }


end
