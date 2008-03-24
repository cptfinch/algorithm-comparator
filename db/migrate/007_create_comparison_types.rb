class CreateComparisonTypes < ActiveRecord::Migration
  def self.up
    create_table :comparison_types do |t|
      t.string :name
      t.integer :algorithm_comparison_join_id
      t.decimal :tolerance

      t.timestamps 
    end
    ComparisonType.create(:name => 'chestwall (pencil beam vs collapsed cone)', :algorithm_comparison_join_id => 1, :tolerance => 5.0)
  end

  def self.down
    drop_table :comparison_types
  end
end
