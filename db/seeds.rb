
Category.create(name: "ActiveGEO") #1 ,0
Category.create(name: "InactiveGEO") #2, 1
Category.create(name: "DebrisGEO") #3, 2
Category.create(name: "RocketBodyGEO") #4, 2
Category.create(name: "ActiveHEO") #5, 0
Category.create(name: "InactiveHEO") #6, 1
Category.create(name: "DebrisHEO") #7, 2
Category.create(name: "RocketBodyHEO") #8, 2
Category.create(name: "ActiveLEO") #9, 0
Category.create(name: "InactiveLEO") #10, 1
Category.create(name: "DebrisLEO") #11, 2
Category.create(name: "RocketBodyLEO") #12, 2

def api_response(url, key)
    response = RestClient.get(url)
    JSON.parse(response)[key]

    # creates array of hashes from key in API
end


def create_satellites
    sat = api_response("http://localhost:3000/kml", "sat") # creates an array of 4 groups of nearfield objects

    sat.each do |sat_array| #goes through each of the 4 ["active_by_country", "inactive_by_country", "debris", "rocket_bodies"]
        sat_array['active_by_country'].each do |country|

            country['satellite_array'].each do |info|
                populate_info(sat, country, info)
            end
        end
    end
end


def populate_info(sat, country, info)
    name = info['name']
    category_id = info['category_id']
    color = find_color(sat)
    satellite_number = info['satellite_number']
    x_coor = info["Point"]["coordinates"].split(",")[0].to_f
    y_coor = info["Point"]["coordinates"].split(",")[1].to_f
    z_coor = info["Point"]["coordinates"].split(",")[2].to_f
    owner = country['name']
    international_designator = info['description']['description_block'].split("<br>")[0].split("</b>")[1].sub(" ", '')
    mission = info['description']['description_block'].split("<br>")[4].split("</b>")[1].sub(" ", '')
    launch_date = info['description']['description_block'].split("<br>")[5].split("</b>")[1].sub(" ", '')
    launch_site = info['description']['description_block'].split("<br>")[6].split("</b>")[1].sub(" ", '')
    period = info['description']['description_block'].split("<br>")[7].split("</b>")[1].sub(" ", '')
    perigree = info['description']['description_block'].split("<br>")[8].split("</b>")[1].sub(" ", '')
    apogee = info['description']['description_block'].split("<br>")[9].split("</b>")[1].sub(" ", '')
    inclination = info['description']['description_block'].split("<br>")[10].split("</b>")[1].sub(" ", '')
    byebug

    #creates the individual nearfield objects
    Satelite.create(
        name: name,
        category_id: category_id,
        color: color,
        satellite_number: satellite_number,
        x_coor: x_coor,
        y_coor: y_coor,
        z_coor: z_coor,
        owner: owner,
        international_designator: international_designator,
        mission: mission,
        launch_date: launch_date,
        launch_site: launch_site,
        period: period,
        perigree: perigree,
        apogee: apogee,
        inclination: inclination,
        )

end



def find_color(sat)
    if sat[0].keys.first == "active_by_country"
        byebug
        return 0
    elsif sat[0].keys.first == "inactive_by_country"
        return 1
    else
        return 2
    end
end




create_satellites
