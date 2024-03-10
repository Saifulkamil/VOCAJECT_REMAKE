import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/MahasiswaDetails.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_konfirm.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../modules/project_details/controllers/project_details_controller.dart';

class WidgetAjukanProject extends GetView<ProjectDetailsController> {
  const WidgetAjukanProject({
    super.key,
    required this.projectDetailsController,
  });

  final ProjectDetailsController projectDetailsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 702,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Form(
            key: projectDetailsController.formkey,
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
                        onPressed: () async {
                          if (projectDetailsController.formkey.currentState!
                              .validate()) {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              builder: (BuildContext context) {
                                return Widgetkonfirm(
                                    projectDetailsController:
                                        projectDetailsController);
                              },
                            );
                          }
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
                        child: DropdownSearch<MahasiswaDetails>.multiSelection(
                          popupProps: const PopupPropsMultiSelection.menu(
                            showSearchBox: true,
                            searchFieldProps: TextFieldProps(
                                decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.search),
                                    hintStyle: TextStyle(fontFamily: "poppins"),
                                    hintText: "Search",
                                    contentPadding: EdgeInsets.all(15))),
                            searchDelay: Duration(milliseconds: 10),
                          ),
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Mahasiswa",
                              hintText: "Pilih Mahasiswa",
                            ),
                          ),
                          itemAsString: (MahasiswaDetails user) =>
                              user.name ?? '',
                          onChanged: (List<MahasiswaDetails?> selectedItems) {
                            projectDetailsController.selectedMahasiswa
                                .clear(); // Bersihkan list ID sebelum menambahkan yang baru
                            projectDetailsController.selectedMahasiswa.addAll(
                                selectedItems.map((item) => item!
                                    .id!)); // Ambil ID dari item yang dipilih dan tambahkan ke list
                          },
                          asyncItems: (String filter) async {
                            try {
                              final dataResponse =
                                  await projectDetailsController
                                      .getUserMhsAccepted();
                              if (dataResponse != null) {
                                return dataResponse.data
                                    .where((user) => user.name!
                                        .contains(filter.toUpperCase()))
                                    .toList();
                              } else {
                                return []; // Mengembalikan list kosong jika dataResponse null
                              }
                            } catch (err) {
                              if (kDebugMode) {
                                print("Error: $err");
                              }
                              return []; // Mengembalikan list kosong jika terjadi kesalahan
                            }
                          },
                          validator: (value) {
                            if (value == null) {
                              return "* Mahasiswa Harus Di Pilih";
                            }
                            return null;
                          },
                        ))),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                     projectDetailsController.pilihFile1();
                  },
                  child: Container(
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
                          Obx(() => Flexible(
                                child: Text(
                                  projectDetailsController.isFilepath1.value ==
                                          true
                                      ? projectDetailsController
                                          .filePathLampiran1.value
                                      : "Lampiran *",
                                  overflow: TextOverflow.ellipsis,
                                  style: projectDetailsController
                                          .isFilepath1.value
                                      ? ColorApp.secondColorTextStyly(context)
                                          .copyWith(
                                              fontSize: 17, fontWeight: medium)
                                      : TextStyle(
                                          fontSize: 17,
                                          fontWeight: medium,
                                          color: Colors
                                              .red, // Warna merah untuk menunjukkan validasi
                                        ),
                                ),
                              )),
                          const Icon(
                            Icons.file_present_rounded,
                            color: greyColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    await projectDetailsController.pilihFile2();
                  },
                  child: Container(
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
                          Obx(() => Flexible(
                                child: Text(
                                  projectDetailsController.isFilepath2.value ==
                                          true
                                      ? projectDetailsController
                                          .filePathLampiran2.value
                                      : "Opsional Lampiran",
                                  overflow: TextOverflow.ellipsis,
                                  style: ColorApp.secondColorTextStyly(context)
                                      .copyWith(
                                          fontSize: 17, fontWeight: medium),
                                ),
                              )),
                          const Icon(
                            Icons.file_present_rounded,
                            color: greyColor,
                          )
                        ],
                      ),
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
                      controller: projectDetailsController.noteC,
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
                            borderSide:
                                const BorderSide(color: colorTransparan),
                            borderRadius: BorderRadius.circular(8),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* Catatan Harus Dimasukan";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
