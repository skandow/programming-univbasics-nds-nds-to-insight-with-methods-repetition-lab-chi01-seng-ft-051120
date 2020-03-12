$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  directors_names = []
  row_index = 0 
  while row_index < source.length do 
    directors_names << source[row_index][:name]
    row_index += 1
  end
  directors_names
end

def total_gross(source)
  total_everyone = 0 
  director_name_gross = directors_totals(source)
  director_name = list_of_directors(source)
  big_index = 0 
  while big_index < director_name.length do 
    name_lookup = director_name[big_index]
    total_everyone += director_name_gross[name_lookup]
    big_index += 1
  end 
  total_everyone
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
end


