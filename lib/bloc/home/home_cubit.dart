import 'package:bloc/bloc.dart';
import 'package:quick_start_flutter_bloc/networking/repository/repository.dart';

import 'home.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({this.repository}) : super(InitialHomeState());

  final Repository repository;

  pingAPi() {
    emit(HomeLoading());

    emit(HomeSuccess());
  }

  onChangeBottomBarIndex(int index) {
    emit(state.copyWith(bottomNavigationIndex: index));
  }

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    print(change.toString());
  }

  logout() {}
}
