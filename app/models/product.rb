class Product < ActiveRecord::Base

validates :title, :description, :image_url, presence: true
validates :price, numericality: {greater_than_or_equal_to: 0.01}
validates :title, uniqueness: true

validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)}i,
message: 'must be a URL for GIF, JPG or PNG image.'
# URL должен указывать на изображение формата GIF, JPG или PNG
}

has_many :line_items
has_many :orders, through: :line_items
before_destroy :ensure_not_referenced_by_any_line_item

def to_param
    "#{id}-#{Russian::transliterate(title).parameterize}" #added recently
end

private
 # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
def ensure_not_referenced_by_any_line_item
	if line_items.empty?
		return true
	else
		errors.add(:base, 'other line items exist')
		return false
	end
end
end
