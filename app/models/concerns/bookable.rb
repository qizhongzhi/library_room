module Bookable
  extend ActiveSupport::Concern

  included do
    belongs_to :room
    belongs_to :user

  
    validates :start_time, presence: true 
    validates :length, presence: true, numericality: { greater_than: 0 }
    validate :start_date_cannot_be_in_the_past
    validate :start_date_cannot_be_in_week_advance
    validate :destory_booking_after_endtime
    validate :overlaps

    before_validation :calculate_end_time
  

    scope :end_during, ->(new_start_time, new_end_time) do
      if (!new_start_time.nil?) && (!new_end_time.nil?)
        where('end_time > ? AND end_time < ?', new_start_time, new_end_time)
      else
        return nil
      end
    end

    scope :start_during, ->(new_start_time, new_end_time) do
      if (!new_start_time.nil?) && (!new_end_time.nil?)
        where('start_time > ? AND start_time < ?', new_start_time, new_end_time)
      else
        return nil
      end
    end

    scope :happening_during, ->(new_start_time, new_end_time) do
      if (!new_start_time.nil?) && (!new_end_time.nil?)
        where('start_time > ? AND end_time < ?', new_start_time, new_end_time)
      else
        return nil
      end 
    end

    scope :enveloping, ->(new_start_time, new_end_time) do
      if (!new_start_time.nil?) && (!new_end_time.nil?)
        where('start_time < ? AND end_time > ?', new_start_time, new_end_time)
      else
        return nil
      end
    end

    scope :identical, ->(new_start_time, new_end_time) do
      if (!new_start_time.nil?) && (!new_end_time.nil?)
        where('start_time = ? AND end_time = ?', new_start_time, new_end_time)
      else
        return nil
      end
    end
  end

  def overlaps
    overlapping_bookings = [ 
      room.bookings.end_during(start_time, end_time),
      room.bookings.start_during(start_time, end_time),
      room.bookings.happening_during(start_time, end_time),
      room.bookings.enveloping(start_time, end_time),
      room.bookings.identical(start_time, end_time)
    ].flatten

    overlapping_bookings.delete self
    if overlapping_bookings.any?
      errors.add(:base, 'Slot has already been booked')
    end
  end

  def start_date_cannot_be_in_the_past
    if start_time< (DateTime.current)
      errors.add(:start_time, 'must be after present time')
    end
  end

  def start_date_cannot_be_in_week_advance
    if start_time > (DateTime.current + 1.week)
      errors.add(:start_time, 'cannot be booked beyond a week')
    end
  end

  def destory_booking_after_endtime    #09-27
    @bookings=Booking.all
        @bookings.each do |booking|
        if booking.end_time < DateTime.current
            booking.destroy
        end
    end
  end

  def calculate_end_time
    start_time = validate_start_time
    length = validate_length
    if start_time && length
      self.end_time = start_time + (length.hours - 60)
    end
  end


  def as_json(options = {})  
   {  
    :id => self.id,  
    :start => self.start_time,  
    :end => self.end_time + 60,  
    :recurring => false, 
    :allDay => false
   }  
  end  

  private

    def validate_start_time
      if !self.start_time.nil?
        start_time = self.start_time
      else
        return nil
      end
    end

    def validate_length
      if !self.length.nil?
        length = self.length.to_i
      else
        return nil
      end
    end

end