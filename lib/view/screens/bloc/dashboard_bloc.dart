import 'dart:async';

import 'package:bloc/bloc.dart';
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
  }

  FutureOr<void> _onDashboardItemListEvent(
      DashboardItemListEvent event, Emitter<DashboardState> emit) async {
    //will fetch data from controller here.
    //then will pass it to the UI

    //emit(DashboardItemListLoading());

    //
    // final List<ProductModel> productList =
    //     await ProductsController().fetchProductList();
    // emit(DashboardItemListState(
    //   productList: productList,
    // ));

    emit(DashboardItemListState());
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
}
