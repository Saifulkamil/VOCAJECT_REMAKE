import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_open_image_kiri.dart';

import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../controllers/konsultasi_controller.dart';

class KonsultasiView extends GetView<KonsultasiController> {
  const KonsultasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Aplikasi_Vocaject,
                style: ColorApp.secondColorTextStyly(context)
                    .copyWith(fontSize: 20, fontWeight: reguler)),
            Row(
              children: [
                Text(
                  "Menulis Pesan...",
                  style:
                      ColorApp.secondColorTextStyly(context).copyWith(fontSize: 12),
                ),
                const SizedBox(
                  width: 6,
                ),
                Flexible(
                  child: Text(
                    pnl,
                    style:
                        ColorApp.secondColorTextStyly(context).copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        elevation: 0,
        leadingWidth: 80,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          borderRadius: BorderRadius.circular(30),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.secondary,
                size: 30,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/image/img_foto.jpg",
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const Expanded(child: PageChatView()),
          Container(
            margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: colorTransparan,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        builder: (BuildContext context) {
                          return Container(
                            height: 120,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Center(
                                    child: Container(
                                      height: 4,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: greyColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(vertical:1,horizontal: 20),
                                 child: Row(children: [
                                  Column(
                                    children: [
                                      IconButton(onPressed: () {
                                        
                                      }, icon: const Icon(Icons.file_present_rounded, size: 35,color: greenColor)),
                                      const Text(File)
                                    ],
                                  ),
                                  const SizedBox(
                                  width: 15,
                                ),
                                  Column(
                                    children: [
                                      IconButton(onPressed: () {
                                        
                                      }, icon: const Icon(Icons.image, size: 35, color: greenColor,)),
                                      const Text(Gambar)

                                    ],
                                  )
                                 ],),
                               )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      size: 30,
                    )),
                Flexible(
                  child: SizedBox(
                      child: TextFormField(
                          // controller: _messageController,
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          onEditingComplete: () {
                            FocusScope.of(context).unfocus();
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.send,
                                  size: 35,
                                  color: greenColor,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15.0),
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.background,
                              hintText: Ketikkan_pesan,
                              hintStyle: const TextStyle(color: greyColor),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: greyColor),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: greyColor),
                              )))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageChatView extends GetView<KonsultasiController> {
  const PageChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView.builder(
        itemCount: 10,
        reverse: true,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Column(
              children: [
                WidgetTextChatKiri(),
                SizedBox(height: 5),
                WidgetGambarChatKanan(),
                SizedBox(height: 5),
                WidgetTextChatKanan(),
                SizedBox(height: 5),
                WidgetGambarChatKiri(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class WidgetTextChatKanan extends StatelessWidget {
  const WidgetTextChatKanan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
                decoration: const BoxDecoration(
                    color: greenAppBar,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                padding: const EdgeInsets.all(10),
                child: Text(
                  gimans_kabarnya,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  style:
                      whiteTextStyly.copyWith(fontSize: 15, fontWeight: medium),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "10:00",
              style: ColorApp.secondColorTextStyly(context)
                  .copyWith(fontSize: 13, fontWeight: medium),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.check_circle_outline_rounded,
              size: 18,
              color: greyColor,
            )
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

class WidgetTextChatKiri extends StatelessWidget {
  const WidgetTextChatKiri({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 15,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10))),
                padding: const EdgeInsets.all(10),
                child: Text(
                  permisi_pak_,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  style: ColorApp.secondColorTextStyly(context)
                      .copyWith(fontSize: 15, fontWeight: medium),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const SizedBox(width: 40),
            Text(
              "10:00",
              style: ColorApp.secondColorTextStyly(context)
                  .copyWith(fontSize: 13, fontWeight: medium),
            ),
            const SizedBox(width: 5),
            
            const Icon(
              Icons.timer_outlined,
              size: 18,
              color: greyColor,
            )
          ],
        ),
      ],
    );
  }
}

class WidgetGambarChatKiri extends StatelessWidget {
  const WidgetGambarChatKiri({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 15,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10))),
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      builder: (BuildContext context) {
                        return const WidgetOpenImage();
                      },
                    );
                  },
                  child: Image.asset(
                    "assets/image/img_vocaject.png",
                    fit: BoxFit.cover,
                    width: 247,
                    height: 202,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const SizedBox(width: 40),
            Text(
              "10:00",
              style: ColorApp.secondColorTextStyly(context)
                  .copyWith(fontSize: 13, fontWeight: medium),
            ),
          ],
        ),
      ],
    );
  }
}

class WidgetGambarChatKanan extends StatelessWidget {
  const WidgetGambarChatKanan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
                decoration: const BoxDecoration(
                    color: greenAppBar,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      builder: (BuildContext context) {
                        return const WidgetOpenImage();
                      },
                    );
                  },
                  child: Image.asset(
                    "assets/image/img_foto.jpg",
                    fit: BoxFit.cover,
                    width: 247,
                    height: 202,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "10:00",
              style: ColorApp.secondColorTextStyly(context)
                  .copyWith(fontSize: 13, fontWeight: medium),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.check_circle_outline_rounded,
              size: 18,
              color: greenColor,
            )
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
