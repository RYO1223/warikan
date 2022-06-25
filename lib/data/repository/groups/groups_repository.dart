import 'package:warikan/data/model/group/group.dart';

abstract class GroupsRepository {
  Future<List<Group>> fetch();
  Future<List<Group>> fetchWithPayments();
}
