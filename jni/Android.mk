LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := miniapp
LOCAL_LDLIBS := -llog -lm -lGLESv3 -lEGL -landroid -shared -uANativeActivity_onCreate

# root
FILE_LIST := $(wildcard $(LOCAL_PATH)/*.cpp)
#FILE_LIST += $(wildcard $(LOCAL_PATH)/folder/*.cpp)

LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%)

LOCAL_CPPFLAGS := -w -s -fvisibility=hidden -pthread -Wall -fpack-struct=1 -Os -std=c++14 -fexceptions -fdata-sections -ffunction-sections 
#LOCAL_CPPFLAGS := -w -pthread -Wall -fpack-struct=1 -Os -std=c++14 -fexceptions
include $(BUILD_SHARED_LIBRARY)