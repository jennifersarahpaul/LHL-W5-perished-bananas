class RemovePosterUrlColumn < ActiveRecord::Migration
  def change
    change_table :movies do |t|
      t.remove :poster_image_url
    end
  end
end
