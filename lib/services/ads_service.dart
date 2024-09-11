import 'package:felpus/helpers/ads_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:developer';


class AdsServices {
  // Separate readiness states for each banner
  static RxBool isBannerAdFirstReady = false.obs;
  static RxBool isBannerAdSecondReady = false.obs;
  static RxBool isBannerAdThirdReady = false.obs;
  static RxBool isBannerAdFourthReady = false.obs;

  static late BannerAd bannerAdFirst;
  static late BannerAd bannerAdSecond;
  static late BannerAd bannerAdThird;
  static late BannerAd bannerAdFourth;

  // Reusable method to load a banner ad
  static BannerAd _createBannerAd(RxBool isReadyState) {
    return BannerAd(
      adUnitId: AdsHelper.bannerAdUnitId(),
      size: AdSize.largeBanner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isReadyState.value = true;
          log("Banner Ad Loaded");
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          isReadyState.value = false;
          log("Banner Ad Error: $error");
        },
      ),
    );
  }

  // Load all banner ads
  static void loadBannerAds() {
    bannerAdFirst = _createBannerAd(isBannerAdFirstReady);
    bannerAdSecond = _createBannerAd(isBannerAdSecondReady);
    bannerAdThird = _createBannerAd(isBannerAdThirdReady);
    bannerAdFourth = _createBannerAd(isBannerAdFourthReady);

    bannerAdFirst.load();
    bannerAdSecond.load();
    bannerAdThird.load();
    bannerAdFourth.load();
  }

  // Dispose of all banner ads
  static void disposeBannerAds() {
    bannerAdFirst.dispose();
    bannerAdSecond.dispose();
    bannerAdThird.dispose();
    bannerAdFourth.dispose();

    isBannerAdFirstReady.value = false;
    isBannerAdSecondReady.value = false;
    isBannerAdThirdReady.value = false;
    isBannerAdFourthReady.value = false;
  }
}
