class User < ActiveRecord::Base
	has_secure_password

	validates :name, :uniqueness => true, format: { with: /\A[a-zA-Z0-9]+\z/ }
	validates :name, :presence => true
	validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ } , allow_blank: true
end