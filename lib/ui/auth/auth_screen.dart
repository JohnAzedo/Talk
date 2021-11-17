import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:talk/ui/auth/auth_viewmodel.dart';
import 'package:talk/ui/constants/dimens.dart';
import 'package:talk/ui/constants/strings.dart';
import 'package:talk/ui/constants/styles.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              Strings.appName,
              style: TextStyles.titleApp,
            ),
            const Text(
              Strings.appDescription,
              style: TextStyles.descriptionApp,
            ),
            Center(
              child: ElevatedButton(
                child: const Text(Strings.googleTextButton),
                onPressed: vm.signIn,
              ),
            ),
            Center(
              child: AnimatedBuilder(
                animation: vm,
                builder: (context, child) {
                  return Text("Log: User = ${vm.nameUser.value}");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
