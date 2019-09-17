class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!
  before_action :validates_step1, only: :step2 # step1のバリデーション
  before_action :validates_step2, only: :step3 # step2のバリデーション


  def new
  end

  def step1
    @user = User.new()
  end
  
  def step2
    @user = User.new()
    session[:nickname]        = user_params[:nickname]
    session[:password]        = user_params[:password]  if session[:provider_data].blank?
    session[:email]           = user_params[:email]
    session[:first_name]      = user_params[:first_name]
    session[:last_name]       = user_params[:last_name]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:last_name_kana]  = user_params[:last_name_kana]
    session[:birth_year]      = user_params[:birth_year]
    session[:birth_month]     = user_params[:birth_month]
    session[:birth_day]       = user_params[:birth_day]
  end

  def step3
    @user = User.new()
    session[:phone_number]    = user_params[:phone_number]
  end
  
  def step4
    @user = User.new()
    @user.build_address(session[:address_attributes])
  end
  
  def step5
    @user = User.new()
  end
  
  def create
    if session[:provider_data].present?
      @user = User.new(
        nickname:           session[:nickname],
        email:              session[:email],
        password:           session[:password],
        first_name:         session[:first_name],
        last_name:          session[:last_name],
        first_name_kana:    session[:first_name_kana],
        last_name_kana:     session[:last_name_kana],
        birth_year:         session[:birth_year],
        birth_month:        session[:birth_month],
        birth_day:          session[:birth_day],
        phone_number:       session[:phone_number],
        address_attributes: user_params[:address_attributes],
        SnsCredential_attributes: {
          uid:              session[:provider_data]["uid"],
          provider:         session[:provider_data]["provider"],
          sns_name:         "",
          user_id:          "",
          created_at:       "",
          updated_at:       ""
        }
      )
    else
      @user = User.new(
        nickname:           session[:nickname],
        email:              session[:email],
        password:           session[:password],
        first_name:         session[:first_name],
        last_name:          session[:last_name],
        first_name_kana:    session[:first_name_kana],
        last_name_kana:     session[:last_name_kana],
        birth_year:         session[:birth_year],
        birth_month:        session[:birth_month],
        birth_day:          session[:birth_day],
        phone_number:       session[:phone_number],
        address_attributes: user_params[:address_attributes]
      )
    end
    @user.save
    sign_in @user
  end

  def check
    @user = ForbiddenWord.where(forbidden_word: user_params[:nickname]).first
    if @user.present?
      respond_to do |format|
        format.json
      end
    end
  end

  def email_check
    @user = User.where(email: user_params[:email]).first
  end

  def validates_step1
    # バリデーション用に、仮でインスタンスを作成する
    @user = User.new(
      nickname:           user_params[:nickname],
      email:              user_params[:email],
      password:           user_params[:password],
      first_name:         user_params[:first_name],
      last_name:          user_params[:last_name],
      first_name_kana:    user_params[:first_name_kana],
      last_name_kana:     user_params[:last_name_kana],
      birth_year:         user_params[:birth_year],
      birth_month:        user_params[:birth_month],
      birth_day:          user_params[:birth_day],
      phone_number:       "09012342345"
    )
    # 仮で作成したインスタンスのバリデーションチェック
    render "step1.html.haml" unless @user.valid?
  end

  def validates_step2
    # バリデーション用に、仮でインスタンスを作成する
    @user = User.new(
      nickname:           session[:nickname],
      email:              session[:email],
      password:           session[:password],
      first_name:         session[:first_name],
      last_name:          session[:last_name],
      first_name_kana:    session[:first_name_kana],
      last_name_kana:     session[:last_name_kana],
      birth_year:         session[:birth_year],
      birth_month:        session[:birth_month],
      birth_day:          session[:birth_day],
      phone_number:       user_params[:phone_number]
    )
    # 仮で作成したインスタンスのバリデーションチェック
    render "step2.html.haml" unless @user.valid?
  end 
  
  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :birth_year,
      :birth_month,
      :birth_day,
      :phone_number,
      address_attributes:[:post_number,:prefecture_id, :city,:address,:building_name,:building_tel,:created_at,:updated_at,:user_id])
  end
end
