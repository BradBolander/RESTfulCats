class Game < ActiveRecord::Base

  def to_s
    "Game number: #{self.id} with a name of #{self.name} and is a #{self.breed}"
  end

end
