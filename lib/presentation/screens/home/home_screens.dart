import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peluquerias/config/blocs/blocs.dart';
import 'package:peluquerias/presentation/views/views.dart';
import 'package:peluquerias/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const name = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.getCurrentPosition();
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.lastKnownLocation == null)
            return const Center(child: Text('Espere por favor...'));

          return BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    MapView(
                      initialLocation: state.lastKnownLocation!,
                      polylines: mapState.polylines.values.toSet(),
                      ),
                    // TODO: botones...
                    const SearchBarWidget(),
                    const ManualMarker()
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
          const Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        BtnFollowUser(),
        BtnCurrentLocation(),
      ]),
    );
  }
}
