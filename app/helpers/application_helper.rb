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
    
    def icon_file_type(filename, options={})
      ext = filename.match(/[^\\]*\.(\w+)$/)[1]
      size = "#{options[:size]}/" if options[:size]
      "/file_type_icons/#{size ||=""}#{ext}.png"
    end




end
