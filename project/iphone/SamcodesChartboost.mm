#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <objc/runtime.h>
#import <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIKit.h>

#import "Chartboost.h"

#include "SamcodesChartboost.h"

extern "C" void sendChartboostEvent(const char* type, const char* location, const char* uri, int reward_coins, int error, bool status);

// Returns a deep copy of the given string as a UTF8 string
// Must be deallocated with free() when we're done with it
const char* deepCopyString(NSString* s)
{
    if(s == nil) {
        return strdup("");
    }
    const char* strUtf8Data = [s UTF8String];
    if(strUtf8Data == NULL) {
        return strdup("");
    }
    return strdup(strUtf8Data);
}

void dispatchEvent(NSString* type, NSString* location, NSString* uri, int reward_coins, int error, bool status)
{
    NSLog(@"Will dispatch Chartboost event: [%@]", type);
    
    const char* typeChars = deepCopyString(type);
    const char* locationChars = deepCopyString(location);
    const char* uriChars = deepCopyString(uri);

    void (^blockClosure)() = ^void() {
        sendChartboostEvent(typeChars, locationChars, uriChars, reward_coins, error, status);
        
        free((void*)(typeChars));
        free((void*)(locationChars));
        free((void*)(uriChars));
    };
    dispatch_async(dispatch_get_main_queue(), blockClosure);
}

@interface MyChartboostDelegate : NSObject<ChartboostDelegate>
@end

@implementation MyChartboostDelegate

// Called before requesting an interstitial via the Chartboost API server.
- (BOOL)shouldRequestInterstitial:(CBLocation)location
{
    dispatchEvent(@"shouldRequestInterstitial", location, @"", 0, -1, false);
    return YES;
}

// Called before an interstitial will be displayed on the screen.
- (BOOL)shouldDisplayInterstitial:(CBLocation)location
{
    dispatchEvent(@"shouldDisplayInterstitial", location, @"", 0, -1, false);
    return YES;
}

// Called after an interstitial has been displayed on the screen.
- (void)didDisplayInterstitial:(CBLocation)location
{
    dispatchEvent(@"didDisplayInterstitial", location, @"", 0, -1, false);
}

// Called after an interstitial has been loaded from the Chartboost API
// servers and cached locally.
- (void)didCacheInterstitial:(CBLocation)location
{
    dispatchEvent(@"didCacheInterstitial", location, @"", 0, -1, false);
}

// Called after an interstitial has attempted to load from the Chartboost API
// servers but failed.
- (void)didFailToLoadInterstitial:(CBLocation)location withError:(CBLoadError)error
{
    dispatchEvent(@"didFailToLoadInterstitial", location, @"", 0, error, false);
}

// Called after a click is registered, but the user is not forwarded to the App Store.
- (void)didFailToRecordClick:(CBLocation)location withError:(CBClickError)error
{
    dispatchEvent(@"didFailToRecordClick", @"", @"", 0, error, false);
}

// Called after an interstitial has been dismissed.
- (void)didDismissInterstitial:(CBLocation)location
{
    dispatchEvent(@"didDismissInterstitial", location, @"", 0, -1, false);
}

// Called after an interstitial has been closed.
- (void)didCloseInterstitial:(CBLocation)location
{
    dispatchEvent(@"didCloseInterstitial", location, @"", 0, -1, false);
}

// Called after an interstitial has been clicked.
- (void)didClickInterstitial:(CBLocation)location
{
    dispatchEvent(@"didClickInterstitial", location, @"", 0, -1, false);
}

// Called after the SDK has been successfully initialized.
- (void)didInitialize:(BOOL)status
{
    dispatchEvent(@"didInitialize", @"", @"", 0, -1, status);
}

// Called before a rewarded video will be displayed on the screen.
- (BOOL)shouldDisplayRewardedVideo:(CBLocation)location
{
    dispatchEvent(@"shouldDisplayRewardedVideo", location, @"", 0, -1, false);
    
    return YES;
}

// Called after a rewarded video has been displayed on the screen.
- (void)didDisplayRewardedVideo:(CBLocation)location
{
    dispatchEvent(@"didDisplayRewardedVideo", location, @"", 0, -1, false);
}

// Called after a rewarded video has been loaded from the Chartboost API
// servers and cached locally.
- (void)didCacheRewardedVideo:(CBLocation)location
{
    dispatchEvent(@"didCacheRewardedVideo", location, @"", 0, -1, false);
}

// Called after a rewarded video has attempted to load from the Chartboost API
// servers but failed.
- (void)didFailToLoadRewardedVideo:(CBLocation)location withError:(CBLoadError)error
{
    dispatchEvent(@"didFailToLoadRewardedVideo", location, @"", 0, error, false);
}

// Called after a rewarded video has been dismissed.
- (void)didDismissRewardedVideo:(CBLocation)location
{
    dispatchEvent(@"didDismissRewardedVideo", location, @"", 0, -1, false);
}

// Called after a rewarded video has been closed.
- (void)didCloseRewardedVideo:(CBLocation)location
{
    dispatchEvent(@"didCloseRewardedVideo", location, @"", 0, -1, false);
}

// Called after a rewarded video has been clicked.
- (void)didClickRewardedVideo:(CBLocation)location
{
    dispatchEvent(@"didClickRewardedVideo", location, @"", 0, -1, false);
}

// Called after a rewarded video has been viewed completely and user is eligible for reward.
- (void)didCompleteRewardedVideo:(CBLocation)location withReward:(int)reward
{
    dispatchEvent(@"didCompleteRewardedVideo", location, @"", reward, -1, false);
}

// Implement to be notified of when a video will be displayed on the screen for
// a given CBLocation. You can then do things like mute effects and sounds.
- (void)willDisplayVideo:(CBLocation)location
{
    dispatchEvent(@"willDisplayVideo", location, @"", 0, -1, false);
}

@end

namespace samcodeschartboost
{
    void initChartboost(const char* appId, const char* appSignature)
    {
        static dispatch_once_t once;
        dispatch_once(&once, ^ {
            MyChartboostDelegate *myObject = [MyChartboostDelegate new];
            
            NSString* nsAppId = [NSString stringWithUTF8String:appId];
            NSString* nsSignature = [NSString stringWithUTF8String:appSignature];
            
            [Chartboost startWithAppId:nsAppId
                          appSignature:nsSignature
                              delegate:myObject];
        });
    }
    
    void showInterstitial(const char* location)
    {
        NSString* nsLocation = [NSString stringWithUTF8String:location];
        [Chartboost showInterstitial:nsLocation];
    }
    
    void cacheInterstitial(const char* location)
    {
        NSString* nsLocation = [NSString stringWithUTF8String:location];
        [Chartboost cacheInterstitial:nsLocation];
    }
    
    bool hasInterstitial(const char* location)
    {
        NSString* nsLocation = [NSString stringWithUTF8String:location];
        return [Chartboost hasInterstitial:nsLocation];
    }
    
    void showRewardedVideo(const char* location)
    {
        NSString* nsLocation = [NSString stringWithUTF8String:location];
        [Chartboost showRewardedVideo:nsLocation];
    }
    
    void cacheRewardedVideo(const char* location)
    {
        NSString* nsLocation = [NSString stringWithUTF8String:location];
        [Chartboost cacheRewardedVideo:nsLocation];
    }
    
    bool hasRewardedVideo(const char* location)
    {
        NSString* nsLocation = [NSString stringWithUTF8String:location];
        return [Chartboost hasRewardedVideo:nsLocation];
    }
    
    bool isAnyViewVisible()
    {
        return [Chartboost isAnyViewVisible];
    }
    
    void setCustomId(const char* id)
    {
        NSString* nsId = [NSString stringWithUTF8String:id];
        [Chartboost setCustomId:nsId];
    }
    
    const char* getCustomId()
    {
        NSString* nsId = [Chartboost getCustomId];
        return [nsId UTF8String];
    }
    
    void setShouldRequestInterstitialsInFirstSession(bool shouldRequest)
    {
        [Chartboost setShouldRequestInterstitialsInFirstSession:shouldRequest];
    }
    
    bool getAutoCacheAds()
    {
        return [Chartboost getAutoCacheAds];
    }
    
    void setAutoCacheAds(bool autoCache)
    {
        [Chartboost setAutoCacheAds:autoCache];
    }
    
    void setShouldPrefetchVideoContent(bool shouldPrefetch)
    {
        [Chartboost setShouldPrefetchVideoContent:shouldPrefetch];
    }
    
    const char* getSDKVersion()
    {
        NSString* nsVersion = [Chartboost getSDKVersion];
        return [nsVersion UTF8String];
    }
    
    void setStatusBarBehavior(bool shouldHide)
    {
        if(shouldHide) {
            [Chartboost setStatusBarBehavior:CBStatusBarBehaviorIgnore];
        } else {
            [Chartboost setStatusBarBehavior:CBStatusBarBehaviorRespect];
        }
    }
    
    void setMuted(bool mute)
    {
        [Chartboost setMuted:mute];
    }
    
    void restrictDataCollection(bool shouldRestrict)
    {
        [Chartboost restrictDataCollection:shouldRestrict];
    }
    
    int getPIDataUseConsent()
    {
        CBPIDataUseConsent currentConsent = [Chartboost getPIDataUseConsent];
        return (int)(currentConsent);
    }
    
    void setPIDataUseConsent(int consent)
    {
        CBPIDataUseConsent consentEnum = (CBPIDataUseConsent)(consent);
        [Chartboost setPIDataUseConsent:consent];
    }
}
