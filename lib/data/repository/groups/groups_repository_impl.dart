import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/data/model/result/result.dart';
import 'package:warikan/data/repository/groups/groups_repository.dart';

final groupsRepositoryProvider =
    Provider<GroupsRepository>((ref) => GroupsRepositoryImpl(ref.read));

class GroupsRepositoryImpl implements GroupsRepository {
  GroupsRepositoryImpl(this._reader);
  final Reader _reader;

  @override
  Future<Result<int>> fetch() async {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 2));

      final rand = Random();
      return rand.nextInt(100);
    });
  }
}
