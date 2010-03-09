class Question < ActiveRecord::Base
  belongs_to :item

  def typus_name
    query
  end
  

end
