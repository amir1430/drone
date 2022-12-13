import 'package:drone/features/login/login.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: NewAccountDiolog(),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       'Before you can use the app\nPlease add a new account',
        //       style: context.headline4,
        //     ),
        //     const SizedBox(
        //       height: 32,
        //     ),
        //     SquareBtn(
        //       size: const Size.square(100),
        //       onPressed: () => context.toDialog(
        //         child: const NewAccountDiolog(),
        //       ),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Icon(
        //             Ionicons.add,
        //             color: context.primaryColor,
        //             size: 32,
        //           ),
        //           const Text('Add account'),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
