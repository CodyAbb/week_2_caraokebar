class KaraokeBar

  attr_reader :name, :entry_cost

  def initialize(name, entry_cost, till, rooms)
    @name = name
    @entry_cost = entry_cost
    @rooms = []
    @till = till
  end


  def customer_money_check(guest)
    if guest.wallet >= entry_cost
      return true
    else
      return false
    end
  end

end
