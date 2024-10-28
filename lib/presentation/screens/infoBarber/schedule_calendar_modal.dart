import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ScheduleCalendarModal extends StatefulWidget {
  const ScheduleCalendarModal({super.key});

  @override
  _ScheduleCalendarModalState createState() => _ScheduleCalendarModalState();
}

class _ScheduleCalendarModalState extends State<ScheduleCalendarModal> {
  DateTime? _selectedDay;
  String? _selectedTimeSlot;

  // Lista de horarios disponibles
  final List<String> availableSlots = [
    '08:00', '08:30', '09:00', '09:30', '10:00', '10:30',
    '11:00', '11:30', '12:00', '12:30', '13:00', '13:30',
    '14:00', '14:30', '15:00', '15:30', '16:00', '16:30',
    '17:00', '17:30', '18:00', '18:30', '19:00', '19:30'
  ];

  // Lista de horarios ya reservados (no disponibles)
  final List<String> bookedSlots = [
    '09:00', '10:00', '11:00', '14:30', '17:00'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.70,  
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Título del modal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Agenda tu cita con Yeferson',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),  // Cierra el modal
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Aquí iría el calendario
          CustomCalendarWidget(
            onDaySelected: (selectedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
          ),

          const SizedBox(height: 10),

          const Text(
            'Selecciona la hora',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),
          _reservationHours(),
          const SizedBox(height: 7),

          ElevatedButton(
            onPressed: _selectedTimeSlot != null && !bookedSlots.contains(_selectedTimeSlot)
                ? () {
                    print('Cita reservada para $_selectedDay a las $_selectedTimeSlot');
                    // Aquí puedes añadir la lógica para reservar la cita
                  }
                : null,
            child: const Text('Reservar cita'),
          ),
        ],
      ),
    );
  }

  Expanded _reservationHours() {
    return Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,  // Cantidad de botones por fila
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.8,  // Relación de aspecto para hacerlos más altos y menos anchos
            ),
            itemCount: availableSlots.length,
            itemBuilder: (context, index) {
              final timeSlot = availableSlots[index];
              final isBooked = bookedSlots.contains(timeSlot);
              final isSelected = timeSlot == _selectedTimeSlot;

              return GestureDetector(
                onTap: () {
                  if (!isBooked) {
                    setState(() {
                      _selectedTimeSlot = timeSlot;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isBooked
                        ? Colors.redAccent
                        : isSelected
                            ? Colors.blue
                            : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color:  Colors.black,
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      timeSlot,
                      style: TextStyle(
                        color: isBooked
                            ? Colors.white
                            : isSelected
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
  }
}
