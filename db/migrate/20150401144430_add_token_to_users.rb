class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pivotal_tracker_token, :string
  end
end
