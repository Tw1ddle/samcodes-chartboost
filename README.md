# Haxe Chartboost

[![Travis Build Status](https://img.shields.io/travis/Tw1ddle/samcodes-chartboost.svg?style=flat-square)](https://travis-ci.org/Tw1ddle/samcodes-chartboost)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://github.com/Tw1ddle/samcodes-chartboost/blob/master/LICENSE)

Unofficial Chartboost ads library support for Haxe OpenFL Android and iOS targets. See the demo app [here](https://github.com/Tw1ddle/samcodes-ads-demo).

### Features

Supports:
* Static and video interstitials.
* Rewarded videos.
* Ad caching and custom ad locations.
* Customizable listener for reacting to all SDK events.
* GDPR personal data consent method bindings.

Doesn't support:
* Chartboost InPlay type ads.
* Chartboost Analytics.
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

On Android, simply set the app identifier and signature in your project settings:
```xml
<setenv name="ChartboostAppId" value="YOUR_ID" if="android" />
<setenv name="ChartboostAppSignature" value="YOUR_SIG" if="android" />
```

On iOS, pass the app identifier and signature in when initializing Chartboost:
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
  * Use ```#if (android || ios)``` conditionals around your imports and calls to this library for cross platform projects - there is no stub/fallback implementation included in the haxelib.
  * If you need to rebuild the iOS or simulator ndlls, navigate to ```/project``` and run ```rebuild_ndlls.sh```.
  * Got an idea or suggestion? Open an issue on GitHub, or send Sam a message on [Twitter](https://twitter.com/Sam_Twidale).