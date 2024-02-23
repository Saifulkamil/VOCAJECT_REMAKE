import 'package:get/get.dart';

import '../modules/anggota/bindings/anggota_binding.dart';
import '../modules/anggota/views/anggota_view.dart';
import '../modules/changeTheme/bindings/change_theme_binding.dart';
import '../modules/changeTheme/views/change_theme_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/konsultasi/bindings/konsultasi_binding.dart';
import '../modules/konsultasi/views/konsultasi_view.dart';
import '../modules/konsultasi/views/list_chat.dart';
import '../modules/langued/bindings/langued_binding.dart';
import '../modules/langued/views/langued_view.dart';
import '../modules/logbook/bindings/logbook_binding.dart';
import '../modules/logbook/views/list_mhs_logbook.dart';
import '../modules/logbook/views/logbook_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_industri.dart';
import '../modules/profile/views/profile_industri_2.dart';
import '../modules/profile/views/profile_people.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/projec_kategori/bindings/projec_kategori_binding.dart';
import '../modules/projec_kategori/views/projec_kategori_view.dart';
import '../modules/project_details/bindings/project_details_binding.dart';
import '../modules/project_details/views/project_details_pending_view.dart';
import '../modules/project_details/views/project_details_view.dart';
import '../modules/project_history/bindings/project_history_binding.dart';
import '../modules/project_history/views/project_history_company_college_view.dart';
import '../modules/project_history/views/project_history_dosen_view.dart';
import '../modules/project_history/views/project_history_mhs_view.dart';
import '../modules/project_progress/bindings/project_progress_binding.dart';
import '../modules/project_progress/views/project_progress_view.dart';
import '../modules/project_terbaru_all/bindings/project_terbaru_all_binding.dart';
import '../modules/project_terbaru_all/views/project_terbaru_all_view.dart';
import '../modules/regiter/bindings/regiter_binding.dart';
import '../modules/regiter/views/pick_role.dart';
import '../modules/regiter/views/regiter_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/atur_ulang_password_klik_email.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/target_project/bindings/target_project_binding.dart';
import '../modules/target_project/views/target_project_view.dart';
import '../responsive/initial/bindings/initial_binding.dart';
import '../responsive/initial/views/initial_view.dart';
import '../utils/component/navigationBar.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class NavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationBar>(
      () => const NavigationBar(),
    );
  }
}

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

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
      name: _Paths.LIST_MHS_LOGBOOK,
      page: () => const ListMhsLogbook(),
      binding: LogbookBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATIONBAR,
      page: () => const NavigationBar(),
      binding: NavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.INITIAL,
      page: () => const InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: _Paths.PICKROLE,
      page: () => const PickRoleScreen(),
      binding: RegiterBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_PROGRESS,
      page: () => const ProjectProgressView(),
      binding: ProjectProgressBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_DETAILS,
      page: () => const ProjectDetailsView(),
      binding: ProjectDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_DETAILS_PENDING,
      page: () => const ProjectDetailsPendingView(),
      binding: ProjectDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROJEC_KATEGORI,
      page: () => const ProjecKategoriView(),
      binding: ProjecKategoriBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_HISTORY_MHS,
      page: () => const ProjectHistoryMSHView(),
      binding: ProjectHistoryBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_HISTORY_DOSEN,
      page: () => const ProjectHistoryDosenView(),
      binding: ProjectHistoryBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_HISTORY_COMPANY_COLLEGE,
      page: () => const ProjectHistoryCompanyCollegeView(),
      binding: ProjectHistoryBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_view,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_THEME,
      page: () => const ChangeThemeView(),
      binding: ChangeThemeBinding(),
    ),
    GetPage(
      name: _Paths.LANGUED,
      page: () => const LanguedView(),
      binding: LanguedBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.TARGET_PROJECT,
      page: () => const TargetProjectView(),
      binding: TargetProjectBinding(),
    ),
    GetPage(
      name: _Paths.KONSULTASI,
      page: () => const KonsultasiView(),
      binding: KonsultasiBinding(),
    ),
    GetPage(
      name: _Paths.LOGBOOK,
      page: () => const LogbookView(),
      binding: LogbookBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD_KLIK,
      page: () => const AturUlangPasswordklikEmail(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.LIST_CHAT,
      page: () => const ListChat(),
      binding: KonsultasiBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PEOPLE,
      page: () => const ProfilePeople(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_INDUSTRI,
      page: () => const Profileindustri(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_INDUSTRI_2,
      page: () => const Profileindustri_2(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_TERBARU_ALL,
      page: () => const ProjectTerbaruAllView(),
      binding: ProjectTerbaruAllBinding(),
    ),
    GetPage(
      name: _Paths.ANGGOTA,
      page: () => const AnggotaView(),
      binding: AnggotaBinding(),
    ),
  ];
}
