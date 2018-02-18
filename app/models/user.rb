class User < ApplicationRecord
	validates :name, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  # validates :sex, inclusion: { in: %w(0 1)}
  enum sex:{male: 0, female: 1}
	has_secure_password	

	def age
		date_format = "%Y%m%d"
		(Date.today.strftime(date_format).to_i - birthdate.strftime(date_format).to_i) / 10000
	end
end
