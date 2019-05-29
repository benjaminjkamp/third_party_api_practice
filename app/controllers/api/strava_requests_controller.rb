class Api::StravaRequestsController < ApplicationController

  def auth
    redirect_to "https://www.strava.com/oauth/authorize?response_type=code&scope=activity:read_all&client_id=35755&redirect_uri=http://localhost:3000/api/token"
  end

  def redirect
    redirect_to "http://localhost:3000/api/token"
    
  end

  def token
    response = HTTP.post(
      "https://www.strava.com/oauth/token?client_id=35755&client_secret=#{ENV["strava_secret"]}&grant_type=authorization_code&code=#{params[:code]}"
      
    )
    # token = nil
    token = response.parse["access_token"]
    refresh_token = response.parse["refresh_token"]

    @response = HTTP
                .auth("Bearer #{token}")
                .get("https://www.strava.com/api/v3/athlete")
    render 'index.json.jbuilder'
  end

end
