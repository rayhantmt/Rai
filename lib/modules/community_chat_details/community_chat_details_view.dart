// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rai/modules/community_chat_details/community_chat_details_controller.dart';
// import 'package:rai/utils/app_images.dart';
// import 'package:rai/utils/app_pages.dart';

// class CommunityChatDetailsView extends GetView<CommunityChatDetailsController> {
//   const CommunityChatDetailsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final arg = Get.arguments;
//     final String name = arg['name'];
//     final String img = arg['img'];
//     final String member = arg['member'];
//     return Scaffold(
//       backgroundColor: AppImages.primarycolor,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             SizedBox(height: Get.height * 0.06),
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap: () => Get.back(),
//                   child: Image.asset(
//                     AppImages.commentconcernbackicon,
//                     height: Get.height * 0.06,
//                   ),
//                 ),
//                 SizedBox(width: Get.width * 0.02),
//                 GestureDetector(
//                   onTap: () => Get.toNamed(
//                     AppPages.communityDetails,
//                     arguments: {
//                       'img': img,
//                       'name': name,
//                       'member': member,
//                       'bio': controller.communityDetails.value!.description,
//                       'role':controller.communityDetails.value!.role,
//                       'id':controller.communityDetails.value!.id
//                     },
//                   ),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 30,
//                         backgroundImage: NetworkImage(img),
//                       ),
//                       SizedBox(width: Get.width * 0.04),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             name,
//                             style: GoogleFonts.manrope(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 16,
//                               color: Color(0xffEEEEF0),
//                             ),
//                           ),
//                           Text(
//                             member,
//                             style: GoogleFonts.manrope(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 14,
//                               color: Color(0xffEEEEF0),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Obx(
//               () => controller.isLoading.value
//                   ? CircularProgressIndicator()
//                   : SizedBox(
//                       height: Get.height * 0.7,
//                       child: Text('Data Loaded Successfully',
//                       style: GoogleFonts.manrope(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 18,

//                         color: Colors.white
//                       ),
//                       ),
//                     ),
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
//                     //mainAxisAlignment: MainAxisAlignment.end,
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
//                       GestureDetector(
//                         onTap: () => controller.fetchdetails(),
//                         child: Image.asset(
//                           AppImages.sendbutton,
//                           height: Get.height * 0.05,
//                         ),
//                       ),
//                       Image.asset(AppImages.micIcon, height: Get.height * 0.05),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rai/modules/community_chat_details/community_chat_details_controller.dart';
import 'package:rai/modules/community_chat_details/community_chat_details_model.dart';
import 'package:rai/utils/app_images.dart';
import 'package:rai/utils/app_pages.dart';

class CommunityChatDetailsView extends GetView<CommunityChatDetailsController> {
  const CommunityChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // ── Arguments — kept exactly as original ──────────────────────────────────
    final arg = Get.arguments;
    final String name = arg['name'];
    final String img = arg['img'];
    final String member = arg['member'];

    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header (original logic preserved) ───────────────────────────
            _Header(name: name, img: img, member: member),

            // ── Chat body ────────────────────────────────────────────────────
            Expanded(child: _ChatBody()),

            // ── Input bar ────────────────────────────────────────────────────
            _InputBar(),
          ],
        ),
      ),
    );
  }
}

// ─── Header ──────────────────────────────────────────────────────────────────

class _Header extends GetView<CommunityChatDetailsController> {
  final String name;
  final String img;
  final String member;

  const _Header({required this.name, required this.img, required this.member});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: Row(
        children: [
          // Back button — original
          GestureDetector(
            onTap: () => Get.back(),
            child: Image.asset(
              AppImages.commentconcernbackicon,
              height: Get.height * 0.06,
            ),
          ),
          SizedBox(width: Get.width * 0.02),

          // Avatar + name — original navigation preserved
          Expanded(
            child: GestureDetector(
              onTap: () => Get.toNamed(
                AppPages.communityDetails,
                arguments: {
                  'img': img,
                  'name': name,
                  'member': member,
                  'bio': controller.communityDetails.value?.description,
                  'role': controller.communityDetails.value?.role,
                  'id': controller.communityDetails.value?.id,
                },
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: const Color(0xff2A2B2D),
                    backgroundImage: img.isNotEmpty ? NetworkImage(img) : null,
                    child: img.isEmpty
                        ? const Icon(Icons.group, color: Colors.white54)
                        : null,
                  ),
                  SizedBox(width: Get.width * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: const Color(0xffEEEEF0),
                          ),
                        ),
                        Text(
                          member,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color(0xff8E8F9A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Connection indicator
          Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: controller.isConnected.value
                    ? const Color(0xff4CAF50)
                    : controller.isConnecting.value
                    ? const Color(0xffFFC107)
                    : const Color(0xffF44336),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Chat Body ───────────────────────────────────────────────────────────────

class _ChatBody extends GetView<CommunityChatDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xff5B5EA6),
            strokeWidth: 2,
          ),
        );
      }

      if (controller.messages.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.chat_bubble_outline,
                color: Color(0xff3A3B3D),
                size: 48,
              ),
              const SizedBox(height: 12),
              Text(
                'No messages yet.\nBe the first to say hi!',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  color: const Color(0xff5A5B65),
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
            ],
          ),
        );
      }

      return ListView.builder(
        controller: controller.scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: controller.messages.length,
        itemBuilder: (_, i) {
          final msg = controller.messages[i];
          final isMe = controller.isMyMessage(msg);

          // Show date divider when date changes
          final showDate =
              i == 0 ||
              !_isSameDay(controller.messages[i - 1].createdAt, msg.createdAt);

          return Column(
            children: [
              if (showDate) _DateDivider(date: msg.createdAt),
              _MessageBubble(msg: msg, isMe: isMe),
            ],
          );
        },
      );
    });
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}

// ─── Date Divider ─────────────────────────────────────────────────────────────

class _DateDivider extends StatelessWidget {
  final DateTime date;
  const _DateDivider({required this.date});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String label;
    if (_isSameDay(date, now)) {
      label = 'Today';
    } else if (_isSameDay(date, now.subtract(const Duration(days: 1)))) {
      label = 'Yesterday';
    } else {
      label = DateFormat('MMM d, yyyy').format(date);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Expanded(
            child: Divider(color: Color(0xff2A2B2D), thickness: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 11,
                color: const Color(0xff5A5B65),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Expanded(
            child: Divider(color: Color(0xff2A2B2D), thickness: 1),
          ),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}

// ─── Message Bubble ───────────────────────────────────────────────────────────
class _MessageBubble extends StatefulWidget {
  final ChatMessage msg;
  final bool isMe;

  const _MessageBubble({required this.msg, required this.isMe});

  @override
  State<_MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<_MessageBubble> {
  AudioPlayer? _audioPlayer;
  bool _isPlaying = false;
  StreamSubscription? _playerStateSubscription;

  @override
  void dispose() {
    _playerStateSubscription?.cancel();
    _audioPlayer?.dispose();
    super.dispose();
  }

  Future<void> _toggleAudio(String url) async {
    if (_audioPlayer == null) {
      _audioPlayer = AudioPlayer();
      _playerStateSubscription = _audioPlayer!.playerStateStream.listen((state) {
        // Sync UI with actual player state
        bool isActuallyPlaying = state.playing;
        if (isActuallyPlaying != _isPlaying) {
          setState(() => _isPlaying = isActuallyPlaying);
        }
      });
    }

    if (_isPlaying) {
      await _audioPlayer!.pause();
    } else {
      await _audioPlayer!.setUrl(url);
      await _audioPlayer!.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeStr = DateFormat('h:mm a').format(widget.msg.createdAt);
    final isMe = widget.isMe;
    final msg = widget.msg;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe) ...[_Avatar(sender: msg.sender), const SizedBox(width: 8)],

          Flexible(
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (!isMe)
                  Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 2),
                    child: Text(
                      msg.sender.displayName,
                      style: GoogleFonts.manrope(
                        fontSize: 11,
                        color: const Color(0xff8E8F9A),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                Container(
                  constraints: BoxConstraints(maxWidth: Get.width * 0.68),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isMe
                        ? const Color(0xffFFFFFF)
                        : const Color(0xff222325),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(18),
                      topRight: const Radius.circular(18),
                      bottomLeft: Radius.circular(isMe ? 18 : 4),
                      bottomRight: Radius.circular(isMe ? 4 : 18),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // ✅ Image
                      if (msg.image != null && msg.image!.isNotEmpty) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            msg.image!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const Icon(
                              Icons.broken_image,
                              color: Colors.white38,
                            ),
                          ),
                        ),
                        if (msg.message.isNotEmpty) const SizedBox(height: 6),
                      ],

                      // ✅ Audio — now tappable with play/pause toggle
                      if (msg.audio != null && msg.audio!.isNotEmpty) ...[
                        GestureDetector(
                          onTap: () => _toggleAudio(msg.audio!),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isMe
                                  ? const Color(0xffE8E8E8)
                                  : const Color(0xff2E2F31),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  _isPlaying
                                      ? Icons.pause_circle_filled_rounded
                                      : Icons.play_circle_fill_rounded,
                                  color: isMe
                                      ? const Color(0xff1E1E1E)
                                      : const Color(0xffEEEEF0),
                                  size: 28,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Voice message',
                                      style: GoogleFonts.manrope(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: isMe
                                            ? const Color(0xff1E1E1E)
                                            : const Color(0xffEEEEF0),
                                      ),
                                    ),
                                    Text(
                                      _isPlaying ? 'Playing...' : 'Tap to play',
                                      style: GoogleFonts.manrope(
                                        fontSize: 10,
                                        color: isMe
                                            ? Colors.black45
                                            : const Color(0xff8E8F9A),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],

                      // ✅ Text
                      if (msg.message.isNotEmpty &&
                          (msg.audio == null || msg.audio!.isEmpty))
                        Text(
                          msg.message,
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            color: isMe
                                ? const Color(0xff1E1E1E)
                                : const Color(0xffEEEEF0),
                            fontWeight: FontWeight.w400,
                            height: 1.45,
                          ),
                        ),

                      // Timestamp
                      const SizedBox(height: 4),
                      Text(
                        timeStr,
                        style: GoogleFonts.manrope(
                          fontSize: 10,
                          color: isMe
                              ? Colors.black45
                              : const Color(0xff5A5B65),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (isMe) const SizedBox(width: 4),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final ChatSender sender;
  const _Avatar({required this.sender});

  @override
  Widget build(BuildContext context) {
    final url = sender.profilePicture;
    return CircleAvatar(
      radius: 16,
      backgroundColor: const Color(0xff2A2B2D),
      backgroundImage: (url != null && url.isNotEmpty)
          ? NetworkImage(url)
          : null,
      child: (url == null || url.isEmpty)
          ? Text(
              sender.displayName.isNotEmpty
                  ? sender.displayName[0].toUpperCase()
                  : '?',
              style: GoogleFonts.manrope(
                fontSize: 12,
                color: Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
    );
  }
}

// ─── Input Bar ────────────────────────────────────────────────────────────────

class _InputBar extends GetView<CommunityChatDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      color: AppImages.primarycolor,
      child: Row(
        children: [
          // Image pick button — original asset preserved
          GestureDetector(
            onTap: () {
              controller.sendImage();
            },
            child: Image.asset(
              AppImages.imagepicking,
              height: Get.height * 0.05,
            ),
          ),
          const SizedBox(width: 8),

          // Text field + send + mic
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xff222325),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  // Text input
                  Expanded(
                    child: TextField(
                      controller: controller.messageController,
                      cursorColor: Colors.white,
                      style: GoogleFonts.manrope(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      maxLines: 4,
                      minLines: 1,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        hintText: 'Type message here...',
                        hintStyle: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xffB2B3BD),
                        ),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => controller.sendMessage(),
                    ),
                  ),

                  // Send button — original asset preserved, now wired up
                  GestureDetector(
                    onTap: controller.sendMessage,
                    child: Image.asset(
                      AppImages.sendbutton,
                      height: Get.height * 0.042,
                    ),
                  ),

                  // Mic button — original asset preserved
                  // Obx(
                  //   () => GestureDetector(
                  //     onLongPressStart: (_) => controller.startRecording(),
                  //     onLongPressEnd: (_) => controller.stopAndSendAudio(),
                  //     child: AnimatedContainer(
                  //       duration: const Duration(milliseconds: 200),
                  //       padding: EdgeInsets.all(
                  //         controller.isRecording.value ? 6 : 0,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         color: controller.isRecording.value
                  //             ? const Color(0xffF44336).withOpacity(0.15)
                  //             : Colors.transparent,
                  //       ),
                  //       child: Image.asset(
                  //         AppImages.micIcon,
                  //         height: Get.height * 0.042,
                  //         color: controller.isRecording.value
                  //             ? const Color(
                  //                 0xffF44336,
                  //               ) // 🔴 red while recording
                  //             : null,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
