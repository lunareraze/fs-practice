import 'dart:convert';

class UserX {
  String id;
  String nama;
  int umur;
  UserX({
    this.id = '',
    this.nama = '',
    this.umur = 0,
  });

  UserX copyWith({
    String? id,
    String? nama,
    int? umur,
  }) {
    return UserX(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      umur: umur ?? this.umur,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'nama': nama});
    result.addAll({'umur': umur});

    return result;
  }

  factory UserX.fromMap(Map<String, dynamic> map) {
    return UserX(
      id: map['id'] ?? '',
      nama: map['nama'] ?? '',
      umur: map['umur']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserX.fromJson(String source) => UserX.fromMap(json.decode(source));

  @override
  String toString() => 'UserX(id: $id, nama: $nama, umur: $umur)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserX && other.id == id && other.nama == nama && other.umur == umur;
  }

  @override
  int get hashCode => id.hashCode ^ nama.hashCode ^ umur.hashCode;
}
