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

  def check_guest_out(guest, room)
    room.remove_guest_from_room(guest)
  end

  def full_capacity_check(room)
    room.occupants.length > 3 ? true : false
  end

end
