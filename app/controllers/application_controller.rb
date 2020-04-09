require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }
    
    get '/' do 
      erb :new 
    end 
    
    post '/teams' do 
      @team = Team.new(params[:team])
      
      params[:team][:heros].each do |info|
        Team.new(info)
      end 
      
      @heros = Hero.all 
      
      erb :"/team"
    end   
    
    


end
