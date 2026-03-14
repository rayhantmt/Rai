// class CommunityModel {
//   final String tittle;
//   final String members;
// final String img;
//   CommunityModel({required this.tittle, required this.members,required this.img, });
// }
class CommunityModel {
  final String id;
  final String tittle;
  final String members;
  final String img;

  CommunityModel({
    required this.id,
    required this.tittle,
    required this.members,
    required this.img,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'] ?? '',
      tittle: json['name'] ?? '',
      members: json['member_count'].toString(),
      img: json['icon'] ?? 'https://picsum.photos/seed/picsum/200/300',
    );
  }
}