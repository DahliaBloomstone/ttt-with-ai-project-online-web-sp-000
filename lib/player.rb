#a root class that will act as an inheritance point for actual player classes.
class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

end
