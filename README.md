# Haxe Chartboost

[![License](https://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://github.com/Tw1ddle/samcodes-chartboost/blob/master/LICENSE)

Unofficial Chartboost ads library support for Haxe OpenFL Android and iOS targets. See the demo app [here](https://github.com/Tw1ddle/samcodes-ads-demo).

*Deprecation note. I am not currently using the Chartboost ads haxelib in any games, so this is likely to be out of date.*

### Features

Supports:
* Static and video interstitials.
* Rewarded videos.
* Ad caching and custom ad locations.
* Customizable listener for reacting to all SDK events.
* GDPR personal data consent method bindings.

Doesn't support:
* Banner ads.
* Age gates.

If there is something you would like adding please open an issue. Pull requests welcomed too!

### Install

```bash
haxelib install samcodes-chartboost
```

### Example

See the [demo app](https://github.com/Tw1ddle/samcodes-ads-demo) for a complete example using a custom listener.

![Screenshot of demo app](https://github.com/Tw1ddle/samcodes-ads-demo/blob/master/screenshots/chartboost-interstitial.png?raw=true "Demo app with Chartboost interstitial")

![Screenshot of demo app](https://github.com/Tw1ddle/samcodes-ads-demo/blob/master/screenshots/chartboost-video.png?raw=true "Demo app with Chartboost video")

### Usage

Include the haxelib through Project.xml:
```xml
<haxelib name="samcodes-chartboost" />
```

On Android and iOS, pass the app identifier and signature in for your chosen app/platform when initializing Chartboost:
```haxe
Chartboost.initChartboost(yourAppId, yourAppSignature);
```

```haxe
// Basic usage
Chartboost.setListener(new MyChartboostListener(listener)); // Attach your own ChartboostListener subclass to handle/respond to SDK events like 'willDisplayInterstitial', 'didDismissInterstitial' etc.

Chartboost.cacheInterstitial("mylocation"); // Cache an interstitial at 'mylocation'. Locations are added to the Chartboost dashboard automatically.

Chartboost.showInterstitial("mylocation"); // Show an interstitial at 'mylocation'. Will display faster if previously cached (check Chartboost.hasInterstitial()).

// And so on...
```

### Notes

  * Refer to the official [Chartboost](https://www.chartboost.com/) documentation.
  * On iOS 14+ you need to include the SKAdNetworkIdentifier key and Chartboost's list of demand partners in your app's info.plist file for ads to work properly.
  * Use ```#if (android || ios)``` conditionals around your imports and calls to this library for cross platform projects - there is no stub/fallback implementation included in the haxelib.
  * You may need to edit the build.gradle file in order to select working combinations of the Android support library and Play Services, depending on your targeted SDK versions and other libraries used in your project.
  * If you need to rebuild the iOS or simulator ndlls, navigate to ```/project``` and run ```rebuild_ndlls.sh```.
  * Got an idea or suggestion? Open an issue on GitHub, or send Sam a message on [Twitter](https://twitter.com/Sam_Twidale).
