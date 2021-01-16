class User < AcitveRecord::Base
    has_secure_password
    has_many :players 
    has_many :teams, through: :players

    @trade_reqs = []

    def trade_reqs
        @trade_reqs
    end

    def add_trade_req(team1_players, team2_players, team2)
        i = 1
        t1_len = team1_players.length
        t1_message = ""
        team2_players.each do | player |
            t1_message << "#{player.name}"
            if (i < t1_len)
                t1_message << " and "
            end
        end
        i = 0
        t2_len = team2_players.length
        t2_message = ""
        team2_players.each do | player |
            t2_message << "#{player.name}"
            if (i < t2_len)
                t2_message << " and "
            end
        end
        @trade_reqs <<"The #{team2} would like to trade #{t2_message} for #{t1_message}."
    end

    def slug
        slug = user.name.tr(" ", "-")
        return slug
    end

    def self.find_by_slug(slug)
        User.all.each | user | do 
            if user.slug == slug
                return user
            end
        end
    end
        
end