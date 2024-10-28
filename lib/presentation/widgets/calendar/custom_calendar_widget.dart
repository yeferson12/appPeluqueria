

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendarWidget extends StatefulWidget {
  final Function(DateTime selectedDay) onDaySelected;

  const CustomCalendarWidget({Key? key, required this.onDaySelected})
      : super(key: key);

  @override
  _CustomCalendarWidgetState createState() => _CustomCalendarWidgetState();
}

class _CustomCalendarWidgetState extends State<CustomCalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Definir el rango de fechas permitidas (dos semanas visibles a la vez)
  final DateTime _firstDay = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)); // Lunes de la semana actual
  final DateTime _lastDay = DateTime.now().add(const Duration(days: 13)); // Último día de las dos semanas siguientes

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TableCalendar(
          locale: 'es_ES',  // Usar el idioma español para el calendario
          firstDay: _firstDay,  // Primer día del calendario
          lastDay: _lastDay,  // Último día de las dos semanas siguientes
          focusedDay: _focusedDay,
          calendarFormat: CalendarFormat.twoWeeks,  // Mostrar solo dos semanas a la vez
          startingDayOfWeek: StartingDayOfWeek.monday,
          rowHeight: size.height * 0.05,  // Ajustar altura de las filas
          daysOfWeekHeight: size.height * 0.025,  // Ajustar altura de los días de la semana
          shouldFillViewport: false,  // No llenar todo el viewport
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;  // Actualiza el día enfocado
            });
            widget.onDaySelected(selectedDay);  // Llama a la función callback
          },
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: TextStyle(
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.bold,
            ),
            leftChevronIcon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: size.width * 0.05,
            ),
            rightChevronIcon: Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: size.width * 0.05,
            ),
            titleTextFormatter: (date, locale) =>
                DateFormat.yMMMM(locale).format(date).replaceAll(' de ', ' '),
          ),
          calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
            selectedDecoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            todayDecoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            weekendTextStyle: TextStyle(
              color: Colors.red,
              fontSize: size.width * 0.035,
            ),
            defaultTextStyle: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.035,
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.bold,
            ),
            weekendStyle: TextStyle(
              color: Colors.red,
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.bold,
            ),
            dowTextFormatter: (date, locale) =>
                DateFormat.E(locale).format(date).substring(0, 1).toUpperCase(),
          ),
          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay;  // Actualiza el día enfocado cuando el usuario cambia de mes
            });
          },
        ),
      ),
    );
  }
}
