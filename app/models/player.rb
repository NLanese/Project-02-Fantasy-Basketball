require 'active_record'
db_options = {adapter: 'sqlite3', database: 'players'}
ActiveRecord::Base.establish_connection(db_options)
class Player < AcitveRecord::Base
    belongs_to :team
    belongs_to :user

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