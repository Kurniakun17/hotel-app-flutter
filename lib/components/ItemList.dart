import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_app/screens/DetailedHotel.dart';

import '../models/hotel.dart';

class ItemList extends StatelessWidget {
  Hotel data;
  ItemList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailedHotel(
                HotelData: data,
              );
            },
          ),
        );
      },
      child: Container(
        height: 132,
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 170,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(data.url, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            data.rating.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                data.location,
                                style: const TextStyle(
                                  color: Color(0xff8E8B93),
                                ),
                              ),
                              Text(
                                'Apartment',
                                style: TextStyle(
                                  color: Color(0xff8E8B93),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.bed,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              data.bedroom.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '\$${data.price}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
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
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
