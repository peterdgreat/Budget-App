class Users::RegistrationsController < Devise::RegistrationsController
  def create
    user = User.find_by(email: params[:user][:email])
    if user.nil?
      user = User.new({
                        name: params[:user][:name],
                        email: params[:user][:email],
                        password: params[:user][:password],
                        password_confirmation: params[:user][:password_confirmation]
                      })
      if user.save
        flash[:notice] = 'Successfully registered'
        sign_in(user)
        redirect_to root_path
      else
        flash[:notice] = user.errors.full_messages.to_sentence
        redirect_to new_user_registration_path
      end
    else
      flash[:notice] = 'Email already exists'
      redirect_to new_user_registration_path
    end
  end
end
