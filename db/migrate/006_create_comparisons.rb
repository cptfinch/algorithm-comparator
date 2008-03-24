class CreateComparisons < ActiveRecord::Migration
  def self.up
    create_table :comparisons do |t|
      t.decimal :result
      t.text :comment
      t.integer :patient_id
      t.integer :user_id
      t.integer :comparison_type_id

      t.timestamps 
    end
   # Comparison.create( :comment => 'test', :patient_id => 1, :user_id => 1, :comparison_type_id => 1 )
  end

  def self.down
    drop_table :comparisons
  end
end
