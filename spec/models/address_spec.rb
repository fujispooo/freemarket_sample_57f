require 'rails_helper'
describe Address do
  describe '#create' do
    # 全てが入っていれば登録できる
    it "is valid with a post_number, city, address,user_id" do
      user    =  FactoryBot.create(:user)
      address = build(:address,
        post_number:   "123-3445",
        prefecture_id: 2,
        city:          "さいたま市",
        address:       "3-3",
        user_id:       user.id,
        building_name: "涼",
        building_tel:  "00000000000")
      expect(address).to be_valid
    end

    #post_numberが空の時は登録できない 
    it "is invalid without a post_number" do
      address = build(:address, post_number: nil)
      address.valid?
      expect(address.errors[:post_number]).to include("can't be blank")
    end

    #prefecture_idが空の時は登録できない 
    it "is invalid without a prefecture" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("can't be blank")
    end

    #cityが空の時は登録できない 
    it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    #addressが空の時は登録できない 
    it "is invalid without a address" do
      address = build(:address, address: nil)
      address.valid?
      expect(address.errors[:address]).to include("can't be blank")
    end

    #prefecture_idが空の時は登録できない 
    it "is invalid without a user_id" do
      address = build(:address, user_id: nil)
      address.valid?
      expect(address.errors[:user_id]).to include("can't be blank")
    end

    #ハイフンの無いpost_numberは登録できない 
    it "is invalid Postcode without hyphen" do
      address = build(:address, post_number: "2222222")
      address.valid?
      expect(address.errors[:post_number]).to include("不正な郵便番号です")
    end

    #ハイフンの位置が違うpost_numberは登録できない 
    it "is invalid Postcode different hyphen positions " do
      address = build(:address, post_number: "2222-222")
      address.valid?
      expect(address.errors[:post_number]).to include("不正な郵便番号です")
    end

    #prefecture_idが指定以外の数字だと登録できない
    it "is invalid Postcode without hyphen" do
      address = build(:address, prefecture_id: "48")
      address.valid?
      expect(address.errors[:prefecture_id]).to include("is not included in the list")
    end

    # cityは半角で登録できない
    it "is invalid with a city is entered in \"hankaku\"" do
      address= build(:address, city: "hankaku")
      address.valid?
      expect(address.errors[:city]).to include("全角かな・ひらがな・漢字で入力してください")
    end

    #building_nameは128文字以上を入力できない
    it "is invalid with a building_name that has more than 25 characters " do
      address = build(:address, building_name: "12345678901234567890123456")
      address.valid?
      expect(address.errors[:building_name][0]).to include("is too long")
    end

    # 電話番号については同一のバリデーションメソッドをuserで用いており、テスト済み
  end
end