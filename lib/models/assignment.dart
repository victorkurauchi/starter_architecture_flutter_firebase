import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Assignment extends Equatable {
  const Assignment(
      {required this.id,
      required this.shiftId,
      required this.status,
      required this.userId,
      required this.checkinAt,
      this.checkoutAt,
      this.checkinLocation,
      this.checkoutLocation});
  final String id;
  final String shiftId;
  final String status;
  final String userId;
  final DateTime checkinAt;
  final DateTime? checkoutAt;
  final GeoPoint? checkinLocation;
  final GeoPoint? checkoutLocation;

  @override
  List<Object> get props => [
        id,
        shiftId,
        status,
        userId,
        checkinAt,
        checkoutAt ?? '',
        checkinLocation ?? '',
        checkoutLocation ?? ''
      ];

  @override
  bool get stringify => true;

  factory Assignment.fromMap(Map<String, dynamic>? data, String documentId) {
    if (data == null) {
      throw StateError('missing data for assignment: $documentId');
    }
    final shiftId = data['shift_id'] as String?;
    final userId = data['user_id'] as String?;

    if (shiftId == null || userId == null) {
      throw StateError('missing data for shiftId or userId: $documentId');
    }
    final status = data['status'] as String;
    final checkinAt = data['checkinAt'] as DateTime;
    final checkoutAt =
        data['checkoutAt'] != null ? data['checkoutAt'] as DateTime : null;
    final checkinLocation = data['checkinLocation'] != null
        ? data['checkinLocation'] as GeoPoint
        : null;
    final checkoutLocation = data['checkoutLocation'] != null
        ? data['checkoutLocation'] as GeoPoint
        : null;

    return Assignment(
        id: documentId,
        shiftId: shiftId,
        userId: userId,
        status: status,
        checkinAt: checkinAt,
        checkoutAt: checkoutAt,
        checkinLocation: checkinLocation,
        checkoutLocation: checkoutLocation);
  }

  Map<String, dynamic> toMap() {
    return {'status': status, 'checkinAt': checkinAt, 'checkoutAt': checkoutAt};
  }
}
