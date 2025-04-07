import 'dart:developer';
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3811809688597776/6072062674';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstatialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3811809688597776/7256381326';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get appOpensAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3811809688597776/4630217988';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}

AppOpenAd? _appOpenAd;

loadAd() {
  AppOpenAd.load(
    adUnitId: AdHelper.appOpensAdUnitId,
    request: const AdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        _appOpenAd = ad;
        _appOpenAd!.show();
      },
      onAdFailedToLoad: (error) {
        _appOpenAd!.dispose();
        log('failed to show app open ad: $error');
      },
    ),
  );
}
