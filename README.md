# enigma
A program that encrypts and decrypts text files based on a Caesar cipher.


CLI INSTRUCTIONS
-------------------------------------------------------------------------

ENCRYPT
-------

To encrypt, you must run the encrypt.rb runner file found in the lib/ directory.  The file takes two to four arguments from the command line.  Syntax for running from CLI is as follows.

`ruby lib/encrypt.rb <arg_1> <arg_2> <arg_3> <arg_4>`

Required arguements:

<arg_1> is the file path of existing text file you wish to encrypt
<arg_2> is the file name and address for new file that encrypt will generate

Optional arguements:
<arg_3> can be a 5 digit number that is fed in as a predetermined encryption key
<arg_4> can be a date in DD.MM.YY format

If <arg_3> and <arg_4> are not provided, the program will generate a random key and a current date. 

EXAMPLES

w/ optional arguments:

`ruby text_docs/hello_world.txt text_docs/new_cipher_text.txt 01275 25.05.90`

w/o optional arguments:

`ruby text_docs/hello_world.txt text_docs/new_cipher_text.txt`



DECRYPT
-------

to be continuted
