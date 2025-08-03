import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:renthouse/components/most_recent/most_recent.dart';
import 'package:renthouse/utiles/colors/color.dart';
import 'package:renthouse/components/drop_down/drop_down.dart';
import 'package:renthouse/models/houses/house_model.dart';
import 'package:renthouse/components/display_item_scroll/horizontal_scroll.dart';
import 'package:renthouse/components/app_bar_container/primary_header_container.dart';
import 'package:renthouse/screens/house_rent_details/rent_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? piece = "2-4 Pieces";
  final List<String> pieces = ["1-2 Pieces", "2-3 Pieces", "2-4 Pieces"];
  String? filter = "Short by: Price";
  final List<String> filters = [
    "Short by: Price",
    "Short by: Location",
    "Short by: Rating",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,

      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  PreferredSize(
                    preferredSize: Size.fromHeight(
                      185,
                    ), // Set the height of the AppBar
                    // child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30),
                      // padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Welcome to RentHouse',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: kFontColor,
                              ),
                            ),

                            subtitle: Row(
                              children: [
                                Text(
                                  'My Location',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down, size: 30),
                              ],
                            ),

                            trailing: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  // Icons.notifications,
                                  Iconsax.message,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // Handle profile button press
                                },
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                DropDownContainer(
                                  dropdownName: piece,
                                  items: pieces,
                                  onChanged: (value) {
                                    setState(() {
                                      piece = value;
                                    });
                                  },
                                ),

                                SizedBox(width: 10),

                                DropDownContainer(
                                  dropdownName: filter,
                                  items: filters,
                                  onChanged: (value) {
                                    setState(() {
                                      filter = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 350,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: houseList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) =>
                                  HouseRentDetail(houseRoom: houseList[index]),
                        ),
                      );
                    },
                    child: DisplayItemHorizontal(houseRoom: houseList[index]),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            mostRecent(),

            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              reverse: true,
              physics: const ScrollPhysics(),
              itemCount: houseList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => HouseRentDetail(houseRoom: houseList[index]),
                      ),
                    );
                  },
                  child: MostRecentItems(houseRoom: houseList[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding mostRecent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white70,
        ),
        child: ListTile(
          title: Text(
            "Most recent Houses",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          trailing: TextButton(
            onPressed: () {
              // Handle view all button press
            },
            child: Text(
              "View All",
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                decorationColor: kFontColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
