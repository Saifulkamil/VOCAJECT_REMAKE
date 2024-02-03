import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../controllers/konsultasi_controller.dart';

class KonsultasiView extends GetView<KonsultasiController> {
  const KonsultasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrondColor,
      body: ListView.builder(
        itemCount: 10,
        reverse: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Column(
              children: [
                Column(
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
                            decoration: const BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              permisi_pak_,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 10,
                              style: blackTextStyly.copyWith(
                                  fontSize: 12, fontWeight: medium),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "10:00",
                      style: blackTextStyly.copyWith(
                          fontSize: 13, fontWeight: medium),
                    ),
                  ],
                ),
                Column(
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
                              style: whiteTextStyly.copyWith(
                                  fontSize: 12, fontWeight: medium),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "10:00",
                      style: blackTextStyly.copyWith(
                          fontSize: 13, fontWeight: medium),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PageChatView extends GetView<KonsultasiController> {
  const PageChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrondColor,
      appBar: AppBar(
        
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Aplikasi_Vocaject,
                style:
                    whiteTextStyly.copyWith(fontSize: 20, fontWeight: reguler)),
            Text(
              pnl,
              style: whiteTextStyly.copyWith(fontSize: 12),
            ),
          ],
        ),
        backgroundColor: greenAppBar,
        elevation: 0,
        leadingWidth: 80,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          borderRadius: BorderRadius.circular(30),
          child: const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              CircleAvatar(
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
          const Expanded(child: KonsultasiView()),
          Container(
            margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: colorTransparan,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextFormField(
                        // controller: _messageController,
                        cursorColor: blackColor,
                        style: const TextStyle(color: blackColor),
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.send,
                                size: 35,
                                color: greenAppBar,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15.0),
                            filled: true,
                            fillColor: whiteColor,
                            hintText: "Ketikan Pesan",
                            hintStyle: const TextStyle(color: greyColor),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(color: whiteColor),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(color: whiteColor),
                            )))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

