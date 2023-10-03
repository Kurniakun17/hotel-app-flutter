import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_app/screens/FilteredHotel.dart';

import '../components/ItemList.dart';
import '../models/hotel.dart';
import 'DetailedHotel.dart';

class HomePage extends StatefulWidget {
  List<Hotel> HotelData;
  String? _typeValue = 'all';
  String priceDropdownvalue = 'Low to High';
  String ratingDropdownvalue = 'High to Low';

  int? _bedroomValue = 0;

  HomePage({Key? key, required this.HotelData}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: const Color(0xff121212),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: screenWidth < 768
                    ? EdgeInsets.only(right: 24, left: 24, top: 24)
                    : EdgeInsets.only(right: 48, left: 48, top: 48),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jakarta',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            'Available ${widget.HotelData.length == null ? '0' : widget.HotelData.length} hotels',
                            style: TextStyle(
                              color: Color(0xff8E8B9A),
                            ),
                          )
                        ],
                      ),
                    ),
                    // navbar
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            iconSize: 36,
                            onPressed: () {
                              FilterBottomSheet(context, screenWidth);
                            },
                            icon: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(500),
                                color: const Color(0xff1e1e1e),
                              ),
                              child: const Icon(
                                Icons.tune_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              IconButton(
                                iconSize: 36,
                                onPressed: () {},
                                icon: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(500),
                                    color: const Color(0xff1e1e1e),
                                  ),
                                  child: const Icon(
                                    Icons.notifications_none_sharp,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 18,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff8E79F9),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: screenWidth < 768
                        ? EdgeInsets.symmetric(horizontal: 24)
                        : EdgeInsets.symmetric(horizontal: 48),
                    child: const Text(
                      'Most Popular',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: screenWidth < 768
                        ? const EdgeInsets.only(
                            left: 24,
                          )
                        : EdgeInsets.only(left: 48),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          carouselItem(
                              data: widget.HotelData[0],
                              screenWidth: screenWidth),
                          carouselItem(
                              data: widget.HotelData[1],
                              screenWidth: screenWidth),
                          carouselItem(
                              data: widget.HotelData[2],
                              screenWidth: screenWidth),
                          carouselItem(
                              data: widget.HotelData[3],
                              screenWidth: screenWidth),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: screenWidth < 768
                        ? const EdgeInsets.symmetric(horizontal: 24)
                        : const EdgeInsets.symmetric(horizontal: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'New Hotels',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            if (screenWidth < 768) {
                              return Column(
                                children: List.generate(5, (index) {
                                  return ItemList(
                                      data: widget.HotelData[index + 4]);
                                }).toList(),
                              );
                            } else if (screenWidth < 1500) {
                              return Column(
                                children: List.generate(3, (index) {
                                  return Row(
                                    children: [
                                      Expanded(
                                          child: ItemList(
                                              data:
                                                  widget.HotelData[index + 4])),
                                      SizedBox(width: 24),
                                      Expanded(
                                          child: ItemList(
                                              data:
                                                  widget.HotelData[index + 5]))
                                    ],
                                  );
                                }).toList(),
                              );
                            } else {
                              return Column(
                                children: List.generate(2, (index) {
                                  return Row(
                                    children: [
                                      Expanded(
                                          child: ItemList(
                                              data:
                                                  widget.HotelData[index + 4])),
                                      SizedBox(width: 32),
                                      Expanded(
                                          child: ItemList(
                                              data:
                                                  widget.HotelData[index + 5])),
                                      SizedBox(width: 32),
                                      Expanded(
                                          child: ItemList(
                                              data:
                                                  widget.HotelData[index + 6]))
                                    ],
                                  );
                                }).toList(),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> FilterBottomSheet(BuildContext context, double screenWidth) {
    List<Hotel> filteredData = widget.HotelData;

    onBedroomChange(bedroomValue, tempData) {
      return tempData.where((item) {
        if (bedroomValue == 0) {
          return true;
        }

        if (bedroomValue == item.bedroom) {
          return true;
        }

        return false;
      }).toList();
    }

    onTypeChange(typeValue, tempData) {
      return tempData.where((item) {
        if (typeValue == 'all') {
          return true;
        }

        if (typeValue == item.type) {
          return true;
        }

        return false;
      }).toList();
    }

    onPriceChange(priceValue, List<Hotel> tempData) {
      if (priceValue == 'Low to High') {
        tempData.sort((a, b) => a.price - b.price);
      } else {
        tempData.sort((a, b) => b.price - a.price);
      }
    }

    onRatingChange(ratingValue, List<Hotel> tempData) {
      int compare(Hotel a, Hotel b) {
        return a.rating.compareTo(b.rating);
      }

      if (ratingValue == 'Low to High') {
        tempData.sort(compare);
      } else {
        tempData.sort((b, a) => compare(a, b));
      }
    }

    updateFilteredData(bedroomValue, typeValue, priceValue, ratingValue) {
      List<Hotel> tempData = widget.HotelData;

      widget._bedroomValue = bedroomValue;
      tempData = onBedroomChange(bedroomValue, tempData);

      widget._typeValue = typeValue;
      tempData = onTypeChange(typeValue, tempData);

      widget.priceDropdownvalue = priceValue;
      onPriceChange(priceValue, tempData);

      widget.ratingDropdownvalue = ratingValue;
      onRatingChange(ratingValue, tempData);

      filteredData = tempData;
    }

    updateFilteredData(widget._bedroomValue, widget._typeValue,
        widget.priceDropdownvalue, widget.ratingDropdownvalue);

    return showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            StatefulBuilder(
              builder: (BuildContext context, setState) {
                return Container(
                  padding: screenWidth < 768
                      ? const EdgeInsets.only(
                          left: 30,
                          top: 40,
                        )
                      : const EdgeInsets.only(
                          left: 80,
                          top: 58,
                        ),
                  decoration: const BoxDecoration(
                    color: Color(0xff0D0D0D),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Filter hotels',
                        style: TextStyle(
                          color: Color(0xff8E8B93),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${filteredData.length} available',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Bedrooms',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              updateFilteredData(
                                0,
                                widget._typeValue,
                                widget.priceDropdownvalue,
                                widget.ratingDropdownvalue,
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: widget._bedroomValue == 0
                                    ? Colors.transparent
                                    : const Color(0xff2c2424),
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: widget._bedroomValue == 0
                                  ? const Color(0xff171717)
                                  : Colors.transparent,
                            ),
                            child: Text('All',
                                style: TextStyle(
                                  color: widget._bedroomValue == 0
                                      ? const Color(
                                          0xffB0868B,
                                        )
                                      : Colors.white,
                                )),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              updateFilteredData(
                                1,
                                widget._typeValue,
                                widget.priceDropdownvalue,
                                widget.ratingDropdownvalue,
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: widget._bedroomValue == 1
                                    ? Colors.transparent
                                    : const Color(0xff2c2424),
                              ),
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                              color: widget._bedroomValue == 1
                                  ? const Color(0xff171717)
                                  : Colors.transparent,
                            ),
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: widget._bedroomValue == 1
                                    ? const Color(
                                        0xffB0868B,
                                      )
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              updateFilteredData(
                                2,
                                widget._typeValue,
                                widget.priceDropdownvalue,
                                widget.ratingDropdownvalue,
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: widget._bedroomValue == 2
                                    ? Colors.transparent
                                    : const Color(0xff2c2424),
                              ),
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                              color: widget._bedroomValue == 2
                                  ? const Color(0xff171717)
                                  : Colors.transparent,
                            ),
                            child: Text('2',
                                style: TextStyle(
                                  color: widget._bedroomValue == 2
                                      ? const Color(
                                          0xffB0868B,
                                        )
                                      : Colors.white,
                                )),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              updateFilteredData(
                                3,
                                widget._typeValue,
                                widget.priceDropdownvalue,
                                widget.ratingDropdownvalue,
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: widget._bedroomValue == 3
                                    ? Colors.transparent
                                    : const Color(0xff2c2424),
                              ),
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                              color: widget._bedroomValue == 3
                                  ? const Color(0xff171717)
                                  : Colors.transparent,
                            ),
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: widget._bedroomValue == 3
                                    ? const Color(0xffB0868B)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 30,
                      ),

                      // Type
                      const Text(
                        'Type',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              updateFilteredData(
                                widget._bedroomValue,
                                'all',
                                widget.priceDropdownvalue,
                                widget.ratingDropdownvalue,
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: widget._typeValue == 'all'
                                    ? Colors.transparent
                                    : const Color(0xff2c2424),
                              ),
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                              color: widget._typeValue == 'all'
                                  ? const Color(0xff171717)
                                  : Colors.transparent,
                            ),
                            child: Text(
                              'All',
                              style: TextStyle(
                                color: widget._typeValue == 'all'
                                    ? const Color(
                                        0xffB0868B,
                                      )
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              updateFilteredData(
                                widget._bedroomValue,
                                'apartment',
                                widget.priceDropdownvalue,
                                widget.ratingDropdownvalue,
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: widget._typeValue == 'apartment'
                                    ? Colors.transparent
                                    : const Color(0xff2c2424),
                              ),
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                              color: widget._typeValue == 'apartment'
                                  ? const Color(0xff171717)
                                  : Colors.transparent,
                            ),
                            child: Text('Apartment',
                                style: TextStyle(
                                  color: widget._typeValue == 'apartment'
                                      ? const Color(
                                          0xffB0868B,
                                        )
                                      : Colors.white,
                                )),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              updateFilteredData(
                                widget._bedroomValue,
                                'studio',
                                widget.priceDropdownvalue,
                                widget.ratingDropdownvalue,
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: widget._typeValue == 'studio'
                                    ? Colors.transparent
                                    : const Color(0xff2c2424),
                              ),
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                              color: widget._typeValue == 'studio'
                                  ? const Color(0xff171717)
                                  : Colors.transparent,
                            ),
                            child: Text('Studio',
                                style: TextStyle(
                                  color: widget._typeValue == 'studio'
                                      ? const Color(
                                          0xffB0868B,
                                        )
                                      : Colors.white,
                                )),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              updateFilteredData(
                                widget._bedroomValue,
                                'villa',
                                widget.priceDropdownvalue,
                                widget.ratingDropdownvalue,
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: widget._typeValue == 'villa'
                                    ? Colors.transparent
                                    : const Color(0xff2c2424),
                              ),
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                              color: widget._typeValue == 'villa'
                                  ? const Color(0xff171717)
                                  : Colors.transparent,
                            ),
                            child: Text('Villa',
                                style: TextStyle(
                                  color: widget._typeValue == 'villa'
                                      ? const Color(
                                          0xffB0868B,
                                        )
                                      : Colors.white,
                                )),
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 30,
                      ),

                      // Price
                      const Text(
                        'Price',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                            right: 30,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff2c2424),
                                ),
                                borderRadius: BorderRadius.circular(24)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: Color(0xff0d0d0d),
                                icon: Padding(
                                  padding: EdgeInsets.only(
                                    right: 24,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                  ),
                                ),
                                isExpanded: true,
                                onChanged: (String? value) {
                                  setState(() {
                                    updateFilteredData(
                                      widget._bedroomValue,
                                      widget._typeValue,
                                      value,
                                      widget.ratingDropdownvalue,
                                    );
                                  });
                                },
                                value: widget.priceDropdownvalue,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Low to High',
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 24),
                                      child: Text(
                                        'Low to High',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'High to Low',
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 24),
                                      child: Text(
                                        'High to Low',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Rating',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 30,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff2c2424),
                              ),
                              borderRadius: BorderRadius.circular(24)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Color(0xff0d0d0d),
                              icon: Padding(
                                padding: EdgeInsets.only(
                                  right: 24,
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                ),
                              ),
                              isExpanded: true,
                              onChanged: (String? value) {
                                setState(() {
                                  updateFilteredData(
                                    widget._bedroomValue,
                                    widget._typeValue,
                                    widget.priceDropdownvalue,
                                    value,
                                  );
                                });
                              },
                              value: widget.ratingDropdownvalue,
                              items: [
                                DropdownMenuItem(
                                  value: 'Low to High',
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 24),
                                    child: Text(
                                      'Low to High',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'High to Low',
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 24),
                                    child: Text(
                                      'High to Low',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 36, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(72),
                                color: const Color(0xff7A60F8),
                              ),
                              child: const Text(
                                'Save Filter',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FilteredHotel(
                                  HotelData: filteredData,
                                );
                              }));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                );
                ;
              },
            ),
          ],
        );
      },
    );
  }

  Widget carouselItem({required Hotel data, required double screenWidth}) {
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
        width: screenWidth < 600 ? (screenWidth * 0.7) : (screenWidth * 0.5),
        margin: const EdgeInsets.only(right: 24),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        data.url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
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
                height: 12,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          data.location,
                          style: const TextStyle(
                            color: Color(0xff8E8B93),
                          ),
                        ),
                        Text(
                          data.type,
                          style: TextStyle(color: Color(0xff8E8B93)),
                        ),
                      ],
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
