import 'dart:convert';

class UserX {
  final String id;
  final String nama;
  final int umur;
  final String createdAt;
  UserX({
    this.id = '',
    this.nama = '',
    this.umur = 0,
    this.createdAt = '',
  });

  UserX copyWith({
    String? id,
    String? nama,
    int? umur,
    String? createdAt,
  }) {
    return UserX(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      umur: umur ?? this.umur,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'nama': nama});
    result.addAll({'umur': umur});
    result.addAll({'created_at': createdAt});

    return result;
  }

  factory UserX.fromMap(Map<String, dynamic> map) {
    return UserX(
      id: map['id'] ?? '',
      nama: map['nama'] ?? '',
      umur: map['umur']?.toInt() ?? 0,
      createdAt: map['created_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserX.fromJson(String source) => UserX.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserX(id: $id, nama: $nama, umur: $umur, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserX && other.id == id && other.nama == nama && other.umur == umur && other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nama.hashCode ^ umur.hashCode ^ createdAt.hashCode;
  }
}
