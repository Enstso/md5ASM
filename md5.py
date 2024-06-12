# Constants for MD5
A = 0x67452301
B = 0xEFCDAB89
C = 0x98BADCFE
D = 0x10325476

# Shift amounts for each operation
shifts = [
    7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22,
    5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20,
    4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
    6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21
]

# Constants K
K = [
    0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee,
    0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
    0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be,
    0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
    0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa,
    0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
    0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
    0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
    0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c,
    0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
    0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05,
    0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
    0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039,
    0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
    0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1,
    0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391
]


# Preprocessing
def preprocess_message(message):
    # Convert message to bytes
    message = bytearray(message.encode('utf-8'))
    
    # Append a '1' bit
    message.append(0x80)
    
    # Append '0' bits until length is congruent to 448 modulo 512
    while (len(message) * 8) % 512 != 448:
        message.append(0)
    
    # Append original message length in bits (64 bits, little-endian)
    original_length_bits = (8 * len(message)).to_bytes(8, byteorder='little')
    message.extend(original_length_bits)
    
    return message


# Transformation Functions

# Function F
def F(x, y, z):
    return (x & y) | (~x & z)

# Function G
def G(x, y, z):
    return (x & z) | (y & ~z)

# Function H
def H(x, y, z):
    return x ^ y ^ z

# Function I
def I(x, y, z):
    return y ^ (x | ~z)


# Helper function for left rotation
def left_rotate(x, c):
    return (x << c) | (x >> (32 - c))

# Process a 512-bit block
def process_block(block, A, B, C, D):
    a, b, c, d = A, B, C, D

    for i in range(64):
        if 0 <= i <= 15:
            f = F(b, c, d)
            g = i
        elif 16 <= i <= 31:
            f = G(b, c, d)
            g = (5 * i + 1) % 16
        elif 32 <= i <= 47:
            f = H(b, c, d)
            g = (3 * i + 5) % 16
        else:
            f = I(b, c, d)
            g = (7 * i) % 16
        
        f = (f + a + K[i] + int.from_bytes(block[4 * g:4 * g + 4], byteorder='little')) & 0xFFFFFFFF
        a = d
        d = c
        c = b
        b = (b + left_rotate(f, shifts[i])) & 0xFFFFFFFF

    A = (A + a) & 0xFFFFFFFF
    B = (B + b) & 0xFFFFFFFF
    C = (C + c) & 0xFFFFFFFF
    D = (D + d) & 0xFFFFFFFF

    return A, B, C, D

# MD5 hashing function
def md5(message):
    message = preprocess_message(message)
    
    # Initialize variables
    A, B, C, D = 0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476
    
    # Process each 512-bit block
    for i in range(0, len(message), 64):
        A, B, C, D = process_block(message[i:i+64], A, B, C, D)
    
    # return final hash
    result = (A.to_bytes(4, byteorder='little') + 
              B.to_bytes(4, byteorder='little') + 
              C.to_bytes(4, byteorder='little') + 
              D.to_bytes(4, byteorder='little'))
    
    return ''.join(f'{byte:02x}' for byte in result)

# test
print(md5("test"))
