
import 'package:flutter/material.dart';
import 'package:peluquerias/presentation/screens/screens.dart';

import '../../ui/ui.dart';
import '../../widgets/widgets.dart';

class SalonBackgrounScreen extends StatefulWidget {
  const SalonBackgrounScreen({super.key});

  @override
  State<SalonBackgrounScreen> createState() => _SalonBackgrounScreenState();
}

class _SalonBackgrounScreenState extends State<SalonBackgrounScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Stack(
                    children: [
                      BackGroud(),
                      SalonScreen(),
                      
                    ],
              ),
        
    );
  }

}
