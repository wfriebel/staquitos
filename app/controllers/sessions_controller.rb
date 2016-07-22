get '/register' do
  if request.xhr?
    erb :'sessions/register', layout: false
  else
    erb :'sessions/register'
  end
end

post '/register' do
  @user = User.create(params)
  if @user.save
    if request.xhr?
      content_type :json
      {success: true}.to_json
    else
      login(@user)
      redirect '/'
    end
  else
    if request.xhr?
      content_type :json
      {success: false}.to_json
    else
      redirect '/register'
    end
  end
end

get '/login' do

  erb :'sessions/login'
end

post '/login' do
  user = authenticate(params[:username], params[:password])
  if user
    login(user)
    redirect "/"
  else
    @error = "Invalid username or password"
    erb :'sessions/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end


