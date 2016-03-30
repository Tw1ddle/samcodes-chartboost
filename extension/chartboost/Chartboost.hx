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

	public static function hasCachedInterstitial(id:String):Bool {
		return has_cached_interstitial(id);
	}
	
	public static function showMoreApps(id:String):Void {
		show_more_apps(id);
	}
	
	public static function cacheMoreApps(id:String):Void {
		cache_more_apps(id);
	}
	
	public static function hasCachedMoreApps(id:String):Bool {
		return has_cached_more_apps(id);
	}
	
	public static function showRewardedVideo(id:String):Void {
		show_rewarded_video(id);
	}
	
	public static function cacheRewardedVideo(id:String):Void {
		cache_rewarded_video(id);
	}
	
	public static function hasCachedRewardedVideo(id:String):Bool {
		return has_cached_rewarded_video(id);
	}
	
	public static function closeImpression():Void {
		close_impression();
	}
	
	public static function isAnyViewVisible():Bool {
		return is_any_view_visible();
	}
	
	public static function setCustomID(id:String):Void {
		set_custom_id(id);
	}
	
	public static function getCustomID():String {
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
		#if android
		var packageName:String = "com/samcodes/chartboost/ChartboostExtension";
		#end
		#if ios
		var ndllName:String = "samcodeschartboost";
		#end
		
		#if ios
		if (init_chartboost == null) {
			init_chartboost = Lib.load(ndllName, "init_chartboost", 2);
		}
		#end
		
		if (set_listener == null) {
			#if android
			set_listener = JNI.createStaticMethod(packageName, "setListener", "(Lorg/haxe/lime/HaxeObject;)V");
			#end
			#if ios
			set_listener = Lib.load(ndllName, "set_listener", 1);
			#end
		}
		if (show_interstitial == null) {
			#if android
			show_interstitial = JNI.createStaticMethod(packageName, "showInterstitial", "(Ljava/lang/String;)V");
			#end
			#if ios
			show_interstitial = Lib.load(ndllName, "show_interstitial", 1);
			#end
		}
		if (cache_interstitial == null) {
			#if android
			cache_interstitial = JNI.createStaticMethod(packageName, "cacheInterstitial", "(Ljava/lang/String;)V");
			#end
			#if ios
			cache_interstitial = Lib.load(ndllName, "cache_interstitial", 1);
			#end
		}
		if (has_cached_interstitial == null) {
			#if android
			has_cached_interstitial = JNI.createStaticMethod(packageName, "hasCachedInterstitial", "(Ljava/lang/String;)Z");
			#end
			#if ios
			has_cached_interstitial = Lib.load(ndllName, "has_cached_interstitial", 1);
			#end
		}
		if (show_more_apps == null) {
			#if android
			show_more_apps = JNI.createStaticMethod(packageName, "showMoreApps", "(Ljava/lang/String;)V");
			#end
			#if ios
			show_more_apps = Lib.load(ndllName, "show_more_apps", 1);
			#end
		}
		if (cache_more_apps == null) {
			#if android
			cache_more_apps = JNI.createStaticMethod(packageName, "cacheMoreApps", "(Ljava/lang/String;)V");
			#end
			#if ios
			cache_more_apps = Lib.load(ndllName, "cache_more_apps", 1);
			#end
		}
		if (has_cached_more_apps == null) {
			#if android
			has_cached_more_apps = JNI.createStaticMethod(packageName, "hasCachedMoreApps", "(Ljava/lang/String;)Z");
			#end
			#if ios
			has_cached_more_apps = Lib.load(ndllName, "has_cached_more_apps", 1);
			#end
		}
		if (show_rewarded_video == null) {
			#if android
			show_rewarded_video = JNI.createStaticMethod(packageName, "showRewardedVideo", "(Ljava/lang/String;)V");
			#end
			#if ios
			show_rewarded_video = Lib.load(ndllName, "show_rewarded_video", 1);
			#end
		}
		if (cache_rewarded_video == null) {
			#if android
			cache_rewarded_video = JNI.createStaticMethod(packageName, "cacheRewardedVideo", "(Ljava/lang/String;)V");
			#end
			#if ios
			cache_rewarded_video = Lib.load(ndllName, "cache_rewarded_video", 1);
			#end
		}
		if (has_cached_rewarded_video == null) {
			#if android
			has_cached_rewarded_video = JNI.createStaticMethod(packageName, "hasCachedRewardedVideo", "(Ljava/lang/String;)Z");
			#end
			#if ios
			has_cached_rewarded_video = Lib.load(ndllName, "has_cached_rewarded_video", 1);
			#end
		}
		if (close_impression == null) {
			#if android
			close_impression = JNI.createStaticMethod(packageName, "closeImpression", "()V");
			#end
			#if ios
			close_impression = Lib.load(ndllName, "close_impression", 0);
			#end
		}
		if (is_any_view_visible == null) {
			#if android
			is_any_view_visible = JNI.createStaticMethod(packageName, "isAnyViewVisible", "()Z");
			#end
			#if ios
			is_any_view_visible = Lib.load(ndllName, "is_any_view_visible", 0);
			#end
		}
		if (set_custom_id == null) {
			#if android
			set_custom_id = JNI.createStaticMethod(packageName, "setCustomID", "(Ljava/lang/String;)V");
			#end
			#if ios
			set_custom_id = Lib.load(ndllName, "set_custom_id", 1);
			#end
		}
		if (get_custom_id == null) {
			#if android
			get_custom_id = JNI.createStaticMethod(packageName, "getCustomID", "()Ljava/lang/String;");
			#end
			#if ios
			get_custom_id = Lib.load(ndllName, "get_custom_id", 0);
			#end
		}
		if (set_should_request_interstitials_in_first_session == null) {
			#if android
			set_should_request_interstitials_in_first_session = JNI.createStaticMethod(packageName, "setShouldRequestInterstitialsInFirstSession", "(Z)V");
			#end
			#if ios
			set_should_request_interstitials_in_first_session = Lib.load(ndllName, "set_should_request_interstitials_in_first_session", 1);
			#end
		}
		if (set_should_display_loading_view_for_more_apps == null) {
			#if android
			set_should_display_loading_view_for_more_apps = JNI.createStaticMethod(packageName, "setShouldDisplayLoadingViewForMoreApps", "(Z)V");
			#end
			#if ios
			set_should_display_loading_view_for_more_apps = Lib.load(ndllName, "set_should_display_loading_view_for_more_apps", 1);
			#end
		}
		if (set_should_prefetch_video_content == null) {
			#if android
			set_should_prefetch_video_content = JNI.createStaticMethod(packageName, "setShouldPrefetchVideoContent", "(Z)V");
			#end
			#if ios
			set_should_prefetch_video_content = Lib.load(ndllName, "set_should_prefetch_video_content", 1);
			#end
		}
		if (get_sdk_version == null) {
			#if android
			get_sdk_version = JNI.createStaticMethod(packageName, "getSDKVersion", "()Ljava/lang/String;");
			#end
			#if ios
			get_sdk_version = Lib.load(ndllName, "get_sdk_version", 0);
			#end
		}
		if (set_should_hide_system_ui == null) {
			#if android
			set_should_hide_system_ui = JNI.createStaticMethod(packageName, "setShouldHideSystemUI", "(Z)V");
			#end
			#if ios
			set_should_hide_system_ui = Lib.load(ndllName, "set_status_bar_behavior", 1); // NOTE this approximates the Android behaviour (either ignore or respect the status bar area)
			#end
		}
	}
	
	#if ios
	private static var init_chartboost:Dynamic = null;
	#end
	private static var set_listener:Dynamic = null;
	private static var show_interstitial:Dynamic = null;
	private static var cache_interstitial:Dynamic = null;
	private static var has_cached_interstitial:Dynamic = null;
	private static var show_more_apps:Dynamic = null;
	private static var cache_more_apps:Dynamic = null;
	private static var has_cached_more_apps:Dynamic = null;
	private static var show_rewarded_video:Dynamic = null;
	private static var cache_rewarded_video:Dynamic = null;
	private static var has_cached_rewarded_video:Dynamic = null;
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