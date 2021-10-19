class StatEntity {
  StatEntity({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }
}
