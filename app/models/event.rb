class Event < ActiveRecord::Base
  belongs_to :location
  has_many :volunteer_rsvps
  has_many :users, :through => :volunteer_rsvps
end
