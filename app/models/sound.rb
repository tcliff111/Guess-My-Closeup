class Sound < ActiveRecord::Base

	has_many :choices
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
		{:bucket => "guess-my-sound",
		:access_key_id => "AKIAISF444EF5Y3PGBVA",
		:secret_access_key => "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"}
	end

end
