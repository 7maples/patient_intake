class IndexPatientsResponses < ActiveRecord::Migration
  def up
    execute "CREATE INDEX patients_responses ON patients USING GIN(responses)"
  end

  def down
    execute "DROP INDEX patients_responses"
  end
end
