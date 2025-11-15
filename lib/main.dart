import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/providers/card_provider.dart';
import 'presentation/providers/rewards_provider.dart';
import 'presentation/providers/user_provider.dart';
import 'presentation/routes/app_routes.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardProvider()),
        ChangeNotifierProvider(create: (_) => RewardsProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'CRED Rewards',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.home,
        routes: AppRoutes.routes,
      ),
    );
  }
}

