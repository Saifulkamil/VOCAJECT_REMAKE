import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../colors.dart';
import '../string.dart';
class WidgetImgPoject extends StatelessWidget {
  const WidgetImgPoject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/image/img_home_desain.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.video_camera_back_outlined,
                        color: whiteColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        Edit_profil,
                        style: whiteTextStyly.copyWith(
                            fontSize: 12, fontWeight: reguler),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          Video_pendek,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: whiteTextStyly.copyWith(
                              fontSize: 12, fontWeight: reguler),
                        ),
                      ),
                      Text(
                        price,
                        style: whiteTextStyly.copyWith(
                            fontSize: 12, fontWeight: medium),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/image/img_foto.jpg"),
                          radius: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          Tesla,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: whiteTextStyly.copyWith(
                              fontSize: 12, fontWeight: medium),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WidgetImgProgresPoject extends StatelessWidget {
  const WidgetImgProgresPoject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/image/img_home_desain.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularPercentIndicator(
                    radius: 17 ,
                    lineWidth: 4,
                    percent: 0.6,
                    center: Text(
                      "60%",
                      style: whiteTextStyly.copyWith(fontSize: 10),
                    ),
                    progressColor: whiteColor,
                  ),
                  
                  SizedBox(
                    width: 150,
                    child: Text(
                      Video_pendek,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: whiteTextStyly.copyWith(
                          fontSize: 15, fontWeight: reguler),
                    ),
                  ),
                  
                  Row(
                    children: [
                      Text(
                        Tim,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: whiteTextStyly.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ),
                      SizedBox(
                        height: 20,
                        width: 100,
                        child: Scaffold(
                            backgroundColor: colorTransparan,
                            body: CustomScrollView(
                              scrollDirection: Axis.horizontal,
                              slivers: [
                                SliverPrototypeExtentList(
                                  delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                    return const CircleAvatar();
                                  }, childCount: 10),
                                  prototypeItem: const CircleAvatar(
                                    radius: 10,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ],
                  )
                ],
              ),
              
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/image/img_foto.jpg"),
                          radius: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          Tesla,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: whiteTextStyly.copyWith(
                              fontSize: 12, fontWeight: medium),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
