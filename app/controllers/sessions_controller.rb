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
  if request.xhr?
    erb :'sessions/login', layout: false
  else
    erb :'posts/index'
  end
end

post '/login' do
  p "NAILLLLLLEEEEDDDD IT!"
  @user = authenticate(params[:username], params[:password])
  if @user
    if request.xhr?
    login(@user)
    end
  else
    @error = "Invalid username or password"
    erb :'sessions/login'
  end
p current_user
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
