class DropConditionsTable < ActiveRecord::Migration
  def up
    drop_table :conditions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
