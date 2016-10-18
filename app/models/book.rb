class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publication
  has_many :book_catalogs, dependent: :destroy
  has_one :book_category, dependent: :destroy
  has_one :category, through: :book_category
  has_one :book_info, dependent: :destroy

  has_many :book_tags
  has_many :tags, through: :book_tags
  has_many :bookmarks

  scope :featured, -> {where(featured: 1).limit(4)}
  scope :latest, -> {where('created_at > ?', Date.today-2).limit(4)}

  def author_name
    author.name
  end

  def publication_name
    publication.name
  end

  def front_image
    book_catalogs.first.catalog.url if book_catalogs.present?
  end

  def edition
    book_info.edition
  end

  def desc
    book_info.desc
  end

  def lang
    book_info.lang
  end

  def isbn_no
    book_info.isbn_no
  end

  def bookmark(user_id)
    bookmarks.find_by(user_id: user_id)
  end



end
