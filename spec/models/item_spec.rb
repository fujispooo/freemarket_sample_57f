require 'rails_helper'

describe "invalid" do
  it "商品名が空の時出品できない" do
    item = Item.create(name: "")
    item.valid?
    expect(item.errors[:name]).to include("can't be blank")
  end
end

describe "invalid" do
  it "商品名が41文字以上の時に出品できない" do
    item = Item.create(name: "アイテム" * 41)
    item.valid?
    expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
  end
end

describe "invalid" do
  it "商品説明が1000文字以上の時に出品できない" do
    item = Item.create(description: "商品説明欄" * 201)
    item.valid?
    expect(item.errors[:description]).to include("is too long (maximum is 1000 characters)")
  end
end


describe "invalid" do
  it "価格が空の時出品できない" do
    item = Item.create(price: "")
    item.valid?
    expect(item.errors[:price]).to include("can't be blank")
  end
end

describe "invalid" do
  it "商品の状態が空の時出品できない" do
    item = Item.create(item_state_id: "")
    item.valid?
    expect(item.errors[:item_state_id]).to include("can't be blank")
  end
end

describe "invalid" do
  it "商品のカテゴリーが空の時出品できない" do
    item = Item.create(category_id: "")
    item.valid?
    expect(item.errors[:category_id]).to include("can't be blank")
  end
end

describe "invalid" do
  it "商品のブランドが空の時出品できない" do
    item = Item.create(brand: "")
    item.valid?
    expect(item.errors[:brand]).to include("can't be blank")
  end
end

