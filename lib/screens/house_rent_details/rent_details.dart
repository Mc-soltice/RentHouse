import 'package:flutter/material.dart';
import 'package:renthouse/models/houses/house_model.dart';
import 'package:renthouse/utiles/colors/color.dart';
import 'package:renthouse/widgets/rounded_container_button.dart';

class HouseRentDetail extends StatelessWidget {
  final HouseRoom houseRoom;

  const HouseRentDetail({super.key, required this.houseRoom});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Hero(
                  tag: houseRoom.image,
                  child: Image.asset(
                    houseRoom.image,
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height * 0.43,
                  ),
                ),
              ),

              // for back button
              Positioned(
                top: 40,
                right: 20,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // for price
              Positioned(
                bottom: -30,
                left: 20,
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      houseRoom.price,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kBlueColor,
                      ),
                    ),
                  ),
                ),
              ),

              // for bookmark icon
              Positioned(
                bottom: -120,
                right: 50,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withAlpha(128),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.bookmark,
                    color: kBackgroundColor,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.03),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    houseRoom.name,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 30,
                      height: 1.2,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  houseRoom.place,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.2,
                    color: kFontColor.withAlpha(150),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Room Facilities",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 2,
                    ),
                  ),
                  Text(
                    "À louer : charmante maison offrant un beau potentiel dans un quartier calme et accessible. Idéale pour une petite famille, elle nécessite quelques rénovations légères (peinture, sanitaires) qui permettront de la personnaliser à votre goût. Une belle opportunité à saisir pour un loyer raisonnable dans un cadre agréable.",
                    style: TextStyle(
                      fontSize: 15,
                      color: kFontColor.withAlpha(150),
                    ),
                  ),
                  Text(
                    "Read More",
                    style: TextStyle(
                      fontSize: 14,
                      height: 2,
                      fontWeight: FontWeight.w500,
                      color: kBlueTextColor,
                      decoration: TextDecoration.underline,
                      decorationColor: kBlueTextColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      dimensionInfo(
                        "images/FV.png",
                        "height : ${houseRoom.height}m",
                      ),
                      dimensionInfo(
                        "images/FH.png",
                        "width : ${houseRoom.width}m",
                      ),
                      dimensionInfo("images/DC.png", "Bathub"),
                      dimensionInfo("images/FM.png", "Family"),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  RoundedContainerButton(
                    onTap: () {
                      // Handle contact action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Contacting ${houseRoom.name}..."),
                        ),
                      );
                    },
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    child: Text(
                      "Contact Now",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container dimensionInfo(image, value) {
    return Container(
      height: 100,
      width: 80,
      decoration: BoxDecoration(
        //  color: kBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(image, height: 40),
          const SizedBox(height: 7),
          Text(value),
        ],
      ),
    );
  }
}
