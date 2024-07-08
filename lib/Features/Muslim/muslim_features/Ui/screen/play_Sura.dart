import 'package:bootcamp/Features/Muslim/muslim_features/Cubit/cubit/muslim_cubit.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class playSuarh extends StatefulWidget {
  playSuarh(
      {super.key,
      required this.id,
      required this.name,
      required this.englishname});
  int id;
  String name;
  String englishname;

  @override
  State<playSuarh> createState() => _playSuarhState();
}

class _playSuarhState extends State<playSuarh> {
  bool isPlaying = false;
  int volume = 50;
  bool bottomsheet = false;
  bool speedlist = false;

  String timeFormat(Duration duration) {
    return "${duration.inHours.remainder(60).toString().padLeft(2, '0')}:${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MuslimCubit()
        ..getSurahAudio(1, widget.id)
        ..getReciters(),
      child: BlocConsumer<MuslimCubit, MusilmState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SurahAudioLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: colors.primary,
                ),
              );
            } else {
              final cubit = BlocProvider.of<MuslimCubit>(context);
              //  cubit.player.play();
              return Scaffold(
                bottomSheet: bottomsheet == false
                    ? null
                    : speedlist == true
                        ? Container(
                            height: 50.h,
                            decoration: const BoxDecoration(
                              color: colors.background,
                            ),
                            child: Row(
                              children: [
                                size.width(30),
                                // slider for speed
                                Container(
                                  height: 200.h,
                                  child: Slider(
                                      activeColor: colors.primary,
                                      inactiveColor:
                                          colors.primary.withOpacity(0.3),
                                      min: 0.1,
                                      max: 3,
                                      value: cubit.player.speed,
                                      onChanged: (value) {
                                        cubit.player.setSpeed(value);
                                      }),
                                ),
                                size.width(30),
                                Text("x${cubit.player.speed.roundToDouble()}",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: colors.subtext,
                                        fontFamily: 'Lexend')),
                              ],
                            ),
                          )
                        : Container(
                            height: 450.h,
                            decoration: const BoxDecoration(
                              color: colors.background,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  size.height(20),
                                  for (int i = 0;
                                      i < cubit.recitersarabic.length - 1;
                                      i++) ...{
                                    GestureDetector(
                                      onTap: () {
                                        cubit.getSurahAudio(
                                            cubit.recitersarabic[i]['id'],
                                            widget.id);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: colors.background,
                                          border: Border.all(
                                            color: colors.primary,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            size.width(10),
                                            // english name
                                            Text(
                                              cubit.recitersarabic[i]
                                                  ['reciter_name'],
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: colors.text,
                                                  fontFamily: 'Lexend'),
                                            ),
                                            size.width(15),
                                            // arabic name
                                            Text(
                                              cubit.recitersarabic[i]
                                                  ['translated_name']['name'],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: colors.text,
                                                  fontFamily: 'Lexend'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  },
                                  size.height(10),

                                  // save
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        bottomsheet = false;
                                      });
                                    },
                                    child: Container(
                                      height: 50.h,
                                      width: 300.w,
                                      decoration: BoxDecoration(
                                        color: colors.primary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Save",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: colors.background,
                                              fontFamily: 'Lexend'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                backgroundColor: colors.background,
                body: SafeArea(
                  child: Column(
                    children: [
                      // image and surah name
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assats/10.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            size.height(50),
                            // surah name
                            Row(
                              children: [
                                size.width(
                                    MediaQuery.of(context).size.width * 0.25),
                                Text(
                                  widget.name,
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      color: colors.text,
                                      fontFamily: 'Lexend',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            // surah english name
                            Row(
                              children: [
                                size.width(
                                    MediaQuery.of(context).size.width * 0.35),
                                Text(
                                  widget.englishname,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: colors.background,
                                      fontFamily: 'Lexend'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      size.height(25),
                      // Slider for audio
                      Container(
                        width: 300.w,
                        child: Slider(
                            activeColor: colors.primary,
                            inactiveColor: colors.primary.withOpacity(0.3),
                            min: 0,
                            max: cubit.duration.inSeconds.toDouble(),
                            value: cubit.position.inSeconds.toDouble(),
                            onChanged: (value) {
                              cubit.player
                                  .seek(Duration(seconds: value.toInt()));
                              // cubit.player.setVolume(volume/100);
                            }),
                      ),
                      // row include time of audio
                      Row(
                        children: [
                          size.width(50),
                          Text(
                            timeFormat(cubit.position),
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: colors.subtext,
                                fontFamily: 'Lexend'),
                          ),
                          size.width(160),
                          Text(
                            timeFormat(cubit.duration),
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: colors.subtext,
                                fontFamily: 'Lexend'),
                          ),
                        ],
                      ),
                      size.height(15),
                      // stop and play and seek , volume
                      Row(
                        children: [
                          size.width(55),
                          // speed of audio
                          IconButton(
                            onPressed: () {
                              setState(() {
                                bottomsheet = !bottomsheet;
                                speedlist = !speedlist;
                              });
                            },
                            icon:const Icon(
                              Icons.speed,
                              size: 30,
                              color: colors.primary,
                            ),
                          ),
                          // seek back
                          IconButton(
                            onPressed: () {
                              cubit.player
                                  .seek(cubit.position - const Duration(seconds: 10));
                            },
                            icon:const Icon(
                              CupertinoIcons.backward_end,
                              size: 40,
                              color: colors.primary,
                            ),
                          ),
                          size.width(10),
                          // stop
                          IconButton(
                            onPressed: () {
                              if (isPlaying == false) {
                                cubit.player.play();
                                setState(() {
                                  isPlaying = true;
                                });
                              } else {
                                cubit.player.stop();
                                setState(() {
                                  isPlaying = false;
                                });
                              }
                            },
                            icon: Icon(
                              isPlaying == false
                                  ? CupertinoIcons.play_circle_fill
                                  : CupertinoIcons.stop_circle_fill,
                              size: 55,
                              color: colors.primary,
                            ),
                          ),
                          size.width(15),
                          // seek forward
                          IconButton(
                            onPressed: () {
                              cubit.player
                                  .seek(cubit.position + const Duration(seconds: 10));
                            },
                            icon:const Icon(
                              CupertinoIcons.forward_end,
                              size: 40,
                              color: colors.primary,
                            ),
                          ),
                          //  reciter icon
                          IconButton(
                            onPressed: () {
                              setState(() {
                                bottomsheet = !bottomsheet;
                                speedlist = false;
                              });
                            },
                            icon: const Icon(
                              Icons.spatial_audio_off_outlined,
                              size: 30,
                              color: colors.primary,
                            ),
                          ),
                          // volume
                          // Slider(
                          //     activeColor: colors.primary,
                          //     inactiveColor: colors.primary.withOpacity(0.3),
                          //     min: 0,
                          //     max: 100,
                          //     value: volume.toDouble(),
                          //     onChanged: (value) {
                          //       setState(() {
                          //         volume = value.toInt();
                          //       });
                          //       cubit.player.setVolume(volume / 100);
                          //     }),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
