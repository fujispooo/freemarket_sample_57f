FactoryBot.define do

  factory :user do
    nickname              {"永野芽郁"}
    email                 {"kksfsfk@gmail.com.jp"}
    password              {"mmmmmmmm"}
    password_confirmation {"mmmmmmmm"}
    first_name            {"藤井"}
    last_name             {"涼"}
    first_name_kana       {"フジイ"}
    last_name_kana        {"リョウ"}
    birth_year            {1993}
    birth_month           {12}
    birth_day             {22}
    phone_number          {"09039290303"}
  end
end