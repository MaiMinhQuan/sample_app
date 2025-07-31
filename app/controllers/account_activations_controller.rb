class AccountActivationsController < ApplicationController
  before_action :load_user_for_activation, only: [:edit]
  before_action :check_user_can_be_activated, only: [:edit]

  def edit
    @user.activate
    log_in @user
    remember_session @user
    flash[:success] = t(".account_activated")
    redirect_to @user
  end

  private

  def load_user_for_activation
    @user = User.find_by(email: params[:email])
    return if @user

    flash[:danger] = t(".invalid_activation_link")
    redirect_to root_url
  end

  def check_user_can_be_activated
    return if user_can_be_activated?

    flash[:danger] = t(".invalid_activation_link")
    redirect_to root_url
  end

  def user_can_be_activated?
    !@user.activated? &&
      @user.authenticated?(:activation, params[:id])
  end
end
