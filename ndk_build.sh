if [[ "${ANDROID_NDK_HOME}X" == "X" ]]; then
    echo "ANDROID_NDK_HOME is not set"
    echo "set it like export ANDROID_NDK_HOME=/home/zhangfuwen/bin/sdk-tools-linux-3859397/ndk-bundle/"
    exit 1
fi
set -x
rm -rf cmake_build_ndk
mkdir cmake_build_ndk && cd cmake_build_ndk
#CMAKE_CXX_FLAGS="-fPIE -fPIC -lstdc++" \
#CMAKE_AR="$NDK_TOOLCHAIN_PATH/arm/bin/arm-linux-androideabi-ar" \
#CMAKE_RANLIB="$NDK_TOOLCHAIN_PATH/arm/bin/arm-linux-androideabi-ranlib" \
#CMAKE_C_COMPILER="${ANDOIRD_NDK_HOME}/ndk-bundle/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android30-clang" \
#CMAKE_CXX_COMPILER="${ANDOIRD_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android30-clang++" \
#cmake ..
cmake -D CMAKE_TOOLCHAIN_FILE=${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake ..
make su
cd -
ls cmake_build_ndk/bin
