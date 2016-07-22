get '/register' do

  erb :'sessions/register'
end

post '/register' do
@user = User.create(params)
  if @user.save
    login(@user)
    redirect '/'
  else
    redirect '/register'
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


