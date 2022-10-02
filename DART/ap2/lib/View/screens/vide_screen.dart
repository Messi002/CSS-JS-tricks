import 'package:ap2/View/widgets/video_player_item.dart';
import 'package:flutter/material.dart';


class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: ,
        controller: PageController(initialPage: 0,viewportFraction: 1),
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index){
          return Stack(
            children: [
              VideoPlayerItem(videoUrl: videoUrl),
              Column(
children: [
   const SizedBox(
                      height: 100,
                    ),
                    Expanded(child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //section on the left
                          Expanded(child: Container(
                              padding: const EdgeInsets.only(
                                left: 20),
                                child: Column(
                                   mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                  children: [
                                    
Text(
                                    data.username,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    data.caption,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.music_note,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        data.songName,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),


                                  ],
                                ),
                      ])),
                          ),
Container(
  width: 100,
                            margin: EdgeInsets.only(top: size.height / 5),
  child: Column(
    children: [




    ],
  ),
)


],


),
),
],
              ),
            ],
          );
      }),
    );
  }
}