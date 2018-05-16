#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>
#include <ctype.h>
#include <objc/runtime.h>

#import "Chartboost.h"
#include "SamcodesChartboost.h"

extern "C" void sendChartboostEvent(const char* type, const char* location, const char* uri, int reward_coins, int error, bool status);

void queueChartboostEvent(const char* type, const char* location, const char* uri, int reward_coins, int error, bool status)
{
	[[NSOperationQueue mainQueue] addOperationWithBlock:^ {
		sendChartboostEvent(type, location, uri, reward_coins, error, status);
	}];
}

@interface MyChartboostDelegate : NSObject<ChartboostDelegate>
@end

@implementation MyChartboostDelegate

// Called before requesting an interstitial via the Chartboost API server.
- (BOOL)shouldRequestInterstitial:(CBLocation)location
{
	queueChartboostEvent("shouldRequestInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);

	return YES;
}

// Called before an interstitial will be displayed on the screen.
- (BOOL)shouldDisplayInterstitial:(CBLocation)location
{
	queueChartboostEvent("shouldDisplayInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);

	return YES;
}

// Called after an interstitial has been displayed on the screen.
- (void)didDisplayInterstitial:(CBLocation)location
{
	queueChartboostEvent("didDisplayInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);
}

// Called after an interstitial has been loaded from the Chartboost API
// servers and cached locally.
- (void)didCacheInterstitial:(CBLocation)location
{
	queueChartboostEvent("didCacheInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);
}

// Called after an interstitial has attempted to load from the Chartboost API
// servers but failed.
 - (void)didFailToLoadInterstitial:(CBLocation)location withError:(CBLoadError)error
 {
	 queueChartboostEvent("didFailToLoadInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, error, false);
 }

// Called after a click is registered, but the user is not forwarded to the App Store.
- (void)didFailToRecordClick:(CBLocation)location withError:(CBClickError)error
{
	queueChartboostEvent("didFailToRecordClick", "", "", 0, error, false);
}

// Called after an interstitial has been dismissed.
- (void)didDismissInterstitial:(CBLocation)location
{
	queueChartboostEvent("didDismissInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);
}

// Called after an interstitial has been closed.
- (void)didCloseInterstitial:(CBLocation)location
{
	queueChartboostEvent("didCloseInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);
}

// Called after an interstitial has been clicked.
- (void)didClickInterstitial:(CBLocation)location
{
	queueChartboostEvent("didClickInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);
}

// Called after the SDK has been successfully initialized.
- (void)didInitialize:(BOOL)status
{
	queueChartboostEvent("didInitialize", "", "", 0, -1, status);
}

// Called before a rewarded video will be displayed on the screen.
- (BOOL)shouldDisplayRewardedVideo:(CBLocation)location
{
	queueChartboostEvent("shouldDisplayRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);

	return YES;
}

// Called after a rewarded video has been displayed on the screen.
- (void)didDisplayRewardedVideo:(CBLocation)location
{
	queueChartboostEvent("didDisplayRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);
}

// Called after a rewarded video has been loaded from the Chartboost API
// servers and cached locally.
- (void)didCacheRewardedVideo:(CBLocation)location
{
	queueChartboostEvent("didCacheRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);
}

// Called after a rewarded video has attempted to load from the Chartboost API
// servers but failed.
- (void)didFailToLoadRewardedVideo:(CBLocation)location withError:(CBLoadError)error
{
	queueChartboostEvent("didFailToLoadRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, error, false);
}

// Called after a rewarded video has been dismissed.
- (void)didDismissRewardedVideo:(CBLocation)location
{
	queueChartboostEvent("didDismissRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);
}

// Called after a rewarded video has been closed.
- (void)didCloseRewardedVideo:(CBLocation)location
{
	queueChartboostEvent("didCloseRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);
}

// Called after a rewarded video has been clicked.
- (void)didClickRewardedVideo:(CBLocation)location
{
	queueChartboostEvent("didClickRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);
}

// Called after a rewarded video has been viewed completely and user is eligible for reward.
- (void)didCompleteRewardedVideo:(CBLocation)location withReward:(int)reward
{
	queueChartboostEvent("didCompleteRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", reward, -1, false);
}

// Implement to be notified of when a video will be displayed on the screen for
// a given CBLocation. You can then do things like mute effects and sounds.
- (void)willDisplayVideo:(CBLocation)location
{
	queueChartboostEvent("willDisplayVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0, -1, false);
}

@end

namespace samcodeschartboost
{
	void initChartboost()
	{
		static dispatch_once_t once;
		dispatch_once(&once, ^ {
			MyChartboostDelegate *myObject = [MyChartboostDelegate new];

			NSString *nsAppId = [[NSString alloc] initWithUTF8String:ChartboostAppId];
			NSString *nsSignature = [[NSString alloc] initWithUTF8String:ChartboostAppSignature];

			[Chartboost startWithAppId:nsAppId
						  appSignature:nsSignature
							  delegate:myObject];
		});
	}
	
	void showInterstitial(const char* location)
	{
		initChartboost();
		
		NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
		[Chartboost showInterstitial:nsLocation];
	}

	void cacheInterstitial(const char* location)
	{
		initChartboost();
		
		NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
		[Chartboost cacheInterstitial:nsLocation];
	}
	
	bool hasInterstitial(const char* location)
	{
		initChartboost();
		
		NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
		return [Chartboost hasInterstitial:nsLocation];
	}
	
	void showRewardedVideo(const char* location)
	{
		initChartboost();
		
		NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
		[Chartboost showRewardedVideo:nsLocation];
	}

	void cacheRewardedVideo(const char* location)
	{
		initChartboost();
		
		NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
		[Chartboost cacheRewardedVideo:nsLocation];
	}
	
	bool hasRewardedVideo(const char* location)
	{
		initChartboost();
		
		NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
		return [Chartboost hasRewardedVideo:nsLocation];
	}
	
	bool isAnyViewVisible()
	{
		initChartboost();
		
		return [Chartboost isAnyViewVisible];
	}
	
	void setCustomId(const char* id)
	{
		initChartboost();
		
		NSString *nsId = [[NSString alloc] initWithUTF8String:id];
		[Chartboost setCustomId:nsId];
	}
	
	const char* getCustomId()
	{
		initChartboost();
		
		NSString *nsId = [Chartboost getCustomId];
		return [nsId UTF8String];
	}
	
	void setShouldRequestInterstitialsInFirstSession(bool shouldRequest)
	{
		initChartboost();
		
		[Chartboost setShouldRequestInterstitialsInFirstSession:shouldRequest];
	}
	
	bool getAutoCacheAds()
	{
		initChartboost();
		
		return [Chartboost getAutoCacheAds];
	}
	
	void setAutoCacheAds(bool autoCache)
	{
		initChartboost();
		
		[Chartboost setAutoCacheAds:autoCache];
	}
	
	void setShouldPrefetchVideoContent(bool shouldPrefetch)
	{
		initChartboost();
		
		[Chartboost setShouldPrefetchVideoContent:shouldPrefetch];
	}
	
	const char* getSDKVersion()
	{
		initChartboost();
		
		NSString *nsVersion = [Chartboost getSDKVersion];
		return [nsVersion UTF8String];
	}
	
	void setStatusBarBehavior(bool shouldHide)
	{
		initChartboost();
		
		if(shouldHide) {
			[Chartboost setStatusBarBehavior:CBStatusBarBehaviorIgnore];
		} else {
			[Chartboost setStatusBarBehavior:CBStatusBarBehaviorRespect];
		}
	}
	
	void setMuted(bool mute)
	{
		initChartboost();
		
		[Chartboost setMuted:muted];
	}
	
	void restrictDataCollection(bool shouldRestrict)
	{
		initChartboost();
		
		[Chartboost setRestrictDataCollection:shouldRestrict];
	}
}