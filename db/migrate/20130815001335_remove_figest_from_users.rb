class RemoveFigestFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_figest, :string
  end
end
