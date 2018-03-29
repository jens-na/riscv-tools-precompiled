riscv-tools-precompiled
=====
This repository holds a precompiled version of the RISC-V toolchain.

## Files
The files are splitted into several parts.

#### builds/build-rv32ima.tar.gz.N

- Compiled with [build-rv32ima.sh](https://github.com/riscv/riscv-tools/blob/master/build-rv32ima.sh)
- Git Revision: [8ad8d4839acf2cdac0129b8fed8fe12136e77307](https://github.com/riscv/riscv-tools/tree/8ad8d4839acf2cdac0129b8fed8fe12136e77307)

````
$ sha256sum *
3f8b0d2d4262e69265ec602ff3e62b8d071dee35937102926dbf715f03eb1bbf  build-rv32ima.tar.gz.00
13392dc581756f63803d5960716ae72a2b59b2b9607bb8a129780c3dddf1cefb  build-rv32ima.tar.gz.01
963df52e9ecf34e9a4ac5827c6af094580739239d271e80950daa310f5e9cb10  build-rv32ima.tar.gz.02
14a8474d95102a6d1e580212a81d534e41185946d2fa6b7277f688989c80307e  build-rv32ima.tar.gz.03
a5f1fcb8e8ffaa452efe043a9b2829bc820568109079297e41fa82abc7111086  build-rv32ima.tar.gz.04
7268e15dd8960c90e3fd921abb85a97b996f0abd10f87d73eb569ac413786196  build-rv32ima.tar.gz.05
116a708260fe9ad6aeda519d6f0670e7167e978f4991743faa2254b2df91bde7  build-rv32ima.tar.gz.06
e218ed6a2612b099c1569f7cb588c67620a52447cb3b8637fa645928ecf36c2f  build-rv32ima.tar.gz.07
d7d2591d9aabae8376dde0649369d6d0a0700f6395fe09b929d80bb69e166d8e  build-rv32ima.tar.gz.08
99ad40f618ce9d931e97f70ed594fc83bd2a80f0ac30094a568ec10e1da48778  build-rv32ima.tar.gz.09
c5637d55769254c50f8aab08e91ebbdee07128e50579f5624884c411cdb75af5  build-rv32ima.tar.gz.10
fae620a575fe93338c5d46b4209b803852fdd6e506cc6fd069a4683bc1088086  build-rv32ima.tar.gz.11
214569af8154931e6b9e955bd237f5dfa931d27eb7e0dc19123bf88c739c33cc  build-rv32ima.tar.gz.12
d5fd5725480b5600baffb9a465c96f2ced6479177221059b7c2ce4d4bafe516e  build-rv32ima.tar.gz.13
00edfa793a8cae813b864ccb737a2c32740112bc7ab30adb789ff097f96e986a  build-rv32ima.tar.gz.14
````

**Attention!**
The RISCV toolchain is a precompiled version, but GCC is linked against the following dynamic libraries which must be available:

```
$ riscv32-unknown-elf-objdump -p ./libexec/gcc/riscv32-unknown-elf/7.2.0/cc1  
[...]
Dynamic Section:
  NEEDED               libisl.so.15    --> see below
  NEEDED               libmpc.so.3
  NEEDED               libmpfr.so.6    --> see below
  NEEDED               libgmp.so.10
  NEEDED               libdl.so.2
  NEEDED               libz.so.1
  NEEDED               libm.so.6
  NEEDED               libc.so.6
[...]
```
-- `libisl.so.15`
```
wget http://isl.gforge.inria.fr/isl-0.15.tar.gz
tar -xvf isl-0.15.tar.gz
cd isl-0.15
./configure
make
sudo make install
```

-- `libmpfr.so.6`
```
wget http://www.mpfr.org/mpfr-current/mpfr-4.0.1.tar.gz
tar -xvf mpfr-4.0.1.tar.gz
cd mpfr-4.0.1
./configure
make
sudo make install
```

## Usage
Download and concatenate the files first:
```
$ curl -O -L https://github.com/jens-na/riscv-tools-precompiled/blob/master/builds/build-rv32ima.tar.gz.[00-14]?raw=true  
```
Afterwards you can install the toolchain in a specific directory:
```
# cat build-rv32ima.tar.gz.* | tar xzf - -C /opt/riscv
```

## Build
If you want to run a build which generates a precompiled version, you can run the following command:
```
$ ./build.sh [build-rv32ima.sh | build.sh]
```

- `build-rv32ima.sh` -- Build a precompiled 32 bit RISC-V toolchain
- `build.sh` -- Build a precompiled 64 bit RISC-V toolchain

## License and Copyright
Licensed under the MIT License.
