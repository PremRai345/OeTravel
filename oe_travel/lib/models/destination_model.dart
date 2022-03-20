class Destination {
  late String destinationName;
  late String destinationDescription;

  late String? id;

  Destination({
    required this.destinationName,
    required this.destinationDescription,
    this.id,
  });

  Destination.fromJson(
    Map obj,
    this.id,
  ) {
    destinationName = obj["destinationName"];
    destinationDescription = obj["destinationDescription"];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["destinationName"] = destinationName;

    map["destinationDescription"] = destinationDescription;

    return map;
  }
}
