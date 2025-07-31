class SessionsController < ApplicationController

  REMEMBER_ME_CONSTANT = "1".freeze

  before_action :load_user, only: [:create]
  before_action :check_authentication, only: [:create]
  before_action :check_activation, only: [:create]

  # GET /login
  def new; end

  # POST /login
  def create
    handle_login
  end

  # DELETE /logout
  def destroy
    log_out
    redirect_to root_url, status: :see_other
  end

  private

  def load_user
    @user = User.find_by email: params.dig(:session, :email)&.downcase
    return if @user

    flash.now[:danger] = t(".invalid_email_password_combination")
    render :new, status: :unprocessable_entity
  end

  def check_authentication
    @authenticated = @user&.authenticate(params.dig(:session, :password))
    return if @authenticated

    flash.now[:danger] = t(".invalid_email_password_combination")
    render :new, status: :unprocessable_entity
  end

  def check_activation
    # Only check activation if authentication passed
    return if @user.activated?

    flash[:warning] = t("flash.account_not_activated")
    redirect_to root_url, status: :see_other
  end

  def handle_login
    forwarding_url = session[:forwarding_url]
    reset_session
    if params.dig(:session, :remember_me) == REMEMBER_ME_CONSTANT
      remember_cookies(@user)
    else
      remember_session(@user)
    end
    log_in @user
    redirect_to forwarding_url || @user
  end
end
