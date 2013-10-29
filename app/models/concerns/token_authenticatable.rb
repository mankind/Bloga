#http://stackoverflow.com/questions/18931952/devise-token-authenticatable-deprecated-what-is-the-alternative

module TokenAuthenticatable
  extend ActiveSupport::Concern


  #Now called from user controller to ensure transparent code reading
  #included do
  #  before_save :ensure_authentication_token!
  #end



  module ClassMethods
    
     def find_by_authentication_token(authentication_token = nil)
      if authentication_token
        where(authentication_token: authentication_token).first
      end
    end
    
  end #closes module ClassMethods
  
  def ensure_authentication_token!
     if authentication_token.blank?
       self.authentication_token = generate_authentication_token
      end
   end
  
   def reset_authentication_token!
      self.authentication_token = generate_authentication_token
      save
    end
    
    private
      
    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
    
  
  
end  #closes module Token
