import 'package:aims_coding_task/common/extensions/sized_box.dart';
import 'package:aims_coding_task/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:aims_coding_task/firebase_options.dart';
import 'package:aims_coding_task/util/di/di.dart';
import 'package:aims_coding_task/util/router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc for Cubit
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();

  static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const AppWithCubit();
      },
    );
  }
}

class AppWithCubit extends StatefulWidget {
  const AppWithCubit({Key? key}) : super(key: key);

  @override
  State<AppWithCubit> createState() => _AppWithCubitState();
}

class _AppWithCubitState extends State<AppWithCubit> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setPadding(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => sl<LoginCubit>(), // Providing the LoginCubit
        ),
        // Add other Cubit providers here if needed
      ],
      child: MaterialApp.router(
        key: navigatorKey,
        restorationScopeId: 'app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        routerConfig: router,
      ),
    );
  }
}
