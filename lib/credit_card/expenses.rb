require 'csv'

module Doppel
  module CreditCard
    module Expenses
      class ExpenseYear
        attr_reader :year

        def initialize(year)
          @year = year
        end

        def rideshare
          binding.pry
          @rideshare ||= expenses.where(description: ['uber', 'UBER', 'lyft', 'LYFT', 'via', 'VIA'])
        end

        def takeout
          # What's the relationship to food?
          takeout_companies = ['seamless', 'uber eats', 'ubereats', 'grubhub', 'seamlss']
          takeout_expenses = expenses.select do |e|
            takeout_companies.any? { |restaurant| e.description.downcase.include?(restaurant) }
          end

          seamless_expenses  = takeout_expenses.select { |e| ['seamless', 'seamlss', 'grubhub'].any? { |r| e.description.downcase.include?(r) } }
          uber_eats_expenses = takeout_expenses.select { |e| ['uber eats', 'ubereats'].any? { |r| e.description.downcase.include?(r) } }

          {
            total_spend:     takeout_expenses.sum(&:amount),
            seamless_spend:  seamless_expenses.sum(&:amount),
            uber_eats_spend: uber_eats_expenses.sum(&:amount),
          }
        end

        def food
          # What's the relationship to takeout?
        end

        def rent

        end

        def amazon

        end

        def coffee

        end

        def travel

        end

        private

        def expenses
          beginning_of_year = Date.new(year)
          end_of_year       = beginning_of_year.end_of_year
          @expenses ||= CreditCardExpense.where(expense_date: beginning_of_year..end_of_year)
        end
      end
    end
  end
end
