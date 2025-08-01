import 'package:flutter/material.dart';

class InvitationEditorScreen extends StatefulWidget {
  @override
  _InvitationEditorScreenState createState() => _InvitationEditorScreenState();
}

class _InvitationEditorScreenState extends State<InvitationEditorScreen> {
  String name = "OLIVIA’S";
  String eventType = "birthday";
  String date = "SATURDAY MAY 4TH";
  String address = "At 9 pm o’clock | Numbers night club\n309 westheimer rd Houston, tx";

  double fontSize = 20;
  String fontFamily = 'Roboto';

  int currentPage = 0;

  List<String> pages = ['Page 1', 'Page 2', 'Page 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: BackButton(),
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          // Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pages.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ChoiceChip(
                  label: Text(pages[index]),
                  selected: currentPage == index,
                  onSelected: (selected) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          // Editable Card Design
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/template_bg.png'), // Replace with your background
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text("JOIN US TO CELEBRATE",
                      style: TextStyle(fontSize: fontSize - 5, fontFamily: fontFamily)),
                  Text(name,
                      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, fontFamily: fontFamily)),
                  SizedBox(height: 10),
                  Text(eventType,
                      style: TextStyle(
                          fontSize: fontSize + 10,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.brown)),
                  SizedBox(height: 10),
                  Text(date,
                      style: TextStyle(fontSize: fontSize, fontFamily: fontFamily)),
                  SizedBox(height: 20),
                  Text(address,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: fontSize - 3, fontFamily: fontFamily)),
                  SizedBox(height: 20),
                  Image.asset('assets/cake.png', height: 100), // Replace with your cake image
                ],
              ),
            ),
          ),
          // Bottom Editor
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _editTextDialog();
                    }),
                IconButton(
                    icon: Icon(Icons.text_fields),
                    onPressed: () {
                      _changeFontFamily();
                    }),
                IconButton(
                    icon: Icon(Icons.format_size),
                    onPressed: () {
                      _changeFontSize();
                    }),
                ElevatedButton(
                    onPressed: () {
                      // Next navigation logic
                    },
                    child: Text("Next"))
              ],
            ),
          )
        ],
      ),
    );
  }

  void _editTextDialog() {
    TextEditingController nameController = TextEditingController(text: name);
    TextEditingController typeController = TextEditingController(text: eventType);
    TextEditingController dateController = TextEditingController(text: date);
    TextEditingController addressController = TextEditingController(text: address);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Edit Invitation"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
              TextField(controller: typeController, decoration: InputDecoration(labelText: "Event Type")),
              TextField(controller: dateController, decoration: InputDecoration(labelText: "Date")),
              TextField(controller: addressController, decoration: InputDecoration(labelText: "Address")),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  name = nameController.text;
                  eventType = typeController.text;
                  date = dateController.text;
                  address = addressController.text;
                });
                Navigator.pop(context);
              },
              child: Text("Save"))
        ],
      ),
    );
  }

  void _changeFontSize() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Change Font Size"),
        content: Slider(
          value: fontSize,
          min: 12,
          max: 40,
          divisions: 7,
          label: fontSize.round().toString(),
          onChanged: (val) {
            setState(() {
              fontSize = val;
            });
          },
        ),
      ),
    );
  }

  void _changeFontFamily() {
    List<String> fonts = ['Roboto', 'Cursive', 'Serif', 'Monospace'];
    showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        title: Text("Choose Font"),
        children: fonts
            .map((font) => SimpleDialogOption(
          child: Text(font, style: TextStyle(fontFamily: font)),
          onPressed: () {
            setState(() {
              fontFamily = font;
            });
            Navigator.pop(context);
          },
        ))
            .toList(),
      ),
    );
  }
}
