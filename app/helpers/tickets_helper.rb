module TicketsHelper
  def fare_list
    Fare::Client.new.get.map { |fare| ["#{fare}円", fare] }
  end
end
