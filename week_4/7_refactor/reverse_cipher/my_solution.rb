# U2.W4: Refactor Cipher Solution


# I worked on this challenge [by myself].


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

# def translate_to_cipher(sentence)
#     alphabet = ('a'..'z').to_a
#     cipher = Hash[alphabet.zip(alphabet.rotate(4))]
#     spaces = ["@", "#", "$", "%", "^", "&", "*"]
    
#     original_sentence = sentence.downcase
#     encoded_sentence = []
#     original_sentence.each_char do |element|
#       if cipher.include?(element)
#         encoded_sentence << cipher[element]
#       elsif element == ' '
#         encoded_sentence << spaces.sample
#       else 
#         encoded_sentence << element
#       end
#      end
    
#     return encoded_sentence.join
# end

def translate_to_cipher(sentence)
    alphabet = ('a'..'z').to_a
    # creates an array of all the letters in the alphabet
    cipher = Hash[alphabet.zip(alphabet.rotate(4))]
    # creates the hash table that was written out long-hand in
    # the initial solution
    spaces = ["@", "#", "$", "%", "^", "&", "*"]
    # creates an array with symbol characters
    
    original_sentence = sentence.downcase
    # makes teh sentence lower-case
    encoded_sentence = []
    # creates an empty array to hold the encoded sentence
    original_sentence.each_char do |element|
    # iterates over each character of the decoded sentence
      if cipher.include?(element)
        encoded_sentence << cipher[element]
        # pushes a letter from the cipher hash to the encoded sentence
      elsif element == ' '
        encoded_sentence << spaces.sample
        # pushes a random symbol to the encoded sentence
      else 
        encoded_sentence << element
        # pushes the character to the encoded sentence
      end
     end
    
    return encoded_sentence.join
    # puts the sentence back together! 
end



# Questions:
# 1. What is the .to_a method doing?
# Creating an array 
# 2. How does the rotate method work? What does it work on?
# Rotate returns a new array with the elements off set by the 
# value in the argument
# 3. What is `each_char` doing?
# iterating over each character in the sentence
# 4. What does `sample` do?
# takes a random symbol from the symbol array
# 5. Are there any other methods you want to understand better?
# nope, i've got all these down! 
# 6. Does this code look better or worse than your refactored solution
#    of the original cipher code? What's better? What's worse?
# The code is very similar to our refactored solution - we both used
# the rotate method. Our code used an array instead of a hash, though. 
# 7. Is this good code? What makes it good? What makes it bad?
# I think it's good code! it's concise (way less lines than the original)
# and it reads well - the variable are descriptive and even someone 
# without ruby knowlege could get an idea of what's going on. 


# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
puts translate_to_cipher("I want cookies")
puts translate_to_cipher("I want cookies")
puts translate_to_cipher("I want cookies")
puts translate_to_cipher("I want cookies")

# nope it doesnt - the symbols can change each time.



# 5. Reflection 

# Seeing this solution was great - it combined some of the elements of 
# our refactored solution, with a few things I hadn't seen before. 
# This solution used .rotate, but still used a hash function. When we
# went to using .rotate, it felt natural to get rid of the hash and only 
# use an array - when I have more time (and it's not 10:30 on sunday night)
# I will change my re-factored solution to use a hash instead of the array
# and see which is faster. 