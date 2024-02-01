import 'package:flutter/material.dart';

import '../colors.dart';
import '../string.dart';

class WidgetKategoriPoject extends StatelessWidget {
  const WidgetKategoriPoject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14.5, bottom: 10),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(8)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                // Get.toNamed(Routes.PAGE_KATEGORI_PROJECT,
                //     arguments: Aplikasi_seluler);
                // Get.to(() => CategoriUserDosen(item: "aplikasi seluler",));
                //     Get.put<Categori>(Categori(item:"aplikasi-seluler"));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 41.4,
                    child: Image.asset(
                      "assets/image/ic_mobile.png",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(Mobile,
                      style: blackTextStyly.copyWith(
                          fontSize: 12, fontWeight: light))
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // Get.toNamed(Routes.PAGE_KATEGORI_PROJECT, arguments: Website);

                //  Get.to(() => CategoriUserDosen(item: "situs web",));
                //     Get.put<Categori>(Categori(item:"situs-web"));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 50.5,
                    child: Image.asset(
                      "assets/image/ic_web.png",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(Website,
                      style: blackTextStyly.copyWith(
                          fontSize: 12, fontWeight: light))
                ],
              ),
            ),
            
            InkWell(
              onTap: () {
                // Get.toNamed(Routes.PAGE_KATEGORI_PROJECT, arguments: Design);

                // Get.to(() => CategoriUserDosen(item: "desain grafis",));
                //     Get.put<Categori>(Categori(item:"desain-grafis"));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 39,
                    width: 40.11,
                    child: Image.asset(
                      "assets/image/ic_desain.png",
                    ),
                  ),
                   const SizedBox(
                    height: 5,
                  ),
                  Text(Design,
                      style: blackTextStyly.copyWith(
                          fontSize: 12, fontWeight: light))
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // Get.toNamed(Routes.PAGE_KATEGORI_PROJECT, arguments: Editor);

                //  Get.to(() => CategoriUserDosen(item: "editor video",));
                //     Get.put<Categori>(Categori(item:"editor-video"));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40.11,
                    child: Image.asset(
                      "assets/image/ic_editor.png",
                    ),
                  ),
                   const SizedBox(
                    height: 5,
                  ),
                  Text(Editor,
                      style: blackTextStyly.copyWith(
                          fontSize: 12, fontWeight: light)),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // Get.toNamed(Routes.PAGE_KATEGORI_PROJECT, arguments: Game);

                // Get.to(() => CategoriUserDosen(item: "pengembangan game",));
                //     Get.put<Categori>(Categori(item:"pengembangan-game"));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      "assets/image/ic_game.png",
                    ),
                  ),
                   const SizedBox(
                    height: 5,
                  ),
                  Text(Game,
                      style: blackTextStyly.copyWith(
                          fontSize: 12, fontWeight: light)),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
