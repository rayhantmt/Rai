class GroupMemberModel {
  final int id;
  final int userId;
  final String username;
  final String firstName;
  final String lastName;
  final String profilePicture;
  final String role;
  final bool isMuted;
  final String joinedAt;

  GroupMemberModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
    required this.role,
    required this.isMuted,
    required this.joinedAt,
  });

  String get fullName => '$firstName $lastName';

  factory GroupMemberModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'];
    return GroupMemberModel(
      id: json['id'],
      userId: user['id'],
      username: user['username'] ?? '',
      firstName: user['first_name'] ?? '',
      lastName: user['last_name'] ?? '',
      profilePicture: user['profile_picture'] ?? '',
      role: json['role'] ?? 'member',
      isMuted: json['is_muted'] ?? false,
      joinedAt: json['joined_at'] ?? '',
    );
  }
}