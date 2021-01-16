require 'active_record'
class Player < AcitveRecord::Base
    belongs_to :team
    belongs_to :user

end