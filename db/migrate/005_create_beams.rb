class CreateBeams < ActiveRecord::Migration
  def self.up
    create_table :beams do |t|
      t.integer :number
      t.decimal :value
      t.integer :plan_id

      t.timestamps 
    end
    Beam.create(:number => 1, :value => 32.2, :plan_id => 1)
    Beam.create(:number => 2, :value => 28.2, :plan_id => 1)
    
    Beam.create(:number => 1, :value => 22.2, :plan_id => 2)
    Beam.create(:number => 2, :value => 18.2, :plan_id => 2)
  
  end

  def self.down
    drop_table :beams
  end
end
