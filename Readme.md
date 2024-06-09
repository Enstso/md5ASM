# MD5 Project in ASMx64

This project involves the implementation of a part of the MD5 hashing algorithm in ASMx64 assembly language. The MD5 algorithm is widely used to produce a digital fingerprint (hash) of data, typically a message or a file.

## Features

- Implementation of the MD5_transform function for processing 512-bit blocks of the message.
- Supports x64 architectures.

## How MD5 Algorithm Works

The MD5 algorithm operates in several steps:
1. Pre-processing of the message.
2. Division of the message into 512-bit blocks.
3. Initialization of variables.
4. Main loop for processing each block.
5. Generation of the final hash.

## Source File

The source file `MD5_transform.asm` contains the implementation of the `MD5_transform` function. This function is responsible for processing a 512-bit block of the message using the MD5 algorithm.

The source code is available in this repository: [MD5_Transform-x64](https://github.com/maximmasiutin/MD5_Transform-x64/blob/master/md5_64.asm).

## Usage

To use this implementation, include the `MD5_transform.asm` file in your x64 assembly project and call the `MD5_transform` function with appropriate input data.

