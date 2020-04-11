require 'csv'

module Doppel
  module CreditCard
    module Expenses
      def self.expenses(path_to_file)
        g = CSV.read(path_to_file)
        all_expenses = g.map { |a| Hash[ g.first.zip(a) ] }.drop(1)
      end

      def self.expenses_by_day(expenses)
        filtered_expenses = {}
        expenses.each do |expense|
          date = expense["Date"]
          filtered_expenses[date] ||= []
          filtered_expenses[date] << expense
        end
        filtered_expenses
      end

      def self.totals_by_day(expenses_by_day)
        totals_expenses_for_each_day = {}
        expenses_by_day.each do |date, expenses|
          totals_expenses_for_each_day[date] = expenses.map { |e| e["Amount"].to_f }.select { |amount| amount > 0}.sum.round(2)
        end
        totals_expenses_for_each_day
      end

      def self.counts_by_day(expenses_by_day)
        count_of_expenses_by_day= Hash.new(0)
        expenses_by_day.each { |date, expenses| count_of_expenses_by_day[date] += 1 }
        count_of_expenses_by_day
      end

      def self.summary(expenses)

        {
          expenses_by_day: expenses_by_day(expenses),
          totals_by_day: totals_by_day(expenses_by_day(expenses)),
          counts_by_day: counts_by_day(expenses),
        }
      end

    end
  end
end
