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

# post('/project/:id/definition') do
#   @project = project.find(params[:id].to_i())
#   definition = Definition.new({:definition => params[:definition],:project_id => @project.id, :id => nil}) 
#   definition.save()
#   erb(:project)
# end

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

# get('/project/:id/definition/:definition_id') do
#   @project = project.find(params[:id].to_i)
#   @definition = Definition.find_definition_by_id(params[:definition_id].to_i())
#   erb(:update_definition)
# end

# patch('/project/:id/definition/:definition_id') do
#   @definition = Definition.find_definition_by_id(params[:definition_id].to_i())
#   @definition.update(params[:new_definition])
#   redirect to("/project/#{params[:id]}")
# end

# delete('/project/:id/definition/:definition_id') do
#   definition = Definition.find_definition_by_id(params[:definition_id].to_i())
#   definition.delete
#   redirect to("/project/#{params[:id]}")
# end