import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class AddNewItemDialogue extends StatefulWidget {
  const AddNewItemDialogue({super.key});

  @override
  State<AddNewItemDialogue> createState() => _AddNewItemDialogueState();
}

class _AddNewItemDialogueState extends State<AddNewItemDialogue> {
  var _dropdownValue = "Electronics";
  void dropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController productIdController = TextEditingController();
    final TextEditingController productNameController = TextEditingController();
    final TextEditingController productLocationController =
        TextEditingController();
    final TextEditingController productQuantityController =
        TextEditingController();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.white,
      child: Container(
        width: 1150.0,
        height: 770.0,
        padding: const EdgeInsets.fromLTRB(50, 30, 50, 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ///Form Field
                Container(
                  height: 450,
                  width: 515,
                  //color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Add New Items',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      const Text(
                        'Product ID:',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: TextField(
                          controller: productIdController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(width: 0.5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Product Name:',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: TextField(
                          controller: productNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(width: 0.5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Product Category:',
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(width: 0.5),
                          ),
                        ),
                        child: DropdownButton(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          items: const [
                            DropdownMenuItem(
                              value: "Electronics",
                              child: Text('Electronics'),
                            ),
                            DropdownMenuItem(
                              value: "Plastic",
                              child: Text('Plastic'),
                            ),
                            DropdownMenuItem(
                              value: "Wood",
                              child: Text('Wood'),
                            ),
                            DropdownMenuItem(
                              value: "Result",
                              child: Text('Result'),
                            ),
                          ],
                          value: _dropdownValue,
                          onChanged: dropDownCallback,
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(05),
                          underline: Container(),
                          focusColor: Colors.transparent,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Product Location:',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: TextField(
                          controller: productLocationController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(width: 0.5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Product Quantity:',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: TextField(
                          controller: productQuantityController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(width: 0.5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///Image Filed
                Container(
                  height: 410,
                  width: 270,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Product Image:',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 270,
                          height: 325,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 0.9,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add_a_photo_outlined,
                              size: 40,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),

            //Submit Button
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 545,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
