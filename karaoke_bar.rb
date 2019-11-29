class KaraokeBar

  attr_reader :name, :entry_cost, :till

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

  def increase_till_money
    @till += @entry_cost
  end

  def put_guest_into_room(guest, room)
    if customer_money_check(guest) == true
      increase_till_money()
      room.add_guest_to_room(guest)
    end
  end

end
