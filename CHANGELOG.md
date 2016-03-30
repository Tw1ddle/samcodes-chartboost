# CHANGELOG

## 1.0.3 -> 1.0.2
* Updated bindings and upgraded to latest Chartboost SDKs (Android 6.4.0, iOS 6.4.0)
* Added configuration method bindings including setShouldRequestInterstitialsInFirstSession.
* Replace deprecated didPrefetchVideos with didInitialize callback.

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