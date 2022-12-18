import 'package:get/get.dart';
import 'package:greengrocer/src/auth/screens/listapessoas.dart';
import 'package:greengrocer/src/auth/screens/sign_up_screen.dart';

import '../auth/screens/sign_in_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: PagesRoutes.pagehome, page: () =>   SignInScreen()),
    GetPage(name: PagesRoutes.pagecadastro, page: () =>  SignUpScreen()),
    GetPage(name: PagesRoutes.pagelista, page: () => const Home())
  ];
}

abstract class PagesRoutes {
  static const String pagelista = '/lista';
  static const String pagecadastro = '/cadastro';
  static const String pagehome = '/home';
}