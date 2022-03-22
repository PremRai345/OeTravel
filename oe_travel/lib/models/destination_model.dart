class Destination {
  late String? id;
  late String destinationName;
  late String destinationDescription;
  late String destinationImageUrl;

  Destination({
    this.id,
    required this.destinationName,
    required this.destinationDescription,
    required this.destinationImageUrl,
  });

  Destination.fromJson(
    Map obj,
    this.id,
  ) {
    destinationName = obj["destinationName"];
    destinationDescription = obj["destinationDescription"];
    destinationImageUrl = obj["destinationImageUrl"];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["destinationName"] = destinationName;

    map["destinationDescription"] = destinationDescription;
    map["destinationImageUrl"] = destinationImageUrl;

    return map;
  }
}
