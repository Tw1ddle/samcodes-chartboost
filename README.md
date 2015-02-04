# Haxe Chartboost

Unofficial Chartboost ads library support for OpenFL Android/iOS targets.

### Features ###

Supports:
* Caching and showing interstitials.
* Caching and showing "more apps" panels.
* Caching and showing rewarded videos.
* Customizable listener for reacting to SDK events.
* Custom ad locations.

Doesn't support:
* Chartboost Store features.
* Chartboost InPlay type ads.
* Age gates.

### Install ###

```bash
haxelib install samcodes-chartboost
```

### Usage ###

Include the haxelib through Project.xml:
```xml
<haxelib name="samcodes-chartboost" />
```

For Android fill in your app identifier and signature here too:
```xml
<setenv name="ChartboostAppId" value="your_app_id" />
<setenv name="ChartboostAppSignature" value="your_app_signature" />
```
For iOS pass the app identifier and signature as parameters in the init call:
```haxe
Chartboost.init("your_app_id", "your_app_signature");
```

```haxe
// Basic usage
Chartboost.setListener(new MyChartboostListener(listener)); // Attach a extended ChartboostListener to handle/respond to SDK events like 'shouldDisplayInterstitial', 'didDismissInterstitial' etc.

Chartboost.cacheInterstitial("mylocation"); // Cache interstitial at 'mylocation'. Locations are added to the Chartboost dashboard automatically.

Chartboost.showInterstitial("mylocation"); // Shows an interstitial at 'mylocation'. Will display faster if previously cached.

// And so on...
```

### Example ###

For a full example see the demo app: https://github.com/Tw1ddle/samcodes-ads-demo

![Screenshot of demo app](https://github.com/Tw1ddle/samcodes-ads-demo/blob/master/screenshots/chartboost-interstitial.png?raw=true "Demo app")

### Notes ###

For running on iOS, you need to drag your ```libChartboost.a``` into the "link binaries with libraries" section under the "build phases" tab in Xcode.

If you need to rebuild the iOS libs for any reason navigate to ```/project``` and run:

```bash
haxelib run hxcpp Build.xml -Diphoneos
haxelib run hxcpp Build.xml -Diphoneos -DHXCPP_ARMV7
haxelib run hxcpp Build.xml -Diphoneos -DHXCPP_ARM64
```
