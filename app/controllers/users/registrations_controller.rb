class Users::RegistrationsController < Devise::RegistrationsController

  def index

  end

  def step1
    @user = User.new()
  end
  
  def step2
    @user = User.new()
    session[:nickname]        = user_params_step1[:nickname]
    session[:email]           = user_params_step1[:email]
    session[:password]        = user_params_step1[:password]
    session[:first_name]      = user_params_step1[:first_name]
    session[:last_name]       = user_params_step1[:last_name]
    session[:first_name_kana] = user_params_step1[:first_name_kana]
    session[:last_name_kana]  = user_params_step1[:last_name_kana]
    session[:birth_year]      = user_params_step1[:birth_year]
    session[:birth_month]     = user_params_step1[:birth_month]
    session[:birth_day]       = user_params_step1[:birth_day]
  end

  def step3
    @user = User.new()
    session[:phone_number]    = user_params_step2[:phone_number]
  end
  
  def step4
    @user = User.new()
    @user.build_address(session[:address_attributes])
  end
  
  def step5
    @user = User.new()
  end
  
  def create
    session[:address_attributes] = user_params_step3[:address_attributes]
    @user = User.new(nickname: session[:nickname],email:session[:email], password:session[:password],first_name:session[:first_name],last_name:session[:last_name], first_name_kana: session[:first_name_kana], last_name_kana:session[:last_name_kana],birth_year:session[:birth_year],birth_month: session[:birth_month],birth_day: session[:birth_day], phone_number: session[:phone_number],address_attributes: session[:address_attributes])
    @user.save
    sign_in @user
  end

  private
  def user_params_step1
    params.require(:user).permit(:nickname,:email,:password,:first_name,:last_name,:first_name_kana,:last_name_kana,:birth_year,:birth_month,:birth_day)
  end

  def user_params_step2
    params.require(:user).permit(:phone_number)
  end

  def user_params_step3
    params.require(:user).permit(address_attributes:[:post_number,:prefecture_id, :city,:address,:building_name,:building_tel,:created_at,:updated_at,:user_id])
  end

  # def user_params_step4
  #   params.require(:user).permit(card_attributes:[:card_number, :explation_month, :explation_year,:security_code,:created_at,:updated_at,:user_id])
  # end

end
