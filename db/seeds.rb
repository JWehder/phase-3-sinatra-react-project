puts "🌱 Seeding spices..."

# Seed your database here

6.times do
    Salesperson.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, quota: rand(10000..25000))
end

Salesperson.all.each do |salesperson|
    4.times do
        Customer.create(salesperson_id: salesperson.id, customer_first_name: Faker::Name.first_name, customer_last_name: Faker::Name.last_name, units_sold: rand(50..100), revenue: rand(1000..60000))
    end
end

puts "✅ Done seeding!"

