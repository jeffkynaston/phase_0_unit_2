def average(array)
	array.inject(:+)/array.length
end

puts average([2,4,6])