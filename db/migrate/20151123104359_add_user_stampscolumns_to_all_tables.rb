class AddUserStampscolumnsToAllTables < ActiveRecord::Migration
  def change
    tables = ActiveRecord::Base.connection.tables - ["schema_migrations"]
    tables.each do |table|
      unless column_exists? table, :created_by
        add_column table, :created_by, :integer
      end

      unless column_exists? table, :updated_by
        add_column table, :updated_by, :integer
      end
    end
  end
end