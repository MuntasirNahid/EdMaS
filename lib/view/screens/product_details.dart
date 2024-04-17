import 'package:edmas/controllers/products/products_controller.dart';
import 'package:edmas/models/product_model.dart';
import 'package:edmas/utills/colors.dart';
import 'package:edmas/view/screens/bloc/dashboard_bloc.dart';
import 'package:edmas/view/widgets/dashboard/edit_item_dialogue.dart';
import 'package:edmas/view/widgets/dashboard/leftside/sust_logo_text.dart';
import 'package:edmas/view/widgets/dashboard/rightside/dashboard_right_side.dart';
import 'package:edmas/view/widgets/deleteProductDialogue.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final DashboardBloc dashboardBloc = DashboardBloc();

  @override
  void initState() {
    // TODO: implement initState
    // dashboardBloc.add(
    //   DashboardSingleProductDetailsEvent(
    //     productId: widget.productId,
    //   ),
    // );
    fetchProductDetails();
    super.initState();
  }

  bool isLoading = false;
  late final ProductModel product;
  void fetchProductDetails() async {
    product = await ProductsController().getSingleProductDetails(
      productId: widget.productId,
    );
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
            //left side all
            Container(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SustLogoAndText(),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Product Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  isLoading
                      ? Container(
                          width: 1200,
                          height: 600,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                    width: 2, color: Colors.grey)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 600,
                                width: 600,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                //will give this image or just a + icons
                                child: product.image != ""
                                    ? Image.network(
                                        product.image,
                                        fit: BoxFit.contain,
                                      )
                                    : const Icon(
                                        Icons.add,
                                        size: 70,
                                      ),
                              ),
                              Container(
                                height: 600,
                                width: 596,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      height: 220,
                                      width: 400,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                            width: 2,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            Text(
                                              "Product Name: ${product.name}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Product Quantity: ${product.quantity}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Product Location: Shelf No ${product.location.shelfNum}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(child: Container()),
                                        SizedBox(
                                          width: 180,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor: primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return EditItemDialogue(
                                                      id: product.id,
                                                      name: product.name,
                                                      quantity:
                                                          product.quantity,
                                                    );
                                                  });
                                            },
                                            child: const Text(
                                              'Edit Details',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            //Dialogue Box for confirmation to Delete the product from Database
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return DeleteProductDialogue(
                                                    productId: product.id,
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.delete_rounded,
                                            color: Colors.red,
                                            size: 60,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : SizedBox(
                          height: 600,
                          width: 1200,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                ],
              ),
            ),

            const SizedBox(
              width: 15,
            ),

            //Right side all
            RightSideAll(),

            //Right side all
          ],
        ),
      ),
    );
  }
}
