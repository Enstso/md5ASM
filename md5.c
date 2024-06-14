#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

// Define LEFTROTATE macro for rotating bits
#define LEFTROTATE(x, c) (((x) << (c)) | ((x) >> (32 - (c))))

// Initial MD5 values (A, B, C, D)
uint32_t A = 0x67452301;
uint32_t B = 0xEFCDAB89;
uint32_t C = 0x98BADCFE;
uint32_t D = 0x10325476;

// T values (sine of integers)
uint32_t T[64] = {
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
};

// Shift amounts for each operation
uint32_t shifts[64] = {
    7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22,
    5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20,
    4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
    6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21
};

// Preprocess the message
void preprocess_message(const uint8_t *initial_msg, size_t initial_len, uint8_t **msg, size_t *new_len) {
    // Calculate the padding: length must be congruent to 448 modulo 512
    size_t padding = (56 - (initial_len + 1) % 64) % 64;
    *new_len = initial_len + 1 + padding + 8;

    // Allocate memory for the new message
    *msg = malloc(*new_len);
    memcpy(*msg, initial_msg, initial_len);

    // Append a '1' bit followed by padding zeros
    (*msg)[initial_len] = 0x80;
    memset(*msg + initial_len + 1, 0, padding);

    // Append the original length in bits
    uint64_t bits_len = 8 * initial_len;
    memcpy(*msg + initial_len + 1 + padding, &bits_len, 8);
}

// Process a single 512-bit block
void process_block(const uint8_t *block, uint32_t *A, uint32_t *B, uint32_t *C, uint32_t *D) {
    // Initialize working variables with current hash value
    uint32_t a = *A, b = *B, c = *C, d = *D, f, g, temp;
    uint32_t M[16];

    // Copy block into 16 32-bit words M
    for (int i = 0; i < 16; ++i)
        M[i] = ((uint32_t)block[i * 4]) | (((uint32_t)block[i * 4 + 1]) << 8) |
               (((uint32_t)block[i * 4 + 2]) << 16) | (((uint32_t)block[i * 4 + 3]) << 24);

    // Main loop
    for (uint32_t i = 0; i < 64; ++i) {
        if (i < 16) {
            f = (b & c) | (~b & d);
            g = i;
        } else if (i < 32) {
            f = (d & b) | (~d & c);
            g = (5 * i + 1) % 16;
        } else if (i < 48) {
            f = b ^ c ^ d;
            g = (3 * i + 5) % 16;
        } else {
            f = c ^ (b | ~d);
            g = (7 * i) % 16;
        }
        temp = d;
        d = c;
        c = b;
        b = b + LEFTROTATE((a + f + T[i] + M[g]), shifts[i]);
        a = temp;
    }

    // Add this chunk's hash to the result so far
    *A += a;
    *B += b;
    *C += c;
    *D += d;
}

// MD5 hashing function
void md5(const char *initial_msg, char *output) {
    uint8_t *msg = NULL;
    size_t new_len = 0;
    preprocess_message((uint8_t*)initial_msg, strlen(initial_msg), &msg, &new_len);

    uint32_t a = A, b = B, c = C, d = D;

    // Process each 512-bit block
    for (size_t offset = 0; offset < new_len; offset += 64) {
        process_block(msg + offset, &a, &b, &c, &d);
    }

    free(msg);

    // Output the final hash as a hexadecimal string
    uint8_t hash[16];
    memcpy(hash, &a, 4);
    memcpy(hash + 4, &b, 4);
    memcpy(hash + 8, &c, 4);
    memcpy(hash + 12, &d, 4);

    for (int i = 0; i < 16; ++i)
        sprintf(output + i * 2, "%02x", hash[i]);
}

// Main function for testing
int main() {
    char output[33] = {0};
    md5("test", output);
    printf("%s\n", output);  // Expected output: 098f6bcd4621d373cade4e832627b4f6
    return 0;
}
