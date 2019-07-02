require 'sinatra'
require 'sqlite3'

$db = SQLite3::Database.new("./database.sqlite3")

$db.execute("create table users (id interger, email varcharc(255), password varcharc(255), PRIMARY KEY (id));")

class USER
  attr_accessor :email, :password
  def initialize(email, password)
    @email = email
    @password = password
  end

  def valid?
    if (@email != ''&& @password != ''  && @password.length > 7)
      return true
    end
  end

  def save
    $db.execute("INSERT INTO users (email, password)
    VALUES ('#{@email}', '#{@password}');")
    return true
  end

  def self.all
    @all = $db.execute("SELECT * FROM users;")
    return @all
  end

  def self.find(id)
    @user = $db.execute)()
end

# @user = USer.new()
# @user.save

get '/' do
  erb :home
end

get '/signup' do
  erb :signup
end

get '/users' do
  @users = User.all
  erb :users
end

get '/user/:id' do
  @user =
end

post '/signup' do
  p "Post request received"
  p params
  @user = User.new(params['email'],params['password'])
  if @user.valid?
    @user.save
    redirect '/thank-you', 301
  else
    puts "This user is missing information"
  end
end

get '/thanks-you' do
  erb :thanks
end
