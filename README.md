riscv-tools-precompiled
=====
This repository holds a precompiled version of the RISC-V toolchain.

## Files


#### builds/build-rv32ima.tar.gz

- Compiled with [build-rv32ima.sh](https://github.com/riscv/riscv-tools/blob/master/build-rv32ima.sh)
- Git Revision: [8ad8d4839acf2cdac0129b8fed8fe12136e77307](https://github.com/riscv/riscv-tools/tree/8ad8d4839acf2cdac0129b8fed8fe12136e77307)

````
$ sha256sum build-rv32ima.tar.gz
1f68df2b2a345d68bed2d24bee128617091d2337b819d86580a4788a86df28e4  build-rv32ima.tar.gz
````

## Build
If you want to run a build which generates a precompiled version, you can run the following command:
```
$ ./build.sh [build-rv32ima.sh | build.sh]
```

- `build-rv32ima.sh` -- Build a precompiled 32 bit RISC-V toolchain
- `build.sh` -- Build a precompiled 64 bit RISC-V toolchain

### License and Copyright
Licensed under the MIT License.


