import 'package:flutter/material.dart';
import 'package:peluquerias/config/blocs/blocs.dart';
import 'package:peluquerias/config/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peluquerias/presentation/services/services.dart';

void main() {
  runApp( 
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GpsBloc() ),
        BlocProvider(create: (context) => LocationBloc() ),
        BlocProvider(create: (context) => MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context)) ),
        BlocProvider(create: (context) => SearchBloc( walkinService: WalkingService(), searchPlacesService: SearchPlacesService()) ),
        BlocProvider(create: (context) => DrawerBloc() ),
        BlocProvider(create: (context) => BarberInfoBloc(mapBloc: BlocProvider.of<MapBloc>(context)) ),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme( selectedColor: selectedColor, isDarkmodo: isDarkmode ).getTheme()
    );
  }
}
