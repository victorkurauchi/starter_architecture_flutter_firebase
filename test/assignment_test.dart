import 'package:flutter_test/flutter_test.dart';
import 'package:starter_architecture_flutter_firebase/models/assignment.dart';

void main() {
  group('models/Assignment', () {
    group('fromMap', () {
      test('null data', () {
        expect(() => Assignment.fromMap(null, 'abc'),
            throwsA(isInstanceOf<StateError>()));
      });
      test('job with all properties', () {
        final date = DateTime.now();
        final job = Assignment.fromMap({
          'shift_id': 'shift1',
          'user_id': 'userId',
          'status': 'accepted',
          'checkinAt': date,
        }, 'abc');
        expect(
            job,
            Assignment(
                shiftId: 'shift1',
                userId: 'userId',
                status: 'accepted',
                id: 'abc',
                checkinAt: date));
      });

      test('missing name', () {
        expect(
            () => Assignment.fromMap(const {
                  'ratePerHour': 10,
                }, 'abc'),
            throwsA(isInstanceOf<StateError>()));
      });
    });

    // group('toMap', () {
    //   test('valid name, ratePerHour', () {
    //     const assignment =
    //         Assignment(name: 'Blogging', ratePerHour: 10, id: 'abc');
    //     expect(assignment.toMap(), {
    //       'name': 'Blogging',
    //       'ratePerHour': 10,
    //     });
    //   });
    // });

    // group('equality', () {
    //   test('different properties, equality returns false', () {
    //     const job1 = Assignment(name: 'Blogging', ratePerHour: 10, id: 'abc');
    //     const job2 = Assignment(name: 'Blogging', ratePerHour: 5, id: 'abc');
    //     expect(job1 == job2, false);
    //   });
    //   test('same properties, equality returns true', () {
    //     const job1 = Assignment(name: 'Blogging', ratePerHour: 10, id: 'abc');
    //     const job2 = Assignment(name: 'Blogging', ratePerHour: 10, id: 'abc');
    //     expect(job1 == job2, true);
    //   });
    // });
  });
}
