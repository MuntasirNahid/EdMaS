import 'package:edmas/utills/bloc_observer.dart';
import 'package:edmas/utills/colors.dart';
import 'package:edmas/view/screens/bloc/dashboard_bloc.dart';
import 'package:edmas/view/screens/dashboard.dart';
import 'package:edmas/view/widgets/dashboard/leftside/dashboard_left_side.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Future<bool> isTokenAvailable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token != null;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(
          create: (context) => DashboardBloc(),
          child: LeftSideAll(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EDMAS',
        theme: ThemeData(
          primaryColor: primaryColor,
          fontFamily: 'Inter',
        ),
        home: const DashBoard(),
        //
        // FutureBuilder<bool>(
        //   future: isTokenAvailable(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       if (snapshot.data == true) {
        //         return const DashBoard();
        //       } else {
        //         return SignupScreen();
        //       }
        //     } else {
        //       return const Scaffold(
        //         body: Center(
        //           child: CircularProgressIndicator(),
        //         ),
        //       );
        //     }
        //   },
        // ),
      ),
    );
  }
}
//To run in Web: flutter run -d web-server --web-renderer html
