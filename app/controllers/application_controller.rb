require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }


    get '/' do
    erb :'../views/super_hero'
    end

    post '/teams' do
      @team = Team.new(params[:team])

      params[:team][:members].each do |details|
        SuperHero.new(details)
      end
      @super_heros = SuperHero.all

      erb :'../views/team'

    end
end
