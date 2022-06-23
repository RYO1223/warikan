import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/data/repository/groups/groups_repository.dart';
import 'package:warikan/data/repository/groups/groups_repository_impl.dart';
import 'package:warikan/ui/home/home_state.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, AsyncValue<HomeState>>(
  (ref) => HomeViewModel(ref: ref),
);

class HomeViewModel extends StateNotifier<AsyncValue<HomeState>> {
  HomeViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  final AutoDisposeStateNotifierProviderRef _ref;

  late final GroupsRepository groupsRepository =
      _ref.read(groupsRepositoryProvider);

  Future<void> load() async {
    final result = await groupsRepository.fetch();
    result.when(success: (data) {
      state = AsyncValue.data(
        HomeState(count: data),
      );
    }, failure: (error) {
      state = AsyncValue.error(error);
    });
  }

  void increment() {
    final count = state.value!.count;
    state = AsyncValue.data(
      HomeState(count: count + 1),
    );
  }
}
