class CandidateItem {
  final int id;
  final String name;

  CandidateItem({
    required this.id,
    required this.name,

  });

  factory CandidateItem.fromJson(Map<String, dynamic> json) {
    return CandidateItem(
      id: json['id'],
      name: json['name'],

    );
  }

  CandidateItem.fromJson2(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  @override
  String toString() {
    return '$id: $name ';
  }
}