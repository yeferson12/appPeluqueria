import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peluquerias/presentation/screens/home/home_screens.dart';
import 'package:peluquerias/presentation/screens/home/loading_permissions.dart';

import '../../../config/blocs/blocs.dart';


class LodingScreen extends StatelessWidget {
  const LodingScreen({super.key});

  static const name = 'loadin-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isAllGranted 
             ? const HomeScreen()
             : const LoadingPermissions();
        },
      ),
   );
  }
}