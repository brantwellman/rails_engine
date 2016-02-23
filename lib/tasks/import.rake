require "csv"

namespace :import do
  desc "TODO"
  task seed_db: :environment do

    customers = "vendor/assets/csv/customers.csv"
    CSV.foreach(customers, :headers => true) do |row|
      Customer.create!(row.to_h)
    end

    merchants = "vendor/assets/csv/merchants.csv"
    CSV.foreach(merchants, :headers => true) do |row|
      Merchant.create!(row.to_h)
    end

    items = "vendor/assets/csv/items.csv"
    CSV.foreach(items, :headers => true) do |row|
      row["unit_price"] = row["unit_price"].to_f/100
      Item.create!(row.to_h)
    end

    invoices = "vendor/assets/csv/invoices.csv"
    CSV.foreach(invoices, :headers => true) do |row|
      Invoice.create!(row.to_h)
    end

    transactions = 'vendor/assets/csv/transactions.csv'
    CSV.foreach(transactions, :headers =>true) do |row|
      Transaction.create!(id: row["id"],
        invoice_id: row["invoice_id"],
        credit_card_number: row["credit_card_number"],
        result: row["result"],
        created_at: row["created_at"],
        updated_at: row["updated_at"]
      )
    end

    invoice_items = "vendor/assets/csv/invoice_items.csv"
    CSV.foreach(invoice_items, :headers => true) do |row|
      row["unit_price"] = row["unit_price"].to_f/100
      InvoiceItem.create!(row.to_h)
    end
  end

end
