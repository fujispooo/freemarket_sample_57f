FactoryBot.define do
  factory :address do
    post_number       {"123-3445"}
    prefecture_id     {2}
    city              {"さいたま市"}
    address           {"3-3"}
    user_id           {1}
    building_name     {"涼"}
    building_tel      {"00000000000"}
  end
end