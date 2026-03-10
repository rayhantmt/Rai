// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rai/utils/app_images.dart';

// class RaiChatView extends StatelessWidget {
//   const RaiChatView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppImages.primarycolor,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
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
//                 Expanded(child: SizedBox()),
//                 GestureDetector(
//                   onTap: () => showModalBottomSheet(
//                     context: context,
//                     builder: (BuildContext) {
//                       return Container(
//                         height: 400,
//                         color: Colors.red,
//                         child: Center(child: Text('Chat Historys')),
//                       );
//                     },
//                   ),
//                   child: Icon(
//                     Icons.history,
//                     size: Get.height * 0.04,
//                     color: Color(0xffEEEEF0),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () => showModalBottomSheet(
//                     context: context,
//                     builder: (BuildContext) {
//                       return Container(
//                         height: Get.height * 0.2,
//                         color: AppImages.primarycolor,
//                         child: Column(
//                           children: [
//                             Row(
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
//                                     color: Color(0xffEEEEF0),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
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
//                                     color: Color(0xffEEEEF0),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                   child: Icon(
//                     Icons.more_vert,
//                     size: Get.height * 0.04,
//                     color: Color(0xffEEEEF0),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: Get.height * 0.02),
//             SizedBox(
//               height: Get.height * 0.7,
//               child: Container(
//                 color: AppImages.primarycolor,

//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       AppImages.chatscreenblacklogo,
//                       height: Get.height * 0.05,
//                     ),
//                     Text(
//                       'Hi, Ethen!',
//                       style: GoogleFonts.manrope(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 20,
//                         color: Color(0xffEEEEF0),
//                       ),
//                     ),
//                     Text(
//                       "'Just ask me, what's on your mind?",
//                       style: GoogleFonts.manrope(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14,
//                         color: Color(0xffB2B3BD),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 Image.asset(AppImages.imagepicking, height: Get.height * 0.07),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     color: Color(0xff222325),
//                   ),
//                   height: Get.height * 0.07,
//                   width: Get.width * 0.745,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           cursorColor: Colors.white,
//                           style: TextStyle(color: Colors.white),
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.only(left: 15),
//                             hint: Center(
//                               child: Text(
//                                 'Type message here...',
//                                 style: GoogleFonts.manrope(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 14,
//                                   color: Color(0xffB2B3BD),
//                                 ),
//                               ),
//                             ),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                       Image.asset(AppImages.sendbutton,
//                       height: Get.height*0.05,
//                       ),
//                       Image.asset(AppImages.micIcon,
//                       height: Get.height*0.05,
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(child: SizedBox()),
//           ],
//         ),
//       ),
//     );
//   }
// }
// views/rai_chat_view.dart

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
// print(controller.messages.length);
//     // Auto-scroll when messages change
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
//       backgroundColor: AppImages.primarycolor,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             // ── Top bar (unchanged) ──────────────────────────
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
//                   onTap: () => showModalBottomSheet(
//                     context: context,
//                     builder: (_) => Container(
//                       height: 400,
//                       color: Colors.red,
//                       child: const Center(child: Text('Chat Historys')),
//                     ),
//                   ),
//                   child: Icon(
//                     Icons.history,
//                     size: Get.height * 0.04,
//                     color: const Color(0xffEEEEF0),
//                   ),
//                 ),
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

//             // ── Chat body ────────────────────────────────────
//             SizedBox(
//               height: Get.height * 0.7,
//               child: Obx(() {
//                 // Empty state — exact same design as before
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
//                           'Hi, Ethen!',
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

//                 // Connecting / loading state
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

//                 // Messages list
//                 return ListView.builder(
//                   controller: scrollController,
//                   padding: const EdgeInsets.only(top: 8, bottom: 8),
//                   itemCount:
//                       controller.messages.length +
//                       (controller.isAiTyping.value ? 1 : 0),
//                   itemBuilder: (context, index) {
//                     // Typing indicator bubble at the end
//                     if (index == controller.messages.length) {
//                       return _TypingBubble();
//                     }

//                     final msg = controller.messages[index];
//                     return _MessageBubble(message: msg);
//                   },
//                 );
//               }),
//             ),

//             // ── Input row (unchanged layout) ─────────────────
//             Obx(
//               () => Row(
//                 children: [
//                   Image.asset(
//                     AppImages.imagepicking,
//                     height: Get.height * 0.07,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       color: const Color(0xff222325),
//                     ),
//                     height: Get.height * 0.07,
//                     width: Get.width * 0.745,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: TextFormField(
//                             controller: textController,
//                             cursorColor: Colors.white,
//                             style: const TextStyle(color: Colors.white),
//                             enabled: !controller.isSending.value,
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.only(left: 15),
//                               hint: Center(
//                                 child: Text(
//                                   'Type message here...',
//                                   style: GoogleFonts.manrope(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 14,
//                                     color: const Color(0xffB2B3BD),
//                                   ),
//                                 ),
//                               ),
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
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
//                                   height: Get.height * 0.05,
//                                 ),
//                         ),
//                         Image.asset(
//                           AppImages.micIcon,
//                           height: Get.height * 0.05,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const Expanded(child: SizedBox()),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ── Message bubble ─────────────────────────────────────────────
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
//           color: isAi ? const Color(0xff2C2D30) : const Color(0xff4A90E2),
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

// // ── AI typing indicator ────────────────────────────────────────
// class _TypingBubble extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 4),
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//         decoration: BoxDecoration(
//           color: const Color(0xff2C2D30),
//           borderRadius: const BorderRadius.only(
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

// rai_chat_view.dart

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
      //resizeToAvoidBottomInset: true,
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // ── Top bar ──────────────────────────────────────
            SizedBox(height: Get.height * 0.05),
            Row(
              children: [
                Image.asset(AppImages.logo,
                    height: Get.height * 0.05, width: Get.width * 0.2),
                const Expanded(child: SizedBox()),
        
                // History icon
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
                  child: Icon(Icons.history,
                      size: Get.height * 0.04,
                      color: const Color(0xffEEEEF0)),
                ),
        
                // More options
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
                            child: Row(children: [
                              Image.asset(AppImages.newchaticon,
                                  height: Get.height * .05),
                              Text('New chat',
                                  style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: const Color(0xffEEEEF0))),
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              controller.clearConversation();
                            },
                            child: Row(children: [
                              Image.asset(AppImages.clearconversationicon,
                                  height: Get.height * .05),
                              Text('Clear this conversation',
                                  style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: const Color(0xffEEEEF0))),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: Icon(Icons.more_vert,
                      size: Get.height * 0.04,
                      color: const Color(0xffEEEEF0)),
                ),
              ],
            ),
        
            SizedBox(height: Get.height * 0.02),
        
            // ── Chat body ─────────────────────────────────────
            SizedBox(
          height: Get.height*0.7,
              
              child: Obx(() {
                print('bottom sized${MediaQuery.of(context).viewInsets.bottom}');
                if (controller.messages.isEmpty &&
                    !controller.isConnecting.value) {
                  return Container(
                    color: AppImages.primarycolor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.chatscreenblacklogo,
                            height: Get.height * 0.05),
                        Text('Hi, There!',
                            style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: const Color(0xffEEEEF0))),
                        Text("'Just ask me, what's on your mind?",
                            style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color(0xffB2B3BD))),
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
                            color: Color(0xffEEEEF0))),
                  );
                }
        
                return ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  itemCount: controller.messages.length +
                      (controller.isAiTyping.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == controller.messages.length) {
                      return _TypingBubble();
                    }
                    return _MessageBubble(
                        message: controller.messages[index]);
                  },
                );
              }),
            ),
        
            // ── Input row ─────────────────────────────────────
            Obx(() {
              final isRecording = controller.isRecording.value;
              final isTranscribing = controller.isTranscribing.value;
              final isUploadingImage = controller.isUploadingImage.value;
        
              return Row(
                children: [
                  // Image pick button
                  GestureDetector(
                    onTap: isUploadingImage
                        ? null
                        : controller.pickAndSendImage,
                    child: isUploadingImage
                        ? SizedBox(
                            height: Get.height * 0.07,
                            width: Get.height * 0.07,
                            child: const Center(
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Color(0xffEEEEF0)),
                              ),
                            ),
                          )
                        : Image.asset(AppImages.imagepicking,
                            height: Get.height * 0.07),
                  ),
        
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: isRecording
                          ? const Color(0xff3A1A1A) // dark red tint when recording
                          : const Color(0xff222325),
                    ),
                    height: Get.height * 0.07,
                    width: Get.width * 0.745,
                    child: Row(
                      children: [
                        // Text field — hidden while recording
                        Expanded(
                          child: isRecording
                              ? Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.fiber_manual_record,
                                          color: Colors.red, size: 12),
                                      const SizedBox(width: 6),
                                      Text('Recording...',
                                          style: GoogleFonts.manrope(
                                              fontSize: 14,
                                              color: const Color(0xffEEEEF0))),
                                    ],
                                  ),
                                )
                              : isTranscribing
                                  ? Center(
                                      child: Text('Transcribing...',
                                          style: GoogleFonts.manrope(
                                              fontSize: 14,
                                              color: const Color(0xffB2B3BD))),
                                    )
                                  : TextFormField(
                                      controller: textController,
                                      cursorColor: Colors.white,
                                      style: const TextStyle(color: Colors.white),
                                      enabled: !controller.isSending.value,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 15),
                                        hint: Center(
                                          child: Text('Type message here...',
                                              style: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xffB2B3BD))),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                        ),
        
                        // Send button
                        GestureDetector(
                          onTap: controller.isSending.value
                              ? null
                              : () {
                                  controller.sendMessage(textController.text);
                                  textController.clear();
                                },
                          child: controller.isSending.value
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8),
                                  child: SizedBox(
                                    width: Get.height * 0.03,
                                    height: Get.height * 0.03,
                                    child: const CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Color(0xffEEEEF0)),
                                  ),
                                )
                              : Image.asset(AppImages.sendbutton,
                                  height: Get.height * 0.045),
                        ),
        
                        // Mic button — tap to start/stop recording
                        GestureDetector(
                          onTap: isTranscribing
                              ? null
                              : controller.toggleRecording,
                          child: isTranscribing
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4),
                                  child: SizedBox(
                                    width: Get.height * 0.03,
                                    height: Get.height * 0.03,
                                    child: const CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Color(0xffEEEEF0)),
                                  ),
                                )
                              : isRecording
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: Icon(Icons.stop_circle,
                                          color: Colors.red,
                                          size: Get.height * 0.04),
                                    )
                                  : Image.asset(AppImages.micIcon,
                                      height: Get.height * 0.05),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
        // SizedBox(height: MediaQuery.of(context).viewInsets.bottom > 0
        //     ? MediaQuery.of(context).viewInsets.bottom
        //     : Get.height * 0.02),
            const Expanded(child: SizedBox()),
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
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xff444550),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Chat History',
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: const Color(0xffEEEEF0))),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    controller.startNewChat();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.add,
                          color: Color(0xffEEEEF0), size: 18),
                      const SizedBox(width: 4),
                      Text('New Chat',
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: const Color(0xffEEEEF0))),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: Color(0xff2C2D30), height: 1),

          // List
          Expanded(
            child: Obx(() {
              if (controller.isLoadingHistory.value) {
                return const Center(
                    child: CircularProgressIndicator(
                        color: Color(0xffEEEEF0)));
              }
              if (controller.conversations.isEmpty) {
                return Center(
                  child: Text('No conversations yet',
                      style: GoogleFonts.manrope(
                          color: const Color(0xffB2B3BD), fontSize: 14)),
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
                        horizontal: 20, vertical: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.chat_bubble_outline,
                            color: Color(0xffB2B3BD), size: 18),
                        const SizedBox(width: 12),

                        // Title + date
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                              controller.loadConversation(conv.id);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(conv.title,
                                    style: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: const Color(0xffEEEEF0)),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                                Text(
                                    controller.formatConvDate(conv.updatedAt),
                                    style: GoogleFonts.manrope(
                                        fontSize: 11,
                                        color: const Color(0xff666770))),
                              ],
                            ),
                          ),
                        ),

                        // Delete icon
                        GestureDetector(
                          onTap: () =>
                              controller.deleteConversation(conv.id),
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.delete_outline,
                                color: Colors.red, size: 20),
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
    return Align(
      alignment: isAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(maxWidth: Get.width * 0.75),
        decoration: BoxDecoration(
          color: isAi ? const Color(0xff2C2D30) : const Color(0xff4A90E2),
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
                    color: Color(0xffEEEEF0)))
            : message.imageUrl != null
                // Show image if present
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(message.imageUrl!,
                        width: Get.width * 0.6, fit: BoxFit.cover))
                : Text(message.text,
                    style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffEEEEF0))),
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
              color: Color(0xffEEEEF0)),
        ),
      ),
    );
  }
}
