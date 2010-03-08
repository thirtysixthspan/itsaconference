class Presentation < ActiveRecord::Base

  has_many :ratings, :as => :rateable 


  validates_presence_of :author, :on => :create
  validates_length_of :author, :in => 6..100, :too_short => "Your name is too short.", :too_long => "Your name is too long.", :on => :create

  validates_presence_of :email, :on => :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
    
  validates_presence_of :biography, :on => :create
  validates_length_of :biography, :maximum => 100 * 6, :too_long => "is too long.", :on => :create
  validates_length_of :biography, :minimum => 10 * 6, :too_short => "is too short.", :on => :create

  validates_presence_of :photo, :on => :create
    
  validates_presence_of :title, :on => :create
  validates_uniqueness_of :title, :message => "A talk with this title has already been proposed.",:on => :create
  validates_length_of :title, :within => 10..100, :too_long => "is too long.", :too_short => "is too short.", :on => :create

  validates_presence_of :theme, :on => :create
  validates_inclusion_of :theme, :in => ['Ruby', 'Rails 3', 'NoSQL', 'Servers'] , :message => "That is not one of our themes.", :on => :create    

  validates_presence_of :abstract, :on => :create
  validates_length_of :abstract, :maximum => 200 * 6, :too_long => "is too long.", :on => :create
  validates_length_of :abstract, :minimum => 20 * 6, :too_short => "is too short.", :on => :create


  validates_acceptance_of :agreed_to_terms, :on=>:create, :message => "You must agree to the Terms and Conditions in order to submit a proposal."
      
      
  def small_photo
    self.photo.gsub("/speaker_photos/","/speaker_photos/photo_")
  end    

  def large_photo
    self.photo.gsub("/speaker_photos/","/speaker_photos/large_photo_")
  end    


  def bio_photo
    self.photo.gsub("/speaker_photos/","/speaker_photos/bio_photo_")
  end    
      
end
