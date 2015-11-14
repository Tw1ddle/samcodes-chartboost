package extension.chartboost;

// Helpers for getting names of errors
// Note the arrays need updating whenever the Chartboost SDK is updated/changes or adds new errors, so there's no guarantee that these are correct.
class ChartboostError {
	#if ios
	private static var orderedLoadingErrorDescriptions:Array<String> = [
		"INTERNAL",
		"INTERNET_UNAVAILABLE",
		"TOO_MANY_CONNECTIONS",
		"WRONG_ORIENTATION",
		"FIRST_SESSION_INTERSTITIALS_DISABLED",
		"NETWORK_FAILURE",
		"NO_AD_FOUND",
		"SESSION_NOT_STARTED",
		"USER_CANCELLATION",
		"NO_LOCATION_FOUND",
		"PREFETCHING_INCOMPLETE",
		"IMPRESSION_ALREADY_VISIBLE"
	];
	
	private static var orderedClickErrorDescriptions:Array<String> = [
		"URI_INVALID",
		"URI_UNRECOGNIZED",
		"AGE_GATE_FAILURE",
		"INTERNAL"
	];
	#end

	#if android
	private static var orderedLoadingErrorDescriptions:Array<String> = [
		"INTERNAL",
		"INTERNET_UNAVAILABLE",
		"TOO_MANY_CONNECTIONS",
		"WRONG_ORIENTATION",
		"FIRST_SESSION_INTERSTITIALS_DISABLED",
		"NETWORK_FAILURE",
		"NO_AD_FOUND",
		"SESSION_NOT_STARTED",
		"IMPRESSION_ALREADY_VISIBLE",
		"MY_HOST_ACTIVITY",
		"USER_CANCELLATION",
		"INVALID_LOCATION",
		"VIDEO_UNAVAILABLE",
		"VIDEO_ID_MISSING",
		"ERROR_PLAYING_VIDEO",
		"INVALID_RESPONSE",
		"ASSETS_DOWNLOAD_FAILURE",
		"ERROR_CREATING_VIEW",
		"ERROR_DISPLAYING_VIEW"
	];
	
	private static var orderedClickErrorDescriptions:Array<String> = [
		"URI_INVALID",
		"URI_UNRECOGNIZED",
		"AGE_GATE_FAILURE",
		"NO_HOST_ACTIVITY",
		"INTERNAL"
	];
	#end
	
	public static function descriptionForLoadingError(id:Int):String {
		if (id < 0 || id >= orderedLoadingErrorDescriptions.length) {
			return "UNKNOWN CHARTBOOST AD LOADING ERROR";
		}
		return orderedLoadingErrorDescriptions[id];
	}
	
	public static function descriptionForClickError(id:Int):String {
		if (id < 0 || id >= orderedClickErrorDescriptions.length) {
			return "UNKNOWN CHARTBOOST CLICK ERROR";
		}
		return orderedClickErrorDescriptions[id];
	}
}