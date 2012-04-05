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
    @user = Hash.new
    @user = {
      id: 0003420,
      name:         "Jackie Lynn Felkins",   #AlumDirPerson: FirstName LastName MiddleName
      major:        "Diversified",           #AlumDirDegreesW: Major1Desc
      year:         "1989",                  #AlumDirDegreesW: AwardYr
      phone1:       "(480) 275-8369",        #AlumDirPerson: HomePhone
      phone2:       nil,                     #AlumDirPerson: CellPhone
      email1:       "felk690@mac.com",       #AlumDirPerson: BestEmail
      addr_street:  "1388 Meadow Glen",      #AlumDirPerson: PrefMailAddr1
      addr_street2: nil,                     #AlumDirPerson: PrefMailAddr2
      addr_street3: nil,                     #AlumDirPerson: PrefMailAddr3
      addr_city:    "Southlake",             #AlumDirPerson: PrefMailCity
      addr_state:   "TX",                    #AlumDirPerson: PrefMailState
      addr_zip:     "76092-5845",            #AlumDirPerson: PrefMailZip
      addr_country: nil,                     #AlumDirPerson: PrefMailCountry
    }
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~





    #Code to do stuff goes here





    # ~~~ Simulate User Data Save ~~~
    # We don't really have to do anything here I guess.
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  end

  def newsletter
  end
end
