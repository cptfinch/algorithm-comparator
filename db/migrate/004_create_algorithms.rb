class CreateAlgorithms < ActiveRecord::Migration
  def self.up
    create_table :algorithms do |t|
      t.string :name
      t.integer :algorithm_comparison_join_id

      t.timestamps 
    end
    Algorithm.create(:name => 'collapsed cone', :algorithm_comparison_join_id => 1)
    Algorithm.create(:name => 'pencil beam', :algorithm_comparison_join_id => 1)
  end

  def self.down
    drop_table :algorithms
  end
end
