import typetraits
import strutils


# var codeword: string = "forsen"

# var input = readLine(stdin)
var input = readFile("input.txt")
var words = input.split({ ' ', ',' })
echo "INPUT: \n", input

# get the length of the input.
var num_words = words.len
# echo num_words

var encoded_text: string
var encoded_word: string = ""
var iteration = 0

# Index is the location number of the letter.
# C is the actual character as a string value
for idx, c in input[0 .. ^1]:
  # echo "Index:", idx, "Item:", c

  # Convert to Ascii by first converting the string 
  # value to a char and then to an int.
  # https://stackoverflow.com/a/58095970
  var ascii_value = int(char(c))

  echo idx
    
  # if current codepoint is a space and previous codepoint was
  # > 127 do not add the space to the encoded text
  if int(char(input[idx])) == 32:
    if int(char(input[idx-1])) > 127:
      continue

  # if this is not the first iteration and the previous
  # ascii charcode was not > 127 then add a space to the encoded
  # text 
  if idx >= 1:
  # var ascii_value = int(char(c))
    if int(char(input[idx-1])) < 127:
      encoded_word.add(" ")
  
  ## control
  ## echo "Ascii value:", ascii_value
  ## echo "------------------------------"

  # if ascii charcode > 127 put current codepoint in encoded text
  # https://forum.nim-lang.org/t/4001#24897
  # That means if we are outside of this scope we 
  if ascii_value > 127:
    ## echo "ENCODED WORD ADDED", c
    encoded_word.add(c)
  elif ascii_value < 127: 
    # Take the ascii value and convert it to binary.
    # For example 'a' == 1100001
    var binary_value = ascii_value.toBin(7)
    ## echo "Binary value:", binary_value
    
    var strbin = string(binary_value)
     
    # if ascii_value == 10: continue
      
    let 
      letter_f = strbin[0]
      letter_o = strbin[1..2]
      letter_r = strbin[3]
      letter_s = strbin[4]
      letter_e = strbin[5]
      letter_n = strbin[6]
 
    if letter_f == '0':
      encoded_word.add("f")
    else:
      encoded_word.add("F")

    # yikes
    # 00 = Ö
    if letter_o[0] == '0' and letter_o[1] == '0':
      encoded_word.add("Ö")
    # 01 = ö
    elif letter_o[0] == '0' and letter_o[1] == '1':
      encoded_word.add("ö")
    # 10 = O
    elif letter_o[0] == '1' and letter_o[1] == '0':
      encoded_word.add("O")
    elif letter_o[0] == '1' and letter_o[1] == '1':
      encoded_word.add("o")
    else:
      encoded_word.add("ERROR DETECTED")

    if letter_r == '0':
      encoded_word.add("r")
    else:
      encoded_word.add("R")

    if letter_s == '0':
      encoded_word.add("s")
    else:
      encoded_word.add("S")

    if letter_e == '0':
      encoded_word.add("e")
    else:
      encoded_word.add("E")

    if letter_n == '0':
      encoded_word.add("n")
    else:
      encoded_word.add("N")

   
  
    # iteration += 1

  #  if binary_value[0] == '0':
  #    encoded_word.add('f')
  #  else:
  #    encoded_word.add('F')

    #for i in 0..7:
      #if i[0] == 0:
#    for idx, v in binary_value[0 .. ^1]:
#      echo "idx:", idx, "v:", v
#
#     
#      # var is the integer value of the 
#      # Convert the value back to the original one
#      # Otherwise it would be 48/49
#      # Remove the char() conversion later on
#
#     
#      if v[idx] == 0: 
#          encoded_word.add('f')
#        else:
#          encoded_word.add('F')
#
#      # if tmp[0] == "0": echo "XD"
     

      


    
    # binary_value = toBin(ascii_value): string
    # echo toBin(ascii_value)
    # var xd: string = c.toBin(8)
echo encoded_word
#echo input
