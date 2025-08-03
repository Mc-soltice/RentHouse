// import 'package:flutter/material.dart';

class HouseRoom{
  final String name;
  final String place;
  final String price;
  final String height;
  final String width;
  final String bath;
  final String type;
  final String rating;
  final String image;
  final String color;

  HouseRoom(
    {
      required this.name,
      required this.place,
      required this.price,
      required this.height,
      required this.width,
      required this.bath,
      required this.type,
      required this.rating,
      required this.image,
      required this.color,
    }
  );
}

List<HouseRoom> houseList = [
  HouseRoom(
    name: "House1",
    place: "New York",
    price: "\$1200",
    height: "10",
    width: "20",
    bath: "2",
    type: "Apartment",
    rating: "4.5",
    image: "images/house1.jpg",
    color: "#FF5733"
  ),
  HouseRoom(
    name: "House2",
    place: "Los Angeles",
    price: "\$1500",
    height: "12",
    width: "22",
    bath: "3",
    type: "Villa",
    rating: "4.8",
    image: "images/house2.jpg",
    color: "#33FF57"
  ),
  HouseRoom(
    name: "House3",
    place: "Chicago",
    price: "\$1500",
    height: "12",
    width: "22",
    bath: "3",
    type: "Villa",
    rating: "4.8",
    image: "images/house3.jpg",
    color: "#33FF57"
  ),
  HouseRoom(
    name: "House4",
    place: "Detroi",
    price: "\$1500",
    height: "12",
    width: "22",
    bath: "3",
    type: "Villa",
    rating: "4.8",
    image: "images/house4.jpeg",
    color: "#33FF57"
  ),
  HouseRoom(
    name: "House5",
    place: "Californie",
    price: "\$1500",
    height: "12",
    width: "22",
    bath: "3",
    type: "Villa",
    rating: "4.8",
    image: "images/house5.jpg",
    color: "#33FF57"
  ),
  // Add more houses as needed
];