import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/data/repository/groups/groups_repository.dart';
import 'package:warikan/data/repository/groups/groups_repository_impl.dart';
import 'package:warikan/ui/home/home_state.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, AsyncValue<HomeState>>(
  (ref) => HomeViewModel(ref: ref),
);

class HomeViewModel extends StateNotifier<AsyncValue<HomeState>> {
  HomeViewModel({required this.ref}) : super(const AsyncLoading()) {
    load();
  }

  final StateNotifierProviderRef<HomeViewModel, AsyncValue<HomeState>> ref;

  late final GroupsRepository groupsRepository =
      ref.watch(groupsRepositoryProvider);

  Future<void> load() async {
    final groups = await groupsRepository.fetchWithPayments();
    state = AsyncValue.data(HomeState(groups: groups));
  }
}
