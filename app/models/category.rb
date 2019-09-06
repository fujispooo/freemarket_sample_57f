class Category < ApplicationRecord
  has_many :items
  has_many :category_sizes
  has_many :sizes, through: :category_sizes
  has_ancestry

  def self.get_items_for(id)
    category = Category.find(id)
    categories = [
      category,
      category.children,
      category.children.map { |category| category.children }
    ].flatten.compact
    categories.map { |category| category.items }.flatten.sort_by{|i|i.created_at}.reverse
  end
end
