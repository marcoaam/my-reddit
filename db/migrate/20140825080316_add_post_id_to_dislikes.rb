class AddPostIdToDislikes < ActiveRecord::Migration
  def change
    add_reference :dislikes, :post, index: true
  end
end
