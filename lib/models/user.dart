import 'dart:convert';

class UserX {
  String id;
  String nama;
  int umur;
  String createAt;
  UserX({
    this.id = '',
    this.nama = '',
    this.umur = 0,
    this.createAt = '',
  });

  UserX copyWith({
    String? id,
    String? nama,
    int? umur,
    String? createAt,
  }) {
    return UserX(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      umur: umur ?? this.umur,
      createAt: createAt ?? this.createAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'nama': nama});
    result.addAll({'umur': umur});
    result.addAll({'create_at': createAt});

    return result;
  }

  factory UserX.fromMap(Map<String, dynamic> map) {
    return UserX(
      id: map['id'] ?? '',
      nama: map['nama'] ?? '',
      umur: map['umur']?.toInt() ?? 0,
      createAt: map['create_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserX.fromJson(String source) => UserX.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserX(id: $id, nama: $nama, umur: $umur, createAt: $createAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserX && other.id == id && other.nama == nama && other.umur == umur && other.createAt == createAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nama.hashCode ^ umur.hashCode ^ createAt.hashCode;
  }
}
