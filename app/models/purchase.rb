class Purchase < ActiveRecord::Base
  
  has_many :purchased_items 
  has_many :items, :through => :purchased_items 
  has_many :responses
  belongs_to :discount

  validates_presence_of :name, :on => :create
  validates_length_of :name, :in => 6..100, :too_short => "Your name is too short.", :too_long => "Your name is too long.", :on => :create

  validates_presence_of :job_title, :on => :create
  validates_length_of :job_title, :within => 1..100, :too_long => "is too long.", :too_short => "is too short.", :on => :create

  validates_presence_of :affiliation, :on => :create
  validates_length_of :affiliation, :within => 1..100, :too_long => "is too long.", :too_short => "is too short.", :on => :create

  validates_presence_of :phone, :on => :create
  validates_format_of :phone, :with => /[\n\.\-\(\)\s]/, :on => :create
  validates_length_of :phone, :within => 7..20, :too_long => "is too long.", :too_short => "is too short.", :on => :create

  validates_presence_of :email, :on => :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
      
  validates_acceptance_of :agreed_to_terms, :on=>:create, :message => "You must agree to the Terms and Conditions in order to make an order.", :on => :create

  def discount
    Discount.find_by_id(self.discount_id)
  end
                  
  def total_fee
    total = 0.0
    self.purchased_items.each { |item| total += item.value }
    return total
  end

  def discount_amount
    if self.discount
      return self.discount.percent / 100.0 * self.total_fee   
    else
      return 0
    end
  end

  def discounted_fee
    self.total_fee - self.discount_amount
  end
  
  def regulate
    if self.payment_amount==0
      self.payment_amount = self.discounted_fee
      self.save
    end
  end
  
end
