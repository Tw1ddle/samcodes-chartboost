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

static value samcodeschartboost_set_listener(value onEvent)
{
	chartboostEventHandle = new AutoGCRoot(onEvent);
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_set_listener, 1);

static value samcodeschartboost_init_chartboost(value id, value signature)
{
	initChartboost(val_string(id), val_string(signature));
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_init_chartboost, 2);

static value samcodeschartboost_show_interstitial(value location)
{
	showInterstitial(val_string(location));
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_show_interstitial, 1);

static value samcodeschartboost_cache_interstitial(value location)
{
	cacheInterstitial(val_string(location));
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_cache_interstitial, 1);

static value samcodeschartboost_has_interstitial(value location)
{
	return alloc_bool(hasInterstitial(val_string(location)));
}
DEFINE_PRIM(samcodeschartboost_has_interstitial, 1);

static value samcodeschartboost_show_more_apps(value location)
{
	showMoreApps(val_string(location));
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_show_more_apps, 1);

static value samcodeschartboost_cache_more_apps(value location)
{
	cacheMoreApps(val_string(location));
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_cache_more_apps, 1);

static value samcodeschartboost_has_more_apps(value location)
{
	return alloc_bool(hasMoreApps(val_string(location)));
}
DEFINE_PRIM(samcodeschartboost_has_more_apps, 1);

static value samcodeschartboost_show_rewarded_video(value location)
{
	showRewardedVideo(val_string(location));
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_show_rewarded_video, 1);

static value samcodeschartboost_cache_rewarded_video(value location)
{
	cacheRewardedVideo(val_string(location));
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_cache_rewarded_video, 1);

static value samcodeschartboost_has_rewarded_video(value location)
{
	return alloc_bool(hasRewardedVideo(val_string(location)));
}
DEFINE_PRIM(samcodeschartboost_has_rewarded_video, 1);

static value samcodeschartboost_is_any_view_visible()
{
	return alloc_bool(isAnyViewVisible());
}
DEFINE_PRIM(samcodeschartboost_is_any_view_visible, 0);

static value samcodeschartboost_set_custom_id(value id)
{
	setCustomId(val_string(id));
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_set_custom_id, 1);

static value samcodeschartboost_get_custom_id()
{
	return alloc_string(getCustomId());
}
DEFINE_PRIM(samcodeschartboost_get_custom_id, 0);

static value samcodeschartboost_set_should_request_interstitials_in_first_session(value shouldRequest)
{
	setShouldRequestInterstitialsInFirstSession(val_bool(shouldRequest));
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_set_should_request_interstitials_in_first_session, 1);

static value samcodeschartboost_get_auto_cache_ads()
{
	return alloc_bool(getAutoCacheAds());
}
DEFINE_PRIM(samcodeschartboost_get_auto_cache_ads, 0);

static value samcodeschartboost_set_auto_cache_ads(value autoCache)
{
	setAutoCacheAds(alloc_bool(autoCache));
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_set_auto_cache_ads, 1);

static value samcodeschartboost_set_should_display_loading_view_for_more_apps(value shouldDisplay)
{
	setShouldDisplayLoadingViewForMoreApps(val_bool(shouldDisplay));
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_set_should_display_loading_view_for_more_apps, 1);

static value samcodeschartboost_set_should_prefetch_video_content(value shouldPrefetch)
{
	setShouldPrefetchVideoContent(val_bool(shouldPrefetch));
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_set_should_prefetch_video_content, 1);

static value samcodeschartboost_get_sdk_version()
{
	return alloc_string(getSDKVersion());
}
DEFINE_PRIM(samcodeschartboost_get_sdk_version, 0);

static value samcodeschartboost_set_status_bar_behavior(value shouldHide)
{
	setStatusBarBehavior(val_bool(shouldHide));
	return alloc_null();
}
DEFINE_PRIM(samcodeschartboost_set_status_bar_behavior, 1);

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
