import 'package:edmas/utills/colors.dart';
import 'package:edmas/view/screens/bloc/dashboard_bloc.dart';
import 'package:edmas/view/widgets/dashboard/leftside/feature_list.dart';
import 'package:flutter/material.dart';

class Features extends StatefulWidget {
  const Features({
    super.key,
  });

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  final DashboardBloc dashboardBloc = DashboardBloc();

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
                dashboardBloc.add(DashboardInitialEvent());
              },
              itemName: 'Items list',
              imagePath: 'list.png',
            ),
            FeatureList(
              onTap: () {
                dashboardBloc.add(DashboardRequestEvent());
              },
              itemName: 'Request',
              imagePath: 'req.png',
            ),
            FeatureList(
              onTap: () {
                dashboardBloc.add(DashboardApprovalEvent());
              },
              itemName: 'Approval',
              imagePath: 'approve.png',
            ),
            FeatureList(
              onTap: () {
                dashboardBloc.add(DashboardApproveEvent());
              },
              itemName: 'Approve',
              imagePath: 'approve2.png',
            ),
            FeatureList(
              onTap: () {
                dashboardBloc.add(DashboardReturnEvent());
              },
              itemName: 'Return',
              imagePath: 'ret.png',
            ),
            FeatureList(
              onTap: () {
                dashboardBloc.add(DashboardDamagesEvent());
              },
              itemName: 'Damages',
              imagePath: 'dam.png',
            ),
            FeatureList(
              onTap: () {
                dashboardBloc.add(DashboardReplacementEvent());
              },
              itemName: 'Replace',
              imagePath: 'rep.png',
            ),
            FeatureList(
              onTap: () {
                dashboardBloc.add(DashboardFundEvent());
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
