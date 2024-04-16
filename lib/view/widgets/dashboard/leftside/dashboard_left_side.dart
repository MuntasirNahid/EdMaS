import 'package:edmas/controllers/products/products_controller.dart';
import 'package:edmas/models/product_model.dart';
import 'package:edmas/view/screens/bloc/dashboard_bloc.dart';
import 'package:edmas/view/screens/product_details.dart';
import 'package:edmas/view/widgets/dashboard/leftside/add_amount_expense.dart';
import 'package:edmas/view/widgets/dashboard/leftside/application_formField.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

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

  bool _isSearching = false;
  List<ProductModel> _allProducts = [];
  List<ProductModel> _filteredProducts = [];

  @override
  void initState() {
    //  dashboardBloc.add(DashboardItemListEvent());
    BlocProvider.of<DashboardBloc>(context).add(
      DashboardItemListEvent(),
    );

    fetchProducts();
    initThings();
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

  Future<void> fetchProducts() async {
    try {
      List<ProductModel> products =
          await ProductsController().fetchProductList();
      setState(() {
        _allProducts = products;
        _filteredProducts = products;
      });
    } catch (error) {
      // Handle error
    }
  }

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = _allProducts
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  String userRole = "";
  void initThings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('user_role')!;
  }

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

              ///DashboardItemList Fetching from Db

              if (state is DashboardItemListLoadingState)
                Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                ),

              ///Search Item and Add new item
              if ((userRole == "store_manager" || userRole == "dept_head") &&
                  state is DashboardItemListState)
                SearchItemAndAddNewItem(
                  onSearchChanged: (query) {
                    if (query.isNotEmpty) {
                      _isSearching = true;
                      _filterProducts(query);
                    } else {
                      _isSearching = false;
                      setState(() {
                        _filteredProducts = _allProducts;
                      });
                    }
                  },
                ),

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
              //   if (state is DashboardApprovalState) const ApprovalItemInfo(),
              // First show the list of application in sorted order
              if (state is DashboardApprovalState)
                const ApprovedItemInfo(
                  isApproval: true,
                ),

              const SizedBox(
                height: 25,
              ),

              ///Add Amount and Expenses Container
              if (state is DashboardFundState) AddExpenseAmount(),

              ///Title's of table
              if ((userRole == "store_manager" || userRole == "dept_head") &&
                  state is DashboardItemListState)
                TableTitle(),

              if (state is DashboardItemListState ||
                  state is DashboardRequestState)
                const Divider(
                  height: 10,
                  thickness: 0.5,
                ),

              const SizedBox(
                height: 10,
              ),

              ///Income List and Income list button
              if (state is DashboardFundState)
                IncomeExpenseLog(isExpense: false),
              if (state is DashboardFundState)
                IncomeExpenseLog(isExpense: true),

              ///Application Approval Overview

              //  if (state is DashboardApprovalState) ApplicationApproval(),

              ///Approve or Reject Button for Approval
              //   if (state is DashboardApprovalState) ApproveRejectButton(),

              ///Application FormField
              if (state is DashboardRequestState) ApplicationFormField(),

              ///DashboardItemList Fetching from Db

              if (state is DashboardItemListLoadingState)
                Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                ),

              ///Add new Item confirmation message dialogue
              if ((userRole == "store_manager" || userRole == "dept_head") &&
                  state is DashboardAddNewItemState)
                AlertDialog(
                  title: const Text('Confirmation'),
                  content: Text(state.response),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),

              ///Item Table Elements
              if (state is DashboardItemListState)
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      ProductModel product = _isSearching
                          ? _filteredProducts[index]
                          : _allProducts[index];
                      return TableElements(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                //  productId: state.productList[index].id,
                                productId: product.id,
                              ),
                            ),
                          );
                        },
                        id: index + 1,
                        // productName: state.productList[index].name,
                        // quantity: state.productList[index].quantity,
                        productName: product.name,
                        quantity: product.quantity,
                      );
                    },
                    // itemCount: state.productList.length,
                    itemCount: _isSearching
                        ? _filteredProducts.length
                        : _allProducts.length,
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
