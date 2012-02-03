class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def openid
    raise 'openid callback not implemetned'
  end

  def google
    logger.info "Enterring google auth callback"
    @user = User.find_for_open_id(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      logger.info "Google auth callback seems to have worked"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      logger.info "Google auth callback seems not to have worked."
      redirect_to new_user_registration_url
    end
  end

end

class Devise::OmniauthCallbacksController
  def after_omniauth_failure_path_for(scope)
    '/'
  end
end

