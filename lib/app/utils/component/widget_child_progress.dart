import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../colors.dart';
import '../string.dart';

class WidgetChildProgress extends StatelessWidget {
  const WidgetChildProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 122,
      child: Scaffold(
        body: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverPrototypeExtentList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right:15.0),
                    child: InkWell(
                        onTap: () {
                          // Get.toNamed(Routes.PAGE_PROGRES_PROJECT);
                        },
                        child: const ChildProgress()),
                  );
                }, childCount: 10),
                prototypeItem: const Padding(
                  padding: EdgeInsets.only(right:16.0),
                  child: ChildProgress(),
                ))
          ],
        ),
      ),
    );
  }
}

class ChildProgress extends StatelessWidget {
  const ChildProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 122,
          width: 157,
          child: Stack(
            children: [
              Image.asset(
                "assets/image/img_home1.png",
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 34,
                      width: 141,
                      decoration: BoxDecoration(
                          color: whiteColor50,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularPercentIndicator(
                                radius: 14.0,
                                lineWidth: 2.5,
                                percent: 1.0,
                                center: Text(
                                  "100%",
                                  style: whiteTextStyly.copyWith(fontSize: 8),
                                ),
                                progressColor: whiteColor,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "12-23-2002",
                                  style: whiteTextStyly.copyWith(
                                      fontSize: 12, fontWeight: reguler),
                                ),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 11.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Aplikasi_seluler,
                            style: whiteTextStyly.copyWith(
                                fontSize: 12, fontWeight: reguler),
                          ),
                          Text(
                            E_health,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: whiteTextStyly.copyWith(
                                fontSize: 14, fontWeight: medium),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      
      ],
    );
  }
}
