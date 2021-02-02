require 'active_record'
class Team < ActiveRecord::Base
    has_many :players
    has_many :users, through: :players

    def slug
        slug = self.name.tr(" ", "-")
        return slug
    end

    def self.find_by_slug(slug)
        Team.all.each do | t | 
            if t.slug == slug
                return t
            end
        end
    end
end

# Team IDs
# 1. Atlanta 
# 2. Boston
# 3. Brooklyn
# 4. Charolette
# 5. Chicago
# 6. Cleveland
# 7. Dallas
# 8. Denver
# 9. Detroit
# 10. Golden State
# 11. Houston
# 12. Indiana
# 13. LAC
# 14. LAL
# 15. Memphis
# 16. Miami
# 17. Milwaukee
# 18. Minnesota
# 19. New Orleans
# 20. New York
# 21. OKC
# 22. Orlando
# 23. Philadelphia
# 24. Phoenix
# 25. Portland Trailblazers
# 26. Sacremento
# 27. San Antonio
# 28. Toronto
# 29. Utah
# 30. Washington