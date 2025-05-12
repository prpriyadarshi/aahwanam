import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCombinedDateTimePicker extends StatefulWidget {
  final Function(DateTime selectedDateTime) onDateTimeSelected;

  const EventCombinedDateTimePicker({Key? key, required this.onDateTimeSelected}) : super(key: key);

  @override
  _EventCombinedDateTimePickerState createState() => _EventCombinedDateTimePickerState();
}

class _EventCombinedDateTimePickerState extends State<EventCombinedDateTimePicker> {
  DateTime? selectedDate;
  DateTime? selectedTime;
  DateTime currentMonth = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showUnifiedDateTimePicker(context);
    });
  }

  void _showUnifiedDateTimePicker(BuildContext context) {
    DateTime initialDate = selectedDate ?? DateTime.now();
    DateTime initialTime = selectedTime ?? DateTime.now();

    DateTime tempDate = initialDate;
    int selectedHour = initialTime.hour % 12 == 0 ? 11 : (initialTime.hour % 12) - 1;
    int selectedMinute = initialTime.minute;
    int selectedPeriodIndex = initialTime.hour >= 12 ? 1 : 0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true, // Allow swiping to dismiss
      enableDrag: true,    // Allow drag-to-dismiss
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.white,  // Make background white for light theme
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.95,
              ),
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("Select Event Date ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600 ,color: Color(0xFF575959))),
                    ),
                    SizedBox(height: 16),

                    // Month Navigation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(DateFormat('MMMM yyyy').format(currentMonth),
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.keyboard_arrow_left),
                              onPressed: () {
                                DateTime previous = DateTime(currentMonth.year, currentMonth.month - 1);
                                DateTime now = DateTime.now();
                                if (previous.year > now.year ||
                                    (previous.year == now.year && previous.month >= now.month)) {
                                  setModalState(() => currentMonth = previous);
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.keyboard_arrow_right),
                              onPressed: () {
                                setModalState(() {
                                  currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Day Labels
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                          .map((d) => Expanded(
                        child: Center(
                            child: Text(d,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF666666)))),
                      ))
                          .toList(),
                    ),

                    // Calendar Grid
                    SizedBox(
                      height: 300,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 8),
                        itemCount: _getDaysInMonth(currentMonth).length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 6,
                        ),
                        itemBuilder: (context, index) {
                          DateTime date = _getDaysInMonth(currentMonth)[index];
                          if (date.year == 0) return Container();

                          bool isPast = date.isBefore(DateTime.now());
                          bool isSelected = tempDate.year == date.year &&
                              tempDate.month == date.month &&
                              tempDate.day == date.day;

                          return GestureDetector(
                            onTap: isPast
                                ? null
                                : () => setModalState(() => tempDate = date),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected ? Color(0xFF1E535B) : Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text("${date.day}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isPast
                                        ? Colors.grey
                                        : isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  )),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 20),

                    Center(
                      child: Text("Select Event Time ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Color(0xFF575959))),
                    ),
                    SizedBox(height: 16),

                    Center(
                      child: SizedBox(
                        height: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Hour Picker
                            SizedBox(
                              width: 80,
                              child: CupertinoPicker(
                                scrollController:
                                FixedExtentScrollController(initialItem: selectedHour),
                                itemExtent: 40,
                                onSelectedItemChanged: (i) =>
                                    setModalState(() => selectedHour = i),
                                children: List.generate(12, (i) => Center(child: Text("${i + 1}"))),
                              ),
                            ),
                            Text(":", style: TextStyle(fontSize: 24)),
                            // Minute Picker
                            SizedBox(
                              width: 80,
                              child: CupertinoPicker(
                                scrollController:
                                FixedExtentScrollController(initialItem: selectedMinute),
                                itemExtent: 40,
                                onSelectedItemChanged: (i) =>
                                    setModalState(() => selectedMinute = i),
                                children: List.generate(
                                    60,
                                        (i) =>
                                        Center(child: Text(i.toString().padLeft(2, '0')))),
                              ),
                            ),
                            // AM/PM Picker
                            SizedBox(
                              width: 80,
                              child: CupertinoPicker(
                                scrollController:
                                FixedExtentScrollController(initialItem: selectedPeriodIndex),
                                itemExtent: 40,
                                onSelectedItemChanged: (i) =>
                                    setModalState(() => selectedPeriodIndex = i),
                                children: const [
                                  Center(child: Text("AM")),
                                  Center(child: Text("PM")),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color(0xFF1E535B)),
                          ),
                          child: Text("Cancel", style: TextStyle(color: Color(0xFF1E535B))),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            int hour = (selectedHour + 1) % 12;
                            if (selectedPeriodIndex == 1) hour += 12;

                            DateTime finalDateTime = DateTime(
                              tempDate.year,
                              tempDate.month,
                              tempDate.day,
                              hour,
                              selectedMinute,
                            );

                            setState(() {
                              selectedDate = tempDate;
                              selectedTime = finalDateTime;
                            });

                            Navigator.pop(context);
                            widget.onDateTimeSelected(finalDateTime);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1E535B),
                          ),
                          child: Text("Set", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<DateTime> _getDaysInMonth(DateTime month) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final firstWeekday = firstDayOfMonth.weekday;
    final daysBefore = (firstWeekday + 6) % 7;

    final numDays = DateTime(month.year, month.month + 1, 0).day;
    final days = <DateTime>[];

    for (int i = 0; i < daysBefore; i++) {
      days.add(DateTime(0));
    }
    for (int i = 0; i < numDays; i++) {
      days.add(DateTime(month.year, month.month, i + 1));
    }

    return days;
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
