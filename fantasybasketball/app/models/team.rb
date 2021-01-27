require 'active_record'
class Team < ActiveRecord::Base
    has_many :players
    has_many :users, through: :players

    def slug
        slug = user.name.tr(" ", "-")
        return slug
    end

    def self.find_by_slug(slug)
        User.all.each do | user | 
            if user.slug == slug
                return user
            end
        end
    end
end