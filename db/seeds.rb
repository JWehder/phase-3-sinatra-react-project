puts "🌱 Seeding spices..."

# Seed your database here
first_names = ["Mark", "John", "Luke", "Jake", "Tom", "Sandy", "Jan", "Jennifer", "Julia", "Pam", "Greg", "Liz"]

last_names = ["Williams", "Wehder", "Johnson", "James", "Carlucci", "Rowell", "Parris", "Stephens", "Verstappen", "Perez", "Samuels", "Wyatt"]

6.times do
    Salesperson.create(first_name: first_names.sample, last_name: last_names.sample, quota: rand(10000..25000))
end

Salesperson.all.each do |salesperson|
    4.times do
        Customer.create(salesperson_id: salesperson.id, customer_first_name: first_names.sample, customer_last_name: last_names.sample, units_sold: rand(50..100), revenue: rand(1000..60000))
    end
end

puts "✅ Done seeding!"

