import 'package:get/get.dart';
import 'package:rai/modules/log_in/log_in_binding.dart';
import 'package:rai/modules/log_in/log_in_view.dart';
import 'package:rai/modules/sign_up/1st_page/1st_page.dart';
import 'package:rai/utils/app_pages.dart';

class AppRoutes {
 static var getpages=[
    GetPage(name: AppPages.login, page: () => LogInView(),binding: LogInBinding()),
    GetPage(name: AppPages.page, page: () => Firstpage(),)
  ];
}