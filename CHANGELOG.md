# CHANGELOG

## 1.1.4 -> 1.1.5
 * Upgraded to latest Chartboost SDK (iOS 8.4.1, Android 8.2.0).

## 1.1.3 -> 1.1.4
 * Upgraded to latest Chartboost SDK (iOS 8.0.1, Android 7.5.0).

## 1.1.2 -> 1.1.3
 * Went back to calling initChartboost manually from Haxe code on launch on Android. You must now call initChartboost manually from Haxe code on launch on Android.
 This works around an issue on HTC One A9 (Android version 6.0.1) and several other devices. Calling Chartboost.startWithAppId() in in the extension's onCreate method prevented SDL from subsequently loading libApplicationMain.so
 Calls to dlopen would fail unless we passed absolute paths to .so files. We couldn't make sense of this, but deferring Chartboost setup until later works around this.

## 1.1.1 -> 1.1.2
 * Upgraded to latest Chartboost SDK (iOS 7.5).
 * Reverted to initializing Chartboost on Android via activity onCreate, doing it later via initChartboost apparently broke ads. You must set app id and signature in project.xml as before.

## 1.1.0 -> 1.1.1
 * Upgraded to latest Chartboost SDK (iOS 7.3.0, Android 7.3.1).
 * You must now call initChartboost manually from Haxe code on launch on Android.
 * Updated bindings, including setPIDataUseConsent method to facilitate compliance with GDPR.

## 1.0.9 -> 1.1.0
 * Upgraded to latest Chartboost SDK (iOS 7.2.0, Android 7.2.0).
 * Numerous updates to support OpenFL 8.
 * Removed deprecated More Apps support.
 * Updated bindings, including restrictDataCollection method to facilitate compliance with GDPR.

## 1.0.8 -> 1.0.9
 * Upgraded to latest Chartboost SDK (iOS 6.6.1).

## 1.0.7 -> 1.0.8
 * Upgraded to latest Chartboost SDKs (iOS 6.6.0, Android 6.6.1)

## 1.0.6 -> 1.0.7
 * Upgraded to latest Chartboost SDKs (iOS 6.5.2, Android 6.6.0)
 * Add Google Play Services Android dependency.

## 1.0.5 -> 1.0.6
 * Updated bindings and upgraded to latest Chartboost SDKs (iOS 6.5.0, Android 6.5.1)
 * Removed iOS binding for closeImpression, as it was removed from the iOS SDK.
 * Renamed descriptionForClickError to descriptionForImpressionError.
 * Added bindings for getAutoCacheAds, setAutoCacheAds.

## 1.0.4 -> 1.0.5
 * Updated bindings and upgraded to latest Chartboost SDKs (Android 6.4.2, iOS 6.4.7)

## 1.0.3 -> 1.0.4
* Fixed a bug with non-unique CFFI primitive names, which could cause clashes (duplicate symbol errors) when using other haxelibs

## 1.0.3 -> 1.0.2
* Renamed hasCachedInterstitial etc. to hasInterstitial, hasMoreApps and hasRewardedVideo to match latest SDKs
* Updated bindings and upgraded to latest Chartboost SDKs (Android 6.4.0, iOS 6.4.0)
* Added configuration method bindings including setShouldRequestInterstitialsInFirstSession
* Replace deprecated didPrefetchVideos with didInitialize callback

## 1.0.1 -> 1.0.2
* Updated bindings and upgraded to latest Chartboost SDKs (Android 6.0.2, iOS 6.0.1)
* Added error ids to listener and a utility class to get error descriptions
* Properly handle back button when an ad is displayed on Android
* Fix AndroidManifest.xml so CBImpressionActivity is merged into the Android manifest

## 1.0.0 -> 1.0.1
* Updated to latest Chartboost SDKs (Android 5.5.0, iOS 5.5.1)
* Added bindings for closeImpression, isAnyViewVisible
* Fix multithreading bug on iOS

## 1.0.0
* Initial release