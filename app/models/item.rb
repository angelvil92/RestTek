class Item < ActiveRecord::Base
	belongs_to :category

	validates :name, :description, :price, :category, presence: true
	validates :name, uniqueness: true
	validates :price, numericality: {greater_than_or_equal_to: 0}, format: {with: /\d*[.][0-9][0-9]/, message: 'Only prices with 2 decimals'}
	# validates :price, numericality: {greater_than_or_equal_to: 0}, format: {with: /\d*[.]\d{2}/, message: 'Only prices with 2 decimals'}

	def self.filter_items_by_category category
		Item.where(category_id: category)
	end

end
