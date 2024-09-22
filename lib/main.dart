import 'package:curefarm_beta/Extensions/Sizes.dart';
import 'package:curefarm_beta/Extensions/router.dart';
import 'package:curefarm_beta/AuthScene/Screens/SignUp&Login/email_screen.dart';
import 'package:curefarm_beta/AuthScene/Screens/SignUp&Login/sign_up_screen.dart';
import 'package:curefarm_beta/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: CureFarm(),
    ),
  );
}

class CureFarm extends ConsumerWidget {
  const CureFarm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      locale: const Locale('ko'),
      routerConfig: ref.watch(routerProvider),
      title: '큐어팜에 오신걸 환영합니다!',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
