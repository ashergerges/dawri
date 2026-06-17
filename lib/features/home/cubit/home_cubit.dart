import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/home/data/repositories/interfaces/i_home_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() :
        _repository=getIt<IHomeRepository>(),
        super( HomeState(refreshController:RefreshController()));

  final IHomeRepository _repository;


}
