import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'lib.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final PageRouter router = PageRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Marketplace().of(context),
        onGenerateRoute: router.getRoute,
      ),
    );
  }
}
