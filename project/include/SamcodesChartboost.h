#ifndef CHARTBOOSTEXT_H
#define CHARTBOOSTEXT_H

namespace samcodeschartboost
{
	void initChartboost(const char* appId, const char* appSignature);
	void showInterstitial(const char* location);
	void cacheInterstitial(const char* location);
	bool hasInterstitial(const char* location);
	void showRewardedVideo(const char* location);
	void cacheRewardedVideo(const char* location);
	bool hasRewardedVideo(const char* location);
	bool isAnyViewVisible();
	void setCustomId(const char* id);
	const char* getCustomId();
	void setShouldRequestInterstitialsInFirstSession(bool shouldRequest);
	bool getAutoCacheAds();
	void setAutoCacheAds(bool autoCache);
	void setShouldPrefetchVideoContent(bool shouldPrefetch);
	const char* getSDKVersion();
	void setStatusBarBehavior(bool shouldHide);
	void setMuted(bool mute);
	void restrictDataCollection(bool shouldRestrict);
	int get_pi_data_use_consent();
	void set_pi_data_use_consent(int consent);
}

#endif