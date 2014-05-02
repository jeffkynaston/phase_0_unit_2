# U2.W5: Bakery Challenge GPS

# I worked on this challenge with: By myself, with Instructor Rick Rubio






# Our Refactored Solution
def bakery_num(num_of_people, fav_food)
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}

  raise ArgumentError.new("You can't make that food") unless my_list.has_key?(fav_food)
  
  return "You need to make #{num_of_people / my_list[fav_food]} #{fav_food}(s)." if num_of_people % my_list[fav_food] == 0
  return "You need to make 0 pie(s), 0 cake(s), and #{num_of_people} cookie(s)." if fav_food == "cookie"
  return "You need to make #{num_of_people / my_list[fav_food]} pie(s), 0 cake(s), and #{num_of_people % my_list[fav_food]} cookie(s)." if fav_food == "pie"
  return "You need to make 0 pie(s), #{num_of_people / my_list[fav_food]} cake(s), and #{num_of_people % my_list[fav_food]} cookie(s)." if fav_food == "cake"
  
end

########################################################


def bakery_num(num_of_people, fav_food)
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}
  quantities = {"pie" => 0, "cake" => 0, "cookie" => 0}

	raise ArgumentError.new("You can't make that food") unless my_list.has_key?(fav_food)

	quantities[fav_food] = (num_of_people / my_list[fav_food])
	leftovers = (num_of_people % my_list[fav_food])
	my_list.each do |k,v| 
		if (leftovers / v) >= 1
			quantities[k] = (leftovers / v)
		end
	end 
	return "You need to make #{quantities["pie"]} pie(s), #{quantities["cake"]} cake(s), and #{quantities["cookie"]} cookie(s)."
end




#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 0 pie(s), 6 cake(s), and 5 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!




#  Reflection 

# Somehow I didin't have a pair for this session (I think they may have switched out earlier in the week)
# so I did most of it on my own and had Rick to bounce questions off of. I ended up getting my 
# refactored solution down to just 8 lines of code, although it's not scalable. If the bakery 
# added any additional products, I would have to re-write the code in order to add that
# product in. I actually have to update applications for my clients all the time, so I 
# totally understand how important it is that code be scalable and after the pairing session, I 
# re-did the code in a more scalable way. I chose instead to store the quantities in their own hash,
# so that I could easily record them as I iterated over the original hash. In my re-re-factored
# solution, I would still need to update the hashes and return sentence, but that's less than
# the first re-factor. Since I'm using the quantities hash now, it would be easy to make the 
# sentence scalable and dynamic - it would just take additional logic to get the sentence identical to
# the driver code. In reality, I might actually show the data in an image or another method
# that is more simple than a sentence. 

