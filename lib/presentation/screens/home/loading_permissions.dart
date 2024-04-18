import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/blocs/blocs.dart';


class LoadingPermissions extends StatelessWidget {
  const LoadingPermissions({super.key});

  static const name = 'loadin-permission';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return !state.isGpsEnabled
              ? const _EnableGpsMessage()
              : const _ActiviteGps();
          },
        )
     ),
   );
  }
}

class _ActiviteGps extends StatelessWidget {
  const _ActiviteGps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         const Text('Esnecesario el acceso al GPS'),
         MaterialButton(
          child: const Text('Solicitar Acceso'),
          color: Colors.grey,
          elevation: 0,
          splashColor: Colors.transparent,
          onPressed: (){ 
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAccess();
          }
          )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Debes habilitar el GPS');
  }
}