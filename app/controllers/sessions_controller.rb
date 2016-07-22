get '/register' do

  erb :'sessions/register'
end

post '/register' do
  if @user = User.create(params[:user])
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
  if @user
    login(@user)

    p "login submitted"
    redirect "/"
  else
    @error = "Invalid email or password"
      erb :'sessions/login'
  end
end

