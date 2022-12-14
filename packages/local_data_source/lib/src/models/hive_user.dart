import 'package:drone_dart/drone_dart.dart';
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

class User with EquatableMixin {
  User({
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.admin,
    required this.machine,
    required this.token,
    required this.server,
  });

  String name;
  String email;
  String avatarUrl;
  bool admin;
  bool machine;
  String server;
  String token;

  factory User.fromDroneUser({
    required DroneUser user,
    required String server,
  }) {
    return User(
        name: user.login,
        email: user.email,
        avatarUrl: user.avatar,
        admin: user.admin,
        machine: user.machine,
        token: user.token,
        server: server);
  }

  User copyWith({
    bool? isCurrentUser,
    String? name,
    String? email,
    String? avatarUrl,
    bool? admin,
    bool? machine,
    String? server,
    String? token,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      admin: admin ?? this.admin,
      machine: machine ?? this.machine,
      token: token ?? this.token,
      server: server ?? this.server,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props =>
      [name, email, avatarUrl, admin, machine, server, token];
}

class HiveUserAdapter extends TypeAdapter<User> {
  @override
  User read(BinaryReader reader) {
    return User(
      name: reader.readString(),
      email: reader.readString(),
      avatarUrl: reader.readString(),
      admin: reader.readBool(),
      machine: reader.readBool(),
      token: reader.readString(),
      server: reader.readString(),
    );
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.email);
    writer.writeString(obj.avatarUrl);
    writer.writeBool(obj.admin);
    writer.writeBool(obj.machine);
    writer.writeString(obj.token);
    writer.writeString(obj.server);
  }
}
