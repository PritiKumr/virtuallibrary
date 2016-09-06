class DataSeed < ApplicationRecord
  Author.create(name: "Ashwin Sanghi")
  Publication.create(name: "Red Hot Chillies")
  Book.create(sku: "AB123K", name: "The krishna key", price: 120, author_id: 1, publication_id: 1)
end
