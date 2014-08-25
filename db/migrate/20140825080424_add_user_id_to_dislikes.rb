class AddUserIdToDislikes < ActiveRecord::Migration
  def change
    add_column :dislikes, :user_id, :integer
  end
end
