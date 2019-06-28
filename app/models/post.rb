class Post < ApplicationRecord
	belongs_to :user
	validates :title, length: { in: 1..20}
	validates :title, :body, presence: true
end
