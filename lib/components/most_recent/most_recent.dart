import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:renthouse/models/houses/house_model.dart';
import 'package:renthouse/utiles/colors/color.dart';

class MostRecentItems extends StatelessWidget {
  final HouseRoom houseRoom;
  const MostRecentItems({super.key, required this.houseRoom});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      padding: EdgeInsets.only(right: 5,left: 5),
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                // for images
                Positioned(
                  top: 0,
                  right: 12,      
                  left: 0,
                  bottom: 12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(houseRoom.image, fit: BoxFit.cover),
                  ),
                ),
                // for rating
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: kBlueColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      child: Row(
                        children: [
                          Icon(Iconsax.star, color: kBackgroundColor, size: 15),
                          SizedBox(width: 3),
                          Text(
                            houseRoom.rating,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    houseRoom.name,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    houseRoom.place,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400],
                    ),
                  ),

                  Row(
                    children: [
                  Text(
                    "${houseRoom.width}m | ${houseRoom.height}m",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),

                  const Spacer(),
                      Text(
                        houseRoom.price,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kBlueColor,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.bookmark, color: Colors.grey),
                        onPressed: () {
                          // Handle favorite button press
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
