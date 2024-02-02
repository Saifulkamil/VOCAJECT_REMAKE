import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/component/widget_cari_text_from_field.dart';
import '../../../utils/component/widget_spotlight.dart';
import '../../../utils/component/widget_poject_terbaru.dart';
import '../../../utils/component/widget_kategori_poject.dart';
import '../../../utils/string.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        toolbarHeight: 63,
        leadingWidth: 148,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Haii,
                style: ColorApp.secondColorTextStyly(context).copyWith(
                    fontSize: 15, fontWeight: reguler),
              ),
              const SizedBox(
                height: 3,
              ),
              Image.asset(
                "assets/image/img_vocaject.png",
              ),
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0, top: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/image/img_foto.jpg"),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 55,
            backgroundColor: Theme.of(context).colorScheme.background,
            centerTitle: true,

            // widget pencarian
            title: const WidgetCariTextFromField(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    Spotlight,
                    style: ColorApp.secondColorTextStyly(context).copyWith(
                        fontSize: 15, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // widget spotlight
                  const WidgetSpotlight(),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Kategori,
                        style: ColorApp.secondColorTextStyly(context).copyWith(
                            fontSize: 15, fontWeight: medium),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          Lihat_semua,
                          style: ColorApp.greenTextStyly(context).copyWith(
                              fontSize: 15, fontWeight: medium),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const WidgetKategoriPoject(),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    Proyek_terbaru,
                    style: ColorApp.secondColorTextStyly(context).copyWith(
                        fontSize: 15, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          SliverPrototypeExtentList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
                  child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PROJECT_DETAILS);
                      },

                      //widget tampilan project
                      child: const WidgetPojectTerbaru()),
                );
              }, childCount: 10),
              prototypeItem: const WidgetPojectTerbaru())
        ],
      ),
    );
  }
}
