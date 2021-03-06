class Post < ActiveRecord::Base

  has_many :post_categories
  has_many :categories, through: :post_categories
  accepts_nested_attributes_for :categories

  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :users

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
     category = Category.find_or_create_by(category_attribute)
     self.categories << category
    end
  end

  def users_attributes=(user_attributes)
    user_attributes.values.each do |user_attribute|
     user = User.find_or_create_by(user_attribute)
     self.users << user
    end
  end

  def user_id=(name)
   self.user = User.find_or_create_by(name: name)
  end

end
