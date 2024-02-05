import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_list_project.dart';

import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../controllers/profile_controller.dart';

class ProfilePeople extends GetView<ProfileController> {
  const ProfilePeople({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: colorTransparan,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 230,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        child: Image.asset(
                          Theme.of(context).brightness == Brightness.dark
                              ? "assets/image/img_dark.png"
                              : "assets/image/img_light.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          color: colorTransparan,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, top: 15),
                              child: Row(
                                children: [
                                  Material(
                                    color: colorTransparan,
                                    child: InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                        )),
                                  ),
                                  Text(
                                    Saiful_Kamil,
                                    style:
                                        ColorApp.secondColorTextStyly(context)
                                            .copyWith(
                                                fontSize: 20,
                                                fontWeight: semiBold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/image/img_foto.jpg"),
                          backgroundColor: Colors.grey,
                          radius: 45,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          Saiful_Kamil,
                          style: ColorApp.secondColorTextStyly(context)
                              .copyWith(fontSize: 20, fontWeight: reguler),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    NIM,
                                    style: ColorApp.secondColorTextStyly(context)
                                        .copyWith(fontSize: 14, fontWeight: bold),
                                  ),
                                  
                                  Text(
                                    " : ",
                                    style: ColorApp.secondColorTextStyly(context)
                                        .copyWith(fontSize: 14, fontWeight: bold),
                                  ),
                                  Text(
                                    no_nim,
                                    style: ColorApp.secondColorTextStyly(context)
                                        .copyWith(fontSize: 14, fontWeight: bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 1,
                                width: double.infinity,
                                decoration: const BoxDecoration(color: greyColor),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    Email,
                                    style: ColorApp.secondColorTextStyly(context)
                                        .copyWith(fontSize: 14, fontWeight: bold),
                                  ),
                                  
                                  Text(
                                    " : ",
                                    style: ColorApp.secondColorTextStyly(context)
                                        .copyWith(fontSize: 14, fontWeight: bold),
                                  ),
                                  Text(
                                    informatika,
                                    style: ColorApp.secondColorTextStyly(context)
                                        .copyWith(fontSize: 14, fontWeight: bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 1,
                                width: double.infinity,
                                decoration: const BoxDecoration(color: greyColor),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    No_Telepon,
                                    style: ColorApp.secondColorTextStyly(context)
                                        .copyWith(fontSize: 14, fontWeight: bold),
                                  ),
                                  
                                  Text(
                                    " : ",
                                    style: ColorApp.secondColorTextStyly(context)
                                        .copyWith(fontSize: 14, fontWeight: bold),
                                  ),
                                  Text(
                                    no_phone,
                                    style: ColorApp.secondColorTextStyly(context)
                                        .copyWith(fontSize: 14, fontWeight: bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 1,
                                width: double.infinity,
                                decoration: const BoxDecoration(color: greyColor),
                              ),
                              
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
        bottomNavigationBar: Container(
            height: 50,
            color: colorTransparan, // Color of the footer
            child: Container(
              width: double.infinity,
              color: colorTransparan,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              builder: (BuildContext context) {
                                return const WidgetListproject();
                              },
                            );
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              elevation: MaterialStateProperty.all(4),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  greenColor2)),
                          child: Text(Lihat_project,
                              style: whiteTextStyly.copyWith(
                                  fontSize: 18, fontWeight: bold)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
