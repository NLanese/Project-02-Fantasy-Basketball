require 'active_record'
db_options = {adapter: 'sqlite3', database: 'players'}
ActiveRecord::Base.establish_connection(db_options)
class Player < ActiveRecord::Base
    belongs_to :team
    belongs_to :user

    def slug
        slug = self.name.tr(" ", "-")
        return slug
    end

    def self.find_by_slug(slug)
        Player.all.each do | p | 
            if p.slug == slug
                return p
            end
        end
    end

end