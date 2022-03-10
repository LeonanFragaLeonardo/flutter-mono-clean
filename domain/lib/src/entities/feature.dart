import 'dart:convert';

class Feature {
  final String name;
  final bool enabled;
  Feature({
    required this.name,
    required this.enabled,
  });

  Feature copyWith({
    String? name,
    bool? enabled,
  }) {
    return Feature(
      name: name ?? this.name,
      enabled: enabled ?? this.enabled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'enabled': enabled,
    };
  }

  factory Feature.fromMap(Map<String, dynamic> map) {
    return Feature(
      name: map['name'] ?? map['featureName'] ?? '',
      enabled: map['enabled'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Feature.fromJson(String source) =>
      Feature.fromMap(json.decode(source));

  @override
  String toString() => 'Feature(name: $name, enabled: $enabled)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Feature && other.name == name && other.enabled == enabled;
  }

  @override
  int get hashCode => name.hashCode ^ enabled.hashCode;
}
