class CreateSampleIndices < ActiveRecord::Migration
  def change
    create_table :sample_indices do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
