class Response < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :question

end
