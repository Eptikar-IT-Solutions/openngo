class AddPrecisionScaleToPriceInLines < ActiveRecord::Migration
  def change
    change_column :lines, :price, :decimal, precision: 7, scale: 2
  end
end
