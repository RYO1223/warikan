import 'package:warikan/src/shared/classes/group.dart';

class GroupsProvider {
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
}
