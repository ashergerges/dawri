// lib/features/partner_details/cubit/partner_details_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/partner_details/data/models/partner_details_model.dart';
import 'package:dawri/features/partner_details/data/repositories/interfaces/i_partner_details_repository.dart';
import 'package:dawri/features/partners/data/models/partners_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_details_state.dart';
part 'partner_details_cubit.freezed.dart';

class PartnerDetailsCubit extends Cubit<PartnerDetailsState> {
  PartnerDetailsCubit(this.partnerId)
      : _repository = getIt<IPartnerDetailsRepository>(),
        super(const PartnerDetailsState());

  final int partnerId;
  final IPartnerDetailsRepository _repository;

  // ─── Details ───────────────────────────────────────────────────────────────
  Future<void> loadDetails() async {
    emit(state.copyWith(detailsStatus: const PartnerDetailsStatus.loading()));

    final result = await _repository.getPartnerDetails(partnerId: partnerId);

    if (result.isError) {
      emit(state.copyWith(detailsStatus: const PartnerDetailsStatus.error()));
      return;
    }

    final partner = result.asValue!.value;
    emit(state.copyWith(
      detailsStatus: const PartnerDetailsStatus.success(),
      partner: partner,
      isFavorite: partner.isFav ?? false,
      // The fresh payload already counts them — drop the local bumps so they
      // aren't added twice.
      extraViewIds: const {},
    ));
  }

  /// Reflects a view the server already accepted.
  void bumpViews(int videoId) {
    if (isClosed) return;
    emit(state.copyWith(extraViewIds: {...state.extraViewIds, videoId}));
  }

  // ─── Favorite (optimistic) ─────────────────────────────────────────────────
  Future<void> toggleFavorite() async {
    final previous = state.isFavorite;
    emit(state.copyWith(isFavorite: !previous));

    final result = await _repository.toggleFavorite(id: partnerId);

    if (result.isError) {
      emit(state.copyWith(isFavorite: previous));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    final message = result.asValue?.value ?? '';
    if (message.isNotEmpty) {
      MessageService.showToast(msg: message, state: ToastStates.success);
    }
  }
}
