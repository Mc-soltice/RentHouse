import 'package:flutter/material.dart';
import 'package:renthouse/models/houses/house_model.dart';
import 'package:renthouse/utiles/colors/color.dart';

class DisplayItemHorizontal extends StatelessWidget {

  final HouseRoom houseRoom;
  const DisplayItemHorizontal({super.key, required this.houseRoom});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(left: 18),
      // elevation: 05,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              
            ),
            child: Image.asset(
              houseRoom.image,
              height: 220,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 120,
            width: 250,
            padding: EdgeInsets.only(left: 15, top: 10, right: 25),
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  houseRoom.name,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  houseRoom.place,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      houseRoom.price,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: kBlueColor,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        SizedBox(width: 5),
                        Text(
                          houseRoom.rating,
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 41,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            boxShadow:[
                              BoxShadow(
                                color: Colors.red.withAlpha(95),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              )
                            ]
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.bookmark, color: Colors.white),
                            onPressed: () {
                              // Handle favorite button press
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}