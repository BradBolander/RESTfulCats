class Song < ActiveRecord::Base

  def to_s
    "Song number: #{self.id} with a name of #{self.name} and is a #{self.breed}"
  end

end
