part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardInitialState extends DashboardState {
  final List<ProductModel> productList;

  DashboardInitialState({required this.productList});
}

class DashboardRequestState extends DashboardState {}

class DashboardApprovalState extends DashboardState {}

class DashboardApproveState extends DashboardState {}

class DashboardReturnState extends DashboardState {}

class DashboardDamagesState extends DashboardState {}

class DashboardReplacementState extends DashboardState {}

class DashboardFundState extends DashboardState {}
