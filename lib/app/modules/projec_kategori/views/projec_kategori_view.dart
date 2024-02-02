import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/component/widget_appbar.dart';
import '../../../utils/component/widget_poject_terbaru.dart';
import '../controllers/projec_kategori_controller.dart';

class ProjecKategoriView extends GetView<ProjecKategoriController> {

  const ProjecKategoriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final kategoriC = Get.find<ProjecKategoriController>();

    return Scaffold(
      appBar: AppbarTransparant(title:"${kategoriC.kategoriProject}"),
      body: CustomScrollView(
          slivers: [
            //  SliverToBoxAdapter(
            //   child: Text("${kategoriC.kategoriProject}")
            // ),
            SliverPrototypeExtentList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(left:15.0, right: 15, bottom: 20),
                            child: WidgetPojectTerbaru(),
                          );
                        },childCount: 10
                      ),
                      prototypeItem: const WidgetPojectTerbaru()
                    )
          ],
        )
      
    );
  }
}
