class Experiment < ApplicationRecord
    has_many :expusers, :dependent => :destroy
    has_many :users, :through => :expusers
    
    validates_presence_of :min, :max
    
    attr_writer :email_list
    
    after_save :assign_users
    
    def email_list
        @email_list || users.map(&:email).join(' ')
    end
    
    private
    
    def assign_users
        if @email_list
            self.users = @email_list.split(/\s+/).map do |email|
                User.find_or_create_by(email: email)
            end
        end
    end
end
