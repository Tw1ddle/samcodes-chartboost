package extension.chartboost;

#if (android || ios)

#if android
import lime.system.JNI;
#end

/**
   The Chartboost class provides bindings to the main functionality of the Chartboost ads SDK on iOS and Android
   See: https://github.com/Tw1ddle/samcodes-chartboost
**/
class Chartboost {
	public static function initChartboost(appId:String, appSignature:String):Void {
		init_chartboost(appId, appSignature);
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
	
	public static function getPIDataUseConsent():ChartboostConsent {
		return get_pi_data_use_consent();
	}
	
	public static function setPIDataUseConsent(consent:ChartboostConsent):Void {
		set_pi_data_use_consent(consent);
	}
	
	#if android
	private static inline var packageName:String = "com/samcodes/chartboost/ChartboostExtension";
	private static inline function bindJNI(jniMethod:String, jniSignature:String) {
		return JNI.createStaticMethod(packageName, jniMethod, jniSignature);
	}
	
	private static var close_impression = bindJNI("closeImpression", "()V");
	
	private static var init_chartboost = bindJNI("initChartboost", "(Ljava/lang/String;Ljava/lang/String;)V");
	
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
	private static var get_pi_data_use_consent = bindJNI("getPIDataUseConsent", "()I");
	private static var set_pi_data_use_consent = bindJNI("setPIDataUseConsent", "(I)V");
	#end
	
	#if ios
	private static var init_chartboost = PrimeLoader.load("samcodeschartboost_init_chartboost", "ssv");
	
	private static var set_listener = PrimeLoader.load("samcodeschartboost_set_listener", "ov");
	private static var show_interstitial = PrimeLoader.load("samcodeschartboost_show_interstitial", "sv");
	private static var cache_interstitial = PrimeLoader.load("samcodeschartboost_cache_interstitial", "sv");
	private static var has_interstitial = PrimeLoader.load("samcodeschartboost_has_interstitial", "sb");
	private static var show_rewarded_video = PrimeLoader.load("samcodeschartboost_show_rewarded_video", "sv");
	private static var cache_rewarded_video = PrimeLoader.load("samcodeschartboost_cache_rewarded_video", "sv");
	private static var has_rewarded_video = PrimeLoader.load("samcodeschartboost_has_rewarded_video", "sb");
	private static var is_any_view_visible = PrimeLoader.load("samcodeschartboost_is_any_view_visible", "b");
	private static var set_custom_id = PrimeLoader.load("samcodeschartboost_set_custom_id", "sv");
	private static var get_custom_id = PrimeLoader.load("samcodeschartboost_get_custom_id", "s");
	private static var set_should_request_interstitials_in_first_session = PrimeLoader.load("samcodeschartboost_set_should_request_interstitials_in_first_session", "bv");
	private static var get_auto_cache_ads = PrimeLoader.load("samcodeschartboost_get_auto_cache_ads", "b");
	private static var set_auto_cache_ads = PrimeLoader.load("samcodeschartboost_set_auto_cache_ads", "bv");
	private static var set_should_prefetch_video_content = PrimeLoader.load("samcodeschartboost_set_should_prefetch_video_content", "bv");
	private static var get_sdk_version = PrimeLoader.load("samcodeschartboost_get_sdk_version", "s");
	private static var set_should_hide_system_ui = PrimeLoader.load("samcodeschartboost_set_status_bar_behavior", "bv");
	private static var set_muted = PrimeLoader.load("samcodeschartboost_set_muted", "bv");
	private static var restrict_data_collection = PrimeLoader.load("samcodeschartboost_restrict_data_collection", "bv");
	private static var get_pi_data_use_consent = PrimeLoader.load("samcodeschartboost_get_pi_data_use_consent", "i");
	private static var set_pi_data_use_consent = PrimeLoader.load("samcodeschartboost_set_pi_data_use_consent", "iv");
	#end
}

#end