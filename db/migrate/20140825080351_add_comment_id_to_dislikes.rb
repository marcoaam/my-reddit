class AddCommentIdToDislikes < ActiveRecord::Migration
  def change
    add_reference :dislikes, :comment, index: true
  end
end
