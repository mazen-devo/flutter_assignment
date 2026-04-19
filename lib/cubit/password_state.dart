part of 'password_cubit.dart';

class PasswordState {
  final bool isObscure;
  String strength;
  final String password;

  PasswordState({
    required this.isObscure,
    this.strength = "Weak",
    this.password = '',
  });

  PasswordState copyWith({
    bool? isObscure,
    String? strength,
    String? password,
  }) {
    return PasswordState(
      isObscure: isObscure ?? this.isObscure,
      strength: strength ?? this.strength,
      password: password ?? this.password,
    );
  }
}
