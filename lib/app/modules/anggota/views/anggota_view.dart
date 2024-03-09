import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../controllers/anggota_controller.dart';

class AnggotaView extends GetView<AnggotaController> {
  const AnggotaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              toolbarHeight: 30,
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Center(
                  child: Text(" Anggota ",
                      style: ColorApp.secondColorTextStyly(context)
                          .copyWith(fontSize: 20, fontWeight: semiBold))),
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              elevation: 0,
              bottom: const TabBar(
                  indicatorColor: colorTransparan,
                  labelColor: greenColor,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: Center(
                          child: Text(
                        Mahasiswa,
                        style: TextStyle(fontSize: 13),
                      )),
                    ),
                    Tab(
                      child: Center(
                          child: Text(
                        Dosen,
                        style: TextStyle(fontSize: 13),
                      )),
                    ),
                  ]),
            ),
            body: TabBarView(children: [
              Scaffold(
                backgroundColor: Colors.transparent,
                body: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      appBar: AppBar(
                        backgroundColor: colorTransparan,
                        toolbarHeight: 5,
                        elevation: 0,
                        bottom: TabBar(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2.5, horizontal: 15),
                            indicatorColor: colorTransparan,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: greenColor),
                            labelColor: whiteColor,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "Aktif",
                                    style: TextStyle(fontSize: 15),
                                  )),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "Belum Terkonfirmasi",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 13),
                                  )),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "Di Tolak",
                                    style: TextStyle(fontSize: 15),
                                  )),
                                ),
                              ),
                            ]),
                      ),
                      body: const TabBarView(children: [
                        Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Center()),
                        Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Center()),
                        Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Center()),
                      ]),
                    )),
              ),
              Scaffold(
                body: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      appBar: AppBar(
                        backgroundColor: colorTransparan,
                        toolbarHeight: 5,
                        elevation: 0,
                        bottom: TabBar(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2.5, horizontal: 15),
                            indicatorColor: colorTransparan,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: greenColor),
                            labelColor: whiteColor,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "Aktif",
                                    style: TextStyle(fontSize: 15),
                                  )),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "Belum Terkonfirmasi",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 13),
                                  )),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "Di Tolak",
                                    style: TextStyle(fontSize: 15),
                                  )),
                                ),
                              ),
                            ]),
                      ),
                      body: const TabBarView(children: [
                        Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Center()),
                        Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Center()),
                        Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Center()),
                      ]),
                    )),
              ),
            ]),
          )),
    );
  }
}
