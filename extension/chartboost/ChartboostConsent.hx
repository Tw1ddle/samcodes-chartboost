package extension.chartboost;

/**
    Enum for whether the user has given their consent for usage of their personal data.
    Note this enum needs updating whenever the Chartboost SDK is updated/changes or adds new consent states, else there's no guarantee that the mapping here is correct.
**/
@:enum abstract ChartboostConsent(Int) from Int to Int
{
	/* Publisher hasn't implemented functionality or the user has the option to not answer. */
	var UNKNOWN = -1;
	/* User does not consent to targeting (Contextual ads). */
	var NO_BEHAVIORAL = 0;
	/* User consents (Behavioral and Contextual Ads). */
	var YES_BEHAVIORAL = 1;
	
	@:to public static function toString(pref:Int):String {
		return switch(pref) {
			case UNKNOWN: "unknown";
			case NO_BEHAVIORAL: "no_behavioral";
			case YES_BEHAVIORAL: "yes_behavioral";
		case _: {
			trace ("Tried to stringify invalid Chartboost consent status, will return 'unknown' instead");
			"unknown";
		}
		};
	}
}