class Presentation < ActiveRecord::Base

  has_many :ratings, :as => :rateable 


  validates_presence_of :author
  validates_length_of :author, :in => 6..100, :too_short => "Your name is too short.", :too_long => "Your name is too long."

  validates_presence_of :affiliation

  validates_presence_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    
  validates_presence_of :biography
  validates_length_of :biography, :maximum => 100 * 6, :too_long => "is too long."
  validates_length_of :biography, :minimum => 10 * 6, :too_short => "is too short."

  validates_presence_of :photo

    
  validates_presence_of :title
  validates_uniqueness_of :title, :message => "A talk with this title has already been proposed."
  validates_length_of :title, :within => 10..100, :too_long => "is too long.", :too_short => "is too short."

  validates_presence_of :theme
  validates_inclusion_of :theme, :in => ['Ruby', 'Rails 3', 'NoSQL', 'Servers'] , :message => "That is not one of our themes."    

  validates_presence_of :abstract
  validates_length_of :abstract, :maximum => 200 * 6, :too_long => "is too long."
  validates_length_of :abstract, :minimum => 20 * 6, :too_short => "is too short."


  validates_acceptance_of :agreed_to_terms, :message => "You must agree to the Terms and Conditions in order to submit a proposal."
      
end
