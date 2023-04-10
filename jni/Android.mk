LOCAL_PATH := $(call my-dir)

#*********** Its for add static lib ********************
#include $(CLEAR_VARS)
#LOCAL_MODULE    := libexample
#LOCAL_SRC_FILES := vendor/example/libexample.a
#include $(PREBUILT_STATIC_LIBRARY)
#************************************************

include $(CLEAR_VARS)

# Name your LIB
LOCAL_MODULE := miniapp

# Local dependencies
LOCAL_LDLIBS := -shared -uANativeActivity_onCreate -lm -lGLESv3 -lEGL -landroid -llog

# The path to the files 'C' language
LOCAL_C_INCLUDES += $(wildcard $(LOCAL_PATH)/vendor/)

# IMPORTANT! First of all, we compile 'android_native_app_glue.c', then everything else
FILE_LIST := $(wildcard $(LOCAL_PATH)/vendor/android_native_app_glue.c)

FILE_LIST += $(wildcard $(LOCAL_PATH)/*.cpp)
#FILE_LIST += $(wildcard $(LOCAL_PATH)/example/*.cpp)
#FILE_LIST += $(wildcard $(LOCAL_PATH)/example2/*.cpp)
# etc...

# Vendor
FILE_LIST += $(wildcard $(LOCAL_PATH)/vendor/imgui/*.cpp)

LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%)

# If you added static libraries above, then write them here ***
#LOCAL_STATIC_LIBRARIES := libexample
#*****************************************************************

#**************** You can change it at your discretion (can be used as a RELEASE) ****************************
#LOCAL_CPPFLAGS := -w -s -fvisibility=hidden -pthread -Wall -fpack-struct=1 -O2 -std=c++14 -fexceptions
#*************************************************************************************************************

# This will allow you not to hide functions inside your library, 
# which will make it easier to track the error during development. 
# Use it only during the DEBUG process, so it will be safer.
LOCAL_CPPFLAGS := -g -rdynamic -funwind-tables -w -pthread -Wall -O2 -std=c++14 -fno-omit-frame-pointer -funwind-tables

include $(BUILD_SHARED_LIBRARY)