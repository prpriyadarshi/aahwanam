
import 'package:aahwanam/screens/account/cart_proceedtopay_screen.dart';
import 'package:aahwanam/widgets/custom_date_time_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingBottomSheet extends StatefulWidget {
  final Map<String, dynamic> booking;

  const BookingBottomSheet({super.key, required this.booking});

  @override
  State<BookingBottomSheet> createState() => _BookingBottomSheetState();
}

class _BookingBottomSheetState extends State<BookingBottomSheet> {
  DateTime selectedDateTime = DateTime.now();

  Future<DateTime?> showCustomDatePicker(BuildContext context) async {
    DateTime currentMonth = DateTime.now();
    DateTime? selectedDate;

    return await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, modalSetState) {
            List<DateTime> _getDaysInMonth(DateTime month) {
              int daysInMonth = DateTime(month.year, month.month + 1, 0).day;
              DateTime firstDayOfMonth = DateTime(month.year, month.month, 1);
              int weekdayOffset = (firstDayOfMonth.weekday + 6) % 7;
              List<DateTime> days = List.generate(daysInMonth, (index) {
                return DateTime(month.year, month.month, index + 1);
              });
              return List<DateTime>.filled(weekdayOffset, DateTime(0)) + days;
            }

            return Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text("Select Event Date",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('MMMM yyyy').format(currentMonth)),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              final now = DateTime.now();
                              DateTime previousMonth = DateTime(
                                  currentMonth.year, currentMonth.month - 1);
                              if (previousMonth.year > now.year ||
                                  (previousMonth.year == now.year &&
                                      previousMonth.month >= now.month)) {
                                modalSetState(() {
                                  currentMonth = previousMonth;
                                });
                              }
                            },
                            icon: Icon(Icons.chevron_left),
                          ),
                          IconButton(
                            onPressed: () {
                              modalSetState(() {
                                currentMonth = DateTime(
                                    currentMonth.year, currentMonth.month + 1);
                              });
                            },
                            icon: Icon(Icons.chevron_right),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                        .map((e) => Expanded(child: Center(child: Text(e))))
                        .toList(),
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: _getDaysInMonth(currentMonth).length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        DateTime date = _getDaysInMonth(currentMonth)[index];
                        if (date.year == 0) return Container();
                        DateTime today = DateTime.now();
                        today = DateTime(today.year, today.month, today.day);
                        bool isPastDate = date.isBefore(today);


                        // bool isPastDate = date.isBefore(DateTime.now());
                        bool isSelected = selectedDate != null &&
                            selectedDate!.year == date.year &&
                            selectedDate!.month == date.month &&
                            selectedDate!.day == date.day;

                        return GestureDetector(
                          onTap: isPastDate
                              ? null
                              : () {
                                  modalSetState(() {
                                    selectedDate = date;
                                  });
                                },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelected ? Color(0xFF1E535B) : null,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text("${date.day}",
                                style: TextStyle(
                                  color: isPastDate
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF1E535B)),
                          foregroundColor: Color(0xFF1E535B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Color(0xFF1E535B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          if (selectedDate != null) {
                            Navigator.pop(context, selectedDate);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1E535B),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Set",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),

                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<TimeOfDay?> showCustomTimePicker(BuildContext context) async {
    TimeOfDay initialTime = TimeOfDay.now();
    int selectedHour = initialTime.hourOfPeriod;
    int selectedMinute = initialTime.minute;
    int selectedPeriodIndex = initialTime.period == DayPeriod.am ? 0 : 1;

    return await showModalBottomSheet<TimeOfDay>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  Text("Select Time",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CupertinoPicker(
                            itemExtent: 50,
                            scrollController: FixedExtentScrollController(
                                initialItem: selectedHour),
                            onSelectedItemChanged: (index) {
                              setModalState(() => selectedHour = index);
                            },
                            children: List.generate(12,
                                (index) => Center(child: Text("${index + 1}"))),
                          ),
                        ),
                        Text(":", style: TextStyle(fontSize: 24)),
                        Expanded(
                          child: CupertinoPicker(
                            itemExtent: 50,
                            scrollController: FixedExtentScrollController(
                                initialItem: selectedMinute),
                            onSelectedItemChanged: (index) {
                              setModalState(() => selectedMinute = index);
                            },
                            children: List.generate(
                                60,
                                (index) => Center(
                                    child: Text(
                                        index.toString().padLeft(2, '0')))),
                          ),
                        ),
                        Expanded(
                          child: CupertinoPicker(
                            itemExtent: 50,
                            scrollController: FixedExtentScrollController(
                                initialItem: selectedPeriodIndex),
                            onSelectedItemChanged: (index) {
                              setModalState(() => selectedPeriodIndex = index);
                            },
                            children: const [
                              Center(child: Text("AM")),
                              Center(child: Text("PM")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF1E535B)),
                          foregroundColor: Color(0xFF1E535B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Color(0xFF1E535B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          int hour = selectedHour + 1;
                          if (hour == 12) hour = 0;
                          if (selectedPeriodIndex == 1) hour += 12;
                          Navigator.pop(context, TimeOfDay(hour: hour, minute: selectedMinute));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1E535B),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Set",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),

                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                "Booking Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF575959),
                ),
              ),
            ),
            const SizedBox(height: 24),

            /// Booking Date
            const Text(
              "Booking Date*",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF575959),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              readOnly: true,
              onTap: () async {
                final date = await showCustomDatePicker(context);
                if (date != null) {
                  setState(() {
                    selectedDateTime = DateTime(
                      date.year,
                      date.month,
                      date.day,
                      selectedDateTime.hour,
                      selectedDateTime.minute,
                    );
                  });
                }
              },
              decoration: InputDecoration(
                hintText: DateFormat('dd, MMM yyyy').format(selectedDateTime),
                hintStyle: const TextStyle(color: Color(0xFF8E8E8E)),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xFF1E535B), width: 1.0),
                ),
                suffixIcon:
                    const Icon(Icons.calendar_today, color: Color(0xFF575959)),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),

            const SizedBox(height: 16),

            /// Booking Time
            const Text(
              "Booking Time*",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF575959),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              readOnly: true,
              onTap: () async {
                final time = await showCustomTimePicker(context);
                if (time != null) {
                  setState(() {
                    selectedDateTime = DateTime(
                      selectedDateTime.year,
                      selectedDateTime.month,
                      selectedDateTime.day,
                      time.hour,
                      time.minute,
                    );
                  });
                }
              },
              decoration: InputDecoration(
                hintText: DateFormat.jm().format(selectedDateTime),
                hintStyle: const TextStyle(color: Color(0xFF8E8E8E)),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xFF1E535B), width: 1.0),
                ),
                suffixIcon:
                    const Icon(Icons.access_time, color: Color(0xFF575959)),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),

            const SizedBox(height: 24),

            /// Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 59,
                  height: 34,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(8),
                      side:
                          const BorderSide(color: Color(0xFF1E535B), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1E535B),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 48,
                  height: 34,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pop(context); // Optional: if you want to close the bottom sheet first
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartProceedToPayScreen(
                            booking: widget.booking,
                            selectedDateTime: selectedDateTime,
                          ),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E535B),
                      padding: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Set",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
