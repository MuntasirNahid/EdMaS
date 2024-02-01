import 'package:edmas/presentation/widgets/item_list.dart';
import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 40.0, 100.0, 40.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      //   'assets/images/search_icon.svg',
                      //   width: 135,
                      //   height: 135,
                      // ),
                      Container(
                        height: 136,
                        width: 136,
                        child: Material(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image(
                            image: AssetImage('assets/images/sust.png'),
                            width: 135,
                            height: 135,
                            // fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 05,
                      ),
                      const Text(
                        'CSE STORE MANAGEMENT SYSTEM',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
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
                            itemName: 'Items list',
                            imagePath: 'list.png',
                          ),
                          ItemList(
                            itemName: 'Request',
                            imagePath: 'req.png',
                          ),
                          ItemList(
                            itemName: 'Approval',
                            imagePath: 'approve.png',
                          ),
                          ItemList(
                            itemName: 'Approve',
                            imagePath: 'approve2.png',
                          ),
                          ItemList(
                            itemName: 'Return',
                            imagePath: 'ret.png',
                          ),
                          ItemList(
                            itemName: 'Damages',
                            imagePath: 'dam.png',
                          ),
                          ItemList(
                            itemName: 'Replace',
                            imagePath: 'rep.png',
                          ),
                          ItemList(
                            itemName: 'Fund',
                            imagePath: 'fund.png',
                            filter: true,
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
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'search.png',
                                width: 25,
                                height: 25,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 3,
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
                            vertical: 5.0,
                            horizontal: 60.0,
                          ),
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
                              Image.asset(
                                'cart.png',
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
                            width: 40,
                          ),
                          Container(
                            width: 100,
                            // color: Colors.blueAccent,
                            child: Image.asset(
                              'details.png',
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

            const SizedBox(
              width: 15,
            ),

            //Right side all
            Container(
              width: 350,
              height: 370,
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(
                        'nahid.jpg',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'noti.png',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'edit.png',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 120,
                      width: 260,
                      child: Material(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            width: 0.4,
                            color: Color(0x3F000000),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 22, 20, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Name: ',
                                  ),
                                  const SizedBox(
                                    width: 08,
                                  ),
                                  Text(
                                    'Nahid',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 05,
                              ),
                              Row(children: [
                                Text(
                                  'Role: ',
                                ),
                                const SizedBox(
                                  width: 08,
                                ),
                                Text(
                                  'Store Manager',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                                ),
                              ]),
                              const SizedBox(
                                height: 05,
                              ),
                              Text(
                                'Dept of CSE',
                              ),
                            ],
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
      ),
    );
  }
}
