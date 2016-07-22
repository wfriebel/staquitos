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
  p current_user
  if authenticate(params[:username], params[:password])
    login(current_user)

    p "login submitted"
    redirect "/"
  else
    @error = "Invalid email or password"
      erb :'sessions/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end


