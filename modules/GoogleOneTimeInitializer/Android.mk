LOCAL_PATH := .
include $(CLEAR_VARS)
include $(GAPPS_CLEAR_VARS)
LOCAL_MODULE := GoogleOneTimeInitializer
LOCAL_PACKAGE_NAME := com.google.android.onetimeinitializer
LOCAL_PRIVILEGED_MODULE := true

GAPPS_LOCAL_OVERRIDES_PACKAGES := OneTimeInitializer

include $(BUILD_GAPPS_PREBUILT_APK)
