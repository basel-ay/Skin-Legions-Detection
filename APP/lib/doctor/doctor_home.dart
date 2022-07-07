import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_router/App_Router.dart';
import 'package:flutter_application_1/shared/constants/constants.dart';

class MyApp extends StatelessWidget
{
  final AppRouter appRouter;


  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: mapScreen,
      // home: Home()
    );
  }
}
