class User < ApplicationRecord
    has_many :expusers, :dependent => :destroy
    has_many :experiments, :through => :expusers
    
    has_secure_password
    
    def admin?
        self.role == 'admin'
    end
end
