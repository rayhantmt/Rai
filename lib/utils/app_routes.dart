import 'package:get/get.dart';
import 'package:rai/modules/account_settings/account_settings_binding.dart';
import 'package:rai/modules/account_settings/account_settings_view.dart';
import 'package:rai/modules/comment_concern/comment_concern_binding.dart';
import 'package:rai/modules/comment_concern/comment_concern_view.dart';
import 'package:rai/modules/community/community_binding.dart';
import 'package:rai/modules/community/community_view.dart';
import 'package:rai/modules/community_chat_details/community_chat_details_binding.dart';
import 'package:rai/modules/community_chat_details/community_chat_details_view.dart';
import 'package:rai/modules/create_new_group/create_new_group_binding.dart';
import 'package:rai/modules/create_new_group/create_new_group_view.dart';
import 'package:rai/modules/edit_profile/edit_profile_binding.dart';
import 'package:rai/modules/edit_profile/edit_profile_view.dart';
import 'package:rai/modules/fotgot_password/otp_page/email_otp/email_otp_fp_binding.dart';
import 'package:rai/modules/fotgot_password/otp_page/email_otp/email_otp_fp_view.dart';
import 'package:rai/modules/fotgot_password/set_password_page/set_password_page_view.dart';
import 'package:rai/modules/fotgot_password/verificatio_page/verification_page_binding.dart';
import 'package:rai/modules/fotgot_password/verificatio_page/verification_page_view.dart';
import 'package:rai/modules/home/home_view.dart';
import 'package:rai/modules/log_in/log_in_binding.dart';
import 'package:rai/modules/log_in/log_in_view.dart';
import 'package:rai/modules/main_screen/main_screen_binding.dart';
import 'package:rai/modules/main_screen/main_screen_view.dart';
import 'package:rai/modules/more_section/more_section_binding.dart';
import 'package:rai/modules/more_section/more_section_view.dart';
import 'package:rai/modules/otp_page/email_otp/email_otp_binding.dart';
import 'package:rai/modules/otp_page/email_otp/email_otp_view.dart';
import 'package:rai/modules/otp_page/mobile_otp/mobile_otp_binding.dart';
import 'package:rai/modules/otp_page/mobile_otp/mobile_otp_view.dart';
import 'package:rai/modules/rai_chat/rai_chat_binding.dart';
import 'package:rai/modules/rai_chat/rai_chat_view.dart';
import 'package:rai/modules/rais_picks/rais_picks_bindings.dart';
import 'package:rai/modules/rais_picks/rais_picks_view.dart';
import 'package:rai/modules/set_profile/set_profile_view.dart';
import 'package:rai/modules/sign_up/1st_page/1st_page.dart';
import 'package:rai/modules/sign_up/2nd_page/2nd_page_binding.dart';
import 'package:rai/modules/sign_up/2nd_page/2nd_page_view.dart';
import 'package:rai/modules/community_details/community_details_binding.dart';
import 'package:rai/modules/community_details/community_details_view.dart';
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
    GetPage(name: AppPages.mobileotp, page: () => MobileOtpView(),binding: MobileOtpBinding()),
    GetPage(name: AppPages.verificationpage, page: () => VerificationPageView(),binding: VerificationPageBinding()),
    GetPage(name: AppPages.setpasswordpage, page: () => SetPasswordPageView(),),
    GetPage(name: AppPages.emailotpfp, page: () => EmailOtpFpView(),binding: EmailOtpFpBinding()),
    GetPage(name: AppPages.mainscreen, page: () => MainScreenView(),binding: MainScreenBinding() ),
    GetPage(name: AppPages.home, page: ()=>HomeView(),),
    GetPage(name: AppPages.community, page: ()=>CommunityView(),binding: CommunityBinding()),
    GetPage(name: AppPages.raichat, page: ()=>RaiChatView(),binding: RaiChatBinding()),
    GetPage(name: AppPages.raispicks, page: ()=>RaisPicksView(),binding: RaisPicksBindings()),
    GetPage(name: AppPages.more, page: ()=>MoreSectionView(),binding: MoreSectionBinding()),
    GetPage(name: AppPages.commentandconcern, page: ()=>CommentConcernView(),binding: CommentConcernBinding()),
    GetPage(name: AppPages.accountsetting, page: ()=>AccountSettingsView(),binding: AccountSettingsBinding()),
    GetPage(name: AppPages.editprofile, page: ()=>EditProfileView(),binding: EditProfileBinding()),
    GetPage(name: AppPages.createNewGroup, page: () => CreateNewGroupView(),binding: CreateNewGroupBinding()),
    GetPage(name: AppPages.communitychatdetails, page: () => CommunityChatDetailsView(),binding: CommunityChatDetailsBinding()),
    GetPage(name: AppPages.communityDetails, page: () => CommunityDetailsView(),binding: CommunityDetailsBinding())

  ];
}