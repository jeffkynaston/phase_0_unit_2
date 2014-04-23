# U2.W4: Add it up!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

# 1. Pseudocode

# What is the input?
# -The input is an array of unknown length
# What is the output? (i.e. What should the code return?)
# -The output is either a sum of all the array's elements or a sentence with
# -all array elements in it. 
# What are the steps needed to solve the problem?
# -1) total method
# -a. Define a method 'total' that takes one argument, (array)
# -b. Set variable 'sum' equal to 0. This variable will hold the total
# -c. Set variable 'i' equal to 0. This variable will be a counter
# -d. Create a while loop to iterate over the array. During the loop, add each
#     array element to 'sum', and then add 1 to 'i'
# -e. outside the loop, return sum and end the function
# -2) sentence_maker method
# -a. Define a method 'sentence_maker' that takes one argument, (array)
# -b. call ruby's built-in join method on the array with a blank space as 
#     the argument; call ruby's built-in capitalize method on the result

# 2. Initial Solution

def total(array)
	sum = 0
	i = 0
	while array[i] 
		sum += array[i]
		i += 1
	end
	return sum
end

def sentence_maker(array)
	return array.join(" ").capitalize + "."
end

# 3. Refactored Solution

def total(array)
	array.inject(0) { |sum, element| sum + element}
end

# or 

def total(array)
	array.reduce(:+)
end

def sentence_maker(array)
	return array.join(" ").capitalize + "."
end	



# 4. Reflection 
# This was my first time digging into enumerables and as it turns out they
# are pretty sweet. For the total method, my initial thought was to use a 
# while loop to iterate through the array. This could definitely be becuase
# we just looked at JavaScript last week and it's limited to for and while
# loops. My solution worked great, but it was a lot more code than my 
# refactored solutions that use enumerable methods. I spent a while reading
# up on them, and found some good resources including this:
# http://www.sitepoint.com/guide-ruby-collections-iii-enumerable-enumerator/
# Using the enumerable methods inject/reduce (which work the same way),
# you can 'reduce' an array of numbers down to one. With the shorthand 
# notation, I was able to get the entire method completed in just 1 line. 

# My initial sentence_maker method worked great and required no refactoring. 
# I was already aware of the built-in join method, and it worked for 
# combining the array. 

# A couple other resources I found for enumerables:
# http://www.slideshare.net/harisamin/the-enumerable-module-or-how-i-fell-in-love-with-ruby
# http://jamesgolick.com/2008/1/5/an-introduction-to-ruby-s-enumerable-module.html
# http://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/44-collections/lessons/96-enumerators-and-enumerables
