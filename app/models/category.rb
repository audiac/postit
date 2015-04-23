class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true, length: { minimum: 5 }

  before_save :generate_slug!

  def generate_slug!
    the_slug = to_slug(self.name)
    category = Category.find_by(slug: the_slug)

    count = 2
    while category && category != self
      the_slug = append_suffix(the_slug, count)
      category = Category.find_by(slug: the_slug)
      count += 1
    end

    self.slug = the_slug.downcase
  end

  def append_suffix(orig_slug, count)
    if orig_slug.split('-').last.to_i != 0
      return orig_slug.split('-').slice(0...-1).join('-') + count.to_s
    else
      return orig_slug + '-' + count.to_s
    end
  end

  def to_slug(name)
    str = name.strip
    str.gsub!(/\s*[^A-Za-z0-9]\s*/, '-')
    str.gsub!(/-+/, '-')
    str.downcase
  end

  def to_param
    self.slug
  end
end