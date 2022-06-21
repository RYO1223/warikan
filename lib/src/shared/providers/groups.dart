import 'package:warikan/src/shared/classes/group.dart';

class GroupsProvider {
  static GroupsProvider get shared => GroupsProvider();

  List<Group> get groups => const [
        Group(
          id: 1,
          name: 'group1',
        ),
        Group(
          id: 2,
          name: 'group2',
        ),
        Group(
          id: 3,
          name: 'group3',
        ),
      ];

  Group getGroup(int id) {
    return groups.firstWhere((group) => group.id == id);
  }
}
