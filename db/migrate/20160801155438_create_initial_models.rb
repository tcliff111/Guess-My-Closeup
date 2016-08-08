class CreateInitialModels < ActiveRecord::Migration
	def change

		create_table :users do |t|
	      t.string :screenname
	 
	      t.timestamps
	    end
    
		create_table :sounds do |t|
	      t.integer :user_id
	 
	      t.timestamps
	    end

	    create_table :choices do |t|
	      t.integer :sound_id
	      t.string :text
	      t.boolean :correct
	 
	      t.timestamps
	    end

	    create_table :answers do |t|
	      t.integer :choice_id
	      t.integer :user_id
	 
	      t.timestamps
	    end


    end
end
