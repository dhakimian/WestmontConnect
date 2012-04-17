class AdminPagesController < ApplicationController
  def queue
  end

  def search
  end

  def searchresults
  end

  def directory
  end

  def edituser
    # ~~~ Simulate User Lookup ~~~
    @id = params[:id]

    # lookup user by id

    @user = Hash.new
    @user = {
      id: "0003420",
      name:         "Tom Marvolo Riddle",    #AlumDirPerson: FirstName LastName MiddleName
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
    @debug = params.to_s
    if params["title"].nil?
    elsif params["title"] == "" || params["body"] == ""
      @success = " - Cannot post a newsletter with no title or body!"
    else
      @success = " - Newsletter posted successfully!"
    end

    # ~~~ Simulate Database Query ~~~

    # Look at previous posts
    @posts = [
        "Cool Things Happening",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when 
        an unknown printer took a galley of type and scrambled it to make a type specimen 
        book. It has survived not only five centuries, but also the leap into electronic typesetting, 
        remaining essentially unchanged. It was popularised in the 1960s with the release of 
        Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing 
        software like Aldus PageMaker including versions of Lorem Ipsum.",
        "Everyone Died",
        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a
         piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard 
         McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the 
         more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the 
         cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum 
         comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of 
         Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics,
         very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit 
         amet.., comes from a line in section 1.10.32.",
        "Asdf Is my New Favorite Word",
        "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those
        interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also
        reproduced in their exact original form, accompanied by English versions from the 1914 
        translation by H. Rackham.",
        "Westmont Connect Surpasses Facebook",
        "It is a long established fact that a reader will be distracted by the readable content 
        of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-
        less normal distribution of letters, as opposed to using 'Content here, content here', making
         it look like readable English. Many desktop publishing packages and web page editors now use 
         Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web 
         sites still in their infancy. Various versions have evolved over the years, sometimes by 
         accident, sometimes on purpose (injected humour and the like)."]

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
        @name = [params["new_first_name"].capitalize, params["new_middle_name"].capitalize, params["new_last_name"].capitalize]
        if @name[0] == "" || @name[2] == ""
          @output = "First and last name cannot be blank!"
        else
          @output = "Successfully changed #{params["user_name"]} to #{@name[0]} #{@name[1]} #{@name[2]}."
          
        end

      when "Save Business Information"
        @output = "Business information saved."


      else
        @output = "What a Terrible Failure!"  
    end
  end
end

