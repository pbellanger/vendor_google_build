include vendor/google/build/config.mk
include $(GAPPS_FILES)

DEVICE_PACKAGE_OVERLAYS += $(GAPPS_DEVICE_FILES_PATH)/overlay/pico

PRODUCT_PACKAGES += GoogleBackupTransport \
                    GoogleContactsSyncAdapter \
                    GoogleFeedback \
                    GoogleOneTimeInitializer \
                    GooglePartnerSetup \
                    PrebuiltGmsCore \
                    GoogleServicesFramework \
                    GoogleLoginService \
                    SetupWizard \
                    Phonesky \
                    GoogleCalendarSyncAdapter
                    
ifneq ($(filter $(call get-allowed-api-levels),23),)
PRODUCT_PACKAGES += GoogleTTS \
                    GooglePackageInstaller
endif

ifneq ($(filter $(TARGET_GAPPS_VARIANT),nano),) # require at least nano
PRODUCT_PACKAGES += FaceLock \
                    HotwordEnrollment \
                    Velvet

ifneq ($(filter $(TARGET_GAPPS_VARIANT),micro),) # require at least micro
PRODUCT_PACKAGES += CalendarGooglePrebuilt \
                    PrebuiltExchange3Google \
                    PrebuiltGmail \
                    GoogleHome
                    
ifeq ($(filter $(call get-allowed-api-levels),23),)
PRODUCT_PACKAGES += GoogleTTS
endif

ifneq ($(filter $(TARGET_GAPPS_VARIANT),mini),) # require at least mini
PRODUCT_PACKAGES += CalculatorGoogle \
                    PrebuiltDeskClockGoogle \
                    PlusOne \
                    Hangouts \
                    Maps \
                    Photos \
                    YouTube

ifneq ($(filter $(TARGET_GAPPS_VARIANT),full),) # require at least full
PRODUCT_PACKAGES += Books \
                    Chrome \
                    CloudPrint2 \
                    EditorsDocs \
                    Drive \
                    GoogleEars \
                    FitnessPrebuilt \
                    PrebuiltKeep \
                    Videos \
                    Music2 \
                    Newsstand \
                    PrebuiltNewsWeather \
                    PlayGames \
                    EditorsSheets \
                    EditorsSlides \
                    talkback

ifneq ($(filter $(TARGET_GAPPS_VARIANT),stock),) # require at least stock

DEVICE_PACKAGE_OVERLAYS += $(GAPPS_DEVICE_FILES_PATH)/overlay/stock

PRODUCT_PACKAGES += GoogleContacts \
                    LatinImeGoogle \
                    TagGoogle \
                    WebViewGoogle

# Messenger and Dialer apps only installed on phones (Dialer requires api level of 23 or above)
ifeq ($(filter $(GAPPS_PRODUCT_TYPE),tablet),)
PRODUCT_PACKAGES += PrebuiltBugle 
ifneq ($(filter $(call get-allowed-api-levels),23),)
PRODUCT_PACKAGES += GoogleDialer
endif
endif

# Camera app only installed on device equiped with a camera
ifeq ($(filter $(GAPPS_PRODUCT_HAS_CAMERA),false),)
PRODUCT_PACKAGES += GoogleCamera 
endif

ifneq ($(filter $(TARGET_GAPPS_VARIANT),super),)

ifneq ($(filter $(call get-allowed-api-levels),23),)
PRODUCT_PACKAGES += AndroidForWork
endif

PRODUCT_PACKAGES += Wallet \
                    DMAgent \
                    GoogleEarth \
                    GCS \
                    GoogleHindiIME \
                    GoogleJapaneseInput \
                    KoreanIME \
                    GooglePinyinIME \
                    Tycho \
                    Street \
                    TranslatePrebuilt \
                    GoogleZhuyinIME \
                    Earth

endif # end super
endif # end stock
endif # end full
endif # end mini
endif # end micro
endif # end nano
