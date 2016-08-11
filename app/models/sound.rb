class Sound < ActiveRecord::Base

	has_many :choices
	has_many :answers, through: :choices
	has_many :users, through: :answers

	belongs_to :user
	accepts_nested_attributes_for :choices

	has_attached_file(	:image,
  						styles: {medium: '300x300>', thumb: '100x100>'},
  						:storage => :s3,
  						:s3_credentials => Proc.new{|a| a.instance.s3_credentials}
  						)

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :image, :presence => true

	def s3_credentials
		{:bucket => "<BUCKET GOES HERE>",
		:access_key_id => "<ID GOES HERE>",
		:secret_access_key => "<KEY GOES HERE>"}
	end

end
