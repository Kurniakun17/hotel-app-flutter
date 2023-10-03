import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/hotel.dart';

class DetailedHotel extends StatefulWidget {
  Hotel HotelData;
  DetailedHotel({Key? key, required this.HotelData}) : super(key: key);

  @override
  _DetailedHotelState createState() => _DetailedHotelState();
}

class _DetailedHotelState extends State<DetailedHotel> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        leading: BackButton(color: Colors.white),
        surfaceTintColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xff121212),
            child: Column(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 100),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: width,
                          height: 200,
                          child: Image.network(
                            'https://picsum.photos/1080/720',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.HotelData.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 18,
                                        color: Colors.amber,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        widget.HotelData.rating.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                widget.HotelData.location,
                                style: const TextStyle(color: Colors.white70),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                widget.HotelData.description,
                                style: const TextStyle(color: Colors.white70),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IntrinsicWidth(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      padding: EdgeInsets.all(24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.apartment,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                '${widget.HotelData.type} Type',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      padding: EdgeInsets.all(24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.bed,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                '${widget.HotelData.bedroom}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                'Bedroom',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              decoration: BoxDecoration(
                color: Color(0xff121212),
                border: Border(
                  top: BorderSide(width: 0.2, color: Colors.grey),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '\$${widget.HotelData.price}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '/night',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          color: Color(0xff121212),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
