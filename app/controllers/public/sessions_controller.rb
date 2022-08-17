# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  
  before_action :customer_state, only: [:create]
  
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected   #「外部から隠蔽」+「レシーバーを仲間が利用する」... 8/11
  
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  # 退会しているか判断するメソッド... 8/17
  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    return if !@customer
    if @customer.valid_password?(params[:customer][:password]) && @customer.unsubscribe_flag
      flash[:notice] = "お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。"  
      redirect_to new_customer_session_path
    end
  end
  # 入力されたemailと一致するレコードを１つ取得
  # そのレコードが無い場合はメソッド終了
  # そのレコードのパスと入力されたパスが一致している(true) 且つ、
  # そのレコードの退会フラグが退会済になっている(true)の場合、
  # フラッシュメッセージを表示
  # 会員新規登録ページへ遷移
  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
