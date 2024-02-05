import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_failed.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_konfirm.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../controllers/fungsi_widget_random.dart';
import '../../modules/project_details/controllers/project_details_controller.dart';

class WidgetAjukanProject extends GetView<ProjectDetailsController> {
  const WidgetAjukanProject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final flowC = Get.put(WidgetController());

    return Container(
      height: 702,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                        borderRadius: BorderRadius.circular(10),
                        color: greyColor),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Ajukan_Proposal,
                    style: ColorApp.secondColorTextStyly(context)
                        .copyWith(fontSize: 20, fontWeight: reguler),
                  ),
                  TextButton(
                      onPressed: () {
                        flowC.Loading();
                        Timer(const Duration(milliseconds: 1000), () {
                          Get.back();
                          // WidgetListproject();
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            builder: (BuildContext context) {
                              return const Widgetkonfirm();
                            },
                          );
                        });
                      },
                      child: Text(
                        simpan,
                        style: ColorApp.greenTextStyly(context)
                            .copyWith(fontSize: 18, fontWeight: reguler),
                      ))
                ],
              ),
              Container(
                // height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: DropdownSearch
                        // <KampusModel>
                        (
                      // asyncItems: (String
                      //     filter) async {
                      // Uri url = Uri.parse(
                      //     // "${UrlDomain.baseurl}/api/user/r/college"
                      //     );

                      // try {
                      //   final response =
                      //       await http
                      //           .get(url);
                      //   var data = json
                      //       .decode(response
                      //           .body) as Map<
                      //       String, dynamic>;
                      //   print(data);

                      //   var ListAllKampus =
                      //       data["data"]
                      //           as List<
                      //               dynamic>;
                      //   var models = KampusModel
                      //       .fromJsonList(
                      //           ListAllKampus);
                      //   for (var model
                      //       in models) {
                      //     model.name = model
                      //         .name
                      //         ?.capitalize;
                      //   }

                      //   return models;
                      // } catch (err) {
                      //   print(err);
                      //   return List<
                      //       KampusModel>.empty();
                      // }
                      // },
                      popupProps: const PopupProps.menu(
                        showSearchBox: true,
                        searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.search),
                                hintStyle: TextStyle(fontFamily: "poppins"),
                                hintText: cari_mahasiswa,
                                contentPadding: EdgeInsets.all(15))),
                        searchDelay: Duration(milliseconds: 10),
                      ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          // labelText: Mahasiswa,
                          border: InputBorder.none,

                          hintText: pilih_mahasiswa,
                          hintStyle:
                              ColorApp.secondColorTextStyly(context).copyWith(),
                        ),
                      ),
                      // itemAsString:
                      //     (KampusModel u) {
                      //   return kampusC =
                      //       u.name!;
                      // },
                      // validator: (vkampus) {
                      //   if (vkampus == null) {
                      //     return "* Kampus Harus Di Pilih";
                      //   }
                      //   return null;
                      // },
                      // onChanged: (Value) {
                      //   idkampus = Value!.id;

                      //   print(Value.id);
                      // }
                      //           ),
                      //     ]),
                      //     Icon(
                      //       Icons.person_add_alt_1,
                      //       color: blackColor,
                      //     )
                      //   ],
                      // ),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text(
                          Lapiran,
                          style: ColorApp.secondColorTextStyly(context)
                              .copyWith(fontSize: 15, fontWeight: medium),
                        )
                      ]),
                      const Icon(
                        Icons.file_present_rounded,
                        color: greyColor,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text(
                          Optional_lampiran,
                          style: ColorApp.secondColorTextStyly(context)
                              .copyWith(fontSize: 15, fontWeight: medium),
                        )
                      ]),
                      const Icon(
                        Icons.file_present_rounded,
                        color: greyColor,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                Catatan_untuk_perusahaan,
                style: ColorApp.secondColorTextStyly(context)
                    .copyWith(fontSize: 15, fontWeight: medium),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                // height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 15.0),
                  child: TextFormField(
                    minLines: 5,
                    maxLines: 15,
                    cursorColor: Theme.of(context).colorScheme.secondary,
                    textAlign: TextAlign.justify,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: colorTransparan,
                        hintText: Ketikan,
                        hintStyle: const TextStyle(color: greyColor),
                        labelStyle: const TextStyle(color: greyColor),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: colorTransparan),
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
