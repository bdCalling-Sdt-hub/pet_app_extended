import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/ads_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class AdsServices {
  static RxBool isBannerAdReady = false.obs;
  static late BannerAd bannerAdFirst;
  static late BannerAd bannerAdSecond;
  static late BannerAd bannerAdThird;
  static late BannerAd bannerAdFourth;

  static RxBool isInterstitialAdReady = false.obs;
  static late InterstitialAd interstitialAd;

  static void loadInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdsHelper.interstitialAdUnitId(),
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
            isInterstitialAdReady = true.obs;
            print("Interstitial Ad Ready");
          },
          onAdFailedToLoad: (error) {
            print(
                "==========================================================> Interstitial Ad Error $error");
            interstitialAd.dispose();

            isInterstitialAdReady = false.obs;
          },
        ));
  }

  static void loadBannerAd() {
    bannerAdFirst = BannerAd(
      adUnitId: AdsHelper.bannerAdUnitId(),
      size: AdSize.largeBanner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerAdReady.value = true;
          print("Banner Ad Ready");
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          isBannerAdReady.value = false;
          print("Banner Ad Error: $error");
        },
      ),
    );
    bannerAdFirst.load();

    bannerAdSecond = BannerAd(
      adUnitId: AdsHelper.bannerAdUnitId(),
      size: AdSize.largeBanner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerAdReady.value = true;
          print("Banner Ad Ready");
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          isBannerAdReady.value = false;
          print("Banner Ad Error: $error");
        },
      ),
    );
    bannerAdSecond.load();

    bannerAdThird = BannerAd(
      adUnitId: AdsHelper.bannerAdUnitId(),
      size: AdSize.largeBanner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerAdReady.value = true;
          print("Banner Ad Ready");
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          isBannerAdReady.value = false;
          print("Banner Ad Error: $error");
        },
      ),
    );
    bannerAdThird.load();

    bannerAdFourth = BannerAd(
      adUnitId: AdsHelper.bannerAdUnitId(),
      size: AdSize.largeBanner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerAdReady.value = true;
          print("Banner Ad Ready");
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          isBannerAdReady.value = false;
          print("Banner Ad Error: $error");
        },
      ),
    );
    bannerAdFourth.load();
  }

  static void disposeBannerAd() {

    bannerAdFirst.dispose();
    bannerAdSecond.dispose();
    bannerAdThird.dispose();
    bannerAdFourth.dispose();
    isBannerAdReady.value = false;
  }
}