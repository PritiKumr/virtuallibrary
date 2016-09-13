class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publication
  has_many :book_catalogs, dependent: :destroy

  def author_name
    author.name
  end

  def publication_name
    publication.name
  end
end
