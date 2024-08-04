import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_budgeting/utils/button_theme.dart';
import 'package:personal_budgeting/utils/color.dart';
import 'package:personal_budgeting/utils/routes/route_name.dart';
import 'package:personal_budgeting/utils/routes/routes.dart';
import 'package:personal_budgeting/view_model/budget_controller.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BudgetController()),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,

          title: 'Personal Budgeting',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColor.whiteColor,
            elevatedButtonTheme: TButtonTheme.elevatedButtonTheme,
            outlinedButtonTheme: TButtonTheme.outlinedButtonTheme,
            textTheme: GoogleFonts.lexendTextTheme(),
            useMaterial3: true,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              centerTitle: true,
              titleTextStyle: GoogleFonts.lexend(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              scrolledUnderElevation: 0,
            ),
          ),
          initialRoute: RoutesName.main,
          onGenerateRoute: Routes.generatedRoute,
        ),
      ),
    );
  }
}
