class SoftwareRelease {
  final String version;
  final String downloadUrl;
  final String changelog;
  final String platform;
  final double sizeMb;

  SoftwareRelease({
    required this.version,
    required this.downloadUrl,
    required this.changelog,
    required this.platform,
    required this.sizeMb,
  });

  factory SoftwareRelease.fromFirestore(
    Map<String, dynamic> json,
  ) {
    return SoftwareRelease(
      version: json["version"] ?? "",
      downloadUrl: json["downloadUrl"] ?? "",
      changelog: json["changelog"] ?? "",
      platform: json["platform"] ?? "",
      sizeMb: (json["sizeMb"] ?? 0).toDouble(),
    );
  }
}