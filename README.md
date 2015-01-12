# Haxe Chartboost

Unofficial Chartboost ads library support for OpenFL Android/iOS targets.

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

### Usage ###

Include the library through project.xml:
```xml
<include path="lib/samcodes-chartboost/include.xml" />
```
Android project.xml:
```xml
	<setenv name="ChartboostAppId" value="your_app_id" />
	<setenv name="ChartboostAppSignature" value="your_app_signature" />
```
For iOS pass as the app identifier and signature as parameters in the Chartboost initialization method:
```haxe
Chartboost.init("your_app_id", "your_app_signature");

// Basic usage
Chartboost.setListener(new MyChartboostListener(listener)); // Attach a extended ChartboostListener to handle/respond to SDK events like 'shouldDisplayInterstitial', 'didDismissInterstitial' etc.

Chartboost.cacheInterstitial("mylocation"); // Cache interstitial at 'mylocation'. Locations are added to the Chartboost dashboard automatically.

Chartboost.showInterstitial("mylocation"); // Shows an interstitial at 'mylocation'. Will display faster if previously cached.

// And so on...

```

### Example ###

For a working example refer to this demo app: https://github.com/Tw1ddle/samcodes-chartboost-demo
