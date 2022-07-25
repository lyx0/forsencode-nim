import typetraits
import strutils



proc encode(input: string): string =
  var encoded_text: string

  # Index is the location number of the letter.
  # C is the actual character as a string value
  for idx, c in input[0 .. ^1]:
    
    # Convert to Ascii by first converting the string 
    # value to a char and then to an int.
    # https://stackoverflow.com/a/58095970
    var ascii_value = int(char(c))

    # if ascii charcode > 127 put current codepoint in encoded text
    if ascii_value > 127:
      encoded_text.add(c)
      continue
     

    # if current codepoint is a space and previous codepoint was
    # > 127 do not add the space to the encoded text
    if int(char(input[idx])) == 32 and int(char(input[idx-1])) > 127:
      encoded_text.add("")
      continue

    # if this is not the first iteration and the previous
    # ascii charcode was not > 127 then add a space to the encoded
    # text 
    if idx >= 1:
      if int(char(input[idx-1])) < 127:
        encoded_text.add(" ")

    # if ascii charcode > 127 put current codepoint in encoded text
    # https://forum.nim-lang.org/t/4001#24897
    # That means if we are outside of this scope we 
    if ascii_value < 127: 
      # convert it to binary.
      # var binary_value =  ascii_value & 0b1000000
      var binary_value = ascii_value.toBin(7)
      
        
      # binary value is of type string therefore we 
      # can simply use its index values 4Head
      let 
        letter_f = binary_value[0]
        letter_o = binary_value[1..2]
        letter_r = binary_value[3]
        letter_s = binary_value[4]
        letter_e = binary_value[5]
        letter_n = binary_value[6]
   
      # yikes
      if letter_f == '0':
        encoded_text.add("f")
      else:
        encoded_text.add("F")

      # 00 = Ö
      if letter_o[0] == '0' and letter_o[1] == '0':
        encoded_text.add("Ö")
      # 01 = ö
      elif letter_o[0] == '0' and letter_o[1] == '1':
        encoded_text.add("ö")
      # 10 = O
      elif letter_o[0] == '1' and letter_o[1] == '0':
        encoded_text.add("O")
      # 11 = o
      elif letter_o[0] == '1' and letter_o[1] == '1':
        encoded_text.add("o")
      else:
        encoded_text.add("ERROR DETECTED")

      if letter_r == '0':
        encoded_text.add("r")
      else:
        encoded_text.add("R")

      if letter_s == '0':
        encoded_text.add("s")
      else:
        encoded_text.add("S")

      if letter_e == '0':
        encoded_text.add("e")
      else:
        encoded_text.add("E")

      if letter_n == '0':
        encoded_text.add("n")
      else:
        encoded_text.add("N")
  
  # return the encoded word
  encoded_text

# uncomment for benchmark
# https://stackoverflow.com/a/36580495
#import times, os, strutils
#
#template benchmark(benchmarkName: string, code: untyped) =
#  block:
#    let t0 = epochTime()
#    echo "Input: ", in_rfc, "\nOutput: ", encode(in_rfc)
#    let elapsed = epochTime() - t0
#    let elapsedStr = elapsed.formatFloat(format = ffDecimal, precision = 5)
#    echo "CPU Time [", benchmarkName, "] ", elapsedStr, "s"
#
#benchmark "my benchmark":
#  sleep 300

# Read from file
# var input = readFile("input.txt")


# For benchmarking
# var in_rfc = readFile("rfc.txt")
# var in_rfc = readFile("rfc6455.html")
#echo "Input: ", in_rfc, "\nOutput: ", encode(in_rfc)

var in_hello_world = "Hello World!"
var in_foo_bar = "foo 🤖 bar"
echo "Input: ", in_hello_world, "\nOutput: ", encode(in_hello_world)
echo "Input: ", in_foo_bar, "\nOutput: ", encode(in_foo_bar)
