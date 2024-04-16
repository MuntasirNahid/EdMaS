import 'package:edmas/controllers/products/products_controller.dart';
import 'package:edmas/models/product_model.dart';
import 'package:edmas/view/widgets/dashboard/leftside/dashboard_left_side.dart';
import 'package:flutter/material.dart';

class RequestItem extends StatefulWidget {
  const RequestItem({super.key, required this.requestItem});
  final RequestData requestItem;
  @override
  State<RequestItem> createState() => _RequestItemState();
}

class _RequestItemState extends State<RequestItem> {
  String _dropDownType = "type";
  String _dropDownProcut = "select";

  @override
  void initState() {
    fetchProducts();
    // TODO: implement initState
    super.initState();
  }

  void dropDownCallback(String? newValue) {
    setState(() {
      _dropDownType = newValue!;
      widget.requestItem.requestType = newValue;
    });
  }

  bool isLoading = false;

  List<ProductModel> products = [];
  ProductModel? selectedProduct;
  var selectedProductName = '';
  var selectedProductId = '';

  void fetchProducts() async {
    try {
      setState(() {
        isLoading = true;
      });
      products = await ProductsController().fetchProductList();
      setState(() {
        isLoading = false;
        selectedProductName = products[0].name;
        selectedProductId = products[0].id;
        selectedProduct = products[0];
      });
    } catch (error) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 180,
          height: 50,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
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
              vertical: 13,
              horizontal: 20,
            ),
            child: Text(
              "Date: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 3,
                offset: Offset(1, 1),
                spreadRadius: 0,
              )
            ],
          ),
          height: 50,
          width: 240,
          child: Center(
            child: DropdownButton(
              underline: Container(),
              items: const [
                DropdownMenuItem(
                  value: "type",
                  child: Text("Request Type"),
                ),
                DropdownMenuItem(
                  value: "give",
                  child: Text("Give"),
                ),
                DropdownMenuItem(
                  value: "take",
                  child: Text("Take"),
                ),
              ],
              onChanged: dropDownCallback,
              value: _dropDownType,
              isExpanded: false,
            ),
          ),
        ),
        Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 3,
                offset: Offset(1, 1),
                spreadRadius: 0,
              )
            ],
          ),
          height: 50,
          width: 240,
          child: Center(
            child: DropdownButton<ProductModel>(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              items: products.map((ProductModel product) {
                return DropdownMenuItem<ProductModel>(
                  value: product,
                  child: Text(product.name),
                );
              }).toList(),
              value: selectedProduct,
              onChanged: (ProductModel? newValue) {
                setState(() {
                  selectedProductName = newValue!.name;
                  selectedProductId = newValue.id;
                  selectedProduct = newValue;
                  widget.requestItem.itemId = selectedProductId;
                  // _logger.debug(
                  //     'selected shelf id: $selectedShelfId');
                });
              },
              isExpanded: true,
              borderRadius: BorderRadius.circular(5),
              underline: Container(),
              focusColor: Colors.transparent,
            ),
          ),
        ),
        Container(
          height: 50,
          width: 240,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 3,
                offset: Offset(1, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                widget.requestItem.quantity = int.parse(value);
              });
            },
            decoration: InputDecoration(
              hintText: "Quantity",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
