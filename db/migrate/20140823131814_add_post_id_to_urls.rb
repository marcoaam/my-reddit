class AddPostIdToUrls < ActiveRecord::Migration
  def change
    add_reference :urls, :post, index: true
  end
end
