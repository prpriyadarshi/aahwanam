import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'custom_text_field.dart' show TextFontStyle;

class CustomDateTimeBottomSheet extends StatefulWidget {
  final void Function(DateTime fullDateTime) onConfirm;

  const CustomDateTimeBottomSheet({super.key, required this.onConfirm});

  @override
  State<CustomDateTimeBottomSheet> createState() =>
      _CustomDateTimeBottomSheetState();
}

class _CustomDateTimeBottomSheetState extends State<CustomDateTimeBottomSheet> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        children: [
          Center(
            child: Text(
              "Select Event Date",
              style: TextFontStyle.textFontStyle(
                16,
                const Color(0xFF575959),
                FontWeight.w600,
              ),

            ),
          ),
          SizedBox(height: 16),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat.yMMMM()
                          .format(selectedDate), // Example: June 2025
                      style: TextFontStyle.textFontStyle(
                        16,
                        const Color(0xFF575959),
                        FontWeight.w500,
                      ),

                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.chevron_left,
                              color: Color(0xFF004d40)),
                          onPressed: () {
                            setState(() {
                              selectedDate = DateTime(
                                selectedDate.year,
                                selectedDate.month - 1,
                                selectedDate.day,
                              );
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.chevron_right,
                              color: Color(0xFF004d40)),
                          onPressed: () {
                            setState(() {
                              selectedDate = DateTime(
                                selectedDate.year,
                                selectedDate.month + 1,
                                selectedDate.day,
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TableCalendar(
                focusedDay: selectedDate,
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2100, 12, 31),
                currentDay: selectedDate,
                calendarFormat: CalendarFormat.month,
                headerVisible: false, // Hide built-in header
                selectedDayPredicate: (day) => isSameDay(selectedDate, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() => selectedDate = selectedDay);
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Color(0xFF004d40),
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Color(0xFF004d40).withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayTextStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Center(
            child: Text(
              "Select Event Time",
                   style: TextFontStyle.textFontStyle(
    16,
    const Color(0xFF575959),
    FontWeight.w500,
    ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: SizedBox(
              height: 140, // Increase height for better spacing
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: false, // false shows AM/PM
                  initialDateTime: DateTime(
                    0,
                    0,
                    0,
                    selectedTime.hour,
                    selectedTime.minute,
                  ),
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      selectedTime = TimeOfDay(
                        hour: newDateTime.hour,
                        minute: newDateTime.minute,
                      );
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFF1E535B)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child:
                    Text("Cancel",
                      style: TextFontStyle.textFontStyle(
                      12,
                      const Color(0xFF575959),
                      FontWeight.w500,
                    ),
                        ),
              ),
              SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {
                  final fullDateTime = DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedTime.hour,
                    selectedTime.minute,
                  );
                  Navigator.pop(context);
                  widget.onConfirm(fullDateTime);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E535B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Set",         style: TextFontStyle.textFontStyle(
                  12,
                   Colors.white,
                  FontWeight.w500,
                ),),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
