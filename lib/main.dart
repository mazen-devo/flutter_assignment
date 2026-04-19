import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/password_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PasswordScreen(),
    );
  }
}

class PasswordScreen extends StatelessWidget {
  const PasswordScreen();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PasswordCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<PasswordCubit, PasswordState>(
            builder: (context, state) {
              final cubit = context.read<PasswordCubit>();
              return Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        obscureText: state.isObscure,
                        onChanged: cubit.checkStrength,
                        decoration: InputDecoration(
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: cubit.toggleVisibility,
                          ),
                        ),
                      ),
                  
                      SizedBox(height: 20),
                  
                      Center(child: 
                         Text(
                          "Strength: ${state.strength.length > 0 ? state.strength : "Weak"}",
                          style: TextStyle(
                            color: state.strength == "Weak"
                                ? Colors.red
                                : state.strength == "Medium"
                                ? Colors.orange
                                : state.strength.length > 0 ? Colors.green : Colors.red,
                          ),
                      ))
                  
                     
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
