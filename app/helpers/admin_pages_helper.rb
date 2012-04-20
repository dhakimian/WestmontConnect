module AdminPagesHelper
  def getname user
    name = user[:name].scan(/\w+/)
    return name[0]+" "+name[2]+" "+name[1]
  end 
end
