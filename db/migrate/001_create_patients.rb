class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :name
      t.string :id_number

      t.timestamps 
    end
    Patient.create(:name => 'John Sickman',:id_number => '1234T')
  end

  def self.down
    drop_table :patients
  end
end
