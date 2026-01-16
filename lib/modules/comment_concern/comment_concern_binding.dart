import 'package:get/get.dart';
import 'package:rai/modules/comment_concern/comment_concern_controller.dart';

class CommentConcernBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<CommentConcernController>(()=>CommentConcernController());
  }
}