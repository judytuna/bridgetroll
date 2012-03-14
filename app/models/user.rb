class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :teaching, :taing, :coordinating, :childcaring, :writing, :hacking, :designing, :evangelizing, :mentoring, :macosx, :windows, :linux, :other

  has_many :volunteer_rsvps
  has_many :events, :through => :volunteer_rsvps
  
  def signup!(event, attending = true)
    volunteer_rsvps.create!(:event_id => event.id, :attending => attending)
  end
end
