import 'package:edmas/presentation/widgets/item_list.dart';
import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(
          children: [
            //left side all
            Container(
              width: 1200,
              child: Column(
                children: [
                  //SUST LOGO AND TEXT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SvgPicture.asset(
                      //   'assets/images/lock.svg',
                      //   width: 135,
                      //   height: 135,
                      // ),
                      Image(
                        image: AssetImage('assets/images/login.png'),
                        width: 135,
                        height: 135,
                      ),
                      const Text(
                        'CSE STORE MANAGEMENT SYSTEM',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //ITEM list
                  Container(
                    width: 1193,
                    height: 156,
                    decoration: ShapeDecoration(
                      color: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ItemList(
                            itemName: 'Items List',
                            imagePath: 'assets/images/lock.svg',
                          ),
                          ItemList(
                            itemName: 'Items List',
                            imagePath: 'assets/images/lock.svg',
                          ),
                          ItemList(
                            itemName: 'Items List',
                            imagePath: 'assets/images/lock.svg',
                          ),
                          ItemList(
                            itemName: 'Items List',
                            imagePath: 'assets/images/lock.svg',
                          ),
                          ItemList(
                            itemName: 'Items List',
                            imagePath: 'assets/images/lock.svg',
                          ),
                          ItemList(
                            itemName: 'Items List',
                            imagePath: 'assets/images/lock.svg',
                          ),
                          ItemList(
                            itemName: 'Items List',
                            imagePath: 'assets/images/lock.svg',
                          ),
                          ItemList(
                            itemName: 'Items List',
                            imagePath: 'assets/images/lock.svg',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),

                  //Search Item and Add new item

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 314,
                        height: 49,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 3,
                              offset: Offset(1, 1),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 05,
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/lock.svg',
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search essential items',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF7A7A7A),
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 314,
                        height: 49,
                        decoration: ShapeDecoration(
                          color: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 3,
                              offset: Offset(1, 1),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 70.0),
                          child: Row(
                            children: [
                              Text(
                                'Add new items',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                'assets/images/lock.svg',
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Header of table

                  const SizedBox(
                    height: 40,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 100,
                      ),
                      Text(
                        'Product ID',
                        style: TextStyle(
                          color: Color(0xFF464646),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 300,
                      ),
                      Text(
                        'Product Name',
                        style: TextStyle(
                          color: Color(0xFF464646),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 295,
                      ),
                      Text(
                        'Quantity',
                        style: TextStyle(
                          color: Color(0xFF464646),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 140,
                      ),
                      Text(
                        'Details',
                        style: TextStyle(
                          color: Color(0xFF464646),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 10,
                    thickness: 0.5,
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Container(
                    width: 1200,
                    height: 52,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(60, 10, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            //color: Colors.blueAccent,
                            child: Text(
                              'ID: 01',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Container(
                            width: 500,
                            //    color: Colors.blueAccent,
                            child: Text(
                              'Product 1',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Container(
                            width: 150,
                            //color: Colors.blueAccent,
                            child: Text(
                              '08',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 100,
                            // color: Colors.blueAccent,
                            child: SvgPicture.asset(
                              'assets/images/lock.svg',
                              color: primaryColor,
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Right side all
            Container(),
          ],
        ),
      ),
    );
  }
}
