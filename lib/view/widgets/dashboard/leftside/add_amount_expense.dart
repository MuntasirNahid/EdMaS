import 'package:edmas/controllers/products/products_controller.dart';
import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class AddExpenseAmount extends StatefulWidget {
  const AddExpenseAmount({
    super.key,
  });

  @override
  State<AddExpenseAmount> createState() => _AddExpenseAmountState();
}

class _AddExpenseAmountState extends State<AddExpenseAmount> {
  final TextEditingController _incomeNoteController = TextEditingController();
  final TextEditingController _expenseNoteController = TextEditingController();
  final TextEditingController _incomeAmountController = TextEditingController();
  final TextEditingController _expenseAmountController =
      TextEditingController();

  bool isIncomeLoading = false;
  bool isExpenseLoading = false;

  void addIncome() async {
    setState(() {
      isIncomeLoading = true;
    });

    String message = await ProductsController().addIncomeOrExpense(
      amount: _incomeAmountController.text.toString(),
      type: 'income',
      details: _incomeNoteController.text.toString(),
    );
    setState(() {
      isIncomeLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void addExpense() async {
    setState(() {
      isExpenseLoading = true;
    });
    String message = await ProductsController().addIncomeOrExpense(
      amount: _expenseAmountController.text.toString(),
      type: 'expense',
      details: _expenseNoteController.text.toString(),
    );
    setState(() {
      isExpenseLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 480,
          height: 170,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 3,
                offset: Offset(1, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Note:",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: TextField(
                        controller: _incomeNoteController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    const Text(
                      "Amount:",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: TextField(
                        controller: _incomeAmountController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: addIncome,
                  child: Container(
                    width: 130,
                    height: 45,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: primaryColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: isIncomeLoading
                          ? const SizedBox(
                              height: 15,
                              width: 20,
                              child: LinearProgressIndicator(
                                color: primaryColor,
                              ),
                            )
                          : Text(
                              "Add Amount",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 480,
          height: 170,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 3,
                offset: Offset(1, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Note:",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: TextField(
                        controller: _expenseNoteController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    const Text(
                      "Amount:",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: TextField(
                        controller: _expenseAmountController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: addExpense,
                  child: Container(
                    width: 130,
                    height: 45,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: isExpenseLoading
                          ? LinearProgressIndicator(
                              color: Colors.redAccent,
                            )
                          : Text(
                              "Add Expense",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
