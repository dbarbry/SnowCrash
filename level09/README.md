We have again a ./level09 and a token, 
When we execute the token whith level09 we get this : 
'tpmhr'

so we saw quite fast that 
./level09 Tpmhr
Token

Was just a +1 of the given letter index so we made a Python script that could reverse the program effect.

def decrypt_token(hex_chars):
    result = []
    for i, hex_char in enumerate(hex_chars):
        decimal_value = int(hex_char, 16)
        decrypted_value = decimal_value - i
        result.append(chr(decrypted_value))
    return ''.join(result)

hex_chars = ['66', '34', '6b', '6d', '6d', '36', '70', '7c', '3d', '82', '7f', '70', '82', '6e', '83', '82', '44', '42', '83', '44', '75', '7b', '7f', '8c', '89']
decrypted_result = decrypt_token(hex_chars)
print(decrypted_result)

Then we cat token that give us : f4kmm6p|=�p�n��DB�Du{��
We put this in our programm and we get : f3iji1ju5yuevaus41q1afiuq
su flag 09 work.

/*********************************************************\

flag09@SnowCrash:~$ getflag 
Check flag.Here is your token : s5cAJpM8ev6XHw998pRWG728z

\*********************************************************/
