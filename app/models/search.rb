class Search < ActiveRecord::Base
 
  def search_rooms
    rooms = Room.all

    rooms = rooms.where(["name LIKE ?", "%#{name}%"]) if name.present?
    rooms = rooms.where(["size LIKE ?", size]) if size.present?
    rooms = rooms.where(["location LIKE ?", location]) if location.present?

    return rooms
  end
end
