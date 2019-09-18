require 'rails_helper'
RSpec.describe User, type: :model do
  # provider uid user_idが入力されていれば登録できる
  it "is valid uid provider user_id" do
    user    =  FactoryBot.create(:user)
    sns_credential = build(:sns_credential,
    uid: "123456789",
    provider: "facebook",
    user_id: user.id
    )
    expect(sns_credential).to be_valid
  end

  #providerが空の時は登録できない 
  it "is invalid without a provider" do
    sns_credential = FactoryBot.build(:sns_credential, provider: nil)
    sns_credential.valid?
    expect(sns_credential.errors[:provider]).to include("can't be blank")
  end

  #uidが空の時は登録できない 
  it "is invalid without a uid" do
    sns_credential = FactoryBot.build(:sns_credential, uid: nil)
    sns_credential.valid?
    expect(sns_credential.errors[:uid]).to include("can't be blank")
  end

  #user_idが空の時は登録できない 
  it "is invalid without a user_id" do
    sns_credential = FactoryBot.build(:sns_credential, user_id: nil)
    sns_credential.valid?
    expect(sns_credential.errors[:user_id]).to include("can't be blank")
  end
end