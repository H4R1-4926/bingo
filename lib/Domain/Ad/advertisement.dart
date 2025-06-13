import 'dart:developer';
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

final bool isActive = true;

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3811809688597776/6072062674';
      // return 'ca-app-pub-3940256099942544/6300978111'; // test ad id
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstatialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3811809688597776/7256381326';
      // return 'ca-app-pub-3940256099942544/1033173712'; // test ad is
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get appOpensAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3811809688597776/4630217988';
      // return 'ca-app-pub-3940256099942544/9257395921'; // test ad id
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}

AppOpenAd? _appOpenAd;

loadAd() {
  if (isActive) {
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
}
