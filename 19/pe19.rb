def count_sunday_in_year(year, first_day)
    sum = 0
	first_day_of_month = first_day
	for month in 1..12 do
        sum += 1 if first_day_of_month == 0
		first_day_of_month = (first_day_of_month + count_day_in_month(year, month)) % 7
    end
    return sum
end

def count_day_in_year(year)
    return is_leap_year(year) ? 366 : 365
end

def count_day_in_month(year, month)
    case month
    when 1
        return 31
    when 2
        return is_leap_year(year) ? 29 : 28
    when 3
		return 31
	when 4
		return 30
	when 5
		return 31
	when 6
		return 30
	when 7
		return 31
	when 8
		return 31
	when 9
		return 30
	when 10
		return 31
	when 11
		return 30
	when 12
		return 31
    end
end

def is_leap_year(year)
	return (year % 4 == 0) && (year % 100 != 0 || year % 400 == 0)
end

def count_sunday(year_from, year_to, first_day)
    sum = 0
    first_day_of_year = first_day
    for year in year_from..year_to do
        sum += count_sunday_in_year(year, first_day_of_year)
        first_day_of_year = (first_day_of_year + count_day_in_year(year)) % 7
    end
    return sum
end

# 1 Jan 1900 is a Monday
# 1 Jan 1901 is a Tuesday
# month: 1..12
# day:0..6 (Sunday..Saturday)
puts count_sunday(1901, 2000, 2)
