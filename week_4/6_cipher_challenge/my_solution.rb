# U2.W4: Cipher Challenge


# I worked on this challenge with: Greg Piccolo.



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.

require 'benchmark'

def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
  # downcase will make the entire string lower-case, .split with "" will split every letter into an arra
  decoded_sentence = []
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c", 
            "h" => "d", 
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
# .rotate could be used for the cipher; Tried adding 4 to a character in IRB, won't work
# If we need to have a data source with the cipher in it, then using a hash would be faster than using an array
# but, an array would be more malleable 
  input.each do |x| # What is #each doing here?
# each is iterating over each letter in the input array
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
# found match is leaving a catch-all for any characters not found in the conditionals
# if found match is false, then it shovels the coded character into the decoded message directly
    cipher.each_key do |y| # What is #each_key doing here?
# each_key is iterating over each key in the hash
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
# this is comparing if the character from the coded message (x) is equal to the character in the key of the hash (y)
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y]
        found_match = true
        break  # Why is it breaking here?
# this is breaking the iteration over the cypher keys - once a match is found, no more iteration is needed
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
# this checking for symbols that indicate a space in the message
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
# this makes an array with 0 - 9 and checks to see if X is in that array 
        decoded_sentence << x
        found_match = true
        break
      end 
    end
    if not found_match  # What is this looking for?
# this is looking for a character that is anything else - not a letter, symbol, or number 0-9
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help.
# this checks to see if the string contains a number
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
# this divides the number by 100
  end  
  return decoded_sentence # What is this returning?        
# this returns the full decoded sentence with corrected numbers
end

# Your Refactored Solution

def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
  decoded_sentence = []
  
alphabet = ('a'..'z').to_a

input.each do |x|
if alphabet.include?(x)
    i = alphabet.index(x)
    # puts "I am comparing x and y. X is #{x} and Y is #{alphabet.rotate(-4)[i]}."
    decoded_sentence << alphabet.rotate(-4)[i]
elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*"
    decoded_sentence << " "
else
    decoded_sentence << x
    end
 end
 
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
  end  
  
  return decoded_sentence     
end


# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"

puts Benchmark.measure {
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"
}
# Reflection
 
# This was a clever challenge - it had Greg and I laughing the entire 
# time we were doing it. It was great to have someone to talk this 
# challenge over with. Most of the method was pretty clear to both of us,
# but there were a couple parts (like figuring out the found_match) where we really
# benefitted from having a partner to bounce ideas off of. Even going over the 
# more simple parts aloud with a partner was helpful - really made me feel like
# i understood exactly what was going on with each step in the function. 

# I used the benchmark module and tested the time that it took to run the driver code
# tests. Our refactored method was nearly 5 times faster (.004 seconds vs .019 seconds). 
# We thought of some other re-factoring possibilities, such as using an array for the 
# symbols conditional or dividing numbers by 100 at the same time they are pushed into the 
# array, but decided against them.
#