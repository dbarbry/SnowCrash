# level09

We have again a ./level09 executable and a token file. 
When we execute the token whith level09 we get this : 

```
level09@SnowCrash:~$ ./level09 token
tpmhr
```

So we quickly managed to understand that:

```
level09@SnowCrash:~$ ./level09 Tpmhr
Token
```

We have to add the index of each character to its ascii value, so we made a Python script that could reverse the program effect.

```
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
```

The hex_char contains what we get when doing cat token which gives us : f4kmm6p|=�p�n��DB�Du{��
And we get : f3iji1ju5yuevaus41q1afiuq

```
/*********************************************************\

flag09@SnowCrash:~$ getflag 
Check flag.Here is your token : s5cAJpM8ev6XHw998pRWG728z

\*********************************************************/
```