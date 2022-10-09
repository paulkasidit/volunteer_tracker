require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "project_management"})

get('/') do 
  # if params["search"]
  #   @projects = Project.search_project(params[:search])
  # else
     @projects = Project.all
  # end
  erb(:index)
end

# get ('/project/new') do 
#   erb(:new_project)
# end

# patch('/projects') do
#   erb(:home_page)
# end

post('/projects') do 
  new_project= params[:project]
  project = Project.new({:title => new_project, :id => nil})
  project.save()
  redirect to('/')
end

get('/project/:id') do
  @project = Project.find(params[:id].to_i())
  @volunteers = Volunteer.find_by_project(@project.id)
  erb(:project)
end

post('/project/:id/update_project') do
  @project = Project.find(params[:id].to_i())
  volunteers = Volunteer.new({:name => params[:volunteer], :project_id => @project.id, :id => nil}) 
  volunteers.save()
  erb(:update_project)
  redirect to("/project/#{params[:id]}")
end

get('/project/:id/update_project') do
  @project = Project.find(params[:id].to_i())
  erb(:update_project)
end

patch('/project/:id') do
  @project = Project.find(params[:id].to_i)
  @project.update(params[:title])
  redirect to("/project/#{@project.id}")
end

delete('/project/:id') do
  project = Project.find(params[:id].to_i)
  project.delete
  redirect to('/')
end

get('/project/:id/volunteer/:volunteer_id') do
  @project = Project.find(params[:id].to_i)
  @volunteer = Volunteer.find(params[:volunteer_id].to_i())
  erb(:update_volunteer)
end

patch('/project/:id/volunteer/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i())
  @volunteer.update(params[:volunteer])
  redirect to("/project/#{params[:id]}")
end

delete('/project/:id/volunteer/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i())
  @volunteer.delete
  redirect to("/project/#{params[:id]}")
end