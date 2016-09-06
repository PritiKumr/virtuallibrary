class DataSeed < ApplicationRecord
  Author.create(name: "Ashwin Sanghi")
  Publication.create(name: "Red Hot Chillies")
  Book.create(sku: "AB123K", name: "The krishna key", price: 120, author_id: 1, publication_id: 1)

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
end
