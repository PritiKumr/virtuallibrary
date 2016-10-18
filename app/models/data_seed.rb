class DataSeed < ApplicationRecord

  def self.category
    categories = [
      "fictional",
      "non-fictional",
      "self-help",
      "competitive exams",
      "educational",
      "spritual"
    ]
    categories.each do |category|
      Category.create(name: category)
    end
  end

  def self.authors
    authors = [
      "J.K. Rowling",
      "Sidney Sheldon",
      "Ashwin Sanghi",
      "Dan Brown",
      "Jeffery Archer",
      "Prem Chand"
    ]
    authors.each do |author|
      Author.create(name: author)
    end
  end

  def self.publications
    publications = [
      "Bloomsburry",
      "Scholastic Press"
    ]
    publications.each do |publication|
      Publication.create(name: publication)
    end
  end

  def self.books
    DataSeed.category
    DataSeed.authors
    DataSeed.publications

    fictional = Category.find_by(name: "Fictional").id
    jk_author_id = Author.find_by(name: "J.K. Rowling").id
    hp_publication_id = Publication.find_by(name: "Bloomsburry").id

    books = [
      {
        name: "Harry Potter and the Philosopher's Stone",
        price: 899.00,
        author_id: jk_author_id,
        publication_id: hp_publication_id,
        book_infos:{
          isbn_no: "9566-09-1234-23",
          edition: Date.parse("01-01-1997"),
          lang: "en",
          desc: Jargon.lorem_ipsum
        }
      },

      {
        name: "Harry Potter and the Chamber of Secrets",
        price: 999.00,
        author_id: jk_author_id,
        publication_id: hp_publication_id,
        book_infos:{
          isbn_no: "9577-19-1634-23",
          edition: Date.parse("01-01-1998"),
          lang: "en",
          desc: Jargon.lorem_ipsum
        }
      },

      {
        name: "Harry Potter and the Prisoner of Azkaban",
        price: 999.00,
        author_id: jk_author_id,
        publication_id: hp_publication_id,
        book_infos:{
          isbn_no: "9977-29-1634-23",
          edition: Date.parse("01-01-1999"),
          lang: "en",
          desc: Jargon.lorem_ipsum
        }
      },

      {
        name: "Harry Potter and the Goblet of Fire",
        price: 1099.00,
        author_id: jk_author_id,
        publication_id: hp_publication_id,
        book_infos:{
          isbn_no: "9977-29-1634-13",
          edition: Date.parse("01-01-1999"),
          lang: "en",
          desc: Jargon.lorem_ipsum
        }
      },

      {
        name: "Harry Potter and the Order of the Phoenix",
        price: 1199.00,
        author_id: jk_author_id,
        publication_id: hp_publication_id,
        book_infos:{
          isbn_no: "9977-31-1634-13",
          edition: Date.parse("01-01-2003"),
          lang: "en",
          desc: Jargon.lorem_ipsum
        }
      },

      {
        name: "Harry Potter and the Half-Blood Prince",
        price: 1299.00,
        author_id: jk_author_id,
        publication_id: hp_publication_id,
        book_infos: {
          isbn_no: "9977-31-1634-29",
          edition: Date.parse("01-01-2005"),
          lang: "en",
          desc: Jargon.lorem_ipsum
        }
      },

      {
        name: "Harry Potter and the Deathly Hollows",
        price: 1399.00,
        author_id: jk_author_id,
        publication_id: hp_publication_id,
        book_infos:{
          isbn_no: "9977-31-1634-39",
          edition: Date.parse("01-01-2007"),
          lang: "en",
          desc: Jargon.lorem_ipsum
        }
      }
    ]

    books.each do |book|
      b = Book.new
      b.name = book[:name]
      b.price = book[:price]
      b.author_id = book[:author_id]
      b.publication_id = book[:publication_id]
      b.save!
      b.create_book_info(
        isbn_no: book[:book_infos][:isbn_no],
        edition: book[:book_infos][:edition],
        lang: book[:book_infos][:lang],
        desc: book[:book_infos][:desc]
      )
      b.create_book_category(category_id: fictional)
    end
  end

  def self.plans
    plan1  = Plan.create(name: 'One Month')
    plan1.sub_plans.create(
      name: "Chotu",
      fee: 49,
      max_book: "2"
    )
    plan1.sub_plans.create(
      name: "Regular",
      fee: 149,
      max_book: "4"
    )
    plan1.sub_plans.create(
      name: "Maha",
      fee: 249,
      max_book: "6"
    )
    plan2 = Plan.create(name: 'Three Months')
    plan2.sub_plans.create(
      name: "Chotu",
      fee: 199,
      max_book: "8"
    )
    plan2.sub_plans.create(
      name: "Regular",
      fee: 299,
      max_book: "10"
    )
    plan2.sub_plans.create(
      name: "Maha",
      fee: 399,
      max_book: "12"
    )
    plan3 = Plan.create(name: 'Six Months')
    plan3.sub_plans.create(
      name: "Chotu",
      fee: 499,
      max_book: "15"
    )
    plan3.sub_plans.create(
      name: "Regular",
      fee: 699,
      max_book: "20"
    )
    plan3.sub_plans.create(
      name: "Maha",
      fee: 999,
      max_book: "25"
    )
    plan4 = Plan.create(name: 'One Year')
    plan4.sub_plans.create(
      name: "Chotu",
      fee: 1099,
      max_book: "30"
    )
    plan4.sub_plans.create(
      name: "Regular",
      fee: 1199,
      max_book: "35"
    )
    plan4.sub_plans.create(
      name: "Maha",
      fee: 1299,
      max_book: "40"
    )
  end

  def self.book_images
      i = 1
    Book.all.each do |b|
      bc = BookCatalog.new
      f = File.open("/home/minions/Documents/Virtual Library Images/hp#{i}.jpg")
      bc.catalog = f
      bc.book_id = b.id
      bc.save!
      i = i+1
    end
  end

end
