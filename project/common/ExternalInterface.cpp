#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif

#include <hx/CFFI.h>
#include "SamcodesChartboost.h"

using namespace samcodeschartboost;

#ifdef IPHONE

AutoGCRoot* chartboostEventHandle = 0;

static value set_listener(value onEvent)
{
	chartboostEventHandle = new AutoGCRoot(onEvent);
	return alloc_null();
}
DEFINE_PRIM(set_listener, 1);

static value init_chartboost(value id, value signature)
{
    initChartboost(val_string(id), val_string(signature));
    return alloc_null();
}
DEFINE_PRIM(init_chartboost, 2);

static value show_interstitial(value location)
{
    showInterstitial(val_string(location));
    return alloc_null();
}
DEFINE_PRIM(show_interstitial, 1);

static value cache_interstitial(value location)
{
    cacheInterstitial(val_string(location));
    return alloc_null();
}
DEFINE_PRIM(cache_interstitial, 1);

static value has_interstitial(value location)
{
    return alloc_bool(hasInterstitial(val_string(location)));
}
DEFINE_PRIM(has_interstitial, 1);

static value show_more_apps(value location)
{
	showMoreApps(val_string(location));
	return alloc_null();
}
DEFINE_PRIM(show_more_apps, 1);

static value cache_more_apps(value location)
{
	cacheMoreApps(val_string(location));
	return alloc_null();
}
DEFINE_PRIM(cache_more_apps, 1);

static value has_more_apps(value location)
{
	return alloc_bool(hasMoreApps(val_string(location)));
}
DEFINE_PRIM(has_more_apps, 1);

static value show_rewarded_video(value location)
{
	showRewardedVideo(val_string(location));
	return alloc_null();
}
DEFINE_PRIM(show_rewarded_video, 1);

static value cache_rewarded_video(value location)
{
	cacheRewardedVideo(val_string(location));
	return alloc_null();
}
DEFINE_PRIM(cache_rewarded_video, 1);

static value has_rewarded_video(value location)
{
	return alloc_bool(hasRewardedVideo(val_string(location)));
}
DEFINE_PRIM(has_rewarded_video, 1);

static value close_impression()
{
	closeImpression();
	return alloc_null();
}
DEFINE_PRIM(close_impression, 0);

static value is_any_view_visible()
{
	return alloc_bool(isAnyViewVisible());
}
DEFINE_PRIM(is_any_view_visible, 0);

static value set_custom_id(value id)
{
	setCustomId(val_string(id));
	return alloc_null();
}
DEFINE_PRIM(set_custom_id, 0);

static value get_custom_id()
{
	return alloc_string(getCustomId());
}
DEFINE_PRIM(get_custom_id, 0);

static value set_should_request_interstitials_in_first_session(value shouldRequest)
{
	setShouldRequestInterstitialsInFirstSession(val_bool(shouldRequest));
	return alloc_null();
}
DEFINE_PRIM(set_should_request_interstitials_in_first_session, 1);

static value set_should_display_loading_view_for_more_apps(value shouldDisplay)
{
	setShouldDisplayLoadingViewForMoreApps(val_bool(shouldDisplay));
	return alloc_null();
}
DEFINE_PRIM(set_should_display_loading_view_for_more_apps, 1);

static value set_should_prefetch_video_content(value shouldPrefetch)
{
	setShouldPrefetchVideoContent(val_bool(shouldPrefetch));
	return alloc_null();
}
DEFINE_PRIM(set_should_prefetch_video_content, 1);

static value get_sdk_version()
{
	return alloc_string(getSDKVersion());
}
DEFINE_PRIM(get_sdk_version, 0);

static value set_status_bar_behavior(value shouldHide)
{
	setStatusBarBehavior(val_bool(shouldHide));
	return alloc_null();
}
DEFINE_PRIM(set_status_bar_behavior, 1);

extern "C" void samcodeschartboost_main()
{
	val_int(0);
}
DEFINE_ENTRY_POINT(samcodeschartboost_main);

extern "C" int samcodeschartboost_register_prims()
{
	return 0; 
}

extern "C" void sendChartboostEvent(const char* type, const char* location, const char* uri, int reward_coins, int error, bool status)
{
    if(chartboostEventHandle == 0)
    {
        return;
    }
    
	value o = alloc_empty_object();
    alloc_field(o, val_id("type"), alloc_string(type));
    alloc_field(o, val_id("location"), alloc_string(location));
	alloc_field(o, val_id("uri"), alloc_string(uri));
	alloc_field(o, val_id("reward_coins"), alloc_int(reward_coins));
	alloc_field(o, val_id("error"), alloc_int(error));
	alloc_field(o, val_id("status"), alloc_bool(status));
	val_call1(chartboostEventHandle->get(), o);
}

#endif

