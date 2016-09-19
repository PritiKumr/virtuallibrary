class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publication
  has_many :book_catalogs, dependent: :destroy
  has_one :book_category, dependent: :destroy
  has_one :category, through: :book_category
  has_one :book_info, dependent: :destroy

  def author_name
    author.name
  end

  def publication_name
    publication.name
  end
end
