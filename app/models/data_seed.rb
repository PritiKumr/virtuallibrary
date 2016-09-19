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
      fee: 250.00,
      security: "100.00",
      no_book: 1,
      max_book: "10",
      max_price: 500.00
    )
    plan1.sub_plans.create(
      name: "Regular",
      fee: 500.00,
      security: "100.00",
      no_book: 2,
      max_book: "15",
      max_price: 800.00
    )
    plan1.sub_plans.create(
      name: "Medium",
      fee: 700.00,
      security: "100.00",
      no_book: 2,
      max_book: "20",
      max_price: 1000.00
    )
    plan1.sub_plans.create(
      name: "Maha",
      fee: 1500.00,
      security: "100.00",
      no_book: 2,
      max_book: "Unlimited",
      max_price: 2000.00
    )
    plan2 = Plan.create(name: 'Three Months')
    plan2.sub_plans.create(
      name: "Chotu",
      fee: 600.00,
      security: "100.00",
      no_book: 2,
      max_book: "24",
      max_price: 800.00
    )
    plan2.sub_plans.create(
      name: "Regular",
      fee: 1200.00,
      security: "100.00",
      no_book: 2,
      max_book: "50",
      max_price: 1500.00
    )
    plan2.sub_plans.create(
      name: "Medium",
      fee: 1800.00,
      security: "100.00",
      no_book: 2,
      max_book: "70",
      max_price: 2000.00
    )
    plan2.sub_plans.create(
      name: "Maha",
      fee: 3000.00,
      security: "No security deposit",
      no_book: 3,
      max_book: "Unlimited",
      max_price: 4000.00
    )
    plan3 = Plan.create(name: 'Six Months')
    plan3.sub_plans.create(
      name: "Chotu",
      fee: 1000.00,
      security: "100.00",
      no_book: 2,
      max_book: "50",
      max_price: 1500.00
    )
    plan3.sub_plans.create(
      name: "Regular",
      fee: 2200.00,
      security: "100.00",
      no_book: 2,
      max_book: "120",
      max_price: 2500.00
    )
    plan3.sub_plans.create(
      name: "Medium",
      fee: 3500.00,
      security: "No security deposit",
      no_book: 2,
      max_book: "150",
      max_price: 4000.00
    )
    plan3.sub_plans.create(
      name: "Maha",
      fee: 5000.00,
      security: "No security deposit",
      no_book: "Unlimited",
      max_book: "Unlimited",
      max_price: 5500.00
    )
    plan4 = Plan.create(name: 'One Year')
    plan4.sub_plans.create(
      name: "Chotu",
      fee: 2500.00,
      security: "100.00",
      no_book: 2,
      max_book: "120",
      max_price: 3000.00
    )
    plan4.sub_plans.create(
      name: "Regular",
      fee: 4200.00,
      security: "No security deposit",
      no_book: 2,
      max_book: "250",
      max_price: 4200.00
    )
    plan4.sub_plans.create(
      name: "Medium",
      fee: 5500.00,
      security: "No security deposit",
      no_book: 2,
      max_book: "300",
      max_price: 6000.00
    )
    plan4.sub_plans.create(
      name: "Maha",
      fee: 8000.00,
      security: "No security deposit",
      no_book: "Unlimited",
      max_book: "Unlimited",
      max_price: 10000.00
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
