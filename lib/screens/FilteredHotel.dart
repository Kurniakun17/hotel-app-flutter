import 'package:flutter/material.dart';

import '../components/ItemList.dart';
import '../models/hotel.dart';

class FilteredHotel extends StatefulWidget {
  List<Hotel> HotelData;
  FilteredHotel({Key? key, required this.HotelData}) : super(key: key);

  @override
  _FilteredHotelState createState() => _FilteredHotelState();
}

class _FilteredHotelState extends State<FilteredHotel> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xf121212),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: const Padding(
          padding: const EdgeInsets.only(top: 12, left: 12),
          child: BackButton(color: Colors.white),
        ),
        backgroundColor: Color(0xff121212),
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Search Hotel',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(0xff121212),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: screenWidth < 768
                    ? const EdgeInsets.symmetric(horizontal: 24, vertical: 16)
                    : const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
                child: SingleChildScrollView(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (screenWidth < 768) {
                        return Column(
                          children:
                              List.generate(widget.HotelData.length, (index) {
                            return ItemList(data: widget.HotelData[index]);
                          }).toList(),
                        );
                      } else if (screenWidth < 1200) {
                        return Column(
                          children: List.generate(
                              (widget.HotelData.length / 2).ceil(), (index) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(right: 24),
                                      child: ItemList(
                                          data: widget.HotelData[index])),
                                ),
                                if (index + 1 >= widget.HotelData.length)
                                  Expanded(
                                    child: ItemList(
                                        data: widget.HotelData[index + 1]),
                                  )
                              ],
                            );
                          }).toList(),
                        );
                      } else {
                        return Column(
                          children: List.generate(
                              (widget.HotelData.length / 3).ceil(), (index) {
                            return Row(
                              children: [
                                Expanded(
                                  child:
                                      ItemList(data: widget.HotelData[index]),
                                ),
                                if (index + 1 >= widget.HotelData.length)
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 32),
                                      child: ItemList(
                                        data: widget.HotelData[index + 1],
                                      ),
                                    ),
                                  ),
                                if (index + 2 >= widget.HotelData.length)
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 32),
                                      child: ItemList(
                                          data: widget.HotelData[index + 2]),
                                    ),
                                  )
                              ],
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
