require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].map { |key, array|
    { key => array << supply }
  }
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.reduce([]) { |total, item| total.concat(item) }
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each { |season, holidays|
    puts "#{season.to_s.gsub('_', ' ').capitalize}:"
    holidays.each { |holiday, supply|
      puts "  #{holiday.to_s.gsub('_', ' ').split.map(&:capitalize).join(' ')}: #{supply.join(', ')}"
    }
  }
end

def all_holidays_with_bbq(holiday_hash)
  holidays = holiday_hash.reduce([]) { |matching_supply_lists, (season, holidays)|
    matching_supply_lists.concat(holidays.reduce([]) { |holidays, (name, supplies)|
        holidays << { name => supplies }
      })
  }
  holidays.select { |holiday|
    holiday.values.flatten.include?('BBQ')
  }.flat_map { |holiday| holiday.keys.flatten }
end
