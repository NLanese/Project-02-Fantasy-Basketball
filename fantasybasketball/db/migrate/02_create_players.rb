class CreatePlayers < ActiveRecord::Migration

    def change 
        create_table :players do | t |
            t.string :name
            t.integer :number
            t.string :position
            t.integer :team_id
            t.integer :user_id
            t.string :ppg
            t.string :apg
            t.string :rpg
        end
    end

end