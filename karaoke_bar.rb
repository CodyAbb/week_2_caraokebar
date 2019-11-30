class KaraokeBar

  attr_reader :name, :entry_cost, :till, :rooms

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

  def check_guest_out(guest, room)
    room.remove_guest_from_room(guest)
  end

  def check_guest_in(guest, room)
    room.add_guest_to_room(guest)
  end

  def full_capacity_check(room)
    room.occupants.length > 2 ? true : false
  end

  def put_guest_into_room(guest, room)
    if customer_money_check(guest) == true
      if full_capacity_check(room[0]) == true
        increase_till_money()
        guest.take_customer_payment(entry_cost)
        room[1].add_guest_to_room(guest)
      else
        increase_till_money()
        guest.take_customer_payment(entry_cost)
        room[0].add_guest_to_room(guest)
      end
    end
  end

end
