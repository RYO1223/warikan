import 'package:warikan/data/model/result/result.dart';

abstract class GroupsRepository {
  Future<Result<int>> fetch();
}
