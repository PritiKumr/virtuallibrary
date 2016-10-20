class BookCatalog < ApplicationRecord
  belongs_to :book
  mount_uploader :catalog, CatalogUploader

end
