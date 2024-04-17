// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:edmas/models/item.dart';

class Application {
  final String id;
  final String applicantId;
  final String applicationToId;
  final String type;
  final String subject;
  final String body;
  final String status;
  final String phase;
  final String quantity;
  final String productName;
  final String productId;
  final String applicantName;
  final String applicantEmail;
  final String applicationToName;
  final String applicationToEmail;
  List<Item> items;
  Application({
    required this.id,
    required this.applicantId,
    required this.applicationToId,
    required this.type,
    required this.subject,
    required this.body,
    required this.status,
    required this.phase,
    required this.quantity,
    required this.productName,
    required this.productId,
    required this.applicantName,
    required this.applicantEmail,
    required this.applicationToName,
    required this.applicationToEmail,
    required this.items,
  });

  Application copyWith({
    String? id,
    String? applicantId,
    String? applicationToId,
    String? type,
    String? subject,
    String? body,
    String? status,
    String? phase,
    String? quantity,
    String? productName,
    String? productId,
    String? applicantName,
    String? applicantEmail,
    String? applicationToName,
    String? applicationToEmail,
    List<Item>? items,
  }) {
    return Application(
      id: id ?? this.id,
      applicantId: applicantId ?? this.applicantId,
      applicationToId: applicationToId ?? this.applicationToId,
      type: type ?? this.type,
      subject: subject ?? this.subject,
      body: body ?? this.body,
      status: status ?? this.status,
      phase: phase ?? this.phase,
      quantity: quantity ?? this.quantity,
      productName: productName ?? this.productName,
      productId: productId ?? this.productId,
      applicantName: applicantName ?? this.applicantName,
      applicantEmail: applicantEmail ?? this.applicantEmail,
      applicationToName: applicationToName ?? this.applicationToName,
      applicationToEmail: applicationToEmail ?? this.applicationToEmail,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'applicantId': applicantId,
      'applicationToId': applicationToId,
      'type': type,
      'subject': subject,
      'body': body,
      'status': status,
      'phase': phase,
      'quantity': quantity,
      'productName': productName,
      'productId': productId,
      'applicantName': applicantName,
      'applicantEmail': applicantEmail,
      'applicationToName': applicationToName,
      'applicationToEmail': applicationToEmail,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory Application.fromMap(Map<String, dynamic> map) {
    return Application(
      id: map['id'] as String,
      applicantId: map['applicantId'] as String,
      applicationToId: map['applicationToId'] as String,
      type: map['type'] as String,
      subject: map['subject'] as String,
      body: map['body'] as String,
      status: map['status'] as String,
      phase: map['phase'] as String,
      quantity: map['quantity'] as String,
      productName: map['productName'] as String,
      productId: map['productId'] as String,
      applicantName: map['applicantName'] as String,
      applicantEmail: map['applicantEmail'] as String,
      applicationToName: map['applicationToName'] as String,
      applicationToEmail: map['applicationToEmail'] as String,
      items: List<Item>.from(
        (map['items'] as List<int>).map<Item>(
          (x) => Item.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Application.fromJson(String source) =>
      Application.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Application(id: $id, applicantId: $applicantId, applicationToId: $applicationToId, type: $type, subject: $subject, body: $body, status: $status, phase: $phase, quantity: $quantity, productName: $productName, productId: $productId, applicantName: $applicantName, applicantEmail: $applicantEmail, applicationToName: $applicationToName, applicationToEmail: $applicationToEmail, items: $items)';
  }

  @override
  bool operator ==(covariant Application other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.applicantId == applicantId &&
        other.applicationToId == applicationToId &&
        other.type == type &&
        other.subject == subject &&
        other.body == body &&
        other.status == status &&
        other.phase == phase &&
        other.quantity == quantity &&
        other.productName == productName &&
        other.productId == productId &&
        other.applicantName == applicantName &&
        other.applicantEmail == applicantEmail &&
        other.applicationToName == applicationToName &&
        other.applicationToEmail == applicationToEmail &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        applicantId.hashCode ^
        applicationToId.hashCode ^
        type.hashCode ^
        subject.hashCode ^
        body.hashCode ^
        status.hashCode ^
        phase.hashCode ^
        quantity.hashCode ^
        productName.hashCode ^
        productId.hashCode ^
        applicantName.hashCode ^
        applicantEmail.hashCode ^
        applicationToName.hashCode ^
        applicationToEmail.hashCode ^
        items.hashCode;
  }
}
