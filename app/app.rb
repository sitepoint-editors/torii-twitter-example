helpers do
  def auth_token
    request.env["HTTP_AUTHORIZATION"]
  end
  
  def authenticated
    if auth_token and
        User.find_by(token: auth_token)
      true
    else
      throw(:halt, [401, "Not authorized\n"])
    end
  end
  
  def omniauth_auth
    request.env['omniauth.auth']
  end
end

set :public_folder, 'public/dist'

get '/auth/twitter/callback' do
  user_info = omniauth_auth['info']
  user = User.find_or_create_by(name: user_info['nickname'])
  user.generate_token
  user.save!
  redirect "/?code=#{user.token}"
end

get '/auth/failure' do
  redirect '/'
end

post '/logout' do
  authenticated
  user = User.find_by(token: auth_token)
  user.token = nil
  user.save!
  redirect '/'
end

get '/users/me' do
  authenticated
  u = User.find_by(:token => auth_token)
  {
    "user" => u
  }.to_json
end


get '/*' do
  File.read(File.join('public/dist', 'index.html'))
end
