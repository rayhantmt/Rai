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

  // JSON -> Model
  factory CommunityChatDetailsModel.fromJson(Map<String, dynamic> json) {
    return CommunityChatDetailsModel(
      id:                   json['id'] ?? '',
      name:                 json['name'] ?? '',
      description:          json['description'] ?? '',
      icon:                 json['icon'],            // nullable
      isPrivate:            json['is_private'] ?? false,
      approvalRequired:     json['approval_required'] ?? false,
      inviteCode:           json['invite_code'] ?? '',
      inviteLink:           json['invite_link'] ?? '',
      groupLink:            json['group_link'] ?? '',
      createdAt:            json['created_at'] ?? '',
      memberCount:          json['member_count'] ?? 0,
      isMember:             json['is_member'] ?? false,
      role:                 json['role'] ?? '',
      isMuted:              json['is_muted'] ?? false,
      pendingRequestCount:  json['pending_request_count'] ?? 0,
    );
  }

  // Model -> JSON
  Map<String, dynamic> toJson() {
    return {
      'id':                     id,
      'name':                   name,
      'description':            description,
      'icon':                   icon,
      'is_private':             isPrivate,
      'approval_required':      approvalRequired,
      'invite_code':            inviteCode,
      'invite_link':            inviteLink,
      'group_link':             groupLink,
      'created_at':             createdAt,
      'member_count':           memberCount,
      'is_member':              isMember,
      'role':                   role,
      'is_muted':               isMuted,
      'pending_request_count':  pendingRequestCount,
    };
  }
}