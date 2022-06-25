import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/data/model/group/group.dart';
import 'package:warikan/data/repository/groups/groups_repository.dart';
import 'package:warikan/data/repository/payments/payments_repository.dart';
import 'package:warikan/data/repository/payments/payments_repository_impl.dart';
import 'package:warikan/extensions/firestore_converters.dart';

final groupsRepositoryProvider =
    Provider<GroupsRepository>((ref) => GroupsRepositoryImpl(ref: ref));

class GroupsRepositoryImpl implements GroupsRepository {
  GroupsRepositoryImpl({required this.ref});

  final ProviderRef<GroupsRepository> ref;

  final groupsRef =
      FirebaseFirestore.instance.collection('groups').withGroupConverter();

  @override
  Future<List<Group>> fetch() async {
    return groupsRef.get().then((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Future<List<Group>> fetchWithPayments() async {
    final PaymentsRepository paymentsRepository =
        ref.watch(paymentsRepositoryProvider);

    final groups = await fetch();
    return Future.wait(
      groups.map((group) {
        return paymentsRepository.fetch(group).then((payments) {
          return group.copyWith(payments: payments);
        });
      }).toList(),
    );
  }
}
