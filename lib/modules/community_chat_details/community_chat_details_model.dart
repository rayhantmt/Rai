// class CommunityChatDetailsModel {
//   final String id;
//   final String name;
//   final String description;
//   final String? icon;
//   final bool isPrivate;
//   final bool approvalRequired;
//   final String inviteCode;
//   final String inviteLink;
//   final String groupLink;
//   final String createdAt;
//   final int memberCount;
//   final bool isMember;
//   final String role;
//   final bool isMuted;
//   final int pendingRequestCount;

//   CommunityChatDetailsModel({
//     required this.id,
//     required this.name,
//     required this.description,
//     this.icon,
//     required this.isPrivate,
//     required this.approvalRequired,
//     required this.inviteCode,
//     required this.inviteLink,
//     required this.groupLink,
//     required this.createdAt,
//     required this.memberCount,
//     required this.isMember,
//     required this.role,
//     required this.isMuted,
//     required this.pendingRequestCount,
//   });

//   // JSON -> Model
//   factory CommunityChatDetailsModel.fromJson(Map<String, dynamic> json) {
//     return CommunityChatDetailsModel(
//       id:                   json['id'] ?? '',
//       name:                 json['name'] ?? '',
//       description:          json['description'] ?? '',
//       icon:                 json['icon'],            // nullable
//       isPrivate:            json['is_private'] ?? false,
//       approvalRequired:     json['approval_required'] ?? false,
//       inviteCode:           json['invite_code'] ?? '',
//       inviteLink:           json['invite_link'] ?? '',
//       groupLink:            json['group_link'] ?? '',
//       createdAt:            json['created_at'] ?? '',
//       memberCount:          json['member_count'] ?? 0,
//       isMember:             json['is_member'] ?? false,
//       role:                 json['role'] ?? '',
//       isMuted:              json['is_muted'] ?? false,
//       pendingRequestCount:  json['pending_request_count'] ?? 0,
//     );
//   }

//   // Model -> JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id':                     id,
//       'name':                   name,
//       'description':            description,
//       'icon':                   icon,
//       'is_private':             isPrivate,
//       'approval_required':      approvalRequired,
//       'invite_code':            inviteCode,
//       'invite_link':            inviteLink,
//       'group_link':             groupLink,
//       'created_at':             createdAt,
//       'member_count':           memberCount,
//       'is_member':              isMember,
//       'role':                   role,
//       'is_muted':               isMuted,
//       'pending_request_count':  pendingRequestCount,
//     };
//   }
// }
class CommunityChatDetailsModel {
  final String id;
  final String name;
  final String description;
  final String? icon;
  final bool isPrivate;
  final bool approvalRequired;
  final String inviteCode;
  final String inviteLink;
  final String groupLink;
  final String createdAt;
  final int memberCount;
  final bool isMember;
  final String role;
  final bool isMuted;
  final int pendingRequestCount;

  CommunityChatDetailsModel({
    required this.id,
    required this.name,
    required this.description,
    this.icon,
    required this.isPrivate,
    required this.approvalRequired,
    required this.inviteCode,
    required this.inviteLink,
    required this.groupLink,
    required this.createdAt,
    required this.memberCount,
    required this.isMember,
    required this.role,
    required this.isMuted,
    required this.pendingRequestCount,
  });

  factory CommunityChatDetailsModel.fromJson(Map<String, dynamic> json) {
    return CommunityChatDetailsModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'],
      isPrivate: json['is_private'] ?? false,
      approvalRequired: json['approval_required'] ?? false,
      inviteCode: json['invite_code'] ?? '',
      inviteLink: json['invite_link'] ?? '',
      groupLink: json['group_link'] ?? '',
      createdAt: json['created_at'] ?? '',
      memberCount: json['member_count'] ?? 0,
      isMember: json['is_member'] ?? false,
      role: json['role'] ?? '',
      isMuted: json['is_muted'] ?? false,
      pendingRequestCount: json['pending_request_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'icon': icon,
      'is_private': isPrivate,
      'approval_required': approvalRequired,
      'invite_code': inviteCode,
      'invite_link': inviteLink,
      'group_link': groupLink,
      'created_at': createdAt,
      'member_count': memberCount,
      'is_member': isMember,
      'role': role,
      'is_muted': isMuted,
      'pending_request_count': pendingRequestCount,
    };
  }
}

// ─── Chat message model ──────────────────────────────────────────────────────

class ChatSender {
  final dynamic id; // can be int or String from backend
  final String username;
  final String firstName;
  final String lastName;
  final String? profilePicture;

  ChatSender({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    this.profilePicture,
  });

  String get displayName {
    final full = '$firstName $lastName'.trim();
    return full.isNotEmpty ? full : username;
  }

  factory ChatSender.fromJson(Map<String, dynamic> json) {
    return ChatSender(
      id: json['id'],
      username: json['username'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      profilePicture: json['profile_picture'],
    );
  }
}

class ChatMessage {
  final String id;
  final String message;
  final String? image;
  final String? audio;
  final ChatSender sender;
  final DateTime createdAt;

  ChatMessage({
    required this.id,
    required this.message,
    this.image,
    this.audio,
    required this.sender,
    required this.createdAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id']?.toString() ?? '',
      message: json['message'] ?? '',
      image: json['image'],
      audio: json['audio'],
      sender: ChatSender.fromJson(json['sender'] ?? {}),
      createdAt: _parseDate(json['created_at']),
    );
  }

  static DateTime _parseDate(dynamic raw) {
    if (raw == null) return DateTime.now();
    try {
      return DateTime.parse(raw.toString()).toLocal();
    } catch (_) {
      return DateTime.now();
    }
  }
}
