import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/projec_kategori/bindings/projec_kategori_binding.dart';
import '../modules/projec_kategori/views/projec_kategori_view.dart';
import '../modules/project_details/bindings/project_details_binding.dart';
import '../modules/project_details/views/project_details_view.dart';
import '../modules/project_progress/bindings/project_progress_binding.dart';
import '../modules/project_progress/views/project_progress_view.dart';
import '../modules/regiter/bindings/regiter_binding.dart';
import '../modules/regiter/views/pick_role.dart';
import '../modules/regiter/views/regiter_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tesst/bindings/tesst_binding.dart';
import '../responsive/initial/bindings/initial_binding.dart';
import '../responsive/initial/views/initial_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGITER,
      page: () => const RegiterView(),
      binding: RegiterBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.INITIAL,
      page: () => const InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: _Paths.PICKROLE,
      page: () => const PickRoleScreen(),
      binding: TesstBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_PROGRESS,
      page: () => const ProjectProgressView(),
      binding: ProjectProgressBinding(),
      children: [
        GetPage(
          name: _Paths.PROJECT_PROGRESS,
          page: () => const ProjectProgressView(),
          binding: ProjectProgressBinding(),
        ),
        GetPage(
          name: _Paths.PROJECT_PROGRESS,
          page: () => const ProjectProgressView(),
          binding: ProjectProgressBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PROJECT_DETAILS,
      page: () => const ProjectDetailsView(),
      binding: ProjectDetailsBinding(),
      children: [
        GetPage(
          name: _Paths.PROJECT_DETAILS,
          page: () => const ProjectDetailsView(),
          binding: ProjectDetailsBinding(),
        ),
        GetPage(
          name: _Paths.PROJECT_DETAILS,
          page: () => const ProjectDetailsView(),
          binding: ProjectDetailsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PROJEC_KATEGORI,
      page: () => const ProjecKategoriView(),
      binding: ProjecKategoriBinding(),
    ),
  ];
}
