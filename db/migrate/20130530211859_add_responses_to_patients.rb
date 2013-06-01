class AddResponsesToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :responses, :hstore
  end
end
