import 'package:get/get.dart';
import 'package:rai/modules/log_in/log_in_binding.dart';
import 'package:rai/modules/log_in/log_in_view.dart';
import 'package:rai/modules/otp_page/email_otp/email_otp_binding.dart';
import 'package:rai/modules/otp_page/email_otp/email_otp_view.dart';
import 'package:rai/modules/otp_page/mobile_otp/mobile_otp_binding.dart';
import 'package:rai/modules/otp_page/mobile_otp/mobile_otp_view.dart';
import 'package:rai/modules/set_profile/set_profile_view.dart';
import 'package:rai/modules/sign_up/1st_page/1st_page.dart';
import 'package:rai/modules/sign_up/2nd_page/2nd_page_binding.dart';
import 'package:rai/modules/sign_up/2nd_page/2nd_page_view.dart';
import 'package:rai/modules/user_credentials_page/user_credentials_page_binding.dart';
import 'package:rai/modules/user_credentials_page/user_credentials_page_view.dart';
import 'package:rai/utils/app_pages.dart';

class AppRoutes {
 static var getpages=[
    GetPage(name: AppPages.login, page: () => LogInView(),binding: LogInBinding()),
    GetPage(name: AppPages.page, page: () => Firstpage(),),
    GetPage(name: AppPages.secondpage, page:  () => SecondPageView(),binding: SecondPageBinding()),
    GetPage(name: AppPages.emailotp, page: () => EmailOtpView(),binding: EmailOtpBinding()),
    GetPage(name: AppPages.usercredentials, page: () => UserCredentialsPageView(),binding: UserCredentialsPageBinding()),
    GetPage(name: AppPages.setUpProfile, page:() => SetProfileView(), ),
    GetPage(name: AppPages.mobileotp, page: () => MobileOtpView(),binding: MobileOtpBinding())
  ];
}