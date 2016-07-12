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
		
		set_listener = initBinding("setListener", "(Lorg/haxe/lime/HaxeObject;)V", "set_listener", 1);
		show_interstitial = initBinding("showInterstitial", "(Ljava/lang/String;)V", "show_interstitial", 1);
		cache_interstitial = initBinding("cacheInterstitial", "(Ljava/lang/String;)V", "cache_interstitial", 1);
		has_interstitial = initBinding("hasInterstitial", "(Ljava/lang/String;)Z", "has_interstitial", 1);
		show_more_apps = initBinding("showMoreApps", "(Ljava/lang/String;)V", "show_more_apps", 1);
		cache_more_apps = initBinding("cacheMoreApps", "(Ljava/lang/String;)V", "cache_more_apps", 1);
		has_more_apps = initBinding("hasMoreApps", "(Ljava/lang/String;)Z", "has_more_apps", 1);
		show_rewarded_video = initBinding("showRewardedVideo", "(Ljava/lang/String;)V", "show_rewarded_video", 1);
		cache_rewarded_video = initBinding("cacheRewardedVideo", "(Ljava/lang/String;)V", "cache_rewarded_video", 1);
		has_rewarded_video = initBinding("hasRewardedVideo", "(Ljava/lang/String;)Z", "has_rewarded_video", 1);
		close_impression = initBinding("closeImpression", "()V", "close_impression", 0);
		is_any_view_visible = initBinding("isAnyViewVisible", "()Z", "is_any_view_visible", 0);
		set_custom_id = initBinding("setCustomId", "(Ljava/lang/String;)V", "set_custom_id", 1);
		get_custom_id = initBinding("getCustomId", "()Ljava/lang/String;", "get_custom_id", 0);
		set_should_request_interstitials_in_first_session = initBinding("setShouldRequestInterstitialsInFirstSession", "(Z)V", "set_should_request_interstitials_in_first_session", 1);
		set_should_display_loading_view_for_more_apps = initBinding("setShouldDisplayLoadingViewForMoreApps", "(Z)V", "set_should_display_loading_view_for_more_apps", 1);
		set_should_prefetch_video_content = initBinding("setShouldPrefetchVideoContent", "(Z)V", "set_should_prefetch_video_content", 1);
		get_sdk_version = initBinding("getSDKVersion", "()Ljava/lang/String;", "get_sdk_version", 0);
		set_should_hide_system_ui = initBinding("setShouldHideSystemUI", "(Z)V", "set_status_bar_behavior", 1);
	}
	
	private static inline function initBinding(jniMethod:String, jniSignature:String, ndllMethod:String, argCount:Int):Dynamic {
		#if android
		var binding = JNI.createStaticMethod(packageName, jniMethod, jniSignature);
		#end
		
		#if ios
		var binding = Lib.load(ndllName, ndllName + "_" + ndllMethod, argCount);
		#end
		
		#if debug
		if (binding == null) {
			throw "Failed to bind method: " + jniMethod + ", " + jniSignature + ", " + ndllName + "_" + ndllMethod + " (" + Std.string(argCount) + ").";
		}
		#end
		
		return binding;
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