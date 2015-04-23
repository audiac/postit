class Category < ActiveRecord::Base

  after_validation :generate_slug

  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true, length: { minimum: 5 }

  def generate_slug
    self.slug = self.name.gsub(' ', '-').downcase
  end

  def to_param
    self.slug
  end
end