class createTeams < ActiveRecord::Migrations

    def change 
        create_table :teams do | t |
            t.string :name
        end
    end

end