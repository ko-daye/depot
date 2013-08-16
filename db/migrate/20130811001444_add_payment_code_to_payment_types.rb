class AddPaymentCodeToPaymentTypes < ActiveRecord::Migration
  def change
    add_column :payment_types, :payment_code, :integer
  end
end
