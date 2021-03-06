# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_date"] = {user: @user.attributes}
    session["devise.regist_date"][:user]["password"] = params[:user][:password]
    @delivery = @user.build_delivery
    render :new_delivery
  end

  def create_delivery
    @user = User.new(session["devise.regist_date"]["user"])
    @delivery = Delivery.new(delivery_params)
    unless @delivery.valid?
      flash.now[:alert] = @delivery.errors.full_messages
      render :new_delivery and return
    end
    @user.build_delivery(@delivery.attributes)
    if @user.save
      session["devise.regist_date"]["user"].clear
      sign_in(:user, @user)
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new_delivery and return
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana, 
      :birthday
    )
  end

  def delivery_params
    params.require(:delivery).permit(
      :postal_code, 
      :prefectures_id, 
      :municipality, 
      :address, 
      :address_detail, 
      :phone_number
    )
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end