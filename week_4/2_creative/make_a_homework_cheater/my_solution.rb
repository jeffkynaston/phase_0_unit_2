# U2.W4: Homework Cheater!


# I worked on this challenge [by myself.

# 2. Pseudocode

# Input:
	# Input will be basic info about the essay - title, date, author, course, topic, thesis
# Output:
	# Return two variables, title and body, that contain the essay
# Steps:
	# 1) Define a method essay_writer that takes six arguments: title, date, author, 
	#    course, topic, and thesis"
	# 2) set variable title equal to a string with the title template in it; use string
  #    interpolation to put in the title, author, and date separated by |'s 
  # 3) set variable body equal to a string with the body template in it; use string 
	#    interpolation to insert course, topic, and thesis arguments
	# 4) Return a string with the title, two new lines and a body 



# 3. Initial Solution

# def essay_writer(title, date, author, course, topic, thesis)
# 	title = "#{title} | by #{author} | #{date}"
# 	body = "Since the dawn of time, #{topic} has always been a fascinating topic that challenged scholars and laymen alike. In fact, #{topic} has played an important role in #{course}, advancing our society's undersatnding beyond what we wever imagined. #{thesis} It's clear that without our understanding of #{topic} human kind wouldn't be where it is today."
# 	return "#{title}: #{body}"
# end

def essay_writer(title, date, author, course, topic, thesis)
	return "#{title} | by #{author} | #{date}\n\nSince the dawn of time, #{topic} has always been a fascinating topic that challenged scholars and laymen alike. In fact, #{topic} has played an important role in #{course}, advancing our society's undersatnding beyond what we wever imagined. #{thesis} It's clear that without our understanding of #{topic} human kind wouldn't be where it is today."
end


# 4. Refactored Solution

# My initial solution was very minimal. The variables are descriptive, and the entire 
# method fits on one line of code, although it is a very long lone. At first, i tried 
# to insert line breaks so that I could make the code more readable, but I had trouble
# passing my driver  tests when I did that - a good reminder that you need to 
# be careful with line breaks when comparing strings.

# I initially thought to do a title and a body separately, but that made it hard to compare
# my entire essay to the driver code sample. I like breaking my methods up into smaller 
# pieces because I think its easier to follow and read, but I was able to get this
# solution to work. And with string interpolation, I was able to make the method really 
# simple, which is just as important as its readability. 

# During the refactoring stage, I did add some output to my driver code that gives
# the user an error. 





# 1. DRIVER TESTS GO BELOW THIS LINE

# title_template = "#{title} | by #{author} | #{date}"
# body_template_positive = "Since the dawn of time, #{topic} has always been a fascinating
# topic that challenged scholars and laymen alike. In fact, #{topic} has played 
# an important role in #{course}, advancing our society's undersatnding beyond
# what we wever imagined. #{thesis} It's clear that without our understanding of 
# #{topic}, human kind wouldn't be where it is today."
essay_geometry = "Triangles of All Sides | by Jeff Kynaston | 4/25/14

Since the dawn of time, Triangle Theory has always been a fascinating topic that challenged scholars and laymen alike. In fact, Triangle Theory has played an important role in Geometry, advancing our society's undersatnding beyond what we wever imagined. Triangle theory has made so many inventions possible, from 3d television to MMORPGs. It's clear that without our understanding of Triangle Theory human kind wouldn't be where it is today."


essay_history = "Swords, Bows, and Magic | by Jeff Kynaston | 4/25/14

Since the dawn of time, King Arthur has always been a fascinating topic that challenged scholars and laymen alike. In fact, King Arthur has played an important role in History, advancing our society's undersatnding beyond what we wever imagined. King Arthur was awesome. It's clear that without our understanding of King Arthur human kind wouldn't be where it is today."


essay_cs = "Ones and Zeros | by Jeff Kynaston | 4/25/14

Since the dawn of time, Algorithm Theory has always been a fascinating topic that challenged scholars and laymen alike. In fact, Algorithm Theory has played an important role in Computer Science, advancing our society's undersatnding beyond what we wever imagined. The Internet Is CRAZY AWESOME. It's clear that without our understanding of Algorithm Theory human kind wouldn't be where it is today."



geometry = essay_writer("Triangles of All Sides", "4/25/14", "Jeff Kynaston", "Geometry", "Triangle Theory", "Triangle theory has made so many inventions possible, from 3d television to MMORPGs.")
history = essay_writer("Swords, Bows, and Magic", "4/25/14", "Jeff Kynaston", "History", "King Arthur", "King Arthur was awesome.")
cs = essay_writer("Ones and Zeros", "4/25/14", "Jeff Kynaston", "Computer Science", "Algorithm Theory", "The Internet Is CRAZY AWESOME.")

# puts geometry 
# puts essay_geometry
puts geometry == essay_geometry
if geometry == essay_geometry
	puts ""
else
	puts "Your Geometry Essay doesn't quite match up"
end

# puts history
# puts essay_history
puts history == essay_history
if history == essay_history
	puts ""
else
	puts "Your History Essay doesn't quite match up"
end

# puts cs
# puts essay_cs
puts cs == essay_cs
if cs == essay_cs
	puts ""
else
	puts "Your Computer Science Essay doesn't quite match up"
end


# 5. Reflection 

# # This was a good intro to writing our own driver code. It was suprisingly more difficult
# than I had intitially thought. I wrote out all three sentences for my driver code first, but 
# when I got to the testing phase, I had some formatting and spelling errors that caused my
# driver code to fail. I found that looking through a paragraph for small formatting errors (sometimes
# just an extra space of newline character) was tedious and headache-inducing. Eventually, I ended up 
# re-doing my method and driver code together, one sentence at a time, to avoid these errors. 

# From all of our challenges involving driver code I can tell that it is a very useful tool. 
# I'm looking forward to learning Rspec and learning how to write more specific, useful tests.

 