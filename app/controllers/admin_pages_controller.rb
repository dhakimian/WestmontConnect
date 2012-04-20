class AdminPagesController < ApplicationController

=begin  # Example user entry for reference
 {
      id: "0003420",
      name:         "Tom Riddle Marvolo",    #AlumDirPerson: FirstName LastName MiddleName
      major:        "The Dark Arts",         #AlumDirDegreesW: Major1Desc
      year:         "1989",                  #AlumDirDegreesW: AwardYr
      phone1:       "(480) 275-8369",        #AlumDirPerson: HomePhone
      phone2:       nil,                     #AlumDirPerson: CellPhone
      email:        "felk690@mac.com",       #AlumDirPerson: BestEmail
      addr1:        "1388 Meadow Glen",      #AlumDirPerson: PrefMailAddr1
      addr2:        nil,                     #AlumDirPerson: PrefMailAddr2
      addr3:        nil,                     #AlumDirPerson: PrefMailAddr3
      addr_city:    "Southlake",             #AlumDirPerson: PrefMailCity
      addr_state:   "TX",                    #AlumDirPerson: PrefMailState
      addr_zip:     "76092-5845",            #AlumDirPerson: PrefMailZip
      addr_country: nil,                     #AlumDirPerson: PrefMailCountry
}
=end
    
  def fakeuserlist num
    first_names = %w[Jim John Bob Tom Fran Bill Ted Norm Alex Johnny Daniel Bilbo Frodo Samwise Sally]
    middle_names = first_names + %w[Marvolo]
    last_names = %w[Tolstoy Phillips Standke Hakimian Shure Baggins Riddle Doe Struthers]
    majors = ["Computer Science", "Liberal Arts", "Dark Arts", "Linguistics", "Psychology", "English"]
    users = []
    i = 0
    while i < num
      users += [{
        id: "#{rand(1000000)}",
        name: "#{first_names[rand(first_names.size)]} #{last_names[rand(last_names.size)]} #{middle_names[rand(middle_names.size)]} ",
        major: "#{majors[rand(majors.size)]}",
        year: "#{rand(2013)}" ,

        }]
      i += 1
    end
  return users

  end
  
  def queue
  end

  def search
  end

  def searchresults
    @debug = params.to_s
    @params = params

    
    @results_num = rand(25)
    @users = fakeuserlist @results_num
  end

  def directory
    @users = fakeuserlist 25   # Simulate pulling entire user list from database

    if params[:l] and params[:l] != "all"
      @users.delete_if {|user| user[:name].scan(/\w+/)[1][0] != params[:l]}
    end 

    ifAll = ""
    if @users == []
      @results = "There are no alumni"
      ifAll = " in the directory!"
    else
      @results = "Showing all alumni"
      #ifAll =
    end
    if params[:l] and params[:l] != "all"
      @results += " whose last names start with #{params[:l]}"
    else
      @results += ifAll
    end
  end

  def edituser
    # ~~~ Simulate User Lookup ~~~
    @id = params[:id]

    # lookup user by id

    @user = Hash.new
    @user = {
      id: "0003420",
      name:         "Tom Riddle Marvolo",    #AlumDirPerson: FirstName LastName MiddleName
      major:        "The Dark Arts",         #AlumDirDegreesW: Major1Desc
      year:         "1989",                  #AlumDirDegreesW: AwardYr
      phone1:       "(480) 275-8369",        #AlumDirPerson: HomePhone
      phone2:       nil,                     #AlumDirPerson: CellPhone
      email:        "felk690@mac.com",       #AlumDirPerson: BestEmail
      addr1:        "1388 Meadow Glen",      #AlumDirPerson: PrefMailAddr1
      addr2:        nil,                     #AlumDirPerson: PrefMailAddr2
      addr3:        nil,                     #AlumDirPerson: PrefMailAddr3
      addr_city:    "Southlake",             #AlumDirPerson: PrefMailCity
      addr_state:   "TX",                    #AlumDirPerson: PrefMailState
      addr_zip:     "76092-5845",            #AlumDirPerson: PrefMailZip
      addr_country: nil,                     #AlumDirPerson: PrefMailCountry
    }

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  end

  def newsletter
  end

  def commituser
    @debug = params.to_s
    @output = ""
    case params["commit"]
      when "Save Contact Information"
        @output = "Contact information saved for #{params['user_name']} (#{params['user_id']})."
      
      when "Mark as Deceased"
        # Set status to D :(
        @output = "Succesfully marked #{params["user_name"]} (#{params['user_id']}) as deceased."

      when "Change Name"
        @name = [params["new_first_name"].capitalize, params["new_last_name"].capitalize, params["new_middle_name"].capitalize]
        if @name[0] == "" || @name[1] == ""
          @output = "First and last name cannot be blank!"
        else
          @output = "Successfully changed #{params["user_name"]} to #{@name[0]} #{@name[2]} #{@name[1]}."
          
        end
	@name = @name.join # (@name is now a string ready to be added to the database)

      when "Save Business Information"
        @output = "Business information saved."


      else
        @output = "What a Terrible Failure!"  
    end
  end
end

