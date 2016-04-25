LOCAL_PATH := .
include $(CLEAR_VARS)
include $(GAPPS_CLEAR_VARS)
LOCAL_MODULE := Photos
LOCAL_PACKAGE_NAME := com.google.android.apps.photos

GAPPS_LOCAL_OVERRIDES_MIN_VARIANT := stock
GAPPS_LOCAL_OVERRIDES_PACKAGES := Gallery Gallery2 MotGallery MediaShortcuts Galaxy4 LiveWallpapers NoiseField PhaseBeam PhotoTable

include $(BUILD_GAPPS_PREBUILT_APK)
