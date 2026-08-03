// lib/features/create_contract/cubit/create_contract_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/utils/app_time_format.dart';
import 'package:dawri/core/utils/helper/validator.dart';
import 'package:dawri/features/create_contract/data/models/create_contract_model.dart';
import 'package:dawri/features/create_contract/data/repositories/interfaces/i_create_contract_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_contract_state.dart';
part 'create_contract_cubit.freezed.dart';

class CreateContractCubit extends Cubit<CreateContractState> {
  CreateContractCubit({required this.userId})
      : _repository = getIt<ICreateContractRepository>(),
        super(const CreateContractState());

  /// The person the contract is drafted with (passed in from the opening card).
  final int userId;
  final ICreateContractRepository _repository;

  // ─── Load lookups ──────────────────────────────────────────────────────────
  Future<void> loadOptions() async {
    emit(state.copyWith(optionsStatus: const CreateContractStatus.loading()));

    final typesResult = await _repository.getContractTypes();
    final salaryResult = await _repository.getSalaryTypes();

    if (typesResult.isError || salaryResult.isError) {
      emit(state.copyWith(optionsStatus: const CreateContractStatus.error()));
      MessageService.showToast(
        msg: (typesResult.asError?.error ?? salaryResult.asError?.error)
                ?.toString() ??
            LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    emit(state.copyWith(
      optionsStatus: const CreateContractStatus.success(),
      contractTypes: typesResult.asValue?.value ?? [],
      salaryTypes: salaryResult.asValue?.value ?? [],
    ));
  }

  // ─── Field updates ─────────────────────────────────────────────────────────
  void selectContractType(int id) =>
      emit(state.copyWith(selectedContractTypeId: id));

  void selectSalaryType(int id) =>
      emit(state.copyWith(selectedSalaryTypeId: id));

  void updateAmount(String value) => emit(state.copyWith(amount: value));

  void updateStartDate(String value) => emit(state.copyWith(startDate: value));

  void updateEndDate(String value) => emit(state.copyWith(endDate: value));

  void updateTotalHours(String value) =>
      emit(state.copyWith(totalHours: value));

  void updateNotes(String value) => emit(state.copyWith(notes: value));

  // ─── Submit ────────────────────────────────────────────────────────────────
  Future<void> submit() async {
    if (state.isSubmitting) return;
    if (!_validate()) return;

    emit(state.copyWith(submitStatus: const CreateContractStatus.loading()));

    final result = await _repository.createContract(
      userId: userId,
      contractTypeId: state.selectedContractTypeId!,
      salaryType: state.selectedSalaryTypeId!,
      amount: num.parse(state.amount.trim()),
      startDate: state.startDate.trim(),
      endDate: state.endDate.trim(),
      totalHours: int.parse(state.totalHours.trim()),
      notes: state.notes.trim(),
    );

    if (result.isError) {
      emit(state.copyWith(submitStatus: const CreateContractStatus.error()));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    MessageService.showToast(
      msg: LocaleKeys.createContractSuccessTitle.tr(),
      state: ToastStates.success,
    );

    emit(state.copyWith(
      submitStatus: const CreateContractStatus.success(),
      isSuccess: true,
    ));
  }

  /// Every field is mandatory — the first failing one is surfaced as a toast.
  bool _validate() {
    if (state.selectedContractTypeId == null) {
      return _fail(LocaleKeys.createContractSelectTypeError.tr());
    }
    if (state.selectedSalaryTypeId == null) {
      return _fail(LocaleKeys.createContractSelectSalaryTypeError.tr());
    }

    final amountError = Validator.validateAmount(state.amount);
    if (amountError != null) return _fail(amountError);

    if (state.startDate.trim().isEmpty) {
      return _fail(LocaleKeys.createContractStartDateRequired.tr());
    }
    if (state.endDate.trim().isEmpty) {
      return _fail(LocaleKeys.createContractEndDateRequired.tr());
    }

    final rangeError = Validator.validateDateRange(
      AppTimeFormat.parseDateTime(state.startDate.trim()),
      AppTimeFormat.parseDateTime(state.endDate.trim()),
    );
    if (rangeError != null) return _fail(rangeError);

    final hoursError = Validator.validateTotalHours(state.totalHours);
    if (hoursError != null) return _fail(hoursError);

    final notesError = Validator.validateNotes(state.notes);
    if (notesError != null) return _fail(notesError);

    return true;
  }

  bool _fail(String message) {
    MessageService.showToast(msg: message, state: ToastStates.error);
    return false;
  }
}
