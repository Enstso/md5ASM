# MD5 Project in ASMx64

This project is an implementation of the MD5 algorithm in ASMx64. Numerous resources were utilized to understand the algorithm's functioning and to implement the MD5 transformation function.

# To launch the programs I set up a dockerfile

[Dockerfile](./Dockerfile)

```bash
docker build -t assembly .

docker run -it --rm  -v $(pwd):/app assembly bash
```

```bash

## How MD5 Algorithm Works

### Steps for MD5 Hash Calculation

1. **Initialization of Constants:**
   - Define four initial constants: A, B, C, and D.
     - A = 0x67452301
     - B = 0xEFCDAB89
     - C = 0x98BADCFE
     - D = 0x10325476

2. **Preprocessing of the Message:**
   - Convert the message into a bytearray.
   - Append a '1' bit to the end of the message.
   - Pad the message with '0' bits until the bit length is congruent to 448 modulo 512.
   - Append the original message length in bits, encoded as a 64-bit little-endian.

3. **Definition of Transformation Functions:**
   - Define four nonlinear functions (F, G, H, I) used in transformations:
     - F(x, y, z) = (x & y) | (~x & z)
     - G(x, y, z) = (x & z) | (y & ~z)
     - H(x, y, z) = x ^ y ^ z
     - I(x, y, z) = y ^ (x | ~z)

4. **Definition of Left Rotation:**
   - Define a function to perform a left rotation on 32 bits.

5. **Definition of Constants K and Shifts:**
   - Use an array of 64 precomputed constants K.
   - Use an array of shifts for each step of the transformations.

6. **Processing Each 512-Bit Block:**
   - Divide the message into 512-bit blocks (64 bytes).
   - For each block:
     - Copy the values of A, B, C, D into temporary variables a, b, c, d.
     - Perform 64 operations using functions F, G, H, I, constants K, and shifts, modifying the values of a, b, c, d.
     - Add the final values of a, b, c, d to the initial values of A, B, C, D.

7. **Assembly of the Final Result:**
   - Convert the final values of A, B, C, D into little-endian.
   - Combine these values into a hexadecimal string to obtain the final hash.

8. **Return MD5 Hash:**
   - Return the hexadecimal representation of the MD5 hash of the input message.

## Understanding and Implementation Attempts

I initially implemented the MD5 algorithm in Python to understand the various steps. Here's the Python code [md5.py](./md5.py).

### PseudoCode

```plaintext
A_initial = 0x67452301
B_initial = 0xEFCDAB89
C_initial = 0x98BADCFE
D_initial = 0x10325476

K = [0xd76aa478, 0xe8c7b756, ...]  // Array of constants K
shifts = [7, 12, 17, 22, ...]  // Array of shifts

For each block of data:
    For each step of the MD5 algorithm (total of 64 steps):
        Save the current values of registers A, B, C, and D onto the stack
        
        For i from 0 to 15:
            Calculate operations F, G, H, and I according to the MD5 specifications
            Apply appropriate shifts to register values
            Swap register values according to the specified scheme
            Increment the counter
        
        Restore the register values from the stack
        Add the result to the previous block

Store the final result in the .bss section
Display the result to the standard output
```

For simplification of the MD5 algorithm implementation, I attempted to hash the plaintext 'test', expecting the hash e3d5106fcf1638a8776a9923f73bcc37.

## My ASM Implementation Attempts

### 1. md5V2.s



- Based on the above pseudocode and md5.py, but resulted in a random value despite following the steps correctly.
- Compilation and execution command:

```bash
 nasm -f elf64 md5V2.s -o md5V2.o && ld md5V2.o -o md5V2 && ./md5V2
```

output:

```bash
#Eg�����ܺ�vT2
```

### 2. md5.s

- Utilizes the function from maximmasiutin [MD5_Transform-x64](https://github.com/maximmasiutin/MD5_Transform-x64/blob/master/md5_64.asm), but does not produce the correct hash value.

- Compilation and execution command:


```bash
nasm -f elf64 md5.s -o md5.o && ld md5.o -o md5 && ./md
```

output:

```bash
 ef1e0d573a77d466r
```

### 3. md5Ssl.s

- Uses the OpenSSL library but encounters a library issue during execution.

- Compilation and execution command:

```bash
nasm -f elf64 md5Ssl.s -o md5Ssl.o && gcc md5Ssl.o -o md5Ssl -lcrypto -lc && ./md5Ssl
```
output : 

```bash
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff7c95269 in ?? () from /lib/x86_64-linux-gnu/libcrypto.so.3

````

Resources:

- [MD5 Algorithm](https://en.wikipedia.org/wiki/MD5)
- [MD5 explained BiMathAx ](https://www.youtube.com/watch?v=WOdDBAvD9VY&t=1316s&ab_channel=BiMathAx)
- [MD5 Transform-x64](https://github.com/maximmasiutin/MD5_Transform-x64/blob/master/md5_64.asm)
- [MD5 OpenSSL](https://www.openssl.org/docs/man1.1.1/man3/MD5.html)


