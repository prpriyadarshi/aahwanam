class AddressModel {
  final String title;
  final String subtitle;

  AddressModel({
    required this.title,
    required this.subtitle,
  });

  // Factory constructor to create an AddressModel from a map
  factory AddressModel.fromMap(Map<String, String> map) {
    return AddressModel(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
    );
  }

  // Method to convert an AddressModel to a map
  Map<String, String> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
    };
  }

  // Optional: Useful for equality checks
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AddressModel &&
              runtimeType == other.runtimeType &&
              title == other.title &&
              subtitle == other.subtitle;

  @override
  int get hashCode => title.hashCode ^ subtitle.hashCode;

  @override
  String toString() => 'AddressModel(title: $title, subtitle: $subtitle)';
}