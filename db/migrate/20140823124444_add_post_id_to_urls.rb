class AddPostIdToUrls < ActiveRecord::Migration
  def change
    add_reference :urls, :url, index: true
  end
end
