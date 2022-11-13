NDK=$ANDROID_NDK_HOME

PWD=$(pwd)

# specify this one to your os on which you run compilation
HOST_OS=linux-x86_64

echo "compiling for architecture: $1"

cd libllvm

mkdir buildcmake
cd buildcmake

case "$1" in
    clean)
        make clean
        ;;
    armv7-a)
        export CFLAGS="-m32 -O2"
        export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_OS
        export TARGET=armv7a-linux-androideabi
        export API=19
        export AR=$TOOLCHAIN/bin/llvm-ar
        export CC=$TOOLCHAIN/bin/$TARGET$API-clang
        # if needed, you can try setting this as $CC or you can steal GAS AS from old ndk such as r15c and point to it there
        export AS=$TOOLCHAIN/bin/llvm-as
        export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
        export LD=$TOOLCHAIN/bin/ld
        export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
        export STRIP=$TOOLCHAIN/bin/llvm-strip
        CMAKEOPTIONS=-DCMAKE_C_FLAGS=$CFLAGS -DCMAKE_CXX_FLAGS=$CFLAGS -DLLVM_ENABLE_PROJECTS=clang -DLLVM_ENABLE_TERMINFO=ON -DLLVM_ENABLE_THREADS=ON -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="ARM" -DLIBCLANG_BUILD_STATIC=ON -DLLVM_INCLUDE_TESTS=OFF -DLLVM_ENABLE_ZLIB=OFF -DCMAKE_CROSSCOMPILING=True -DLLVM_DEFAULT_TARGET_TRIPLE=armv7a-linux-androideabi -DLLVM_TARGET_ARCH=ARM -DLLVM_ENABLE_PIC=True -DCMAKE_TOOLCHAIN_FILE=$NDK/build/cmake/android.toolchain.cmake
        cmake $CMAKEOPTIONS ..
        cmake --build . --config Release
        ;;
    armv8-a)
        export CFLAGS="-m64 -O2"
        export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_OS
        export TARGET=aarch64-linux-android
        export API=21
        export AR=$TOOLCHAIN/bin/llvm-ar
        export CC=$TOOLCHAIN/bin/$TARGET$API-clang
        # if needed, you can try setting this as $CC or you can steal GAS AS from old ndk such as r15c and point to it there
        export AS=$TOOLCHAIN/bin/llvm-as
        export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
        export LD=$TOOLCHAIN/bin/ld
        export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
        export STRIP=$TOOLCHAIN/bin/llvm-strip
        CMAKEOPTIONS=-DCMAKE_C_FLAGS=$CFLAGS -DCMAKE_CXX_FLAGS=$CFLAGS -DLLVM_ENABLE_PROJECTS=clang -DLLVM_ENABLE_TERMINFO=ON -DLLVM_ENABLE_THREADS=ON -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="ARM64" -DLIBCLANG_BUILD_STATIC=ON -DLLVM_INCLUDE_TESTS=OFF -DLLVM_ENABLE_ZLIB=OFF -DCMAKE_CROSSCOMPILING=True -DLLVM_DEFAULT_TARGET_TRIPLE=aarch64-linux-android -DLLVM_TARGET_ARCH=ARM64 -DLLVM_ENABLE_PIC=True -DCMAKE_TOOLCHAIN_FILE=$NDK/build/cmake/android.toolchain.cmake
        cmake $CMAKEOPTIONS ..
        cmake --build . --config Release
        ;;
    x86-android)
        export CFLAGS="-m32 -O2"
        export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_OS
        export TARGET=i686-linux-android
        export API=19
        export AR=$TOOLCHAIN/bin/llvm-ar
        export CC=$TOOLCHAIN/bin/$TARGET$API-clang
        # if needed, you can try setting this as $CC or you can steal GAS AS from old ndk such as r15c and point to it there
        export AS=$TOOLCHAIN/bin/llvm-as
        export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
        export LD=$TOOLCHAIN/bin/ld
        export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
        export STRIP=$TOOLCHAIN/bin/llvm-strip
        CMAKEOPTIONS=-DCMAKE_C_FLAGS=$CFLAGS -DCMAKE_CXX_FLAGS=$CFLAGS -DLLVM_ENABLE_PROJECTS=clang -DLLVM_ENABLE_TERMINFO=ON -DLLVM_ENABLE_THREADS=ON -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="X86" -DLIBCLANG_BUILD_STATIC=ON -DLLVM_INCLUDE_TESTS=OFF -DLLVM_ENABLE_ZLIB=OFF -DCMAKE_CROSSCOMPILING=True -DLLVM_DEFAULT_TARGET_TRIPLE=i686-linux-android -DLLVM_TARGET_ARCH=X86 -DLLVM_ENABLE_PIC=True -DCMAKE_TOOLCHAIN_FILE=$NDK/build/cmake/android.toolchain.cmake
        cmake $CMAKEOPTIONS ..
        cmake --build . --config Release
        ;;
    x86_64-android)
        export CFLAGS="-m64 -O2"
        export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_OS
        export TARGET=x86_64-linux-android
        export API=21
        export AR=$TOOLCHAIN/bin/llvm-ar
        export CC=$TOOLCHAIN/bin/$TARGET$API-clang
        # if needed, you can try setting this as $CC or you can steal GAS AS from old ndk such as r15c and point to it there
        export AS=$TOOLCHAIN/bin/llvm-as
        export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
        export LD=$TOOLCHAIN/bin/ld
        export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
        export STRIP=$TOOLCHAIN/bin/llvm-strip
        CMAKEOPTIONS=-DCMAKE_C_FLAGS=$CFLAGS -DCMAKE_CXX_FLAGS=$CFLAGS -DLLVM_ENABLE_PROJECTS=clang -DLLVM_ENABLE_TERMINFO=ON -DLLVM_ENABLE_THREADS=ON -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="X86_64" -DLIBCLANG_BUILD_STATIC=ON -DLLVM_INCLUDE_TESTS=OFF -DLLVM_ENABLE_ZLIB=OFF -DCMAKE_CROSSCOMPILING=True -DLLVM_DEFAULT_TARGET_TRIPLE=x86_64-linux-android -DLLVM_TARGET_ARCH=X86_64 -DLLVM_ENABLE_PIC=True -DCMAKE_TOOLCHAIN_FILE=$NDK/build/cmake/android.toolchain.cmake
        cmake $CMAKEOPTIONS ..
        cmake --build . --config Release
        ;;
    #x86_64-linux)
        #export CFLAGS="-m64 -O2"
        #CMAKEOPTIONS=""
        #cmake $CMAKEOPTIONS ..
        #cmake --build . --config Release
        #;;
    #x86-linux)
        #export CFLAGS="-m32 -O2"
        #CMAKEOPTIONS=""
        #cmake $CMAKEOPTIONS ..
        #cmake --build . --config Release
        #;;
    *)
        echo "you didn't specify an architecture or specified invalid one (available options: armv7-a, armv8-a, x86-android, x86_64-android, x86_64-linux)"
        exit 1
        ;;
esac