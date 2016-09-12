class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publication

  # mount_uploaders :catalogs, CatalogUploader

  def author_name
    author.name
  end

  def publication_name
    publication.name
  end
end
