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
  #   @projects = Project.search_word(params[:search])
  # else
     @projects = Project.all
  # end
  erb(:index)
end

# get ('/word/new') do 
#   erb(:new_word)
# end

# patch('/words') do
#   erb(:home_page)
# end

# post('/words') do 
#   new_word = params[:word]
#   word = Word.new({:word => new_word, :id => nil})
#   word.save()
#   redirect to('/')
# end

# get('/word/:id') do
#   @word = Word.find_word_by_id(params[:id].to_i())
#   erb(:word)
# end

# post('/word/:id/definition') do
#   @word = Word.find_word_by_id(params[:id].to_i())
#   definition = Definition.new({:definition => params[:definition],:word_id => @word.id, :id => nil}) 
#   definition.save()
#   erb(:word)
# end

# get('/word/:id/update_word') do
#   @word = Word.find_word_by_id(params[:id].to_i())
#   erb(:update_word)
# end

# patch('/word/:id') do
#   @word = Word.find_word_by_id(params[:id].to_i)
#   @word.update(params[:update_word])
#   redirect to("/word/#{@word.id}")
# end

# delete('/word/:id') do
#   word = Word.find_word_by_id(params[:id].to_i)
#   word.delete_definition
#   word.delete
#   redirect '/'
# end

# get('/word/:id/definition/:definition_id') do
#   @word = Word.find_word_by_id(params[:id].to_i)
#   @definition = Definition.find_definition_by_id(params[:definition_id].to_i())
#   erb(:update_definition)
# end

# patch('/word/:id/definition/:definition_id') do
#   @definition = Definition.find_definition_by_id(params[:definition_id].to_i())
#   @definition.update(params[:new_definition])
#   redirect to("/word/#{params[:id]}")
# end

# delete('/word/:id/definition/:definition_id') do
#   definition = Definition.find_definition_by_id(params[:definition_id].to_i())
#   definition.delete
#   redirect to("/word/#{params[:id]}")
# end