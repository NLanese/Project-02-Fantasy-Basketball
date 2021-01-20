class CreatePlayers < ActiveRecord::Migration[6.1]

    def change 
        create_table :players do | t |
            t.string :name
            t.integer :number
            t.integer :team_id
            t.string :ppg
            t.string :apg
            t.string :rpg
        end
    end

end