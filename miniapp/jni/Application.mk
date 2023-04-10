# If you need only armeabi-v7a, then don't touch APP_ABI
# If you need all architectures, it's enough to write 'all'
# Example: APP_ABI := all
# If you need certain architectures, then write them through a space
# Example: APP_ABI := armeabi-v7a arm64-v8a x86 x86_64

APP_ABI := armeabi-v7a

# Defines the minimum level of the Android API required to build the application. 
# The APP_PLATFORM value must match the API version that your application will run on. 
# For example, if your application is designed to run on Android 8.0 (API level 26), 
# then the APP_PLATFORM value should be set to android-26. 
#***************************************************************************************
# Example: APP_PLATFORM := android-26
#***************************************************************************************
# If you want your app to work on all Android versions starting from a certain API level,
# then you can specify this API level as the APP_PLATFORM value. 
# For example, if you want your app to work on all Android devices starting from Android 4.4 (API level 19), 
# then the APP_PLATFORM value can be set to android-19. 
# However, keep in mind that not all functions and features will be available on all versions of Android.

# Android 5.0 (API level 21)
APP_PLATFORM := android-21 

# name your app
APP_MODULES := miniapp

# Its default, but exists: gnustl_static, c++_static, c++_shared, stlport_static, stlport_shared, system.
APP_STL := c++_static