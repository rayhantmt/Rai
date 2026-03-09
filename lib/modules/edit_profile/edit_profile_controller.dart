import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  Rx<DateTime> birthdate = DateTime.now().obs;
  final ImagePicker _picker = ImagePicker();
  Rxn<XFile> profileImage = Rxn<XFile>();
  Future<void> pickProfileImage() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (picked != null) {
        profileImage.value = picked;
      } else {
        print('Profile pick cancelled');
      }
    } catch (e) {
      print('Error picking profile image: $e');
      Get.snackbar('Error', 'Failed to pick profile image: $e');
    }
  }

  final token=GetStorage().read('token');
  final firstname=GetStorage().read('firstname')??"Error loading name";
  final lastname=GetStorage().read('lastname')??'';
  final profileimage=GetStorage().read('profileimage')??"loading";
  final username=GetStorage().read('username');
  final bio=GetStorage().read('bio');
  final dateofbirth=GetStorage().read('dateofbirth');
}
