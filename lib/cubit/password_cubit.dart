import 'package:bloc/bloc.dart';
part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordState(isObscure: true, strength: ""));

  void toggleVisibility() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  void checkStrength(String password) {
    String strength = "";

    if (password.length < 6) {
      strength = "Weak";
    } else if (password.length < 10) {
      strength = "Medium";
    } else {
      strength = "Strong";
    }

    emit(state.copyWith(strength: strength, password: password));
  }
}
