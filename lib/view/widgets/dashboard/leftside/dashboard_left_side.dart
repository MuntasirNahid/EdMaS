import 'package:edmas/controllers/products/products_controller.dart';
import 'package:edmas/models/product_model.dart';
import 'package:edmas/view/widgets/dashboard/leftside/features.dart';
import 'package:edmas/view/widgets/dashboard/leftside/search_and_add_new_item.dart';
import 'package:edmas/view/widgets/dashboard/leftside/sust_logo_text.dart';
import 'package:edmas/view/widgets/dashboard/leftside/table_elements.dart';
import 'package:edmas/view/widgets/dashboard/leftside/table_title.dart';
import 'package:flutter/material.dart';

class LeftSideAll extends StatefulWidget {
  const LeftSideAll({
    super.key,
  });

  @override
  State<LeftSideAll> createState() => _LeftSideAllState();
}

class _LeftSideAllState extends State<LeftSideAll> {
  bool isProductsLoaded = false;

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  List<ProductModel> productsList = [];

  Future<void> fetchProducts() async {
    final products = await ProductsController().fetchProductList();
    setState(() {
      productsList = products;
      isProductsLoaded = true;
    });
  }

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

          Expanded(
            child: Container(
              width: 1200,
              height: 400,
              child: isProductsLoaded
                  ? ListView.separated(
                      itemCount: productsList.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        final product = productsList[index];
                        return TableElements(
                          id: index + 1,
                          productName: product.name,
                          quantity: product.quantity,
                        );
                      },
                    )
                  : const LinearProgressIndicator(),
            ),
          )

          // child: ListView.separated(
          //   //itemCount: productsList.length,
          //   itemCount: 2,
          //   separatorBuilder: (context, index) => const SizedBox(
          //     height: 10,
          //   ),
          //   itemBuilder: (context, index) {
          //     return TableElements(
          //       id: index,
          //       productName: productsList[index].name,
          //       // quantity: productsList[index].quantity,
          //       // productName: "Nahid",
          //       quantity: 2,
          //     );
          //   },
          // ),

          //
        ],
      ),
    );
  }
}
