# module Sluggable
#   extend ActiveSupport::Concern

#   included do
#     before_save :generate_slug!
#     class_attribute :slug_column
#   end

#   def generate_slug!
#     the_slug = to_slug(self.send(self.class.slug_column))
#     object = self.class.find_by(slug: the_slug)

#     count = 2
#     while object && object != self
#       the_slug = append_suffix(the_slug, count)
#       object = self.class.find_by(slug: the_slug)
#       count += 1
#     end

#     self.slug = the_slug.downcase
#   end

#   def append_suffix(orig_slug, count)
#     if orig_slug.split('-').last.to_i != 0
#       return orig_slug.split('-').slice(0...-1).join('-') + count.to_s
#     else
#       return orig_slug + '-' + count.to_s
#     end
#   end

#   def to_slug(name)
#     str = name.strip
#     str.gsub!(/\s*[^A-Za-z0-9]\s*/, '-')
#     str.gsub!(/-+/, '-')
#     str.downcase
#   end

#   def to_param
#     self.slug
#   end

#   module ClassMethods
#     def sluggable_column(column_name)
#       self.slug_column = column_name
#     end
#   end

# end