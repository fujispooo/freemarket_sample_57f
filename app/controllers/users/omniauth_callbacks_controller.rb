class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    # リクエストデータからsnsプロバイダからの情報を取り出す
    requestData = request.env["omniauth.auth"]
    @user = User.find_oauth(requestData)
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      # sessionにプロバイダ情報を保存
      session[:provider_data]             = requestData.except("extra")
      session[:nickname]                  = requestData.info.name
      session[:email]                     = requestData.info.email
      session[:password]                  = Devise.friendly_token[0, 20] # ランダムなパスワードを作成
      session[:provider_data]["uid"]      = requestData.uid
      session[:provider_data]["provider"] = provider.to_s
      # 会員登録ページに遷移
      redirect_to registration_path
    end
  end
  
  def failure
    redirect_to root_path && return
  end
end
