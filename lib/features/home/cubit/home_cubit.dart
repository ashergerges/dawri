// lib/features/home/cubit/home_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/home/data/models/home_model.dart';
import 'package:dawri/features/home/data/repositories/interfaces/i_home_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() :
        _homeRepository=getIt<IHomeRepository>(),
        super( HomeState());
  final IHomeRepository _homeRepository;





  Future<void> getHome() async {
    emit(state.copyWith(status: HomeStateStatus.loading()));

    final result = await _homeRepository.getHome();
    if (result.isError) {
      emit(
        state.copyWith(status: HomeStateStatus.error(),),
      );      return;
    }

    emit(
      state.copyWith(
        status: HomeStateStatus.success(),
        products: result.asValue?.value.latestProducts??[],
        tickets: result.asValue?.value.matchesTickets??[],
      ),
    );
  }
  Future<void> addedToCart({required int id}) async {

    final result = await _homeRepository.addedToCart(id: id);
    if (result.isError) {
      emit(
        state.copyWith(status: HomeStateStatus.error(),),
      );      return;
    }

    MessageService.showToast(msg: result.asValue?.value??"", state: ToastStates.success);
  }
}