class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
     @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
     @user.skip_confirmation!
     @user.save
     if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      sign_in_and_redirect @user
    end
  end
  def google_oauth2
     @user = User.find_for_google_oauth2_oauth(request.env["omniauth.auth"], current_user)
     @user.skip_confirmation!
     @user.save
     if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      sign_in_and_redirect @user
    end
  end
end
