
import 'package:starter_application/core/entities/base_entity.dart';

class LoginEntity extends BaseEntity {
  final String? token;
  final AccountEntity? account;

  LoginEntity({
    required this.account,
    required this.token,
  });

  @override
  List<Object?> get props => [
        this.account,
        this.token,
      ];
}

class AccountEntity extends BaseEntity {
  AccountEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final String? id;
  final String? name;
  final String? imageUrl;

  @override
  List<Object?> get props => [
        this.id,
        this.name,
        this.imageUrl,
      ];
}
