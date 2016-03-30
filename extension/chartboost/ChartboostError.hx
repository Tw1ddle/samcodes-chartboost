package extension.chartboost;

// Helpers for getting names of errors
// Note the methods need updating whenever the Chartboost SDK is updated/changes or adds new errors, else there's no guarantee that the mappings to the enums are correct.
class ChartboostError {
	#if ios	
	private static function getLoadingErrorDescription(id:Int):String {
		return switch(id) {
			case 0:
				"INTERNAL";
			case 1:
				"INTERNET_UNAVAILABLE";
			case 2:
				"TOO_MANY_CONNECTIONS";
			case 3:
				"WRONG_ORIENTATION";
			case 4:
				"FIRST_SESSION_INTERSTITIALS_DISABLED";
			case 5:
				"NETWORK_FAILURE";
			case 6:
				"NO_AD_FOUND";
			case 7:
				"SESSION_NOT_STARTED";
			case 8:
				"IMPRESSION_ALREADY_VISIBLE";
			case 10:
				"USER_CANCELLATION";
			case 11:
				"NO_LOCATION_FOUND";
			case 16:
				"ASSET_DOWNLOAD_FAILURE";
			case 21:
				"PREFETCHING_INCOMPLETE";
			default:
				"UNKNOWN CHARTBOOST AD LOADING ERROR";
		};
	}
	
	private static function getClickErrorDescription(id:Int):String {
		if (id < 0 || id >= orderedLoadingErrorDescriptions.length) {
			return "UNKNOWN CHARTBOOST CLICK ERROR";
		}
		return orderedClickErrorDescriptions[i];
	}
	
	private static var orderedClickErrorDescriptions:Array<String> = [
		"URI_INVALID",
		"URI_UNRECOGNIZED",
		"AGE_GATE_FAILURE",
		"INTERNAL"
	];
	#end

	#if android
	private static function getLoadingErrorDescription(id:Int):String {
		if (id < 0 || id >= orderedLoadingErrorDescriptions.length) {
			return "UNKNOWN CHARTBOOST AD LOADING ERROR";
		}
		return orderedLoadingErrorDescriptions[i];
	}
	
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
	
	private static function getClickErrorDescription(id:Int):String {
		if (id < 0 || id >= orderedLoadingErrorDescriptions.length) {
			return "UNKNOWN CHARTBOOST CLICK ERROR";
		}
		return orderedClickErrorDescriptions[i];
	}
	
	private static var orderedClickErrorDescriptions:Array<String> = [
		"URI_INVALID",
		"URI_UNRECOGNIZED",
		"AGE_GATE_FAILURE",
		"NO_HOST_ACTIVITY",
		"INTERNAL"
	];
	#end
	
	public static function descriptionForLoadingError(id:Int):String {
		return getLoadingErrorDescription(id);
	}
	
	public static function descriptionForClickError(id:Int):String {
		return getClickErrorDescription(id);
	}
}