import 'package:flutter/material.dart';
import 'birthday_template_screen.dart';

class EInvitationBirthday extends StatelessWidget {
  const EInvitationBirthday({super.key});

  final List<Map<String, String>> templates = const [
    {
      'title': "Rachelle's Birthday Party",
      'date': 'Sunday, December 15, 3:00 PM',
      'venue': '123 Anywhere St., Any City',
      'template': 'template1',
      'bgColor': '0xFFF7F5F2',
    },
    {
      'title': 'Juliana Silva - 18th Birthday Party',
      'date': 'Monday, January 15, 10:00 AM',
      'venue': '125 Anywhere St., Any City, ST 12345',
      'template': 'template2',
      'bgColor': '0xFFE8F4FB',
    },
    {
      'title': 'Aarav\'s Special Birthday Bash',
      'date': 'Friday, September 20, 6:00 PM',
      'venue': 'Palm Resort, Beachside City',
      'template': 'template3',
      'bgColor': '0xFFFFF0E5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Template')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.65,
        ),
        itemCount: templates.length,
        itemBuilder: (context, index) {
          final template = templates[index];
          final bgColorHex = template['bgColor'];
          final bgColor = bgColorHex != null
              ? Color(int.parse(bgColorHex))
              : Colors.white;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BirthdayTemplateScreen(
                    title: template['title']!,
                    date: template['date']!,
                    venue: template['venue']!,
                    templateId: template['template']!,
                    bgColor: bgColor,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    template['title'] ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    template['date'] ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    template['venue'] ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
