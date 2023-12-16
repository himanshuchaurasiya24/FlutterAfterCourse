class UserModel {
  final int id;
  final String name;
  final String color;
  final String pantone_value;

  UserModel({
    required this.id,
    required this.name,
    required this.color,
    required this.pantone_value,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      color: json['color'],
      pantone_value: json['pantone_value'],
    );
  }
}
