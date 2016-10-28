require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

config.assets.precompile << Proc.new do |path|  
  if path =~ /\.(css|js|scss|png|jpg|gif|json)\z/  
    full_path = Rails.application.assets.resolve(path).to_path  
    app_assets_path1 = Rails.root.join('app', 'assets').to_path  
    app_assets_path2 = Rails.root.join('public', 'assets').to_path  
    app_assets_path3 = Rails.root.join('vendor', 'assets').to_path  


    if full_path.starts_with? app_assets_path1  
      true  
    else  
      if full_path.starts_with? app_assets_path2  
        true  
      else  
        if full_path.starts_with? app_assets_path3  
          true  
        else  
          false  
        end  
      end  
    end  
  end  
end 

module RecruitStu
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
