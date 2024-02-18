import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectModel.dart';

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
    // final projectC = Get.find<HomeController>();

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
                  style: ColorApp.secondColorTextStyly(context)
                      .copyWith(fontSize: 15, fontWeight: reguler),
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
          actions: [
            InkWell(
              child: Padding(
                  padding: const EdgeInsets.only(right: 15.0, top: 18),
                  child: InkWell(
                    onTap: () {
                       Get.toNamed(Routes.LIST_CHAT);
                      // projectC.getProject();
                    },
                    child: const Stack(
                      children: [
                        Icon(
                          Icons.email_rounded,
                          size: 30,
                          color: greyColor,
                        ),
                        Positioned(
                            top: 0,
                            left: 0,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: redcolor,
                            )),
                      ],
                    ),
                  )),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.EDIT_PROFILE);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 15.0, top: 15),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/image/img_foto.jpg"),
                ),
              ),
            )
          ],
        ),
        body: GetX<HomeController>(builder: (controller) {
          if (!controller.isProjectLoaded.value) {
            // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
            return const Center(child: CircularProgressIndicator());
          } else {
            return CustomScrollView(
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
                        Builder(
                          builder: (context) {
                            if (controller.listProject.isEmpty) {
                              // Jika data spotlight kosong, tampilkan pesan atau widget lain
                              return const Center();
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    Spotlight,
                                    style:
                                        ColorApp.secondColorTextStyly(context)
                                            .copyWith(
                                                fontSize: 15,
                                                fontWeight: medium),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),

                                  WidgetSpotlight(controller: controller),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                        
                            Text(
                              Kategori,
                              style: ColorApp.secondColorTextStyly(context)
                                  .copyWith(fontSize: 15, fontWeight: medium),
                            ),
                           
                        const SizedBox(
                          height: 7,
                        ),
                        const WidgetKategoriPoject(),
                      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              Proyek_terbaru,
                              style: ColorApp.secondColorTextStyly(context)
                                  .copyWith(fontSize: 15, fontWeight: medium),
                            ),
                             TextButton(
                              onPressed: () {},
                              child: Text(
                                Lihat_semua,
                                style: ColorApp.greenTextStyly(context)
                                    .copyWith(fontSize: 15, fontWeight: medium),
                              ),
                           
                        ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
                SliverPrototypeExtentList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final project = controller.listProject[index];
                      
                      return 
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15, bottom: 20),
                            child: InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.PROJECT_DETAILS);
                                },
                          
                                //widget tampilan project
                                child:  WidgetPojectTerbaru(controller: project)),
                         
                      );
                    }, childCount: controller.listProject.length),
                    prototypeItem:  const WidgetPojectTerbaruKosong())
              ],
            );
          }
        }));
  }
}
