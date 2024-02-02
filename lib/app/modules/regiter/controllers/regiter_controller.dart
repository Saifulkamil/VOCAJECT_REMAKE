import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../../utils/colors.dart';



class RegiterController extends GetxController {

   String? role;

  @override
  void onInit() {
    super.onInit();
    role = Get.arguments;
  }

  List<GlobalKey<FormState>> formkeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  RxBool aishidden = true.obs;
  RxBool bishidden = true.obs;

  var currentStep = 0.obs;

  List<Step> viewStep(BuildContext context) {
    return [
      Step(
          title: Text(
            "Identitas",
            style: ColorApp.secondColorTextStyly(context)
                .copyWith(fontSize: 15, fontWeight: medium),
          ),
          content: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkeys[0],
            child: Column(
              children: [
                TextFormField(
                    // validator: (vnama) {
                    //   if (vnama == null || vnama.isEmpty) {
                    //     return "* Nama Tidak Boleh kosong";
                    //   }
                    //   return null;
                    // },
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    cursorColor: Theme.of(context).colorScheme.secondary,
                    // controller: namaC,
                    decoration: InputDecoration(
                      label: Text(
                        Nama,
                        style: ColorApp.secondColorTextStyly(context).copyWith(
                          fontSize: 15,
                        ),
                      ),
                      hintText: Nama,
                      hintStyle:
                          ColorApp.secondColorTextStyly(context).copyWith(),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                      ),
                    )),
                TextFormField(
                    // validator: (vnim) {
                    //   if (vnim == null || vnim.isEmpty) {
                    //     return "* Nim Tidak Boleh kosong";
                    //   }
                    //   return null;
                    // },
                    cursorColor: Theme.of(context).colorScheme.secondary,
                    keyboardType: TextInputType.number,
                    // controller: nimC,
                    decoration: InputDecoration(
                      label: Text(
                        NIM,
                        style: ColorApp.secondColorTextStyly(context).copyWith(
                          fontSize: 15,
                        ),
                      ),
                      hintStyle:
                          ColorApp.secondColorTextStyly(context).copyWith(),
                      hintText: NIM,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                      ),
                    )),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  // validator: (vdaerah) {
                  //   if (vdaerah == null || vdaerah.isEmpty) {
                  //     return "* Alamat Tidak Boleh kosong";
                  //   }
                  //   return null;
                  // },
                  keyboardType: TextInputType.streetAddress,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  // controller: alamatC,
                  decoration: InputDecoration(
                    label: Text(Alamat,
                        style: ColorApp.secondColorTextStyly(context).copyWith(
                          fontSize: 15,
                        )),
                    hintStyle:
                        ColorApp.secondColorTextStyly(context).copyWith(),
                    hintText: Alamat,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                  ),
                )
              ],
            ),
          ),
          isActive: currentStep.value >= 0,
          state:
              currentStep.value > 0 ? StepState.complete : StepState.indexed),
      Step(
          title: Text(
            Universitas,
            style: ColorApp.secondColorTextStyly(context)
                .copyWith(fontSize: 15, fontWeight: medium),
          ),
          content: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkeys[1],
            child: Column(
              children: [
                DropdownSearch
                    // <KampusModel>
                    (
                  // asyncItems: (String filter) async {
                  //   Uri url =
                  //       Uri.parse("${UrlDomain.baseurl}/api/user/r/college");

                  //   try {
                  //     final response = await http.get(url);
                  //     var data =
                  //         json.decode(response.body) as Map<String, dynamic>;
                  //     print(data);

                  //     var ListAllKampus = data["data"] as List<dynamic>;
                  //     var models = KampusModel.fromJsonList(ListAllKampus);
                  //     for (var model in models) {
                  //       model.name = model.name?.capitalize;
                  //     }

                  //     return models;
                  //   } catch (err) {
                  //     print(err);
                  //     return List<KampusModel>.empty();
                  //   }
                  // },
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.search,
                        color: greyColor,
                      ),
                      hintStyle:
                          ColorApp.secondColorTextStyly(context).copyWith(),
                      hintText: cari_Kampus,
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                      ),
                    )),
                    searchDelay: const Duration(milliseconds: 10),
                  ),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: Kampus,
                        labelStyle:
                            ColorApp.secondColorTextStyly(context).copyWith(),
                        hintText: Pilih_Kampus_Kamu,
                        hintStyle:
                            ColorApp.secondColorTextStyly(context).copyWith(),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                        ),
                        suffixIconColor: greyColor),
                  ),
                  // itemAsString: (KampusModel u) {
                  //   return kampusC = u.name!;
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
                ),
              ],
            ),
          ),
          isActive: currentStep.value >= 1,
          state:
              currentStep.value > 1 ? StepState.complete : StepState.indexed),
      Step(
          title: Text(
            Akun,
            style: ColorApp.secondColorTextStyly(context).copyWith(
              fontSize: 15,
            ),
          ),
          content: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkeys[2],
            child: Column(
              children: [
                TextFormField(
                  // validator: (vemail) {
                  //   if (vemail!.isEmpty) {
                  //     return "* Email Harus Di Masukan";
                  //   }

                  //   final emailRegex = RegExp(
                  //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  //   if (!emailRegex.hasMatch(vemail)) {
                  //     return "* Masukan Email Yang Benar";
                  //   }
                  //   return null;
                  // },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  // controller: emailC,
                  decoration: InputDecoration(
                      label: Text(
                        Email,
                        style: ColorApp.secondColorTextStyly(context).copyWith(
                          fontSize: 15,
                        ),
                      ),
                      hintStyle:
                          ColorApp.secondColorTextStyly(context).copyWith(
                        fontSize: 15,
                      ),
                      hintText: Email,
                     focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),),
                ),
                TextFormField(
                  // validator: (vphone) {
                  //   if (vphone == null || vphone.isEmpty) {
                  //     return "* No Hp Tidak Boleh kosong";
                  //   }
                  //   return null;
                  // },
                  keyboardType: TextInputType.phone,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  // controller: phoneC,
                  decoration:  InputDecoration(
                      label: Text(No_Telepon,
                          style: ColorApp.secondColorTextStyly(context).copyWith(
                        fontSize: 15,
                      ),),
                      hintStyle: ColorApp.secondColorTextStyly(context).copyWith(
                        fontSize: 15,
                      ),
                      hintText: No_Telepon,
                      focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),),
                ),
                TextFormField(
                  // validator: (vpass) {
                  //   if (vpass == null || vpass.isEmpty) {
                  //     return "* Sandi Tidak Boleh kosong";
                  //   } else if (vpass.length < 8) {
                  //     return "* Sandi harus 8 huruf";
                  //   }
                  //   return null;
                  // },
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  // controller: passwordC,
                  obscureText: aishidden.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        color: greyColor,
                        onPressed: () {
                          aishidden.toggle();
                        },
                        icon: Icon(aishidden.isFalse
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    label: Text(Kata_sandi,
                        style:  ColorApp.secondColorTextStyly(context).copyWith(
                        fontSize: 15,
                      ),),
                    hintStyle:   ColorApp.secondColorTextStyly(context).copyWith(
                        fontSize: 15,
                      ),
                    hintText: Kata_sandi,
                   focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                  ),
                ),
                TextFormField(
                  // validator: (vpass) {
                  //   if (vpass == null || vpass.isEmpty) {
                  //     return "* Sandi Tidak Boleh kosong";
                  //   } else if (vpass.length < 8) {
                  //     return "* Sandi harus 8 huruf";
                  //   }else if (vpass != passwordC.text) {
                  //     return "* Sandi Tidak Sesuai";
                  //   }
                  //   return null;
                  // },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: bishidden.value,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        color: greyColor,
                        onPressed: () {
                          bishidden.toggle();
                        },
                        icon: Icon(bishidden.isFalse
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    label: Text(Konfirmasi_kata_sandi,
                        style:  ColorApp.secondColorTextStyly(context).copyWith(
                        fontSize: 15,
                      ),),
                    hintStyle:   ColorApp.secondColorTextStyly(context).copyWith(
                        fontSize: 15,
                      ),
                    hintText: Konfirmasi_kata_sandi,
                   focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                  ),
                )
              ],
            ),
          ),
          isActive: currentStep.value >= 2,
          state:
              currentStep.value > 2 ? StepState.complete : StepState.indexed),
      Step(
        title: const Text("Selesai", style: TextStyle(fontFamily: "poppins")),
        content: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkeys[3],
          child: const Padding(
            padding: EdgeInsets.only(left: 0),
            // child: Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 8.0),
            //       child: Row(
            //         children: [
            //           const Icon(
            //             Icons.person,
            //           ),
            //           Flexible(
            //             child: Text(
            //               "  ${namaC.text} ",
            //               style: const TextStyle(
            //                   fontSize: 17, fontFamily: "poppins"),
            //               overflow: TextOverflow.ellipsis,
            //               maxLines: 1,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 8.0),
            //       child: Row(
            //         children: [
            //           const Icon(Icons.school),
            //           Flexible(
            //             child: Text(
            //               "  ${nimC.text} ",
            //               style: const TextStyle(fontSize: 17),
            //               overflow: TextOverflow.ellipsis,
            //               maxLines: 1,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 8.0),
            //       child: Row(
            //         children: [
            //           const Icon(Icons.account_balance),
            //           Flexible(
            //             child: Text(
            //               "  $kampusC ",
            //               style: const TextStyle(
            //                   fontSize: 16, fontFamily: "poppins"),
            //               overflow: TextOverflow.ellipsis,
            //               maxLines: 1,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 8.0),
            //       child: Row(
            //         children: [
            //           const Icon(Icons.pin_drop),
            //           Flexible(
            //             child: Text(
            //               "  ${alamatC.text} ",
            //               style: const TextStyle(
            //                   fontSize: 17, fontFamily: "poppins"),
            //               overflow: TextOverflow.ellipsis,
            //               maxLines: 1,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 8.0),
            //       child: Row(
            //         children: [
            //           const Icon(Icons.email),
            //           Flexible(
            //             child: Text(
            //               "  ${emailC.text} ",
            //               style: const TextStyle(
            //                   fontSize: 17, fontFamily: "poppins"),
            //               overflow: TextOverflow.ellipsis,
            //               maxLines: 1,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 8.0),
            //       child: Row(
            //         children: [
            //           const Icon(Icons.phone),
            //           Flexible(
            //             child: Text(
            //               "  ${phoneC.text} ",
            //               style: const TextStyle(
            //                   fontSize: 17, fontFamily: "poppins"),
            //               overflow: TextOverflow.ellipsis,
            //               maxLines: 1,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
        isActive: currentStep.value >= 3,
      ),
    ];
  }
}
