class AppUser {
  final String uid;
  final String email;
  final String displayName;
  final String role;

  final List<dynamic> products;
  final List<dynamic> licenses;

  final DateTime? createdAt;

  AppUser({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.role,
    required this.products,
    required this.licenses,
    required this.createdAt,
  });

  factory AppUser.fromFirestore(String uid, Map<String, dynamic> json) {
    return AppUser(
      uid: uid,
      email: json["email"] ?? "",
      displayName: json["displayName"] ?? "",
      role: json["role"] ?? "user",
      products: json["products"] ?? [],
      licenses: json["licenses"] ?? [],
      createdAt: json["createdAt"] != null ? json["createdAt"].toDate() : null,
    );
  }

  bool hasProduct(String productId) {
    return products.contains(productId);
  }

  bool hasLicense(String licenseId) {
    return licenses.contains(licenseId);
  }
}
