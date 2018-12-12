require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index

# show

get '/students' do
  @students = Student.all()
  erb(:students)
end

get '/students/:id' do
  @student = Student.find( params[:id] )
  erb(:view)
end

# new

get '/students/new' do
  erb(:new)
end

# create

post '/students' do
  @student = Student.new( params )
  @student.save()
  erb(:create)
end

# edit

get '/students/:id/edit' do
  @student = Student.find( params[:id] )
  erb(:edit)
end

# update

post '/students/:id' do
  Student.new( params ).update
  redirect to '/students'
end

# destroy
