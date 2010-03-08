class Purchase < ActiveRecord::Base
  
  has_many :items, :as => :purchased_items 

  validates_presence_of :name
  validates_length_of :name, :in => 6..100, :too_short => "Your name is too short.", :too_long => "Your name is too long."

  validates_presence_of :job_title
  validates_length_of :job_title, :within => 1..100, :too_long => "is too long.", :too_short => "is too short."

  validates_presence_of :affiliation
  validates_length_of :affiliation, :within => 1..100, :too_long => "is too long.", :too_short => "is too short."

  validates_presence_of :phone
  validates_format_of :phone, :with => /[\n\.\-\(\)\s]/
  validates_length_of :phone, :within => 7..20, :too_long => "is too long.", :too_short => "is too short."

  validates_presence_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
      
  validates_acceptance_of :agreed_to_terms, :on=>:create, :message => "You must agree to the Terms and Conditions in order to make an order."

end
