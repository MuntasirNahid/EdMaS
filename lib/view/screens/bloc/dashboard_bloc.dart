import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:edmas/controllers/products/products_controller.dart';
import 'package:edmas/models/location_model.dart';
import 'package:edmas/models/product_model.dart';
import 'package:edmas/utills/logger.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardItemListEvent>(_onDashboardItemListEvent);
    on<DashboardRequestEvent>(_onDashboardRequestEvent);
    on<DashboardApprovalEvent>(_onDashboardApprovalEvent);
    on<DashboardApproveEvent>(_onDashboardApproveEvent);
    on<DashboardReturnEvent>(_onDashboardReturnEvent);
    on<DashboardDamagesEvent>(_onDashboardDamagesEvent);
    on<DashboardReplacementEvent>(_onDashboardReplacementEvent);
    on<DashboardFundEvent>(_onDashboardFundEvent);
    on<DashboardAddNewItemEvent>(_onDashboardAddNewItemEvent);
    on<DashboardGetAllShelfEvent>(_onDashboardGetAllShelfEvent);
    on<DashboardSingleProductDetailsEvent>(
        _onDashboardSingleProductDetailsEvent);
    on<DashboardApplicationDetailsEvent>(_onDashboardApplicationDetailsEvent);
  }

  final Logger _logger = Logger.getLogger((DashboardBloc).toString());

  FutureOr<void> _onDashboardItemListEvent(
      DashboardItemListEvent event, Emitter<DashboardState> emit) async {
    //will fetch data from controller here.
    //then will pass it to the UI

    emit(DashboardItemListLoadingState());

    //
    final List<ProductModel> productList =
        await ProductsController().fetchProductList();

    emit(
      DashboardItemListState(
        productList: productList,
      ),
    );
  }

  FutureOr<void> _onDashboardRequestEvent(
    DashboardRequestEvent event,
    Emitter<DashboardState> emit,
  ) {
    emit(
      DashboardRequestState(),
    );
  }

  FutureOr<void> _onDashboardApprovalEvent(
      DashboardApprovalEvent event, Emitter<DashboardState> emit) {
    emit(DashboardApprovalState());
  }

  FutureOr<void> _onDashboardApproveEvent(
      DashboardApproveEvent event, Emitter<DashboardState> emit) {
    emit(DashboardApproveState());
  }

  FutureOr<void> _onDashboardDamagesEvent(
      DashboardDamagesEvent event, Emitter<DashboardState> emit) {
    emit(DashboardDamagesState());
  }

  FutureOr<void> _onDashboardReplacementEvent(
      DashboardReplacementEvent event, Emitter<DashboardState> emit) {
    emit(DashboardReplacementState());
  }

  FutureOr<void> _onDashboardReturnEvent(
      DashboardReturnEvent event, Emitter<DashboardState> emit) {
    emit(DashboardReturnState());
  }

  FutureOr<void> _onDashboardFundEvent(
      DashboardFundEvent event, Emitter<DashboardState> emit) {
    emit(DashboardFundState());
  }

  FutureOr<void> _onDashboardAddNewItemEvent(
      DashboardAddNewItemEvent event, Emitter<DashboardState> emit) async {
    final String response = await ProductsController().addProduct(
      image: event.image,
      name: event.itemName,
      location: event.location,
      quantity: event.itemQuantity,
    );

    _logger.debug(response.toString());

    emit(DashboardAddNewItemState(response: response));
  }

  FutureOr<void> _onDashboardGetAllShelfEvent(
      DashboardGetAllShelfEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardGetAllShelfLoadingState());
    final List<LocationModel> shelfList =
        await ProductsController().getAllShelf();
    emit(DashboardGetAllShelfState(shelfList: shelfList));
  }

  FutureOr<void> _onDashboardSingleProductDetailsEvent(
      DashboardSingleProductDetailsEvent event,
      Emitter<DashboardState> emit) async {
    emit(DashboardSingleProductDetailsLoadingState());

    final ProductModel product;

    product = await ProductsController()
        .getSingleProductDetails(productId: event.productId);

    emit(
      DashboardSingleProductDetailsFetchedState(
        product: product,
      ),
    );
  }

  FutureOr<void> _onDashboardApplicationDetailsEvent(
      DashboardApplicationDetailsEvent event, Emitter<DashboardState> emit) {
    emit(DashboardApplicationDetailsState());
  }
}
