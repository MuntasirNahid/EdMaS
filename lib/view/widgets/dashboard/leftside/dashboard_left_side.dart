import 'package:edmas/view/screens/bloc/dashboard_bloc.dart';
import 'package:edmas/view/screens/product_details.dart';
import 'package:edmas/view/widgets/dashboard/leftside/add_amount_expense.dart';
import 'package:edmas/view/widgets/dashboard/leftside/application_approval.dart';
import 'package:edmas/view/widgets/dashboard/leftside/application_formField.dart';
import 'package:edmas/view/widgets/dashboard/leftside/approval_item_info.dart';
import 'package:edmas/view/widgets/dashboard/leftside/approve_reject_button.dart';
import 'package:edmas/view/widgets/dashboard/leftside/approved_item_info.dart';
import 'package:edmas/view/widgets/dashboard/leftside/features.dart';
import 'package:edmas/view/widgets/dashboard/leftside/fund_overview.dart';
import 'package:edmas/view/widgets/dashboard/leftside/income_expense_log.dart';
import 'package:edmas/view/widgets/dashboard/leftside/request_button.dart';
import 'package:edmas/view/widgets/dashboard/leftside/request_item.dart';
import 'package:edmas/view/widgets/dashboard/leftside/search_and_add_new_item.dart';
import 'package:edmas/view/widgets/dashboard/leftside/sust_logo_text.dart';
import 'package:edmas/view/widgets/dashboard/leftside/table_elements.dart';
import 'package:edmas/view/widgets/dashboard/leftside/table_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeftSideAll extends StatefulWidget {
  const LeftSideAll({
    super.key,
  });

  @override
  State<LeftSideAll> createState() => _LeftSideAllState();
}

class _LeftSideAllState extends State<LeftSideAll> {
  bool isProductsLoaded = false;
  final DashboardBloc dashboardBloc = DashboardBloc();

  @override
  void initState() {
    dashboardBloc.add(DashboardItemListEvent());
    //  fetchProducts();
    super.initState();
  }

  //egula shob bloc er er vitore hobe
  // List<ProductModel> productsList = [];
  //
  // Future<void> fetchProducts() async {
  //   final products = await ProductsController().fetchProductList();
  //   setState(() {
  //     productsList = products;
  //     isProductsLoaded = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
              if (state is DashboardItemListState)
                const SearchItemAndAddNewItem(),

              ///Request
              if (state is DashboardRequestState) const RequestItem(),

              ///Approved
              if (state is DashboardApproveState)
                const ApprovedItemInfo(isApproved: true),

              ///Returned
              if (state is DashboardReturnState)
                const ApprovedItemInfo(isReturn: true),

              ///Damages
              if (state is DashboardDamagesState)
                const ApprovedItemInfo(isDamages: true),

              /// Replacement
              if (state is DashboardReplacementState)
                const ApprovedItemInfo(isReplacement: true),

              ///Fund Overview
              if (state is DashboardFundState) const Fund_overview(),

              ///Approval Info
              if (state is DashboardApprovalState) const ApprovalItemInfo(),

              const SizedBox(
                height: 30,
              ),

              ///Add Amount and Expenses Container
              if (state is DashboardFundState) AddExpenseAmount(),

              ///Title's of table
              if (state is DashboardItemListState) TableTitle(),

              if (state is DashboardItemListState ||
                  state is DashboardRequestState ||
                  state is DashboardApprovalState)
                const Divider(
                  height: 10,
                  thickness: 0.5,
                ),

              const SizedBox(
                height: 15,
              ),

              ///Income List and Income list button
              if (state is DashboardFundState)
                IncomeExpenseLog(isExpense: false),
              if (state is DashboardFundState)
                IncomeExpenseLog(isExpense: true),

              ///Application Approval Overview

              if (state is DashboardApprovalState) ApplicationApproval(),

              ///Approve or Reject Button for Approval
              if (state is DashboardApprovalState) ApproveRejectButton(),

              ///Application FormField
              if (state is DashboardRequestState) ApplicationFormField(),

              ///Item Table Elements
              if (state is DashboardItemListState)
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return TableElements(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ProductDetailsScreen(),
                            ),
                          );
                        },
                        id: index + 1,
                        productName: "MAC",
                        quantity: 5,
                      );
                    },
                    itemCount: 3,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                  ),
                ),

              ///Request Button
              if (state is DashboardRequestState) RequestButton(),
            ],
          ),
        );
      },
    );
  }
}
