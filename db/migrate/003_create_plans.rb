class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.integer :algorithm_id
      t.integer :comparison_id

      t.timestamps 
    end
    Plan.create(:algorithm_id => 1, :comparison_id => 1)
    Plan.create(:algorithm_id => 2, :comparison_id => 1)
    
  end

  def self.down
    drop_table :plans
  end
end
