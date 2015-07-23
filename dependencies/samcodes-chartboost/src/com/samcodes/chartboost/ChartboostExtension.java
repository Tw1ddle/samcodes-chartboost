package com.samcodes.chartboost;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import com.chartboost.sdk.*;
import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;
import com.chartboost.sdk.Model.CBError.CBClickError;
import com.chartboost.sdk.Model.CBError.CBImpressionError;
import com.chartboost.sdk.CBLocation;

public class ChartboostExtension extends Extension 
{
	private static String appId = "::ENV_ChartboostAppId::"; 
	private static String appSignature = "::ENV_ChartboostAppSignature::";
	private static String TAG = "ChartboostExtension";
	
	public static HaxeObject callback = null;
	public static void setListener(HaxeObject haxeCallback) {
		Log.i(TAG, "Setting Haxe Chartboost delegate object");
		callback = haxeCallback;
	}
	
	private class AChartboostDelegate extends ChartboostDelegate {
		public void callHaxe(final String name, final Object[] args) {
			if(callback != null) {
				callbackHandler.post(new Runnable() {
					public void run() {
						Log.d(TAG, "Calling " + name + " from java");
						callback.call(name, args);
					}
				});
			} else {
				Log.w(TAG, "Chartboost callback object is null, ignored a Chartboost callback");
			}
		}
		
		@Override
		public boolean shouldRequestInterstitial(String location) {
			Log.i(TAG, "SHOULD REQUEST INTERSTITIAL " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("shouldRequestInterstitial", new Object[] {location});
			}			
			
			return true;
		}

		@Override
		public boolean shouldDisplayInterstitial(String location) {
			Log.i(TAG, "SHOULD DISPLAY INTERSTITIAL " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("shouldDisplayInterstitial", new Object[] {location});
			}
			
			return true;
		}

		@Override
		public void didCacheInterstitial(String location) {
			Log.i(TAG, "DID CACHE INTERSTITIAL " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didCacheInterstitial", new Object[] {location});
			}
		}

		@Override
		public void didFailToLoadInterstitial(String location, CBImpressionError error) {
			Log.i(TAG, "DID FAIL TO LOAD INTERSTITIAL " + (location != null ? location : "null") + " Error: " + error.name());
			
			if(location != null) {
				callHaxe("didFailToLoadInterstitial", new Object[] {location});
			}
		}

		@Override
		public void didDismissInterstitial(String location) {
			Log.i(TAG, "DID DISMISS INTERSTITIAL: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didDismissInterstitial", new Object[] {location});
			}
		}

		@Override
		public void didCloseInterstitial(String location) {
			Log.i(TAG, "DID CLOSE INTERSTITIAL: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didCloseInterstitial", new Object[] {location});
			}
		}

		@Override
		public void didClickInterstitial(String location) {
			Log.i(TAG, "DID CLICK INTERSTITIAL: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didClickInterstitial", new Object[] {location});
			}
		}

		@Override
		public void didDisplayInterstitial(String location) {
			Log.i(TAG, "DID DISPLAY INTERSTITIAL: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didDisplayInterstitial", new Object[] {location});
			}
		}

		@Override
		public boolean shouldRequestMoreApps(String location) {
			Log.i(TAG, "SHOULD REQUEST MORE APPS: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("shouldRequestMoreApps", new Object[] {location});
			}
			
			return true;
		}

		@Override
		public boolean shouldDisplayMoreApps(String location) {
			Log.i(TAG, "SHOULD DISPLAY MORE APPS: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("shouldDisplayMoreApps", new Object[] {location});
			}
			
			return true;
		}

		@Override
		public void didFailToLoadMoreApps(String location, CBImpressionError error) {
			Log.i(TAG, "DID FAIL TO LOAD MOREAPPS: " + (location != null ? location : "null") + " Error: " + error.name());
			
			if(location != null) {
				callHaxe("didFailToLoadMoreApps", new Object[] {location});
			}
		}

		@Override
		public void didCacheMoreApps(String location) {
			Log.i(TAG, "DID CACHE MORE APPS: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didCacheMoreApps", new Object[] {location});
			}
		}

		@Override
		public void didDismissMoreApps(String location) {
			Log.i(TAG, "DID DISMISS MORE APPS " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didDismissMoreApps", new Object[] {location});
			}
		}

		@Override
		public void didCloseMoreApps(String location) {
			Log.i(TAG, "DID CLOSE MORE APPS: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didCloseMoreApps", new Object[] {location});
			}
		}

		@Override
		public void didClickMoreApps(String location) {
			Log.i(TAG, "DID CLICK MORE APPS: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didClickMoreApps", new Object[] {location});
			}
		}

		@Override
		public void didDisplayMoreApps(String location) {
			Log.i(TAG, "DID DISPLAY MORE APPS: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didDisplayMoreApps", new Object[] {location});
			}
		}

		@Override
		public void didFailToRecordClick(String uri, CBClickError error) {
			Log.i(TAG, "DID FAILED TO RECORD CLICK " + (uri != null ? uri : "null") + ", error: " + error.name());
			
			if(uri != null) {
				callHaxe("didFailToRecordClick", new Object[] {uri});
			}
		}

		@Override
		public boolean shouldDisplayRewardedVideo(String location) {
			Log.i(TAG, "SHOULD DISPLAY REWARDED VIDEO: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("shouldDisplayRewardedVideo", new Object[] {location});
			}
			
			return true;
		}

		@Override
		public void didCacheRewardedVideo(String location) {
			Log.i(TAG, "DID CACHE REWARDED VIDEO: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didCacheRewardedVideo", new Object[] {location});
			}
		}

		@Override
		public void didFailToLoadRewardedVideo(String location, CBImpressionError error) {
			Log.i(TAG, "DID FAIL TO LOAD REWARDED VIDEO: " + (location != null ? location : "null") + " Error: " + error.name());
			
			if(location != null) {
				callHaxe("didFailToLoadRewardedVideo", new Object[] {location});
			}
		}

		@Override
		public void didDismissRewardedVideo(String location) {
			Log.i(TAG, "DID DISMISS REWARDED VIDEO: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didDismissRewardedVideo", new Object[] {location});
			}
		}

		@Override
		public void didCloseRewardedVideo(String location) {
			Log.i(TAG, "DID CLOSE REWARDED VIDEO: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didCloseRewardedVideo", new Object[] {location});
			}
		}

		@Override
		public void didClickRewardedVideo(String location) {
			Log.i(TAG, "DID CLICK REWARDED VIDEO: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didClickRewardedVideo", new Object[] {location});
			}
		}

		@Override
		public void didCompleteRewardedVideo(String location, int reward) {
			Log.i(TAG, "DID COMPLETE REWARDED VIDEO: " + (location != null ? location : "null") + " FOR REWARD: " + reward);
			
			if(location != null) {
				callHaxe("didCompleteRewardedVideo", new Object[] {location, reward});
			}
		}
		
		@Override
		public void didDisplayRewardedVideo(String location) {
			Log.i(TAG, "DID DISPLAY REWARDED VIDEO: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("didDisplayRewardedVideo", new Object[] {location});
			}
		}

		@Override
		public void willDisplayVideo(String location) {
			Log.i(TAG, "WILL DISPLAY VIDEO: " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("willDisplayVideo", new Object[] {location});
			}
		}
	};
	private ChartboostDelegate delegate = new AChartboostDelegate();
	
	@Override
	public void onCreate (Bundle savedInstanceState) {
		if(ChartboostExtension.appId == "null" || ChartboostExtension.appSignature == "null") {
			Log.e(TAG, "CHARTBOOST APP ID AND/OR APP SIGNATURE HAVE NOT BEEN SET.");
			Log.e(TAG, "Refer to the Chartboost SDK documentation");
			Log.e(TAG, "Set the id and signature in your Project.xml file: <setenv name='ChartboostAppId' value='your app id' /> <setenv name='ChartboostAppSignature' name='your app signature' /> ");
			return;
		}
		
		Log.i(TAG, "STARTING CHARTBOOST WITH APP ID: " + ChartboostExtension.appId + " AND APP SIGNATURE " + ChartboostExtension.appSignature);
		Chartboost.startWithAppId(Extension.mainActivity, ChartboostExtension.appId, ChartboostExtension.appSignature);
		Chartboost.setDelegate(delegate);
	}
	
	@Override
	public void onStart() {
		super.onStart();
		Chartboost.onStart(Extension.mainActivity);
	}

	@Override
	public void onResume() {
		super.onResume();
		Chartboost.onResume(Extension.mainActivity);
	}
	
	@Override
	public void onPause() {
		super.onPause();
		Chartboost.onPause(Extension.mainActivity);
	}
	
	@Override
	public void onStop() {
		super.onStop();
		Chartboost.onStop(Extension.mainActivity);
	}
	
	@Override
	public void onDestroy() {
		super.onDestroy();
		Chartboost.onDestroy(Extension.mainActivity);
	}
	
	public static boolean hasCachedInterstitial(String id) {
		return Chartboost.hasInterstitial(id); 
	}

	public static void cacheInterstitial(String id) {
		Chartboost.cacheInterstitial(id);
	}
	
	public static void showInterstitial(String id) {
		Chartboost.showInterstitial(id); 
	}
	
	public static boolean hasCachedMoreApps(String id) {
		return Chartboost.hasMoreApps(id);
	}
	
	public static void cacheMoreApps(String id) {
		Chartboost.cacheMoreApps(id);
	}
	
	public static void showMoreApps(String id) {
		Chartboost.showMoreApps(id);
	}
	
	public static boolean hasCachedRewardedVideo(String id) {
		return Chartboost.hasRewardedVideo(id);
	}
	
	public static void cacheRewardedVideo(String id) {
		Chartboost.cacheRewardedVideo(id);
	}
	
	public static void showRewardedVideo(String id) {
		Chartboost.showRewardedVideo(id);
	}
	
	public static void closeImpression() {
		Chartboost.closeImpression();
	}
	
	public static boolean isAnyViewVisible() {
		return Chartboost.isAnyViewVisible();
	}
}