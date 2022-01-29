module PeopleDataParser
  class Percent < Base
    COL_SEP = '%'
    COL_MAP = {
      first_name: 0,
      city: 1,
      birthdate: 2
    }

    private

    def col_sep
      COL_SEP
    end

    def col_map
      COL_MAP
    end
  end
end
