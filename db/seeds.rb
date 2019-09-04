# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 開発環境の時に実行
if Rails.env == 'development'
  ItemImage.create!(
    [
      {
        image: File.open('./app/assets/images/miyagit.jpeg'),
        item_id: '1',
      }
    ]
  )
end
