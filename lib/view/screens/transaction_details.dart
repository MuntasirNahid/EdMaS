import 'package:edmas/controllers/products/products_controller.dart';
import 'package:edmas/models/transaction_model.dart';
import 'package:edmas/view/screens/bloc/dashboard_bloc.dart';
import 'package:edmas/view/widgets/dashboard/leftside/sust_logo_text.dart';
import 'package:edmas/view/widgets/dashboard/rightside/dashboard_right_side.dart';
import 'package:edmas/view/widgets/dashboard/transaction_elements.dart';
import 'package:edmas/view/widgets/dashboard/transaction_title.dart';
import 'package:flutter/material.dart';

class TransactionDetailsScreen extends StatefulWidget {
  const TransactionDetailsScreen({
    super.key,
  });

  @override
  State<TransactionDetailsScreen> createState() =>
      _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
  final DashboardBloc dashboardBloc = DashboardBloc();

  @override
  void initState() {
    // TODO: implement initState

    fetchTransactionDetails();
    super.initState();
  }

  bool isLoading = false;

  List<TransactionModel> transactions = [];

  void fetchTransactionDetails() async {
    transactions = await ProductsController().getAllTransaction();
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 40.0, 80.0, 40.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 1200,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const SustLogoAndText(),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          'Transaction History',
                          style: TextStyle(
                            color: Color(0xFF464646),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //left side all
                        TransactionTitle(),
                        const Divider(
                          height: 15,
                          thickness: 2,
                        ),
                        isLoading
                            ? Expanded(
                                child: Container(
                                  width: 1200,
                                  height: 600,
                                  child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      return TransactionElements(
                                        type: transactions[index].type,
                                        details: transactions[index].details,
                                        amount: transactions[index].amount,
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 10,
                                      );
                                    },
                                    itemCount: transactions.length,
                                  ),
                                ),
                              )
                            : Center(
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                      ])),

              const SizedBox(
                width: 15,
              ),

              //Right side all
              RightSideAll(),

              //Right side all
            ],
          )),
    );
  }
}
