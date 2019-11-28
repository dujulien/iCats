# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

# Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome_email
	def welcome_email
		UserMailer.welcome_email(User.last)
	end

# Preview this email at http://localhost:3000/rails/mailers/user_mailer/order_email
	def order_email
		UserMailer.order_email(User.last)
	end

end
