class CreatePersonalConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_connections, id: :uuid do |t|
      t.belongs_to :source_person, null: false, foreign_key: { to_table: :people }, type: :uuid
      t.belongs_to :target_person, null: false, foreign_key: { to_table: :people }, type: :uuid

      t.timestamps
    end
  end
end
