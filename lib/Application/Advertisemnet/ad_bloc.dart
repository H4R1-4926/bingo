import 'dart:developer';

import 'package:bingo/Domain/Ad/advertisement.dart';
import 'package:bingo/Infrastructure/music/music.dart';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'ad_event.dart';
part 'ad_state.dart';
part 'ad_bloc.freezed.dart';

class AdBloc extends Bloc<AdEvent, AdState> {
  BannerAd? _bannerAd;
  final bool isActive = false;
  InterstitialAd? _interstitialAd;
  AdBloc() : super(AdState.initial()) {
    on<Started>((event, emit) async {
      if (isActive) {
        BannerAd(
                size: AdSize.banner,
                adUnitId: AdHelper.bannerAdUnitId,
                listener: BannerAdListener(
                  onAdLoaded: (ad) {
                    _bannerAd = ad as BannerAd;
                  },
                  onAdFailedToLoad: (ad, error) {
                    log('Failed to load BannerAd: $error');
                    ad.dispose();
                  },
                ),
                request: const AdRequest())
            .load();
        emit(AdState(ads: _bannerAd));
      }
    });
    on<_Interstatial>((event, emit) async {
      if (isActive) {
        final audio = Audio();
        bool wasMuted = await audio.isMuted();
        await audio.stopPlaying();
        //Audio().markIntentToResume();
        InterstitialAd.load(
            adUnitId: AdHelper.interstatialAdUnitId,
            request: const AdRequest(),
            adLoadCallback: InterstitialAdLoadCallback(
              onAdLoaded: (ad) {
                ad.fullScreenContentCallback = FullScreenContentCallback(
                  onAdDismissedFullScreenContent: (ad) async {
                    //await Audio().restoreIntentAfterAd();

                    ad.dispose();
                    if (!wasMuted) {
                      await audio.bgPlay();
                    }
                  },
                  onAdFailedToShowFullScreenContent: (ad, error) {
                    ad.dispose();
                  },
                );
                _interstitialAd = ad;
                _interstitialAd?.show();
              },
              onAdFailedToLoad: (error) {
                log('InterstitialAd failed to load: $error');
              },
            ));
      }
    });
  }
  @override
  Future<void> close() {
    _bannerAd?.dispose();
    return super.close();
  }
}
