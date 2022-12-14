class Project

  attr_reader :id
  attr_accessor :title

  def initialize(attributes) 
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)  
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("name")
      id = project.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def save 
    result  = DB.exec("INSERT INTO projects(name) VALUES ('#{@title}') RETURNING id; ")
    @id = result.first().fetch("id").to_i
  end

  def ==(project_to_compare)
    self.title == project_to_compare.title 
  end

  def self.find(id) 
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first 
    title = project.fetch("name")
    id = project.fetch("id").to_i 
    Project.new({:title => title, :id => id})
  end


  def self.clear
    DB.exec("DELETE FROM projects *;")
  end

  def update(attributes)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first 
    @title = attributes.fetch(:title)
    DB.exec("UPDATE projects SET name = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
    DB.exec("DELETE FROM volunteers WHERE project_id = #{@id};")
  end

  def volunteers
    Volunteer.find_by_project(self.id)
  end

  def delete_volunteer 
    volunteers = []
    if volunteers != [] 
      volunteers.each do |volunteer| 
        Volunteer.delete(volunteer.id) 
      end
    end
  end

end 

