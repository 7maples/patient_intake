class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :id_str
      t.string :screen_name
      t.string :name
      t.string :profile_image_url

      t.timestamps
    end
  end
end
