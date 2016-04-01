package extension.chartboost;

#if android
import openfl.utils.JNI;
#end

#if ios
import flash.Lib;
#end

#if (android || ios)
@:allow(extension.Chartboost) class Chartboost {
	// Must be called before use of any other methods in this class
	public static function init(?appId:String, ?appSignature:String):Void {
		#if ios
		if (appId == null || appSignature == null || appId.length <= 10 || appSignature.length <= 10) {
			throw "Chartboost appId/appSignature not passed. On iOS appId and appSignature parameters must be passed in Chartboost.init.";
		}
		#end
		
		Chartboost.initBindings();
		
		#if ios
		init_chartboost(appId, appSignature);
		#end
	}
	
	public static function setListener(listener:ChartboostListener):Void {
		#if android
		set_listener(listener);
		#end
		
		#if ios
		set_listener(listener.notify);
		#end
	}
	
	public static function showInterstitial(id:String):Void {
		show_interstitial(id);
	}

	public static function cacheInterstitial(id:String):Void {
		cache_interstitial(id);
	}

	public static function hasInterstitial(id:String):Bool {
		return has_interstitial(id);
	}
	
	public static function showMoreApps(id:String):Void {
		show_more_apps(id);
	}
	
	public static function cacheMoreApps(id:String):Void {
		cache_more_apps(id);
	}
	
	public static function hasMoreApps(id:String):Bool {
		return has_more_apps(id);
	}
	
	public static function showRewardedVideo(id:String):Void {
		show_rewarded_video(id);
	}
	
	public static function cacheRewardedVideo(id:String):Void {
		cache_rewarded_video(id);
	}
	
	public static function hasRewardedVideo(id:String):Bool {
		return has_rewarded_video(id);
	}
	
	public static function closeImpression():Void {
		close_impression();
	}
	
	public static function isAnyViewVisible():Bool {
		return is_any_view_visible();
	}
	
	public static function setCustomId(id:String):Void {
		set_custom_id(id);
	}
	
	public static function getCustomId():String {
		return get_custom_id();
	}
	
	public static function setShouldRequestInterstitialsInFirstSession(shouldRequest:Bool):Void {
		set_should_request_interstitials_in_first_session(shouldRequest);
	}
	
	public static function setShouldDisplayLoadingViewForMoreApps(shouldDisplay:Bool):Void {
		set_should_display_loading_view_for_more_apps(shouldDisplay);
	}
	
	public static function setShouldPrefetchVideoContent(shouldPrefetch:Bool):Void {
		set_should_prefetch_video_content(shouldPrefetch);
	}
	
	public static function getSDKVersion():String {
		return get_sdk_version();
	}
	
	public static function setShouldHideSystemUI(shouldHide:Bool):Void {
		set_should_hide_system_ui(shouldHide);
	}
	
	private static function initBindings() {		
		#if ios
		if (init_chartboost == null) {
			init_chartboost = Lib.load(ndllName, "init_chartboost", 2);
		}
		#end
		
		initBinding(set_listener, "setListener", "(Lorg/haxe/lime/HaxeObject;)V", "set_listener", 1);
		initBinding(show_interstitial, "showInterstitial", "(Ljava/lang/String;)V", "show_interstitial", 1);
		initBinding(cache_interstitial, "cacheInterstitial", "(Ljava/lang/String;)V", "cache_interstitial", 1);
		initBinding(has_interstitial, "hasInterstitial", "(Ljava/lang/String;)Z", "has_interstitial", 1);
		initBinding(show_more_apps, "showMoreApps", "(Ljava/lang/String;)V", "show_more_apps", 1);
		initBinding(cache_more_apps, "cacheMoreApps", "(Ljava/lang/String;)V", "cache_more_apps", 1);
		initBinding(has_more_apps, "hasMoreApps", "(Ljava/lang/String;)Z", "has_more_apps", 1);
		initBinding(show_rewarded_video,  "showRewardedVideo", "(Ljava/lang/String;)V", "show_rewarded_video", 1);
		initBinding(cache_rewarded_video, "cacheRewardedVideo", "(Ljava/lang/String;)V", "cache_rewarded_video", 1);
		initBinding(has_rewarded_video, "hasRewardedVideo", "(Ljava/lang/String;)Z", "has_rewarded_video", 1);
		initBinding(close_impression, "closeImpression", "()V", "close_impression", 0);
		initBinding(is_any_view_visible, "isAnyViewVisible", "()Z", "is_any_view_visible", 0);
		initBinding(set_custom_id, "setCustomId", "(Ljava/lang/String;)V", "set_custom_id", 1);
		initBinding(get_custom_id, "getCustomId", "()Ljava/lang/String;", "get_custom_id", 0);
		initBinding(set_should_request_interstitials_in_first_session, "setShouldRequestInterstitialsInFirstSession", "(Z)V", "set_should_request_interstitials_in_first_session", 1);
		initBinding(set_should_display_loading_view_for_more_apps, "setShouldDisplayLoadingViewForMoreApps", "(Z)V", "set_should_display_loading_view_for_more_apps", 1);
		initBinding(set_should_prefetch_video_content, "setShouldPrefetchVideoContent", "(Z)V", "set_should_prefetch_video_content", 1);
		initBinding(get_sdk_version, "getSDKVersion", "()Ljava/lang/String;", "get_sdk_version", 0);
		initBinding(set_should_hide_system_ui, "setShouldHideSystemUI", "(Z)V", "set_status_bar_behavior", 1);
	}
	
	private static inline function initBinding(binding:Dynamic, jniMethod:String, jniSignature:String, ndllMethod:String, argCount:Int):Void {
		if (binding != null) {
			trace("Attempted to initialize a non-null binding. Are you initializing the ads SDK more than once?");
			return;
		}
		#if android
		binding = JNI.createStaticMethod(packageName, jniMethod, jniSignature);
		#end
		#if ios
		binding = Lib.load(ndllName, ndllMethod, argCount);
		#end
		
		#if debug
		if (binding == null) {
			while (true) {
				trace("Fail");
			}
			throw "Failed to bind method: " + jniMethod + ", " + jniSignature + ", " + ndllMethod + " (" + Std.string(argCount) + ").";
		}
		#end
	}
	
	#if android
	private static inline var packageName:String = "com/samcodes/chartboost/ChartboostExtension";
	#end
	#if ios
	private static inline var ndllName:String = "samcodeschartboost";
	#end
	
	#if ios
	private static var init_chartboost:Dynamic = null;
	#end
	private static var set_listener:Dynamic = null;
	private static var show_interstitial:Dynamic = null;
	private static var cache_interstitial:Dynamic = null;
	private static var has_interstitial:Dynamic = null;
	private static var show_more_apps:Dynamic = null;
	private static var cache_more_apps:Dynamic = null;
	private static var has_more_apps:Dynamic = null;
	private static var show_rewarded_video:Dynamic = null;
	private static var cache_rewarded_video:Dynamic = null;
	private static var has_rewarded_video:Dynamic = null;
	private static var close_impression:Dynamic = null;
	private static var is_any_view_visible:Dynamic = null;
	private static var set_custom_id:Dynamic = null;
	private static var get_custom_id:Dynamic = null;
	private static var set_should_request_interstitials_in_first_session:Dynamic = null;
	private static var set_should_display_loading_view_for_more_apps:Dynamic = null;
	private static var set_should_prefetch_video_content:Dynamic = null;
	private static var get_sdk_version:Dynamic = null;
	private static var set_should_hide_system_ui:Dynamic = null;
}
#end