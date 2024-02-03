import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../controllers/target_project_controller.dart';

class TargetProjectView extends GetView<TargetProjectController> {
  const TargetProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: colorTransparan,
          elevation: 0,
          title: Text(Target_Proyek,
              style: ColorApp.secondColorTextStyly(context)
                  .copyWith(fontSize: 20, fontWeight: semiBold)),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.secondary,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      builder: (BuildContext context) {
                        return Container(
                          height: 502,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Center(
                                      child: Container(
                                        height: 5,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: greyColor),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        Tambahkan_target,
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 20,
                                                fontWeight: medium),
                                      ),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            simpan,
                                            style:
                                                ColorApp.greenTextStyly(context)
                                                    .copyWith(
                                                        fontSize: 18,
                                                        fontWeight: reguler),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    // height: 500,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondaryContainer,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(),
                                      child: TextFormField(
                                        minLines: 1,
                                        maxLines: 5,
                                        cursorColor: blackColor10,
                                        textAlign: TextAlign.justify,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: colorTransparan,
                                            hintText: Ketikkan_Logbook_anda,
                                            hintStyle: const TextStyle(
                                                color: greyColor),
                                            labelStyle: const TextStyle(
                                                color: blackColor),
                                            border: InputBorder.none,
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: colorTransparan),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 35,
                  )),
            )
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: Text(Aplikasi_Vocaject,
                    textAlign: TextAlign.center,
                    style: ColorApp.secondColorTextStyly(context)
                        .copyWith(fontSize: 16, fontWeight: semiBold)),
              ),
            ),
            SliverPrototypeExtentList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                                                          colorScheme:
                                                              ColorScheme.light(
                                                                  primary:
                                                                      greenColor)),
                      child: CheckboxListTile(
                        enabled: true,
                        title: Text("sdfsdfsdfsdfsdf",
                            style: ColorApp.secondColorTextStyly(context)
                                .copyWith(fontSize: 15, fontWeight: reguler)),
                        checkColor: Theme.of(context).colorScheme.background,
                        // fillColor: MaterialStatePropertyAll(greenColor),
                        value: true,
                        
                        onChanged: (value) {},
                      ),
                    ),
                  );
                }, childCount: 5),
                prototypeItem: CheckboxListTile(
                  enabled: false,
                  title: Text("sdfsdfsdfsdfsdf",
                      style: ColorApp.secondColorTextStyly(context)
                          .copyWith(fontSize: 15, fontWeight: reguler)),
                  checkColor: Colors.black,
                  value: false,
                  onChanged: (value) {},
                ))
          ],
        )
        // Padding(
        //     padding: const EdgeInsets.only(left: 15.0, right: 15),
        //     child:
        //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //       Container(
        //           width: double.infinity,
        //           decoration: BoxDecoration(
        //               color: Theme.of(context).colorScheme.secondaryContainer,
        //               border: Border.all(color: blackColor),
        //               borderRadius: BorderRadius.circular(7)),
        //           child: Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   horizontal: 15.0, vertical: 10),
        //               child: Column(children: [
        //                 Text(Aplikasi_Vocaject,
        //                     textAlign: TextAlign.center,
        //                     style: ColorApp.secondColorTextStyly(context)
        //                         .copyWith(fontSize: 16, fontWeight: semiBold)),
        //                 SizedBox(
        //                     height: MediaQuery.of(context).size.height / 3.1,
        //                     width: double.infinity,
        //                     child: Scaffold(
        //                         backgroundColor: Colors.transparent,
        //                         body: Material(
        //                           color:
        //                               Theme.of(context).colorScheme.background,
        //                           child: InkWell(
        //                             onLongPress: () {
        //                               // Get.to(()=>todoc.editdialog());
        //                             },
        //                             child: Padding(
        //                               padding:
        //                                   const EdgeInsets.only(bottom: 15.0),
        //                               child: CheckboxListTile(
        //                                 enabled: false,
        //                                 title: Text("sdfsdfsdfsdfsdf",
        //                                     style:
        //                                         ColorApp.secondColorTextStyly(
        //                                                 context)
        //                                             .copyWith(
        //                                                 fontSize: 15,
        //                                                 fontWeight: reguler)),
        //                                 checkColor: Colors.black,
        //                                 value: false,
        //                                 onChanged: (value) {},
        //                               ),
        //                             ),
        //                           ),
        //                         )))
        //               ])))
        //     ])
        //     )
        );
  }
}
