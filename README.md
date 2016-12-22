# Haxe Chartboost

Unofficial Chartboost ads library support for OpenFL Android/iOS targets.

### Features ###

Supports:
* Static and video interstitials.
* More apps panels.
* Rewarded videos.
* Caching and custom ad locations.
* Customizable listener for reacting to all SDK events.

Doesn't support:
* Chartboost InPlay type ads.
* Chartboost Analytics.
* Age gates.

If there is something you would like adding let me know. Pull requests welcomed too!

### Install ###

```bash
haxelib install samcodes-chartboost
```

### Example ###

See the demo app for a complete example using a custom listener: https://github.com/Tw1ddle/samcodes-ads-demo

![Screenshot of demo app](https://github.com/Tw1ddle/samcodes-ads-demo/blob/master/screenshots/chartboost-interstitial.png?raw=true "Demo app")

![Screenshot of demo app](https://github.com/Tw1ddle/samcodes-ads-demo/blob/master/screenshots/chartboost-video.png?raw=true "Demo app")

### Usage ###

Include the haxelib through Project.xml:
```xml
<haxelib name="samcodes-chartboost" />
```

For Android also set your app identifier and signature:
```xml
<setenv name="ChartboostAppId" value="your_app_id" />
<setenv name="ChartboostAppSignature" value="your_app_signature" />
```
For iOS pass the app identifier and signature via the init call:
```haxe
Chartboost.init("your_app_id", "your_app_signature");
```

```haxe
// Basic usage
Chartboost.setListener(new MyChartboostListener(listener)); // Attach your own extended ChartboostListener to handle/respond to SDK events like 'shouldDisplayInterstitial', 'didDismissInterstitial' etc.

Chartboost.cacheInterstitial("mylocation"); // Cache an interstitial at 'mylocation'. Locations are added to the Chartboost dashboard automatically.

Chartboost.showInterstitial("mylocation"); // Show an interstitial at 'mylocation'. Will display faster if previously cached (check Chartboost.hasInterstitial()).

// And so on...
```

### Notes ###

If in doubt, refer to the official [Chartboost](https://www.chartboost.com/) documentation.

Use ```#if (android || ios)``` conditionals around your imports and calls to this library for cross platform projects, as there is no stub/fallback implementation included in the haxelib.

For iOS you need to drag your ```libChartboost.a``` into the "link binaries with libraries" section under the "build phases" tab in Xcode.

If you need to rebuild the iOS or simulator ndlls navigate to ```/project``` and run ```rebuild_ndlls.sh```.