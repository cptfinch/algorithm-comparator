class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name

      t.timestamps 
    end
    User.create(:name => 'CPTF')
  end

  def self.down
    drop_table :users
  end
end
