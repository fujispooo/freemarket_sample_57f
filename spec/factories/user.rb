FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"藤井"}
    last_name             {"涼"}
    first_name_kana       {"フジイ"}
    last_name_kana        {"リョウ"}
    birth_year            {"1993"}
    birth_month           {"12"}
    birth_day             {"22"}
    phone_number          {"09039290303"}
  end
end