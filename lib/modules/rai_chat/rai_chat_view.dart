// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rai/modules/rai_chat/rai_chat_controller.dart';
// import 'package:rai/utils/app_images.dart';

// class RaiChatView extends GetView<RaiChatController> {
//   const RaiChatView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final textController = TextEditingController();
//     final scrollController = ScrollController();

//     ever(controller.messages, (_) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         if (scrollController.hasClients) {
//           scrollController.animateTo(
//             scrollController.position.maxScrollExtent,
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeOut,
//           );
//         }
//       });
//     });

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: AppImages.primarycolor,
//       body: Padding(
//         padding: EdgeInsets.only(
//           left: 20,
//           right: 20,
//           bottom: Get.height * 0.1,
//         ),
//         child: Column(
//           children: [
//             SizedBox(height: Get.height * 0.05),
//             Row(
//               children: [
//                 Image.asset(
//                   AppImages.logo,
//                   height: Get.height * 0.05,
//                   width: Get.width * 0.2,
//                 ),
//                 const Expanded(child: SizedBox()),
//                 GestureDetector(
//                   onTap: () {
//                     controller.fetchConversations();
//                     showModalBottomSheet(
//                       context: context,
//                       isScrollControlled: true,
//                       backgroundColor: Colors.transparent,
//                       builder: (_) => _HistorySheet(controller: controller),
//                     );
//                   },
//                   child: Icon(
//                     Icons.history,
//                     size: Get.height * 0.04,
//                     color: const Color(0xffEEEEF0),
//                   ),
//                 ),

//                 // More options
//                 GestureDetector(
//                   onTap: () => showModalBottomSheet(
//                     context: context,
//                     builder: (_) => Container(
//                       height: Get.height * 0.2,
//                       color: AppImages.primarycolor,
//                       child: Column(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Get.back();
//                               controller.startNewChat();
//                             },
//                             child: Row(
//                               children: [
//                                 Image.asset(
//                                   AppImages.newchaticon,
//                                   height: Get.height * .05,
//                                 ),
//                                 Text(
//                                   'New chat',
//                                   style: GoogleFonts.manrope(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 14,
//                                     color: const Color(0xffEEEEF0),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Get.back();
//                               controller.clearConversation();
//                             },
//                             child: Row(
//                               children: [
//                                 Image.asset(
//                                   AppImages.clearconversationicon,
//                                   height: Get.height * .05,
//                                 ),
//                                 Text(
//                                   'Clear this conversation',
//                                   style: GoogleFonts.manrope(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 14,
//                                     color: const Color(0xffEEEEF0),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   child: Icon(
//                     Icons.more_vert,
//                     size: Get.height * 0.04,
//                     color: const Color(0xffEEEEF0),
//                   ),
//                 ),
//               ],
//             ),

//             SizedBox(height: Get.height * 0.02),

//             // ── Chat body ─────────────────────────────────────
//             Expanded(
//               child: Obx(() {
//                 if (controller.messages.isEmpty &&
//                     !controller.isConnecting.value) {
//                   return Container(
//                     color: AppImages.primarycolor,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           AppImages.chatscreenblacklogo,
//                           height: Get.height * 0.05,
//                         ),
//                         Text(
//                           'Hi, There!',
//                           style: GoogleFonts.manrope(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 20,
//                             color: const Color(0xffEEEEF0),
//                           ),
//                         ),
//                         Text(
//                           "'Just ask me, what's on your mind?",
//                           style: GoogleFonts.manrope(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 14,
//                             color: const Color(0xffB2B3BD),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }

//                 if (controller.isConnecting.value &&
//                     controller.messages.isEmpty) {
//                   return Container(
//                     color: AppImages.primarycolor,
//                     child: const Center(
//                       child: CircularProgressIndicator(
//                         color: Color(0xffEEEEF0),
//                       ),
//                     ),
//                   );
//                 }

//                 return ListView.builder(
//                   controller: scrollController,
//                   padding: const EdgeInsets.only(top: 8, bottom: 8),
//                   itemCount:
//                       controller.messages.length +
//                       (controller.isAiTyping.value ? 1 : 0),
//                   itemBuilder: (context, index) {
//                     if (index == controller.messages.length) {
//                       return _TypingBubble();
//                     }
//                     return _MessageBubble(message: controller.messages[index]);
//                   },
//                 );
//               }),
//             ),

//             // ── Input row ─────────────────────────────────────
//             Obx(() {
//               final isRecording = controller.isRecording.value;
//               final isTranscribing = controller.isTranscribing.value;
//               final isUploadingImage = controller.isUploadingImage.value;

//               return Row(
//                 children: [
//                   // Image pick button
//                   GestureDetector(
//                     onTap: isUploadingImage
//                         ? null
//                         : controller.pickAndSendImage,
//                     child: isUploadingImage
//                         ? SizedBox(
//                             height: Get.height * 0.07,
//                             width: Get.height * 0.07,
//                             child: const Center(
//                               child: SizedBox(
//                                 width: 24,
//                                 height: 24,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   color: Color(0xffEEEEF0),
//                                 ),
//                               ),
//                             ),
//                           )
//                         : Image.asset(
//                             AppImages.imagepicking,
//                             height: Get.height * 0.07,
//                           ),
//                   ),

//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       color: isRecording
//                           ? const Color(
//                               0xff3A1A1A,
//                             ) // dark red tint when recording
//                           : const Color(0xff222325),
//                     ),
//                     height: Get.height * 0.07,
//                     width: Get.width * 0.72,
//                     child: Row(
//                       children: [
//                         // Text field — hidden while recording
//                         Expanded(
//                           child: isRecording
//                               ? Center(
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Icon(
//                                         Icons.fiber_manual_record,
//                                         color: Colors.red,
//                                         size: 12,
//                                       ),
//                                       const SizedBox(width: 6),
//                                       Text(
//                                         'Recording...',
//                                         style: GoogleFonts.manrope(
//                                           fontSize: 14,
//                                           color: const Color(0xffEEEEF0),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               : isTranscribing
//                               ? Center(
//                                   child: Text(
//                                     'Transcribing...',
//                                     style: GoogleFonts.manrope(
//                                       fontSize: 14,
//                                       color: const Color(0xffB2B3BD),
//                                     ),
//                                   ),
//                                 )
//                               : TextFormField(
//                                   controller: textController,
//                                   cursorColor: Colors.white,
//                                   style: const TextStyle(color: Colors.white),
//                                   enabled: !controller.isSending.value,
//                                   decoration: InputDecoration(
//                                     contentPadding: const EdgeInsets.only(
//                                       left: 15,
//                                     ),
//                                     hint: Center(
//                                       child: Text(
//                                         'Type message here...',
//                                         style: GoogleFonts.manrope(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 14,
//                                           color: const Color(0xffB2B3BD),
//                                         ),
//                                       ),
//                                     ),
//                                     border: InputBorder.none,
//                                   ),
//                                 ),
//                         ),

//                         // Send button
//                         GestureDetector(
//                           onTap: controller.isSending.value
//                               ? null
//                               : () {
//                                   controller.sendMessage(textController.text);
//                                   textController.clear();
//                                 },
//                           child: controller.isSending.value
//                               ? Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 8,
//                                   ),
//                                   child: SizedBox(
//                                     width: Get.height * 0.03,
//                                     height: Get.height * 0.03,
//                                     child: const CircularProgressIndicator(
//                                       strokeWidth: 2,
//                                       color: Color(0xffEEEEF0),
//                                     ),
//                                   ),
//                                 )
//                               : Image.asset(
//                                   AppImages.sendbutton,
//                                   height: Get.height * 0.045,
//                                 ),
//                         ),

//                         // Mic button — tap to start/stop recording
//                         GestureDetector(
//                           onTap: isTranscribing
//                               ? null
//                               : controller.toggleRecording,
//                           child: isTranscribing
//                               ? Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 4,
//                                   ),
//                                   child: SizedBox(
//                                     width: Get.height * 0.03,
//                                     height: Get.height * 0.03,
//                                     child: const CircularProgressIndicator(
//                                       strokeWidth: 2,
//                                       color: Color(0xffEEEEF0),
//                                     ),
//                                   ),
//                                 )
//                               : isRecording
//                               ? Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 4,
//                                   ),
//                                   child: Icon(
//                                     Icons.stop_circle,
//                                     color: Colors.red,
//                                     size: Get.height * 0.04,
//                                   ),
//                                 )
//                               : Image.asset(
//                                   AppImages.micIcon,
//                                   height: Get.height * 0.05,
//                                 ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             }),
//             SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ── History Bottom Sheet ──────────────────────────────────────
// class _HistorySheet extends StatelessWidget {
//   final RaiChatController controller;
//   const _HistorySheet({required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Get.height * 0.75,
//       decoration: BoxDecoration(
//         color: AppImages.primarycolor,
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       child: Column(
//         children: [
//           // Handle
//           Container(
//             margin: const EdgeInsets.only(top: 12),
//             width: 40,
//             height: 4,
//             decoration: BoxDecoration(
//               color: const Color(0xff444550),
//               borderRadius: BorderRadius.circular(2),
//             ),
//           ),

//           // Header
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Chat History',
//                   style: GoogleFonts.manrope(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 18,
//                     color: const Color(0xffEEEEF0),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Get.back();
//                     controller.startNewChat();
//                   },
//                   child: Row(
//                     children: [
//                       const Icon(Icons.add, color: Color(0xffEEEEF0), size: 18),
//                       const SizedBox(width: 4),
//                       Text(
//                         'New Chat',
//                         style: GoogleFonts.manrope(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                           color: const Color(0xffEEEEF0),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const Divider(color: Color(0xff2C2D30), height: 1),

//           // List
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoadingHistory.value) {
//                 return const Center(
//                   child: CircularProgressIndicator(color: Color(0xffEEEEF0)),
//                 );
//               }
//               if (controller.conversations.isEmpty) {
//                 return Center(
//                   child: Text(
//                     'No conversations yet',
//                     style: GoogleFonts.manrope(
//                       color: const Color(0xffB2B3BD),
//                       fontSize: 14,
//                     ),
//                   ),
//                 );
//               }
//               return ListView.separated(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 itemCount: controller.conversations.length,
//                 separatorBuilder: (_, __) =>
//                     const Divider(color: Color(0xff2C2D30), height: 1),
//                 itemBuilder: (_, i) {
//                   final conv = controller.conversations[i];
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 4,
//                     ),
//                     child: Row(
//                       children: [
//                         const Icon(
//                           Icons.chat_bubble_outline,
//                           color: Color(0xffB2B3BD),
//                           size: 18,
//                         ),
//                         const SizedBox(width: 12),

//                         // Title + date
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               Get.back();
//                               controller.loadConversation(conv.id);
//                             },
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   conv.title,
//                                   style: GoogleFonts.manrope(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 14,
//                                     color: const Color(0xffEEEEF0),
//                                   ),
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                                 Text(
//                                   controller.formatConvDate(conv.updatedAt),
//                                   style: GoogleFonts.manrope(
//                                     fontSize: 11,
//                                     color: const Color(0xff666770),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),

//                         // Delete icon
//                         GestureDetector(
//                           onTap: () => controller.deleteConversation(conv.id),
//                           child: const Padding(
//                             padding: EdgeInsets.all(8),
//                             child: Icon(
//                               Icons.delete_outline,
//                               color: Colors.red,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ── Message bubble ────────────────────────────────────────────
// class _MessageBubble extends StatelessWidget {
//   final ChatMessage message;
//   const _MessageBubble({required this.message});

//   @override
//   Widget build(BuildContext context) {
//     final isAi = message.isAi;
//     return Align(
//       alignment: isAi ? Alignment.centerLeft : Alignment.centerRight,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 4),
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//         constraints: BoxConstraints(maxWidth: Get.width * 0.75),
//         decoration: BoxDecoration(
//           color: isAi ? AppImages.primarycolor : const Color(0xff222325),
//           borderRadius: BorderRadius.only(
//             topLeft: const Radius.circular(16),
//             topRight: const Radius.circular(16),
//             bottomLeft: Radius.circular(isAi ? 0 : 16),
//             bottomRight: Radius.circular(isAi ? 16 : 0),
//           ),
//         ),
//         child: message.status == 'processing'
//             ? const SizedBox(
//                 width: 40,
//                 height: 14,
//                 child: LinearProgressIndicator(
//                   backgroundColor: Colors.transparent,
//                   color: Color(0xffEEEEF0),
//                 ),
//               )
//             : message.imageUrl != null
//             // Show image if present
//             ? ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   message.imageUrl!,
//                   width: Get.width * 0.6,
//                   fit: BoxFit.cover,
//                 ),
//               )
//             : Text(
//                 message.text,
//                 style: GoogleFonts.manrope(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: const Color(0xffEEEEF0),
//                 ),
//               ),
//       ),
//     );
//   }
// }

// // ── Typing bubble ─────────────────────────────────────────────
// class _TypingBubble extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 4),
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//         decoration: const BoxDecoration(
//           color: Color(0xff2C2D30),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(16),
//             topRight: Radius.circular(16),
//             bottomRight: Radius.circular(16),
//           ),
//         ),
//         child: const SizedBox(
//           width: 40,
//           height: 14,
//           child: LinearProgressIndicator(
//             backgroundColor: Colors.transparent,
//             color: Color(0xffEEEEF0),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/modules/rai_chat/rai_chat_controller.dart';
import 'package:rai/utils/app_images.dart';

class RaiChatView extends GetView<RaiChatController> {
  const RaiChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final scrollController = ScrollController();

    ever(controller.messages, (_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: Get.height * 0.1),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.05),

            // ── Top bar ───────────────────────────────────────
            Row(
              children: [
                Image.asset(
                  AppImages.logo,
                  height: Get.height * 0.05,
                  width: Get.width * 0.2,
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    controller.fetchConversations();
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => _HistorySheet(controller: controller),
                    );
                  },
                  child: Icon(
                    Icons.history,
                    size: Get.height * 0.04,
                    color: const Color(0xffEEEEF0),
                  ),
                ),
                GestureDetector(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (_) => Container(
                      height: Get.height * 0.2,
                      color: AppImages.primarycolor,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              controller.startNewChat();
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.newchaticon,
                                  height: Get.height * .05,
                                ),
                                Text(
                                  'New chat',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: const Color(0xffEEEEF0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              controller.clearConversation();
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.clearconversationicon,
                                  height: Get.height * .05,
                                ),
                                Text(
                                  'Clear this conversation',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: const Color(0xffEEEEF0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: Icon(
                    Icons.more_vert,
                    size: Get.height * 0.04,
                    color: const Color(0xffEEEEF0),
                  ),
                ),
              ],
            ),

            SizedBox(height: Get.height * 0.02),

            // ── Chat body ─────────────────────────────────────
            Expanded(
              child: Obx(() {
                if (controller.messages.isEmpty &&
                    !controller.isConnecting.value) {
                  return Container(
                    color: AppImages.primarycolor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.chatscreenblacklogo,
                          height: Get.height * 0.05,
                        ),
                        Text(
                          'Hi, There!',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: const Color(0xffEEEEF0),
                          ),
                        ),
                        Text(
                          "'Just ask me, what's on your mind?",
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color(0xffB2B3BD),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (controller.isConnecting.value &&
                    controller.messages.isEmpty) {
                  return Container(
                    color: AppImages.primarycolor,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffEEEEF0),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  itemCount:
                      controller.messages.length +
                      (controller.isAiTyping.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == controller.messages.length) {
                      return _TypingBubble();
                    }
                    return _MessageBubble(message: controller.messages[index]);
                  },
                );
              }),
            ),

            // ── Image preview strip ───────────────────────────
            // Shows the selected image ABOVE the input row so the user can
            // review it (and optionally remove it) before sending.
            Obx(() {
              final imagePath = controller.selectedImagePath.value;
              final isUploading = controller.isUploadingImage.value;

              // Show strip only when an image is selected/uploading
              if (imagePath.isEmpty && !isUploading) return const SizedBox();

              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xff222325),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    // Thumbnail or uploading indicator
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: isUploading
                          ? Container(
                              width: 56,
                              height: 56,
                              color: const Color(0xff2C2D30),
                              child: const Center(
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Color(0xffEEEEF0),
                                  ),
                                ),
                              ),
                            )
                          : Image.file(
                              File(imagePath),
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
                            ),
                    ),

                    const SizedBox(width: 10),

                    // Label
                    Expanded(
                      child: Text(
                        isUploading
                            ? 'Uploading image…'
                            : 'Image ready to send',
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          color: const Color(0xffB2B3BD),
                        ),
                      ),
                    ),

                    // Remove button — only when upload is done
                    if (!isUploading)
                      GestureDetector(
                        onTap: controller.removePendingImage,
                        child: const Icon(
                          Icons.close,
                          color: Color(0xffB2B3BD),
                          size: 20,
                        ),
                      ),
                  ],
                ),
              );
            }),

            // ── Input row ─────────────────────────────────────
            //Obx(() {
            //   final isRecording = controller.isRecording.value;
            //   final isTranscribing = controller.isTranscribing.value;
            //   final isUploadingImage = controller.isUploadingImage.value;

            //   return Row(
            //     children: [
            //       // Image pick button
            //       GestureDetector(
            //         onTap:
            //             isUploadingImage ? null : controller.pickAndSendImage,
            //         child: isUploadingImage
            //             ? SizedBox(
            //                 height: Get.height * 0.07,
            //                 width: Get.height * 0.07,
            //                 child: const Center(
            //                   child: SizedBox(
            //                     width: 24,
            //                     height: 24,
            //                     child: CircularProgressIndicator(
            //                       strokeWidth: 2,
            //                       color: Color(0xffEEEEF0),
            //                     ),
            //                   ),
            //                 ),
            //               )
            //             : Image.asset(
            //                 AppImages.imagepicking,
            //                 height: Get.height * 0.07,
            //               ),
            //       ),

            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(100),
            //           color: isRecording
            //               ? const Color(0xff3A1A1A)
            //               : const Color(0xff222325),
            //         ),
            //         height: Get.height * 0.07,
            //         width: Get.width * 0.72,
            //         child: Row(
            //           children: [
            //             // Text field — hidden while recording
            //             Expanded(
            //               child: isRecording
            //                   ? Center(
            //                       child: Row(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           const Icon(
            //                             Icons.fiber_manual_record,
            //                             color: Colors.red,
            //                             size: 12,
            //                           ),
            //                           const SizedBox(width: 6),
            //                           Text(
            //                             'Recording...',
            //                             style: GoogleFonts.manrope(
            //                               fontSize: 14,
            //                               color: const Color(0xffEEEEF0),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     )
            //                   : isTranscribing
            //                       ? Center(
            //                           child: Text(
            //                             'Transcribing...',
            //                             style: GoogleFonts.manrope(
            //                               fontSize: 14,
            //                               color: const Color(0xffB2B3BD),
            //                             ),
            //                           ),
            //                         )
            //                       : TextFormField(

            //                         keyboardType: TextInputType.multiline,
            //                         maxLines: 3,
            //                           controller: textController,
            //                           cursorColor: Colors.white,
            //                           style:
            //                               const TextStyle(color: Colors.white),
            //                           enabled: !controller.isSending.value,
            //                           decoration: InputDecoration(
            //                             contentPadding:
            //                                 const EdgeInsets.only(left: 15,bottom: 10),
            //                             hint: Center(
            //                               child: Text(
            //                                 'Type message here...',
            //                                 style: GoogleFonts.manrope(
            //                                   fontWeight: FontWeight.w500,
            //                                   fontSize: 14,
            //                                   color: const Color(0xffB2B3BD),
            //                                 ),
            //                               ),
            //                             ),
            //                             border: InputBorder.none,
            //                           ),
            //                         ),
            //             ),

            //             // Send button
            //             GestureDetector(
            //               onTap: controller.isSending.value
            //                   ? null
            //                   : () {
            //                       controller.sendMessage(textController.text);
            //                       textController.clear();
            //                     },
            //               child: controller.isSending.value
            //                   ? Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 8),
            //                       child: SizedBox(
            //                         width: Get.height * 0.03,
            //                         height: Get.height * 0.03,
            //                         child: const CircularProgressIndicator(
            //                           strokeWidth: 2,
            //                           color: Color(0xffEEEEF0),
            //                         ),
            //                       ),
            //                     )
            //                   : Image.asset(
            //                       AppImages.sendbutton,
            //                       height: Get.height * 0.045,
            //                     ),
            //             ),

            //             // Mic button
            //             GestureDetector(
            //               onTap: isTranscribing
            //                   ? null
            //                   : controller.toggleRecording,
            //               child: isTranscribing
            //                   ? Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 4),
            //                       child: SizedBox(
            //                         width: Get.height * 0.03,
            //                         height: Get.height * 0.03,
            //                         child: const CircularProgressIndicator(
            //                           strokeWidth: 2,
            //                           color: Color(0xffEEEEF0),
            //                         ),
            //                       ),
            //                     )
            //                   : isRecording
            //                       ? Padding(
            //                           padding: const EdgeInsets.symmetric(
            //                               horizontal: 4),
            //                           child: Icon(
            //                             Icons.stop_circle,
            //                             color: Colors.red,
            //                             size: Get.height * 0.04,
            //                           ),
            //                         )
            //                       : Image.asset(
            //                           AppImages.micIcon,
            //                           height: Get.height * 0.05,
            //                         ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   );
            // }),
            // Replace your existing input row Obx block with this:
            Obx(() {
              final isRecording = controller.isRecording.value;
              final isTranscribing = controller.isTranscribing.value;
              final isUploadingImage = controller.isUploadingImage.value;
              final isSending = controller.isSending.value;
              final isExpanded = controller.isInputExpanded.value; // NEW

              final showSend =
                  controller.inputText.value.trim().isNotEmpty ||
                  controller.selectedImagePath.value.isNotEmpty ||
                  isSending;

              return Row(
                children: [
                  // ── + / collapse button ────────────────────────────
                  GestureDetector(
                    onTap: () => controller.isInputExpanded.toggle(),
                    child: AnimatedRotation(
                      turns: isExpanded
                          ? 0.125
                          : 0, // 45° when open → looks like ×
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.add_circle_outline,
                        size: Get.height * 0.045,
                        color: const Color(0xffEEEEF0),
                      ),
                    ),
                  ),

                  // ── Image + Mic slide in when expanded ─────────────
                  AnimatedSize(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    child: isExpanded
                        ? Row(
                            children: [
                              const SizedBox(width: 6),

                              // Image pick
                              GestureDetector(
                                onTap: isUploadingImage
                                    ? null
                                    : controller.pickAndSendImage,
                                child: isUploadingImage
                                    ? SizedBox(
                                        height: Get.height * 0.055,
                                        width: Get.height * 0.055,
                                        child: const Center(
                                          child: SizedBox(
                                            width: 22,
                                            height: 22,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: Color(0xffEEEEF0),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Image.asset(
                                        AppImages.imagepicking,
                                        height: Get.height * 0.055,
                                      ),
                              ),

                              const SizedBox(width: 4),

                              // Mic — only shown here when panel is open AND no text/image
                              if (!showSend)
                                GestureDetector(
                                  onTap: isTranscribing
                                      ? null
                                      : controller.toggleRecording,
                                  child: isTranscribing
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          child: SizedBox(
                                            width: Get.height * 0.03,
                                            height: Get.height * 0.03,
                                            child:
                                                const CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  color: Color(0xffEEEEF0),
                                                ),
                                          ),
                                        )
                                      : isRecording
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          child: Icon(
                                            Icons.stop_circle,
                                            color: Colors.red,
                                            size: Get.height * 0.045,
                                          ),
                                        )
                                      : Image.asset(
                                          AppImages.micIcon,
                                          height: Get.height * 0.055,
                                        ),
                                ),

                              const SizedBox(width: 4),
                            ],
                          )
                        : const SizedBox(),
                  ),

                  // ── Text input pill ────────────────────────────────
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: isRecording
                            ? const Color(0xff3A1A1A)
                            : const Color(0xff222325),
                      ),
                      height: Get.height * 0.07,
                      child: Row(
                        children: [
                          Expanded(
                            child: isRecording
                                ? Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.fiber_manual_record,
                                          color: Colors.red,
                                          size: 12,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          'Recording...',
                                          style: GoogleFonts.manrope(
                                            fontSize: 14,
                                            color: const Color(0xffEEEEF0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : isTranscribing
                                ? Center(
                                    child: Text(
                                      'Transcribing...',
                                      style: GoogleFonts.manrope(
                                        fontSize: 14,
                                        color: const Color(0xffB2B3BD),
                                      ),
                                    ),
                                  )
                                : TextFormField(
                                    controller: textController,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 3,
                                    cursorColor: Colors.white,
                                    style: const TextStyle(color: Colors.white),
                                    enabled: !isSending,
                                    onChanged: (v) =>
                                        controller.inputText.value = v,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                        left: 15,
                                        bottom: 10,
                                      ),
                                      hint: Center(
                                        child: Text(
                                          'Type message here...',
                                          style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: const Color(0xffB2B3BD),
                                          ),
                                        ),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                          ),

                          // ── Send OR Mic inside the pill ───────────
                          if (showSend)
                            // Send button / spinner
                            GestureDetector(
                              onTap: isSending
                                  ? null
                                  : () {
                                      controller.sendMessage(
                                        textController.text,
                                      );
                                      textController.clear();
                                    },
                              child: isSending
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: SizedBox(
                                        width: Get.height * 0.03,
                                        height: Get.height * 0.03,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Color(0xffEEEEF0),
                                        ),
                                      ),
                                    )
                                  : Image.asset(
                                      AppImages.sendbutton,
                                      height: Get.height * 0.045,
                                    ),
                            )
                          else if (!isExpanded)
                            // Mic inside pill — only when panel is collapsed
                            // (when expanded, mic lives outside in the expanded panel)
                            GestureDetector(
                              onTap: isTranscribing
                                  ? null
                                  : controller.toggleRecording,
                              child: isTranscribing
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: SizedBox(
                                        width: Get.height * 0.03,
                                        height: Get.height * 0.03,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Color(0xffEEEEF0),
                                        ),
                                      ),
                                    )
                                  : isRecording
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: Icon(
                                        Icons.stop_circle,
                                        color: Colors.red,
                                        size: Get.height * 0.04,
                                      ),
                                    )
                                  : Image.asset(
                                      AppImages.micIcon,
                                      height: Get.height * 0.05,
                                    ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),

            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}

// ── History Bottom Sheet ──────────────────────────────────────
class _HistorySheet extends StatelessWidget {
  final RaiChatController controller;
  const _HistorySheet({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.75,
      decoration: BoxDecoration(
        color: AppImages.primarycolor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xff444550),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chat History',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: const Color(0xffEEEEF0),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    controller.startNewChat();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.add, color: Color(0xffEEEEF0), size: 18),
                      const SizedBox(width: 4),
                      Text(
                        'New Chat',
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: const Color(0xffEEEEF0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xff2C2D30), height: 1),
          Expanded(
            child: Obx(() {
              if (controller.isLoadingHistory.value) {
                return const Center(
                  child: CircularProgressIndicator(color: Color(0xffEEEEF0)),
                );
              }
              if (controller.conversations.isEmpty) {
                return Center(
                  child: Text(
                    'No conversations yet',
                    style: GoogleFonts.manrope(
                      color: const Color(0xffB2B3BD),
                      fontSize: 14,
                    ),
                  ),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: controller.conversations.length,
                separatorBuilder: (_, __) =>
                    const Divider(color: Color(0xff2C2D30), height: 1),
                itemBuilder: (_, i) {
                  final conv = controller.conversations[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.chat_bubble_outline,
                          color: Color(0xffB2B3BD),
                          size: 18,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                              controller.loadConversation(conv.id);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  conv.title,
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: const Color(0xffEEEEF0),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  controller.formatConvDate(conv.updatedAt),
                                  style: GoogleFonts.manrope(
                                    fontSize: 11,
                                    color: const Color(0xff666770),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.deleteConversation(conv.id),
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

// ── Message bubble ────────────────────────────────────────────
class _MessageBubble extends StatelessWidget {
  final ChatMessage message;
  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isAi = message.isAi;

    // Determine if imageUrl is a local file path or a remote URL
    final imageUrl = message.imageUrl;
    final bool isLocalFile = imageUrl != null && !imageUrl.startsWith('http');

    return Align(
      alignment: isAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(maxWidth: Get.width * 0.75),
        decoration: BoxDecoration(
          color: isAi ? AppImages.primarycolor : const Color(0xff222325),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isAi ? 0 : 16),
            bottomRight: Radius.circular(isAi ? 16 : 0),
          ),
        ),
        child: message.status == 'processing'
            ? const SizedBox(
                width: 40,
                height: 14,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  color: Color(0xffEEEEF0),
                ),
              )
            : imageUrl != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Image (local or network) ──────────
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: isLocalFile
                        ? Image.file(
                            File(imageUrl),
                            width: Get.width * 0.6,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            imageUrl,
                            width: Get.width * 0.6,
                            fit: BoxFit.cover,
                          ),
                  ),
                  // ── Optional caption ──────────────────
                  if (message.text.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      message.text,
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffEEEEF0),
                      ),
                    ),
                  ],
                ],
              )
            : Text(
                message.text,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffEEEEF0),
                ),
              ),
      ),
    );
  }
}

// ── Typing bubble ─────────────────────────────────────────────
class _TypingBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: const BoxDecoration(
          color: Color(0xff2C2D30),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: const SizedBox(
          width: 40,
          height: 14,
          child: LinearProgressIndicator(
            backgroundColor: Colors.transparent,
            color: Color(0xffEEEEF0),
          ),
        ),
      ),
    );
  }
}
