import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warikan/data/model/group/group.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Group> groups,
  }) = _HomeState;
}
