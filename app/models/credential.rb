class Credential < ActiveRecord::Base

  def generate_code
    self.code = Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by {rand}.join)
  end
   
  def self.authenticate(candidate)
    @credential = Credential.find_by_code(candidate)    
    if @credential
      @credential.access_count+=1
      @credential.save
    end

    return @credential    
  end

end
