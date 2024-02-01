import 'package:edmas/presentation/widgets/dashboard/leftside/features.dart';
import 'package:edmas/presentation/widgets/dashboard/leftside/search_and_add_new_item.dart';
import 'package:edmas/presentation/widgets/dashboard/leftside/sust_logo_text.dart';
import 'package:edmas/presentation/widgets/dashboard/leftside/table_elements.dart';
import 'package:edmas/presentation/widgets/dashboard/leftside/table_title.dart';
import 'package:flutter/material.dart';

class LeftSideAll extends StatelessWidget {
  const LeftSideAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      child: Column(
        children: [
          ///SUST LOGO AND TEXT
          SustLogoAndText(),

          const SizedBox(
            height: 10,
          ),

          ///FEATURE list
          Features(),

          const SizedBox(
            height: 35,
          ),

          ///Search Item and Add new item
          SearchItemAndAddNewItem(),

          const SizedBox(
            height: 40,
          ),

          ///Title's of table
          TableTitle(),

          Divider(
            height: 10,
            thickness: 0.5,
          ),

          const SizedBox(
            height: 15,
          ),

          ///Table Elements
          TableElements(),
        ],
      ),
    );
  }
}
