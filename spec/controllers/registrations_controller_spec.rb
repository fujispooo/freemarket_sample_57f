require 'rails_helper'

feature 'Registrations', type: :feature do
  let(:user) { create(:user) }

  scenario 'トップページからユーザ新規登録画面に遷移' do
    visit root_path
    expect(page).to have_no_content('マイページ')

    visit '/jp/signup'
    find('.sign-up__by--mail').click
    expect(current_path).to eq registration_path
  # end

  # scenario '新規登録画面1ページ目のフォーム入力後、2ページ目に遷移' do
  #   visit registration_path
    expect(page).to have_content('会員情報入力')
    fill_in 'user_name'                 , with: user.nickname
    fill_in 'user_email'                , with: "ffff@gg.co.jp"
    fill_in 'user_password'             , with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    fill_in 'user_first_name'           , with: user.first_name
    fill_in 'user_last_name'            , with: user.last_name
    fill_in 'user_first_name_kana'      , with: user.first_name_kana
    fill_in 'user_last_name_kana'       , with: user.last_name_kana
    fill_in 'user_birth_year'           , with: user.birth_year
    fill_in 'user_birth_month'          , with: user.birth_month
    fill_in 'user_birth_day'            , with: user.birth_day
    find('.form__sent-btn').click
    expect(current_path).to eq ms_confirmation_path
  # end

  # scenario '新規登録画面2ページ目にフォーム入力後、3ページ目に遷移' do
  #   visit ms_confirmation_path
    expect(page).to have_content('電話番号の確認')
    fill_in 'user_phone_number'         , with: user.phone_number
    find('.form__sent-btn').click
    expect(current_path).to eq sms_confirmation_sms_path

    expect(page).to have_content('電話番号認証')
    fill_in 'Authentication'         , with: "2222"
    find('.Authentication-btn').click
    expect(current_path).to eq address_path

    expect(page).to have_content('発送・お届け先住所入力')
    fill_in 'user_address_attributes_post_number'   , with: "122-8888"
    select '東京都', from: 'prefecture-form'
    fill_in 'user_address_attributes_city'          , with: "世田谷区"
    fill_in 'user_address_attributes_address'       , with: "若林"
    find('.form__sent-btn').click
    expect(current_path).to eq registration_create_path
  end
end