import 'dart:typed_data';

import 'package:edmas/controllers/products/products_controller.dart';
import 'package:edmas/global/common_widgets/image_picker.dart';
import 'package:edmas/models/location_model.dart';
import 'package:edmas/utills/colors.dart';
import 'package:edmas/utills/logger.dart';
import 'package:edmas/view/screens/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddNewItemDialogue extends StatefulWidget {
  const AddNewItemDialogue({super.key});

  @override
  State<AddNewItemDialogue> createState() => _AddNewItemDialogueState();
}

class _AddNewItemDialogueState extends State<AddNewItemDialogue> {
  final DashboardBloc dashboardBloc = DashboardBloc();

  // Uint8List image = Uint8List(0);
  //
  // Future pickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //     // final imageTemporary = File(image.path);
  //     final imagePermanent = await image.readAsBytes();
  //
  //     setState(() {
  //       this.image = imagePermanent;
  //     });
  //   } on Exception catch (e) {
  //     // TODO
  //     print('Failed to pick image:$e');
  //   }
  // }

  Uint8List? _image;

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  var selectedShelfId = "";

  List<LocationModel> shelfList = [];

  LocationModel? selectedShelf;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllShelf();
  }

  bool isLoaded = false;

  void getAllShelf() async {
    // final dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    // dashboardBloc.add(DashboardGetAllShelfEvent());
    shelfList = await ProductsController().getAllShelf();

    setState(() {
      isLoaded = true;
      selectedShelf = shelfList[0];
      selectedShelfId = shelfList[0].id;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Logger _logger = Logger.getLogger((AddNewItemDialogue).toString());
    final TextEditingController productNameController = TextEditingController();

    final TextEditingController productQuantityController =
        TextEditingController();

    //_logger.debug('Shelf List: ${shelfList[1].shelfNum}');

    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        // It's not working
        if (state is DashboardAddNewItemState) {
          Fluttertoast.showToast(
            msg: state.response,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: primaryColor,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: Colors.white,
          child: Container(
            width: 1150.0,
            height: 770.0,
            padding: const EdgeInsets.fromLTRB(50, 30, 50, 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: isLoaded
                ? Column(
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

                                const SizedBox(height: 10.0),

                                const Text(
                                  'Shelf Number:',
                                  textAlign: TextAlign.center,
                                ),

                                // ),
                                Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(width: 0.5),
                                    ),
                                  ),
                                  child: DropdownButton<LocationModel>(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    items: shelfList.map((LocationModel shelf) {
                                      return DropdownMenuItem<LocationModel>(
                                        value: shelf,
                                        child: Text(shelf.shelfNum),
                                      );
                                    }).toList(),
                                    value: selectedShelf,
                                    onChanged: (LocationModel? newValue) {
                                      setState(() {
                                        selectedShelf = newValue;
                                        selectedShelfId = newValue!.id;
                                        _logger.debug(
                                            'selected shelf id: $selectedShelfId');
                                      });
                                    },
                                    isExpanded: true,
                                    borderRadius: BorderRadius.circular(5),
                                    underline: Container(),
                                    focusColor: Colors.transparent,
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
                                        borderSide:
                                            const BorderSide(width: 0.5),
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
                                        borderSide:
                                            const BorderSide(width: 0.5),
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
                                    height: 200,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 0.9,
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            selectImage();
                                          },
                                          child: _image != null
                                              ? Image.memory(
                                                  _image!,
                                                  fit: BoxFit.cover,
                                                )
                                              : const Icon(
                                                  Icons.add_a_photo_outlined,
                                                  size: 40,
                                                  color: Colors.grey,
                                                ),
                                        ),
                                      );
                                    }),
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
                          onPressed: () {
                            dashboardBloc.add(
                              DashboardAddNewItemEvent(
                                _image,
                                itemName: productNameController.text,
                                location: selectedShelfId,
                                itemQuantity: productQuantityController.text,
                              ),
                            );

                            // BlocProvider(create: create).of<DashboardBloc>(context)
                            //     .add(DashboardItemListEvent());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (state is DashboardAddNewItemState)
                        Text(
                          state.response,
                          style: TextStyle(fontSize: 16),
                        ),
                    ],
                  )
                : SizedBox(
                    height: 100,
                    width: 100,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
