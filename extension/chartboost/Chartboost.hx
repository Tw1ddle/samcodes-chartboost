package extension.chartboost;

#if (android || ios)

#if ios
import cpp.Object;
#end

import lime.system.JNI;

@:allow(extension.Chartboost) class Chartboost {
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
	
	public static function showRewardedVideo(id:String):Void {
		show_rewarded_video(id);
	}
	
	public static function cacheRewardedVideo(id:String):Void {
		cache_rewarded_video(id);
	}
	
	public static function hasRewardedVideo(id:String):Bool {
		return has_rewarded_video(id);
	}
	
	#if android
	public static function closeImpression():Void {
		close_impression();
	}
	#end
	
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
	
	public static function getAutoCacheAds():Bool {
		return get_auto_cache_ads();
	}
	
	public static function setAutoCacheAds(autoCacheAds:Bool):Void {
		set_auto_cache_ads(autoCacheAds);
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
	
	#if ios
	public static function setMuted(mute:Bool):Void {
		set_muted(mute);
	}
	#end
	
	public static function restrictDataCollection(shouldRestrict:Bool):Void {
		restrict_data_collection(shouldRestrict);
	}
	
	#if android
	private static inline var packageName:String = "com/samcodes/chartboost/ChartboostExtension";
	private static inline function bindJNI(jniMethod:String, jniSignature:String) {
		return JNI.createStaticMethod(packageName, jniMethod, jniSignature);
	}
	
	private static var close_impression = bindJNI("closeImpression", "()V");
	
	private static var set_listener = bindJNI("setListener", "(Lorg/haxe/lime/HaxeObject;)V");
	private static var show_interstitial = bindJNI("showInterstitial", "(Ljava/lang/String;)V");
	private static var cache_interstitial = bindJNI("cacheInterstitial", "(Ljava/lang/String;)V");
	private static var has_interstitial = bindJNI("hasInterstitial", "(Ljava/lang/String;)Z");
	private static var show_rewarded_video = bindJNI("showRewardedVideo", "(Ljava/lang/String;)V");
	private static var cache_rewarded_video = bindJNI("cacheRewardedVideo", "(Ljava/lang/String;)V");
	private static var has_rewarded_video = bindJNI("hasRewardedVideo", "(Ljava/lang/String;)Z");
	private static var is_any_view_visible = bindJNI("isAnyViewVisible", "()Z");
	private static var set_custom_id = bindJNI("setCustomId", "(Ljava/lang/String;)V");
	private static var get_custom_id= bindJNI("getCustomId", "()Ljava/lang/String;");
	private static var set_should_request_interstitials_in_first_session = bindJNI("setShouldRequestInterstitialsInFirstSession", "(Z)V");
	private static var get_auto_cache_ads = bindJNI("getAutoCacheAds", "()Z");
	private static var set_auto_cache_ads = bindJNI("setAutoCacheAds", "(Z)V");
	private static var set_should_prefetch_video_content = bindJNI("setShouldPrefetchVideoContent", "(Z)V");
	private static var get_sdk_version = bindJNI("getSDKVersion", "()Ljava/lang/String;");
	private static var set_should_hide_system_ui = bindJNI("setShouldHideSystemUI", "(Z)V");
	private static var restrict_data_collection = bindJNI("restrictDataCollection", "(Z)V");
	#end
	
	#if ios
	private static var set_listener = PrimeLoader.load("set_listener", "ov");
	private static var show_interstitial = PrimeLoader.load("show_interstitial", "sv");
	private static var cache_interstitial = PrimeLoader.load("cache_interstitial", "sv");
	private static var has_interstitial = PrimeLoader.load("has_interstitial", "sb");
	private static var show_rewarded_video = PrimeLoader.load("show_rewarded_video", "sv");
	private static var cache_rewarded_video = PrimeLoader.load("cache_rewarded_video", "sv");
	private static var has_rewarded_video = PrimeLoader.load("has_rewarded_video", "sb");
	private static var is_any_view_visible = PrimeLoader.load("is_any_view_visible", "v");
	private static var set_custom_id = PrimeLoader.load("set_custom_id", "sv");
	private static var get_custom_id = PrimeLoader.load("get_custom_id", "s");
	private static var set_should_request_interstitials_in_first_session = PrimeLoader.load("set_should_request_interstitials_in_first_session", "bv");
	private static var get_auto_cache_ads = PrimeLoader.load("get_auto_cache_ads", "b");
	private static var set_auto_cache_ads = PrimeLoader.load("set_auto_cache_ads", "bv");
	private static var set_should_prefetch_video_content = PrimeLoader.load("set_should_prefetch_video_content", "bv");
	private static var get_sdk_version = PrimeLoader.load("get_sdk_version", "s");
	private static var set_should_hide_system_ui = PrimeLoader.load("set_status_bar_behavior", "bv");
	private static var set_muted = PrimeLoader.load("set_muted", "bv");
	private static var restrict_data_collection = PrimeLoader.load("restrict_data_collection", "bv");
	#end
}

#end