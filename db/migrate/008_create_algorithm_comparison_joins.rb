class CreateAlgorithmComparisonJoins < ActiveRecord::Migration
  def self.up
    create_table :algorithm_comparison_joins do |t|
      t.integer :algorithm_id
      t.integer :comparison_type_id

      t.timestamps 
    end
    AlgorithmComparisonJoin.create(:algorithm_id => 1, :comparison_type_id => 1)
  end

  def self.down
    drop_table :algorithm_comparison_joins
  end
end
