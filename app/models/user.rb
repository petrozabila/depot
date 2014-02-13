class User < ActiveRecord::Base
	has_secure_password
	validates :name, presence: true, uniqueness: true
	
	validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true

	#validate :password, presence: true, on: :create
	after_destroy :ensure_an_admin_remains

	private
	 def ensure_an_admin_remains
	 	is User.count.zero?
	 	raise "The last user can not be deleted"
	 end
end
