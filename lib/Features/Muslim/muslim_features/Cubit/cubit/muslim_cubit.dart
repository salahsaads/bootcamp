import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bootcamp/Features/Muslim/muslim_features/Ui/screen/listquran.dart';
import 'package:bootcamp/Features/Muslim/muslim_features/data/qruan.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:just_audio/just_audio.dart';

part 'muslim_state.dart';

class MuslimCubit extends Cubit<MusilmState> {
  MuslimCubit() : super(MuslimInitial());

  String readingmood = "";
  int sizefont = 18;
  Color color = colors.text;

  List<dynamic> quranlist = [];

  List<dynamic> surah = [];
  List<dynamic> surah2 = [];

  String surahUrl = "";
  final player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  List<dynamic> recitersarabic = [];
  // get quran list
  getQuranList() async {
    emit(QuranListLoading());
    try {
      quranlist = await quran.getQuranList();
      emit(QuranListLoaded());
    } catch (e) {
      emit(QuranListFailed());
    }
  }

  // get surah
  getSurah(int id, String lang) async {
    emit(SurahLoading());
    try {
      surah = await quran.getSurah(id, lang);
      emit(SurahLoaded());
    } catch (e) {
      emit(SurahFailed());
    }
  }

  // set reading mood
  setReadingMood(String mood, int id) {
    emit(MusilmLoading());
    try {
      readingmood = mood;
      if (readingmood == 'arabic') {
        getSurah(id, 'ar');
      } else if (readingmood == 'english') {
        getSurah(id, 'en');
      } else {
        getSurahBoth(id);
      }
      emit(MusilmInitial());
    } catch (e) {
      emit(MusilmFailed());
    }
  }

  // font size
  setfontsize(int size) {
    emit(MusilmLoading());
    try {
      sizefont = size;
      emit(MusilmInitial());
    } catch (e) {
      emit(MusilmFailed());
    }
  }

  // color
  setcolor(Color color) {
    emit(MusilmLoading());
    try {
      this.color = color;
      emit(MusilmInitial());
    } catch (e) {
      emit(MusilmFailed());
    }
  }

  // get both languages
  getSurahBoth(int id) async {
    emit(SurahLoading());
    try {
      surah = await quran.getSurah(id, 'ar');
      surah2 = await quran.getSurah(id, 'en');

      emit(SurahLoaded());
    } catch (e) {
      emit(SurahFailed());
    }
  }

  // get surah audio
  getSurahAudio(int id, int chapter_number) async {
    emit(SurahAudioLoading());
    try {
      surahUrl = await quran.getSurahAudio(id, chapter_number);
      duration = await player.setUrl(
        surahUrl,
      ) as Duration;

      player.durationStream.listen((duration0) {
        duration = duration0 as Duration;
      });

      player.positionStream.listen((position0) {
        position = position0 as Duration;
      });

      Timer.periodic(Duration(seconds: 1), (timer) {
        initial();
      });

      emit(SurahAudioLoaded());
    } catch (e) {
      emit(SurahAudioFailed());
    }
  }

  // initial
  initial() {
    player.durationStream.listen((duration0) {
      duration = duration0 as Duration;  
    });

    player.positionStream.listen((position0) {
      position = position0 as Duration;
    });
    emit(SurahLoaded());
  }

  // get reciters
  getReciters() async {
    emit(RecitersLoading());
    try {
      recitersarabic = await quran.getReciters('ar');
      emit(RecitersLoaded());
    } catch (e) {
      emit(RecitersFailed());
    }
  }
}
