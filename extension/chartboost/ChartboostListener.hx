package extension.chartboost;

/**
   Customizable listener for responding to Chartboost SDK events.
   Note - in the Chartboost SDK itself, you can return true/false from the shouldRequest/shouldDisplay* methods to indicate whether an ad should be requested or displayed.
   However you can't do that here, so you should implement logic prior to requesting/displaying an ad in your the game, rather than in here
**/
class ChartboostListener {
	public function shouldRequestInterstitial(location:String):Void {
		
	}
	
	public function shouldDisplayInterstitial(location:String):Void {
		
	}
	
	public function didCacheInterstitial(location:String):Void {
		
	}
	
	public function didFailToLoadInterstitial(location:String, error:Int):Void {
		
	}
	
	public function willDisplayInterstitial(location:String):Void {
		
	}
	
	public function didDismissInterstitial(location:String):Void {
		
	}
	
	public function didCloseInterstitial(location:String):Void {
		
	}
	
	public function didClickInterstitial(location:String):Void {
		
	}
	
	public function didDisplayInterstitial(location:String):Void {
		
	}
	
	public function shouldDisplayRewardedVideo(location:String):Void {
		
	}
	
	public function didCacheRewardedVideo(location:String):Void {
		
	}
	
	public function didFailToLoadRewardedVideo(location:String, error:Int):Void {
		
	}
	
	public function didDismissRewardedVideo(location:String):Void {
		
	}
	
	public function didCloseRewardedVideo(location:String):Void {
		
	}
	
	public function didClickRewardedVideo(location:String):Void {
		
	}
	
	public function didCompleteRewardedVideo(location:String, reward:Int):Void {
		
	}
	
	public function didDisplayRewardedVideo(location:String):Void {
		
	}
	
	public function willDisplayVideo(location:String):Void {
		
	}
	
	public function didFailToRecordClick(uri:String, error:Int):Void {
		
	}
	
	public function didInitialize(status:Bool):Void {
		
	}
	
	// TODO there are far better ways of doing this
	#if ios
	// Interstitial events
	private static inline var SHOULD_REQUEST_INTERSTITIAL:String = "shouldRequestInterstitial";
	private static inline var SHOULD_DISPLAY_INTERSTITIAL:String = "shouldDisplayInterstitial";
	private static inline var DID_CACHE_INTERSTITIAL:String = "didCacheInterstitial";
	private static inline var DID_FAIL_TO_LOAD_INTERSTITIAL:String = "didFailToLoadInterstitial";
	private static inline var WILL_DISPLAY_INTERSTITIAL:String = "willDisplayInterstitial";
	private static inline var DID_DISMISS_INTERSTITIAL:String = "didDismissInterstitial";
	private static inline var DID_CLOSE_INTERSTITIAL:String = "didCloseInterstitial";
	private static inline var DID_CLICK_INTERSTITIAL:String = "didClickInterstitial";
	private static inline var DID_DISPLAY_INTERSTITIAL:String = "didDisplayInterstitial";
	
	// Rewarded video events
	private static inline var SHOULD_DISPLAY_REWARDED_VIDEO:String = "shouldDisplayRewardedVideo";
	private static inline var DID_CACHE_REWARDED_VIDEO:String = "didCacheRewardedVideo";
	private static inline var DID_FAIL_TO_LOAD_REWARDED_VIDEO:String = "didFailToLoadRewardedVideo";
	private static inline var DID_DISMISS_REWARDED_VIDEO:String = "didDismissRewardedVideo";
	private static inline var DID_CLOSE_REWARDED_VIDEO:String = "didCloseRewardedVideo";
	private static inline var DID_CLICK_REWARDED_VIDEO:String = "didClickRewardedVideo";
	private static inline var DID_COMPLETE_REWARDED_VIDEO:String = "didCompleteRewardedVideo";
	private static inline var DID_DISPLAY_REWARDED_VIDEO:String = "didDisplayRewardedVideo";
	
	private static inline var WILL_DISPLAY_VIDEO:String = "willDisplayVideo";
	
	// Misc
	private static inline var DID_FAIL_TO_RECORD_CLICK:String = "didFailToRecordClick";
	private static inline var DID_INITIALIZE:String = "didInitialize";
	
	public function notify(inEvent:Dynamic):Void {
		var type:String = "";
		var location:String = "";
		var uri:String = "";
		var reward_coins:Int = 0;
		var error:Int = -1;
		var status:Bool = false;
		
		if (Reflect.hasField(inEvent, "type")) {
			type = Std.string (Reflect.field (inEvent, "type"));
		}
		
		if (Reflect.hasField(inEvent, "location")) {
			location = Std.string (Reflect.field (inEvent, "location"));
		}
		
		if (Reflect.hasField(inEvent, "uri")) {
			uri = Std.string (Reflect.field (inEvent, "uri"));
		}
		
		if (Reflect.hasField(inEvent, "reward_coins")) {
			reward_coins = cast (Reflect.field (inEvent, "reward_coins"));
		}
		
		if (Reflect.hasField(inEvent, "error")) {
			error = cast (Reflect.field (inEvent, "error"));
		}
		
		if (Reflect.hasField(inEvent, "status")) {
			status = cast (Reflect.field(inEvent, "status"));
		}
		
		switch(type) {
			case SHOULD_REQUEST_INTERSTITIAL:
				shouldRequestInterstitial(location);
			case SHOULD_DISPLAY_INTERSTITIAL:
				shouldDisplayInterstitial(location);
			case DID_CACHE_INTERSTITIAL:
				didCacheInterstitial(location);
			case DID_FAIL_TO_LOAD_INTERSTITIAL:
				didFailToLoadInterstitial(location, error);
			case WILL_DISPLAY_INTERSTITIAL:
				willDisplayInterstitial(location);
			case DID_DISMISS_INTERSTITIAL:
				didDismissInterstitial(location);
			case DID_CLOSE_INTERSTITIAL:
				didCloseInterstitial(location);
			case DID_CLICK_INTERSTITIAL:
				didClickInterstitial(location);
			case DID_DISPLAY_INTERSTITIAL:
				didDisplayInterstitial(location);
				
			case SHOULD_DISPLAY_REWARDED_VIDEO:
				shouldDisplayRewardedVideo(location);
			case DID_CACHE_REWARDED_VIDEO:
				didCacheRewardedVideo(location);
			case DID_FAIL_TO_LOAD_REWARDED_VIDEO:
				didFailToLoadRewardedVideo(location, error);
			case DID_DISMISS_REWARDED_VIDEO:
				didDismissRewardedVideo(location);
			case DID_CLOSE_REWARDED_VIDEO:
				didCloseRewardedVideo(location);
			case DID_CLICK_REWARDED_VIDEO:
				didClickRewardedVideo(location);
			case DID_COMPLETE_REWARDED_VIDEO:
				didCompleteRewardedVideo(location, reward_coins);
			case DID_DISPLAY_REWARDED_VIDEO:
				didDisplayRewardedVideo(location);
				
			case WILL_DISPLAY_VIDEO:
				willDisplayVideo(location);
				
			case DID_FAIL_TO_RECORD_CLICK:
				didFailToRecordClick(uri, error);
			case DID_INITIALIZE:
				didInitialize(status);
				
			default:
			{
				trace("Unhandled Chartboost event. There shouldn't be any of these. Event type was [" + type + "]");
			}
		}
	}
	#end
}