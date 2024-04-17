part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardItemListLoadingState extends DashboardState {}

class DashboardItemListState extends DashboardState {
  final List<ProductModel> productList;

  DashboardItemListState({required this.productList});
}

class DashboardRequestState extends DashboardState {}

class DashboardApprovalState extends DashboardState {}

class DashboardApproveState extends DashboardState {}

class DashboardReturnState extends DashboardState {}

class DashboardDamagesState extends DashboardState {}

class DashboardReplacementState extends DashboardState {}

class DashboardFundState extends DashboardState {}

class DashboardAddNewItemState extends DashboardState {
  final String response;

  DashboardAddNewItemState({required this.response});
}

class DashboardGetAllShelfState extends DashboardState {
  final List<LocationModel> shelfList;

  DashboardGetAllShelfState({required this.shelfList});
}

class DashboardGetAllShelfLoadingState extends DashboardState {}

class DashboardSingleProductDetailsLoadingState extends DashboardState {}

class DashboardSingleProductDetailsFetchedState extends DashboardState {
  final ProductModel product;

  DashboardSingleProductDetailsFetchedState({required this.product});
}

class DashboardApplicationDetailsState extends DashboardState {}
