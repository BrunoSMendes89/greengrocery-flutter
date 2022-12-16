import 'package:get/get.dart';

import '../auth/screens/sign_in_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: '/home', page: () => const SignInScreen())
  ];
}
