import 'package:get/get.dart';
import 'package:rai/modules/log_in/log_in_view.dart';
import 'package:rai/utils/app_pages.dart';

class AppRoutes {
  List getpages=[
    GetPage(name: AppPages.login, page: () => LogInView(),)
  ];
}