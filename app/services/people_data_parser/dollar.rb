module PeopleDataParser
  class Dollar < Base
    COL_SEP = "$"
    COL_MAP = {
      city: 0,
      birthdate: 1,
      last_name: 2,
      first_name: 3
    }

    CITY_MAP = {
      'NYC': 'New York City',
      'LA': 'Los Angeles'
    }

    private

    # custom mapper for dollar city (NYC, LA) to (New York City, Los Angeles)
    def city(person_raw, col)
      CITY_MAP[person_raw[col].strip.to_sym]
    end

    def col_sep
      COL_SEP
    end

    def col_map
      COL_MAP
    end
  end
end
