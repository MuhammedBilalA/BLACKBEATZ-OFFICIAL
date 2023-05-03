import 'package:black_beatz/database/songs/songs_db_model/songs_db_model.dart';
import 'package:black_beatz/screens/common_widgets/hearticon.dart';
import 'package:black_beatz/screens/common_widgets/listtilecustom.dart';
import 'package:black_beatz/screens/favourite_screens/favourite.dart';
import 'package:black_beatz/screens/playing_screen/mini_player.dart';
import 'package:black_beatz/screens/playing_screen/player_functions.dart';
import 'package:black_beatz/screens/playlist_screens/addto_playlist_screen.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:on_audio_query/on_audio_query.dart';

List<Songs> mostPlayedList = [];

class MostlyPlayed extends StatelessWidget {
  const MostlyPlayed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF53147A),
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Center(
                child: FaIcon(
              FontAwesomeIcons.angleLeft,
            ))),
        backgroundColor: const Color(0xFF53147A),
        title: const Text(
          'TOP BEATZ',
          style: TextStyle(
              fontFamily: 'Peddana', fontWeight: FontWeight.w600, fontSize: 25),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: (mostPlayedList.isEmpty)
          ? const Center(
              child: Text(
                'Play Some Songs',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Peddana',
                    fontSize: 26),
              ),
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: InkWell(
                    onTap: () {
                      playingAudio(mostPlayedList, index);

                      showBottomSheet(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          context: context,
                          builder: (context) {
                            return const MiniPlayer();
                          });
                    },
                    child: ListtileCustomWidget(
                      index: index,
                      context: context,
                      title: Text(
                        mostPlayedList[index].songName!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Text(
                        mostPlayedList[index].artist!,
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: QueryArtworkWidget(
                        size: 3000,
                        quality: 100,
                        artworkQuality: FilterQuality.high,
                        artworkBorder: BorderRadius.circular(10),
                        artworkFit: BoxFit.cover,
                        id: mostPlayedList[index].id!,
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/photo-1544785349-c4a5301826fd.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      trailing1: Hearticon(
                        currentSong: mostPlayedList[index],
                        isfav:
                            favoritelist.value.contains(mostPlayedList[index]),
                      ),
                      trailing2: PopupMenuButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: const Color.fromARGB(255, 45, 10, 67),
                          icon: const FaIcon(
                            FontAwesomeIcons.ellipsisVertical,
                            color: Colors.white,
                            size: 26,
                          ),
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 1,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (ctx) => AddToPlaylist(
                                                    addToPlaylistSong:
                                                        mostPlayedList[index],
                                                  )));
                                    },
                                    child: const Text(
                                      'ADD TO PLAYLIST',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Peddana',
                                          fontSize: 22),
                                    ),
                                  ),
                                )
                              ]),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 0,
                );
              },
              itemCount: mostPlayedList.length,
            ),
    );
  }
}
