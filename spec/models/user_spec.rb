require 'rails_helper'
describe User do
  describe '#create' do
    # 全てが入って入れば登録できる
    it "is valid with a nickname, email, password, password_confirmation, first_name, last_name, first_name_kana, last_name_kana, birth_year, birth_month, birth_day, phone_numeber" do
      user =  FactoryBot.build(:user)
      expect(user).to be_valid
    end

    #nicknameが空の時は登録できない 
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    #emailが空の時は登録できない 
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    #passwordが空の時は登録できない 
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    #first_nameが空の時は登録できない 
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    #last_nameが空の時は登録できない 
    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    #first_name_kanaが空の時は登録できない
    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    #last_name_kanaが空の時は登録できない
    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    #birth_yearが空の時は登録できない
    it "is invalid without a birth_year" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    #birth_monthが空の時は登録できない
    it "is invalid without a birth_month" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end

    #birth_dayが空の時は登録できない
    it "is invalid without a birth_day" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end

    #phone_numberが空の時は登録できない
    it "is invalid without a phone_number" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end

    #nicknameを11文字以上を入力できない
    it "is invalid with a nickname that has more than 10 characters " do
      user = build(:user, nickname: "aaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    #nicknameを1文字以下で入力できない
    it "is invalid with a nickname that has less than 1 characters " do
      user = build(:user, nickname: "a")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too short")
    end

    #passwordを128文字以上を入力できない
    it "is invalid with a password that has more than 128 characters " do
      user = build(:user, password: "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789")
      user.valid?
      expect(user.errors[:password][0]).to include("is too long")
    end

    #nicknameを1文字以下で入力できない
    it "is invalid with a password that has less than 7 characters " do
      user = build(:user, password: "aaaaaa")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

    # birth_year が1900より小さいと入力できない
    it "is invalid with a birth_year that has less 1900 " do
      user = build(:user, birth_year: 1899)
      user.valid?
      expect(user.errors[:birth_year][0]).to include("is not included in the list")
    end

    # birth_year が2000より大きいと入力できない
    it "is invalid with a birth_year that has over 2000 " do
      user = build(:user, birth_year: 2001)
      user.valid?
      expect(user.errors[:birth_year][0]).to include("is not included in the list")
    end

    # birth_month が1より小さいと入力できない
    it "is invalid with a birth_month that has less than 1" do
      user = build(:user, birth_month: 0)
      user.valid?
      expect(user.errors[:birth_month][0]).to include("is not included in the list")
    end

    # birth_year が12より大きいと入力できない
    it "is invalid with a birth_month that has more over than 12" do
      user = build(:user, birth_month: 13)
      user.valid?
      expect(user.errors[:birth_month][0]).to include("is not included in the list")
    end

    # birth_year が1より小さいと入力できない
    it "is invalid with a birth_day that has less than 1" do
      user = build(:user, birth_day: 0)
      user.valid?
      expect(user.errors[:birth_day][0]).to include("is not included in the list")
    end

    # birth_month が31より大きいと入力できない
    it "is invalid with a birth_day that has over than 31" do
      user = build(:user, birth_day: 32)
      user.valid?
      expect(user.errors[:birth_day][0]).to include("is not included in the list")
    end

    # 同じメールアドレスでは登録できない
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # first_name_kanaはひらがなで登録できない
    it "is invalid with a first_name_kana is entered in \"hiragana\"" do
      user = build(:user, first_name_kana: "ひらがな")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("全角カタカナで入力してください")
    end

    # last_name_kanaはひらがなで登録できない
    it "is invalid with a last_name_kana is entered in \"hiragana\"" do
      user = build(:user, last_name_kana: "ひらがな")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("全角カタカナで入力してください")
    end

    # first_name_kanaはカタカナで登録できる
    it "is valid with a first_name_kana is entered in \"katakana\"" do
      user = build(:user, first_name_kana: "カタカナ")
      expect(user).to be_valid
    end

    # last_name_kanaはカタカナで登録できる
    it "is valid with a last_name_kana is entered in \"katakana\"" do
      user = build(:user, last_name_kana: "カタカナ")
      expect(user).to be_valid
    end

    # first_nameは半角で登録できない
    it "is invalid with a first_name is entered in \"hankaku\"" do
      user = build(:user, first_name: "hankaku")
      user.valid?
      expect(user.errors[:first_name]).to include("全角かな・ひらがな・漢字で入力してください")
    end

    # last_nameは半角で登録できない
    it "is invalid with a last_name is entered in \"hankaku\"" do
      user = build(:user, last_name: "hankaku")
      user.valid?
      expect(user.errors[:last_name]).to include("全角かな・ひらがな・漢字で入力してください")
    end

    # first_nameは漢字で登録できる
    it "is valid with a first_name is entered in \"kanji\"" do
      user = build(:user, first_name: "漢字")
      expect(user).to be_valid
    end

    # lastt_nameは漢字で登録できる
    it "is valid with a last_name is entered in \"kanji\"" do
      user = build(:user, last_name: "漢字")
      expect(user).to be_valid
    end

    # (1)不正なメールアドレスは登録できない
    it "is invalid with a email is entered in invalid value(type1)" do
      user = build(:user, email: "-hankaku@fafafa.co.jp")
      user.valid?
      expect(user.errors[:email]).to include("不正なメールアドレスです")
    end

    # (2)不正なメールアドレスは登録できない
    it "is invalid with a email is entered in invalid value(type2)" do
      user = build(:user, email: "han--kaku@fafafa.co.jp")
      user.valid?
      expect(user.errors[:email]).to include("不正なメールアドレスです")
    end

    # (3)不正なメールアドレスは登録できない
    it "is invalid with a email is entered in invalid value(type3)" do
      user = build(:user, email: "han--kakufafafa.co.jp")
      user.valid?
      expect(user.errors[:email]).to include("不正なメールアドレスです")
    end

    # (1)正常なメールアドレスが登録できる
    it "is valid with a email is entered in valid value(type1)" do
      user = build(:user, email: "hankaku@fafafa.co.jp")
      expect(user).to be_valid
    end

    # (2)正常なメールアドレスが登録できる
    it "is valid with a email is entered in valid value(type2)" do
      user = build(:user, email: "hank_aku@fafafa.co.jp")
      expect(user).to be_valid
    end

    # (3)正常なメールアドレスが登録できる
    it "is valid with a email is entered in valid value(type3)" do
      user = build(:user, email: "hank_ak_u@fafafa.co.jp")
      expect(user).to be_valid
    end

    # (4)正常なメールアドレスが登録できる
    it "is valid with a email is entered in valid value(type4)" do
      user = build(:user, email: "hank-aku@fafafa.co.jp")
      expect(user).to be_valid
    end

    # (5)正常なメールアドレスが登録できる
    it "is valid with a email is entered in valid value(type5)" do
      user = build(:user, email: "hank-ak-u@fafafa.co.jp")
      expect(user).to be_valid
    end

    # (6)正常なメールアドレスが登録できる
    it "is valid with a email is entered in valid value(type6)" do
      user = build(:user, email: "ha-nk_ak_u@fafafa.co.jp")
      expect(user).to be_valid
    end

    # (1)不正な電話番号は登録できない
    it "is invalid with a phone_number is entered in invalid value(type1)" do
      user = build(:user, phone_number: "090-2222-1111")
      user.valid?
      expect(user.errors[:phone_number]).to include("不正な電話番号です")
    end

    # (2)不正な電話番号は登録できない
    it "is invalid with a phone_number is entered in invalid value(type2)" do
      user = build(:user, phone_number: "99022221111")
      user.valid?
      expect(user.errors[:phone_number]).to include("不正な電話番号です")
    end

    # (1)正常な電話番号が登録できる
    it "is valid with a phone_number is entered in valid value(type1)" do
      user = build(:user, phone_number: "09011112222")
      expect(user).to be_valid
    end

    # (2)正常な電話番号が登録できる
    it "is valid with a phone_number is entered in valid value(type2)" do
      user = build(:user, phone_number: "0399992222")
      expect(user).to be_valid
    end
  end
end