package extension.chartboost;

#if android
import openfl.utils.JNI;
#end

#if ios
import flash.Lib;
#end

#if (android || ios)
@:allow(extension.Chartboost) class Chartboost
{
	public static function setListener(listener:ChartboostListener):Void {
		set_listener(listener);
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
	
	public static function init(?appId:String, ?appSignature:String):Void {
		#if ios
		if (appId == null || appSignature == null) {
			throw "Chartboost appId/appSignature not passed. On iOS appId and appSignature parameters must be passed in Chartboost.init.";
		}
		#end
		
		Chartboost.initBindings();
		
		#if ios
		init_chartboost(appId, appSignature);
		#end
	}
	
	private static function initBindings() {
		#if android
		var packageName:String = "com/samcodes/chartboost/ChartboostExtension";
		#end
		#if ios
		var namespaceName:String = "samcodes";
		#end
		
		#if ios
		if (init_chartboost == null) {
			init_chartboost = Lib.load(namespaceName, "init_chartboost", 2);
		}
		#end
		
		if (set_listener == null) {
			#if android
			set_listener = JNI.createStaticMethod(packageName, "setListener", "(Lorg/haxe/lime/HaxeObject;)V");
			#end
			#if ios
			set_listener = Lib.load(namespaceName, "setListener", 1);
			#end
		}
		if (show_interstitial == null) {
			#if android
			show_interstitial = JNI.createStaticMethod(packageName, "showInterstitial", "(Ljava/lang/String;)V");
			#end
			#if ios
			show_interstitial = Lib.load(namespaceName, "showInterstitial", 1);
			#end
		}
		if (cache_interstitial == null) {
			#if android
			cache_interstitial = JNI.createStaticMethod(packageName, "cacheInterstitial", "(Ljava/lang/String;)V");
			#end
			#if ios
			cache_interstitial = Lib.load(namespaceName, "cacheInterstitial", 1);
			#end
		}
		if (has_cached_interstitial == null) {
			#if android
			has_cached_interstitial = JNI.createStaticMethod(packageName, "hasCachedInterstitial", "(Ljava/lang/String;)Z");
			#end
			#if ios
			has_cached_interstitial = Lib.load(namespaceName, "hasCachedInterstitial", 1);
			#end
		}
		if (show_more_apps == null) {
			#if android
			show_more_apps = JNI.createStaticMethod(packageName, "showMoreApps", "(Ljava/lang/String;)V");
			#end
			#if ios
			show_more_apps = Lib.load(namespaceName, "showMoreApps", 1);
			#end
		}
		if (cache_more_apps == null) {
			#if android
			cache_more_apps = JNI.createStaticMethod(packageName, "cacheMoreApps", "(Ljava/lang/String;)V");
			#end
			#if ios
			cache_more_apps = Lib.load(namespaceName, "cacheMoreApps", 1);
			#end
		}
		if (has_cached_more_apps == null) {
			#if android
			has_cached_more_apps = JNI.createStaticMethod(packageName, "hasCachedMoreApps", "(Ljava/lang/String;)Z");
			#end
			#if ios
			has_cached_more_apps = Lib.load(namespaceName, "hasCachedMoreApps", 1);
			#end
		}
		if (show_rewarded_video == null) {
			#if android
			show_rewarded_video = JNI.createStaticMethod(packageName, "showRewardedVideo", "(Ljava/lang/String;)V");
			#end
			#if ios
			show_rewarded_video = Lib.load(namespaceName, "showRewardedVideo", 1);
			#end
		}
		if (cache_rewarded_video == null) {
			#if android
			cache_rewarded_video = JNI.createStaticMethod(packageName, "cacheRewardedVideo", "(Ljava/lang/String;)V");
			#end
			#if ios
			cache_rewarded_video = Lib.load(namespaceName, "cacheRewardedVideo", 1);
			#end
		}
		if (has_cached_rewarded_video == null) {
			#if android
			has_cached_rewarded_video = JNI.createStaticMethod(packageName, "hasCachedRewardedVideo", "(Ljava/lang/String;)Z");
			#end
			#if ios
			has_cached_rewarded_video = Lib.load(namespaceName, "hasCachedRewardedVideo", 1);
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
}
#end