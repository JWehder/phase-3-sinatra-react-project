class Salesperson < ActiveRecord::Base
    has_many :customers

    def total_revenue
        self.customers.reduce(0) {|sum, customer| sum + customer.revenue}
    end

    def self.overall_revenue
        self.all.reduce(0) {|sum, salesperson| sum + salesperson.total_revenue}
    end

    def self.total_quota
        self.all.reduce(0) {|sum, salesperson| sum + salesperson.quota}
    end
end