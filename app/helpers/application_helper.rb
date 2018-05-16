module ApplicationHelper
    
    def country
        @country ||= Country.new
    end
    
    def city
        @city ||= City.new
    end

    def distric
        @district ||= District.new
    end
    def department
        @department ||= Department.new
    end
    def user
        @user ||= User.new
    end
    

    
    
end
