connection: "htf2024"

# include all the views
include: "/views/**/*.view.lkml"

explore: discovery_telescope {
  join: discovery_facility {
    sql_on: ${discovery_telescope.facility_id} = ${discovery_facility.facility_id} ;;
    relationship: many_to_one
  }
}

explore: discovery_facility {
}

explore: raw_planets {}

explore: star {}

explore: planet {
  label: "Explore Planets"

  join: discovery_facility {
    sql_on: ${planet.facility_id} = ${discovery_facility.facility_id} ;;
    relationship: many_to_one
  }

}
