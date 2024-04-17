part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class DashboardItemListEvent extends DashboardEvent {}

class DashboardRequestEvent extends DashboardEvent {}

class DashboardApprovalEvent extends DashboardEvent {}

class DashboardApproveEvent extends DashboardEvent {}

class DashboardReturnEvent extends DashboardEvent {}

class DashboardDamagesEvent extends DashboardEvent {}

class DashboardReplacementEvent extends DashboardEvent {}

class DashboardFundEvent extends DashboardEvent {}

class DashboardAddNewItemEvent extends DashboardEvent {
  final String itemName;
  final String location;
  final String itemQuantity;
  final Uint8List? image;

  DashboardAddNewItemEvent(
    this.image, {
    required this.itemName,
    required this.location,
    required this.itemQuantity,
  });
}

class DashboardGetAllShelfEvent extends DashboardEvent {}

class DashboardSingleProductDetailsEvent extends DashboardEvent {
  final String productId;

  DashboardSingleProductDetailsEvent({required this.productId});
}

class DashboardApplicationDetailsEvent extends DashboardEvent {}
