connection: "htf2024"

# include all the views
include: "/views/**/*.view.lkml"

explore: discovery_telescope {
}

explore: discovery_facility {
}

explore: raw_planets {}

explore: star {}

explore: planet {
  label: "Explore Planets"
  description: "Details of planets, their discovery facilities, and telescopes."

  # Join the discovery_facility view
  join: discovery_facility {
    sql_on: ${planet.facility_id} = ${discovery_facility.facility_id} ;;
    relationship: many_to_one
  }

  join: star{
    sql_on: ${planet.host_id} = ${star.host_id} ;;
    relationship: many_to_one
  }

  # Join the discovery_telescope view through discovery_facility
  join: discovery_telescope {
    sql_on: ${discovery_facility.facility_id} = ${discovery_telescope.facility_id} ;;
    relationship: many_to_one
  }
}
