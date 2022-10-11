module ProfilesHelper
def title_name(profile)
    if profile.gender == "male"
      "Mr. #{profile.name}"
    else
      "Ms. #{profile.name}"
    end
  end

end
