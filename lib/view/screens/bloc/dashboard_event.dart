part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class DashboardInitialEvent extends DashboardEvent {}

class DashboardRequestEvent extends DashboardEvent {}

class DashboardApprovalEvent extends DashboardEvent {}

class DashboardApproveEvent extends DashboardEvent {}

class DashboardReturnEvent extends DashboardEvent {}

class DashboardDamagesEvent extends DashboardEvent {}

class DashboardReplacementEvent extends DashboardEvent {}

class DashboardFundEvent extends DashboardEvent {}
