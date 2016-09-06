class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :description, presence: true, length: { minimum: 10, maximum: 100}
end
#validations set for new article object instances. Must be present; length min/max set