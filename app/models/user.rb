class User < AcitveRecord::Base
    has_secure_password
    has_many :players 
    has_many :teams, through: :players

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