# Haxe Chartboost

[![Travis Build Status](https://img.shields.io/travis/Tw1ddle/samcodes-chartboost.svg?style=flat-square)](https://travis-ci.org/Tw1ddle/samcodes-chartboost)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://github.com/Tw1ddle/samcodes-chartboost/blob/master/LICENSE)

Unofficial Chartboost ads library support for OpenFL Android and iOS targets. See the demo app [here](https://github.com/Tw1ddle/samcodes-ads-demo).

### Features

Supports:
* Static and video interstitials.
* Rewarded videos.
* Ad caching and custom ad locations.
* Customizable listener for reacting to all SDK events.

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

![Screenshot of demo app](https://github.com/Tw1ddle/samcodes-ads-demo/blob/master/screenshots/chartboost-interstitial.png?raw=true "Demo app")

![Screenshot of demo app](https://github.com/Tw1ddle/samcodes-ads-demo/blob/master/screenshots/chartboost-video.png?raw=true "Demo app")

### Usage

Include the haxelib through Project.xml:
```xml
<haxelib name="samcodes-chartboost" />
```

Specify your app id and app signature in Project.xml:
```xml
<!-- Enter your app id and app signatures here -->
<setenv name="ChartboostAppId" value="YOUR_ID" if="android" />
<setenv name="ChartboostAppSignature" value="YOUR_SIG" if="android" />
<haxeflag name="ChartboostAppId" value="YOUR_ID" if="ios" />
<haxeflag name="ChartboostAppSignature" value="YOUR_SIG" if="ios" />
```

```haxe
// Basic usage
Chartboost.setListener(new MyChartboostListener(listener)); // Attach your own ChartboostListener subclass to handle/respond to SDK events like 'willDisplayInterstitial', 'didDismissInterstitial' etc.

Chartboost.cacheInterstitial("mylocation"); // Cache an interstitial at 'mylocation'. Locations are added to the Chartboost dashboard automatically.

Chartboost.showInterstitial("mylocation"); // Show an interstitial at 'mylocation'. Will display faster if previously cached (check Chartboost.hasInterstitial()).

// And so on...
```

### Notes

If in doubt, refer to the official [Chartboost](https://www.chartboost.com/) documentation.

Use ```#if (android || ios)``` conditionals around your imports and calls to this library for cross platform projects - there is no stub/fallback implementation included in the haxelib.

For iOS you need to drag the ads library framework files e.g. ```Chartboost``` into the "link binaries with libraries" section under the "build phases" tab in Xcode.

If you need to rebuild the iOS or simulator ndlls, navigate to ```/project``` and run ```rebuild_ndlls.sh```.