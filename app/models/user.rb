class User < ActiveRecord::Base

	# Creates password
	attr_accessor :password

	validates :password, :presence => true,
                       :confirmation => true, 
                       :format => { :with => /\A(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){6,40}\z/, message: "Your password must include at least one number, one letter, and be at least 6 characters long."}

	before_save :encrypt_password
	
	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

	# Checks password
	def self.authenticate(user_name, password)
		user = User.where(user_name: user_name).first
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end


	validates :user_name, :presence => true,
										:uniqueness => true
  validates :email, :presence => true,
                    :uniqueness => true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	has_many :favorites
	has_many :posts, foreign_key: 'author_id'
end
