#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>
#include <ctype.h>
#include <objc/runtime.h>

#import "Chartboost.h"
#include "SamcodesChartboost.h"

extern "C" void sendChartboostEvent(const char* type, const char* location, const char* uri, int reward_coins);

void queueChartboostEvent(const char* type, const char* location, const char* uri, int reward_coins)
{
	[[NSOperationQueue mainQueue] addOperationWithBlock:^ {
		sendChartboostEvent(type, location, uri, reward_coins);
	}];
}

@interface MyChartboostDelegate : NSObject<ChartboostDelegate>
@end

@implementation MyChartboostDelegate

// Called before requesting an interstitial via the Chartboost API server.
- (BOOL)shouldRequestInterstitial:(CBLocation)location
{
	queueChartboostEvent("shouldRequestInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
    
    return YES;
}

// Called before an interstitial will be displayed on the screen.
- (BOOL)shouldDisplayInterstitial:(CBLocation)location
{
	queueChartboostEvent("shouldDisplayInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
    
    return YES;
}

// Called after an interstitial has been displayed on the screen.
- (void)didDisplayInterstitial:(CBLocation)location
{
	queueChartboostEvent("didDisplayInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after an interstitial has been loaded from the Chartboost API
// servers and cached locally.
- (void)didCacheInterstitial:(CBLocation)location
{
	queueChartboostEvent("didCacheInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after an interstitial has attempted to load from the Chartboost API
// servers but failed.
 - (void)didFailToLoadInterstitial:(CBLocation)location withError:(CBLoadError)error
 {
	 queueChartboostEvent("didFailToLoadInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
 }

// Called after a click is registered, but the user is not forwarded to the App Store.
- (void)didFailToRecordClick:(CBLocation)location withError:(CBClickError)error
{
	queueChartboostEvent("didFailToRecordClick", "", "", 0);
}

// Called after an interstitial has been dismissed.
- (void)didDismissInterstitial:(CBLocation)location
{
	queueChartboostEvent("didDismissInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after an interstitial has been closed.
- (void)didCloseInterstitial:(CBLocation)location
{
	queueChartboostEvent("didCloseInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after an interstitial has been clicked.
- (void)didClickInterstitial:(CBLocation)location
{
	queueChartboostEvent("didClickInterstitial", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called before a MoreApps page will be displayed on the screen.
- (BOOL)shouldDisplayMoreApps:(CBLocation)location
{
	queueChartboostEvent("shouldDisplayMoreApps", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
    
    return YES;
}

// Called after a MoreApps page has been displayed on the screen.
- (void)didDisplayMoreApps:(CBLocation)location
{
	queueChartboostEvent("didDisplayMoreApps", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after a MoreApps page has been loaded from the Chartboost API
// servers and cached locally.
- (void)didCacheMoreApps:(CBLocation)location
{
	queueChartboostEvent("didCacheMoreApps", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after a MoreApps page has been dismissed.
- (void)didDismissMoreApps:(CBLocation)location
{
	queueChartboostEvent("didDismissMoreApps", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after a MoreApps page has been closed.
- (void)didCloseMoreApps:(CBLocation)location
{
	queueChartboostEvent("didCloseMoreApps", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after a MoreApps page has been clicked.
- (void)didClickMoreApps:(CBLocation)location
{
	queueChartboostEvent("didClickMoreApps", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after a MoreApps page attempted to load from the Chartboost API
// servers but failed.
- (void)didFailToLoadMoreApps:(CBLocation)location withError:(CBLoadError)error
{
	queueChartboostEvent("didFailToLoadMoreApps", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after videos have been successfully prefetched
- (void)didPrefetchVideos
{
	sendChartboostEvent("didPrefetchVideos", "", "", 0);
}

// Called before a rewarded video will be displayed on the screen.
- (BOOL)shouldDisplayRewardedVideo:(CBLocation)location
{
	queueChartboostEvent("shouldDisplayRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
    
    return YES;
}

// Called after a rewarded video has been displayed on the screen.
- (void)didDisplayRewardedVideo:(CBLocation)location
{
	queueChartboostEvent("didDisplayRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after a rewarded video has been loaded from the Chartboost API
// servers and cached locally.
- (void)didCacheRewardedVideo:(CBLocation)location
{
	queueChartboostEvent("didCacheRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after a rewarded video has attempted to load from the Chartboost API
// servers but failed.
- (void)didFailToLoadRewardedVideo:(CBLocation)location withError:(CBLoadError)error
{
	queueChartboostEvent("didFailToLoadRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after a rewarded video has been dismissed.
- (void)didDismissRewardedVideo:(CBLocation)location
{
	queueChartboostEvent("didDismissRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after a rewarded video has been closed.
- (void)didCloseRewardedVideo:(CBLocation)location
{
	queueChartboostEvent("didCloseRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after a rewarded video has been clicked.
- (void)didClickRewardedVideo:(CBLocation)location
{
	queueChartboostEvent("didClickRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Called after a rewarded video has been viewed completely and user is eligible for reward.
- (void)didCompleteRewardedVideo:(CBLocation)location withReward:(int)reward
{
	queueChartboostEvent("didCompleteRewardedVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", reward);
}

// Implement to be notified of when a video will be displayed on the screen for 
// a given CBLocation. You can then do things like mute effects and sounds.
- (void)willDisplayVideo:(CBLocation)location
{
	queueChartboostEvent("willDisplayVideo", [location cStringUsingEncoding:[NSString defaultCStringEncoding]], "", 0);
}

// Whether Chartboost should show ads in the first session
// Defaults to YES
- (BOOL)shouldRequestInterstitialsInFirstSession
{
	return YES;
}

@end

namespace samcodeschartboost
{	
    void initChartboost(const char *appId, const char *appSignature)
    {
        MyChartboostDelegate *myObject = [MyChartboostDelegate new];
        
        NSString *nsAppId = [[NSString alloc] initWithUTF8String:appId];
        NSString *nsSignature = [[NSString alloc] initWithUTF8String:appSignature];
        
        [Chartboost startWithAppId:nsAppId
                      appSignature:nsSignature
                          delegate:myObject];
    }
	
	void showInterstitial(const char* location)
	{
        NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
        [Chartboost showInterstitial:nsLocation];
    }
	
    void cacheInterstitial(const char* location)
    {
        NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
        [Chartboost cacheInterstitial:nsLocation];
    }
	
    bool hasCachedInterstitial(const char* location)
    {
        NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
        return [Chartboost hasInterstitial:nsLocation];
    }
	
	void showMoreApps(const char* location)
	{
        NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
        [Chartboost showMoreApps:nsLocation];
	}
	
    void cacheMoreApps(const char* location)
	{
        NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
        [Chartboost cacheMoreApps:nsLocation];
	}
	
    bool hasCachedMoreApps(const char* location)
	{
        NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
        return [Chartboost hasMoreApps:nsLocation];
	}
	
	void showRewardedVideo(const char* location)
	{
        NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
        [Chartboost showRewardedVideo:nsLocation];
	}
	
    void cacheRewardedVideo(const char* location)
	{
        NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
        [Chartboost cacheRewardedVideo:nsLocation];
	}
	
    bool hasCachedRewardedVideo(const char* location)
	{
        NSString *nsLocation = [[NSString alloc] initWithUTF8String:location];
        return [Chartboost hasRewardedVideo:nsLocation];
	}
	
	void closeImpression()
	{
		[Chartboost closeImpression];
	}
	
	bool isAnyViewVisible()
	{
		return [Chartboost isAnyViewVisible];
	}
}