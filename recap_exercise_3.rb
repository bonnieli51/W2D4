
# Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.

# no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# no_dupes?([true, true, true])            # => []
def no_dupes?(arr)
    count = Hash.new(0)
    arr.each {|ele| count[ele] +=1}
    filtered = count.select {|k,v| v == 1}
    filtered.keys
end

# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. 
# The method should return true if an element never appears consecutively in the array; it should return false otherwise.

# no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# no_consecutive_repeats?(['x'])                              # => true

def no_consecutive_repeats?(arr)
    return true if arr.length == 1
    (0...arr.length-1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end

# Write a method char_indices(str) that takes in a string as an arg. 
# The method should return a hash containing characters as keys. 
# The value associated with each key should be an array containing the indices where that character is found.

# char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def char_indices(str)
    indices = Hash.new{|h,k| h[k]=[]}
    str.each_char.with_index do |char,i|
        indices[char] << i 
    end
    indices
end

# Write a method longest_streak(str) that accepts a string as an arg. 
# The method should return the longest streak of consecutive characters in the string. 
# If there are any ties, return the streak that occurs later in the string.

# longest_streak('a')           # => 'a'
# longest_streak('accccbbb')    # => 'cccc'
# longest_streak('aaaxyyyyyzz') # => 'yyyyy
# longest_streak('aaabbb')      # => 'bbb'


def longest_streak(str)
    i = 0
    hash = {} 
    while i < str.length
        current = str[i]
        count = 0
        while current == str[i]
            count +=1
            i += 1
        end
        hash[current] = count
    end
    sorted = hash.sort_by{|k,v| v}
    sorted[-1][0] * sorted[-1][1]
end

# Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not the number is a bi-prime. 
# A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

# bi_prime?(14)   # => true
# bi_prime?(22)   # => true
# bi_prime?(25)   # => true
# bi_prime?(94)   # => true
# bi_prime?(24)   # => false
# bi_prime?(64)   # => false

def bi_prime(num)
    factors = []
    (2...num).each do |i|
        factors << i if num % i == 0 
    end
    return true if factors.length == 2 || factors.length == 1
    false       
end

# Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, returning the encrypted message.
# Assume that the message consists of only lowercase alphabetic characters.

# vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vigenere_cipher(message,keys)
    alphabet = ("a".."z").to_a
    new_word = ""
    message.each_char.with_index do |char, i|
       new_idx = alphabet.index(char) + keys[i%keys.length]
       new_word += alphabet[new_idx % 26]
    end
    new_word
end

# Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel is replaced with the vowel that appears before it sequentially in the original string. 
# The first vowel of the string should be replaced with the last vowel.

# vowel_rotate('computer')      # => "cempotur"
# vowel_rotate('oranges')       # => "erongas"
# vowel_rotate('headphones')    # => "heedphanos"
# vowel_rotate('bootcamp')      # => "baotcomp"
# vowel_rotate('awesome')       # => "ewasemo"

def vowel_rotate(str)
    vowels = "aeiou"
    i = -1
    while i != -str.length
        break if vowels.include?(str[i]) 
        i -= 1
    end
    last_vowel = str[i]
    new_word = ""
    str.each_char do |char|
        if vowels.include?(char)
            new_word += last_vowel
            last_vowel = char
        else
            new_word += char
        end
    end
    new_word
end
