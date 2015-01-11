# Haxe Chartboost

Unofficial Chartboost ads library support for OpenFL Android/iOS targets.

Supports:
* Caching and showing interstitials.
* Caching and showing the "more apps" panel.
* Caching and showing rewarded videos.
* Customizable listener for reacting to events.
* Custom ad locations.

Doesn't support:
* Chartboost Store features.
* Chartboost InPlay type ads.
* Age gates.

### Usage ###

Include the library through project.xml:
```haxe
	<include path="lib/samcodes-chartboost/include.xml" />
```

Set your app identifier and signature.

Android project.xml:
```xml
	<setenv name="ChartboostAppId" value="your_app_id" />
	<setenv name="ChartboostAppSignature" value="your_app_signature" />
```

iOS pass as a parameter in the Chartboost initialization method:
```haxe
Chartboost.init("your_app_id", "your_app_signature");
```

### Examples ###

For a full sample check the HaxeFlixel demo app: https://github.com/Tw1ddle/samcodes-chartboost-demo