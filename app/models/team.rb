require 'active_record'
class Team < AcitveRecord::Base
    has_many :players
    has_many :users, through: :players


end