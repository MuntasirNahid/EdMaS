import 'package:edmas/utills/colors.dart';
import 'package:edmas/view/screens/bloc/dashboard_bloc.dart';
import 'package:edmas/view/widgets/dashboard/leftside/feature_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Features extends StatefulWidget {
  const Features({
    super.key,
  });

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            FeatureList(
              onTap: () {
                BlocProvider.of<DashboardBloc>(context)
                    .add(DashboardItemListEvent());
              },
              itemName: 'Items list',
              imagePath: 'list.png',
            ),
            FeatureList(
              onTap: () {
                BlocProvider.of<DashboardBloc>(context)
                    .add(DashboardRequestEvent());
              },
              itemName: 'Request',
              imagePath: 'req.png',
            ),
            FeatureList(
              onTap: () {
                BlocProvider.of<DashboardBloc>(context)
                    .add(DashboardApprovalEvent());
              },
              itemName: 'Approval',
              imagePath: 'approve.png',
            ),
            FeatureList(
              onTap: () {
                BlocProvider.of<DashboardBloc>(context)
                    .add(DashboardApproveEvent());
              },
              itemName: 'Approve',
              imagePath: 'approve2.png',
            ),
            FeatureList(
              onTap: () {
                BlocProvider.of<DashboardBloc>(context)
                    .add(DashboardReturnEvent());
              },
              itemName: 'Return',
              imagePath: 'ret.png',
            ),
            FeatureList(
              onTap: () {
                BlocProvider.of<DashboardBloc>(context)
                    .add(DashboardDamagesEvent());
              },
              itemName: 'Damages',
              imagePath: 'dam.png',
            ),
            FeatureList(
              onTap: () {
                BlocProvider.of<DashboardBloc>(context)
                    .add(DashboardReplacementEvent());
              },
              itemName: 'Replace',
              imagePath: 'rep.png',
            ),
            FeatureList(
              onTap: () {
                BlocProvider.of<DashboardBloc>(context)
                    .add(DashboardFundEvent());
              },
              itemName: 'Fund',
              imagePath: 'fund.png',
              filter: true,
            ),
          ],
        ),
      ),
    );
  }
}
