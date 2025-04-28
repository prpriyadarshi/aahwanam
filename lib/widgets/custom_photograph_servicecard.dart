import 'package:aahwanam/widgets/custom_event_date_time%20_picker.dart';
import 'package:flutter/material.dart';

class CustomServiceCard extends StatelessWidget {

  @override
  List<String> birthdayPhotoshootImages = [
    "assets/images/birthdayGallery.png",
    "assets/images/birthdayGallery1.png",
    "assets/images/birthdayGallery2.png",
    "assets/images/birthdayGallery3.png",

  ];
  List<String> preweddingVideoThumbnails = [
    "assets/images/preweddingGallery.png",
    "assets/images/preweddingGallery1.png",
    "assets/images/preweddingGallery2.png",
    "assets/images/preweddingGallery3.png",
  ];

  List<String> babyPhotoshootImages = [
    "assets/images/babyshootGallery.png",
    "assets/images/babyshootGallery1.png",
    "assets/images/babyshootGallery2.png",
    "assets/images/babyshootGallery3.png",
  ];

  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Photo studio"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
          child: Row(
            children: [
              // Outlined Button
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFF1E535B),
                    side: BorderSide(color: Color(0xFF1E535B), width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text("Add to cart"),
                ),
              ),
              SizedBox(width: 12),
              // Filled Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1E535B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text("Book Service"
                    ,style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),


        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card Section (non-scrollable)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFF4F4F4), width: 0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  margin: EdgeInsets.zero,
                  color: Color(0xFFF4F4F4),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/baby shoot main.png',
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Photo Studio", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                SizedBox(height: 4),
                                Text("15,000", style: TextStyle(fontSize: 14, color: Color(0xFF1E535B), fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 20),
                                SizedBox(width: 4),
                                Text("4.3", style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // TabBar
              PreferredSize(
                preferredSize: Size.fromHeight(50), // Adjust height as needed
                child: TabBar(
                  labelColor: Color(0xFF575959),
                  unselectedLabelColor: Color(0xFF757575),
                  dividerHeight: 0,
                  indicatorColor: Color(0xFF575959),
                  tabs: [
                    Tab(child: Align(child: Text("All Details"), alignment: Alignment.center)),
                    Tab(child: Align(child: Text("Gallery"), alignment: Alignment.center)),
                    Tab(child: Align(child: Text("Reviews"), alignment: Alignment.center)),
                  ],
                ),
              ),


              // Tab content (scrollable only inside tabs)
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      padding: EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Silver Package',style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF575959),
                                ),),

                                Text(
                                  "₹6000",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF1E535B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                            ],
                          ),

                          const SizedBox(height: 10,),
                          Text('Silver Package Photography Service offers a '
                              'fantastic choice When all you need a budget friendly photography'
                              ' and personal photoshoot for your event.',style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF757575),
                          ),),

                          SizedBox(height: 10,),
                          Text(
                            "Included in this Package are:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF575959),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "• 1 Professional Photographer + Videographer\n"
                                "• Candid Photos and HD quality\n"
                                "• Premium quality soft copies of your event",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF757575),
                            ),
                          ),
                          SizedBox(height: 16),

                          // Event Details Section with Centered Text and Lines
                          Row(
                            children: [
                              // Left Line
                              Expanded(
                                child: Divider(
                                  color: Color(0xFFE4E4E4),
                                  thickness: 0.5,
                                ),
                              ),
                              // Text
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "Get quotes for your event",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF575959),
                                  ),
                                ),
                              ),
                              // Right Line
                              Expanded(
                                child: Divider(
                                  color: Color(0xFFE4E4E4),
                                  thickness: 0.5,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16), // Add some spacing after the heading
                          EventDateTimePicker(),
                          SizedBox(height: 16), // Add some spacing after the heading



                          Text('Event Address*',style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF575959),
                          ),),

                          SizedBox(height: 10,),

                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFE4E4E4)),
                                borderRadius: BorderRadius.circular(9)
                            ),
                            child: Column(
                              children: [

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space between title and button
                                  children: [
                                    Text(
                                      "Financial District", // Your title here
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF575959)
                                      ),
                                    ),

                                    ElevatedButton(
                                      onPressed: () {
                                        // Button action
                                      },
                                      child: Text(
                                        "Change",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Color(0xFF1E535B), // Text color
                                        backgroundColor: Colors.white, // Button background color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0), // Rounded corners
                                          side: BorderSide(color: Color(0xFF1E535B), width: 1), // Border color and width
                                        ),
                                        padding: EdgeInsets.all(6.00), // No extra space inside the button
                                        minimumSize: Size(0, 0), // Ensures the button size matches the content
                                      ),
                                    ),



                                  ],
                                ),

                                SizedBox(height: 8.0), // Add spacing between Row and paragraph
                                Text(
                                  "This is the paragraph text that appears below the title and button \n This is the paragraph text that appears below the title and button.",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF757575),
                                  ),
                                ),
                              ],
                            ),
                          )

                        ]
                      ),
                    ),


                    SingleChildScrollView(
                      padding: EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Birthday Photoshoot
                          Text("Birthday Photoshoot", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color(0xFF575959))),
                          SizedBox(height: 8),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (var image in birthdayPhotoshootImages)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        image,
                                        width: 96,
                                        height: 102,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),

                          // Prewedding Videos
                          Text("Prewedding Videos", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color(0xFF575959))),
                          SizedBox(height: 8),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (var videoThumbnail in preweddingVideoThumbnails)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            videoThumbnail,
                                            width: 96,
                                            height: 102,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Icon(Icons.play_circle_fill, size: 40, color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),

                          // Baby Photoshoot
                          Text("Baby Photoshoot", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color(0xFF575959))),
                          SizedBox(height: 8),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (var image in babyPhotoshootImages)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        image,
                                        width: 96,
                                        height: 102,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      padding: EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Rating & Reviews", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color(0xFF575959))),
                              SizedBox(height: 8),
                              for (int i = 5; i >= 1; i--)
                                Row(
                                  children: [
                                    Text("$i"),
                                    SizedBox(width: 4),
                                    Icon(Icons.star, color: Color(0xFFEFAA37), size: 16),
                                    SizedBox(width: 8),
                                    SizedBox(
                                      width: 100, // Define the width here
                                      child: LinearProgressIndicator(
                                        value: i * 0.2, // Replace with your actual values
                                        minHeight: 3,
                                        backgroundColor: Colors.grey.shade300,
                                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1E535B)),
                                      ),
                                    ),

                                    SizedBox(width: 8),
                                    Text("${i * 20}", style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                            ],
                          ),

                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Button action
                                },
                                child: Text(
                                  "Rate Service",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Color(0xFF1E535B), // Text color
                                  backgroundColor: Colors.white, // Button background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                                    side: BorderSide(color: Color(0xFF1E535B), width: 1), // Border color and width
                                  ),
                                  padding: EdgeInsets.all(9.00), // No extra space inside the button
                                  minimumSize: Size(0, 0), // Ensures the button size matches the content
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Very Good",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Color(0xFFEFAA37), size: 16),
                                  Icon(Icons.star, color: Color(0xFFEFAA37), size: 16),
                                  Icon(Icons.star, color: Color(0xFFEFAA37), size: 16),
                                  Icon(Icons.star, color: Color(0xFFEFAA37), size: 16),
                                  Icon(Icons.star_border, color: Color(0xFFEFAA37), size: 16),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text("200 ratings and 160 \n reviews", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF757575))),
                            ],
                          ),
                        ],
                        ),
                          SizedBox(height: 16),
                          // Photos Section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Photos",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF575959)),
                            ),
                            SizedBox(height: 8),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,  // Ensure it's aligned to the left
                                children: [
                                  for (var image in babyPhotoshootImages) // Replace with your images list
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          image,
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16),

                          // Individual Review

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.star, color: Color(0xFFEFAA37), size: 16),
                              Icon(Icons.star, color: Color(0xFFEFAA37), size: 16),
                              Icon(Icons.star, color: Color(0xFFEFAA37), size: 16),
                              Icon(Icons.star, color: Color(0xFFEFAA37), size: 16),
                              Icon(Icons.star_border, color: Color(0xFFEFAA37), size: 16),

                              SizedBox(width: 8),

                              Text(
                                "24 ",
                                style: TextStyle(color: Color(0xFF575959), fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Very good service ",
                                style: TextStyle(color: Color(0xFF757575), fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          // This column allows the text to wrap onto the next line if needed
                          SizedBox(height: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF757575)),
                              ),
                            ],
                          ),
                        ],
                      ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
