class CreateJoinTablePhotosTags < ActiveRecord::Migration[6.1]
  def change
    create_join_table :photos, :tags do |t|
      t.index %i[photo_id tag_id]
      t.index %i[tag_id photo_id]
    end
  end
end
