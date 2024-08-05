class BrandData {
  final String id;
  final String name;
  final String motherTongue;
  final String image;
  final String slug;

  BrandData({
    required this.id,
    required this.name,
    required this.motherTongue,
    required this.image,
    required this.slug,
  });

  factory BrandData.fromJson(Map<String, dynamic> json) {
    return BrandData(
      id: json['id'].toString(),
      name: json['name'].toString(),
      motherTongue: json['mother_tongue'].toString(),
      image: json['image'].toString(),
      slug: json['slug'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'motherTongue': motherTongue,
      'image': image,
      'slug': slug,
    };
  }

  @override
  String toString() {
    return 'TestData(id: $id, name: $name, motherTongue: $motherTongue, image: $image, slug: $slug)';
  }
}
