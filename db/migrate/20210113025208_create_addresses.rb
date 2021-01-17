class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postcode,  null:false                    
      t.string :prefecture, null:false                    
      t.string :city,       null:false                    
      t.string :street,     null:false                    
      t.string :building,   null:false                    
      t.string :tel,       null:false                    
      t.references :order,  null:false, foreign_key: true 
      t.timestamps
    end
  end
end
