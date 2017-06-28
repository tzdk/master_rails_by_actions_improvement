class UserMailer < ApplicationMailer
	def activation_needed_email(user)
	  @user = user
	  @url  = "http://localhost:3000/users/#{user.activation_token}/activate"
	  delivery_options = { user_name: '529950736@qq.com',
                         password: 'gpnbgniasappbicg',
                         address: 'smtp.qq.com',
                         authentication: 'plain',
                         enable_starttls_auto: true }
	  mail(to: user.email, subject: 'Welcome to My Awesome Site',delivery_method_options: delivery_options)
	end

	def activation_success_email(user)
	  @user = user
	  @url  = "http://0.0.0.0:3000/login"
	  mail(to: user.email, subject: 'Your account is now activated')
	end
end
