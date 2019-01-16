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
import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;
import com.chartboost.sdk.Chartboost;
import com.chartboost.sdk.ChartboostDelegate;
import com.chartboost.sdk.Chartboost.CBPIDataUseConsent;
import com.chartboost.sdk.Model.CBError.CBClickError;
import com.chartboost.sdk.Model.CBError.CBImpressionError;
import com.chartboost.sdk.CBLocation;

public class ChartboostExtension extends Extension
{
	private static String TAG = "ChartboostExtension";
	
	public static void initChartboost(String appId, String appSignature) {
		if(appId == null || appSignature == null) {
			Log.e(TAG, "CHARTBOOST APP ID AND/OR APP SIGNATURE HAVE NOT BEEN SET.");
			Log.e(TAG, "Refer to the Chartboost SDK documentation");
			Log.e(TAG, "Pass the id and signature into the initChartboost call from Haxe");
			return;
		}
		
		Log.i(TAG, "STARTING CHARTBOOST WITH APP ID: " + appId + " AND APP SIGNATURE " + appSignature);
		
		Chartboost.startWithAppId(Extension.mainActivity, appId, appSignature);
	}
	
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
		public void didInitialize() {
			Log.i(TAG, "DID INITIALIZE");
			
			// NOTE according to the 6.4.1 docs this method provides a boolean on iOS indicating status of initialization, so passing "true" for success here
			callHaxe("didInitialize", new Object[] {new Boolean(true)});
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
				callHaxe("didFailToLoadInterstitial", new Object[] {location, new Integer(error.ordinal())});
			}
		}

		@Override
		public void willDisplayInterstitial(String location) {
			Log.i(TAG, "WILL DISPLAY INTERSTITIAL " + (location != null ? location : "null"));
			
			if(location != null) {
				callHaxe("willDisplayInterstitial", new Object[] {location});
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
		public void didFailToRecordClick(String uri, CBClickError error) {
			Log.i(TAG, "DID FAILED TO RECORD CLICK " + (uri != null ? uri : "null") + ", error: " + error.ordinal());
			
			if(uri != null) {
				callHaxe("didFailToRecordClick", new Object[] {uri, new Integer(error.ordinal())});
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
				callHaxe("didFailToLoadRewardedVideo", new Object[] {location, new Integer(error.ordinal())});
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
		super.onCreate(savedInstanceState);
		
		Chartboost.setDelegate(delegate);
		Chartboost.onCreate(Extension.mainActivity);
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
	
	@Override
	public boolean onBackPressed() {
		// If an interstitial is onscreen, close it
		if(Chartboost.onBackPressed()) {
			return false;
		} else {
			return super.onBackPressed();
		}
	}
	
	public static boolean hasInterstitial(String id) {
		return Chartboost.hasInterstitial(id);
	}

	public static void cacheInterstitial(String id) {
		Chartboost.cacheInterstitial(id);
	}
	
	public static void showInterstitial(String id) {
		Chartboost.showInterstitial(id);
	}
	
	public static boolean hasRewardedVideo(String id) {
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
	
	public static void setCustomId(String id) {
		Chartboost.setCustomId(id);
	}
	
	public static String getCustomId() {
		return Chartboost.getCustomId();
	}
	
	public static void setShouldRequestInterstitialsInFirstSession(boolean shouldRequest) {
		Chartboost.setShouldRequestInterstitialsInFirstSession(shouldRequest);
	}
	
	public static boolean getAutoCacheAds() {
		return Chartboost.getAutoCacheAds();
	}
	
	public static void setAutoCacheAds(boolean autoCacheAds) {
		Chartboost.setAutoCacheAds(autoCacheAds);
	}
	
	public static void setShouldPrefetchVideoContent(boolean shouldPrefetch) {
		Chartboost.setShouldPrefetchVideoContent(shouldPrefetch);
	}
	
	public static String getSDKVersion() {
		return Chartboost.getSDKVersion();
	}
	
	public static void setShouldHideSystemUI(boolean shouldHide) {
		Chartboost.setShouldHideSystemUI(shouldHide);
	}
	
	public static void restrictDataCollection(boolean shouldRestrict) {
		Chartboost.restrictDataCollection(Extension.mainActivity, shouldRestrict);
	}
	
	public static void setPIDataUseConsent(int consent) {
		if(consent == -1) {
			Chartboost.setPIDataUseConsent(Extension.mainActivity, Chartboost.CBPIDataUseConsent.UNKNOWN);
		}
		if(consent == 0) {
			Chartboost.setPIDataUseConsent(Extension.mainActivity, Chartboost.CBPIDataUseConsent.NO_BEHAVIORAL);
		}
		if(consent == 1) {
			Chartboost.setPIDataUseConsent(Extension.mainActivity, Chartboost.CBPIDataUseConsent.YES_BEHAVIORAL);
		}
		
		Log.w(TAG, "FAILED TO SET PERSONAL DATA USE CONSENT STATE, DID YOU PASS A VALID VALUE?");
	}
	
	public static int getPIDataUseConsent() {
		return Chartboost.getPIDataUseConsent().getValue();
	}
}