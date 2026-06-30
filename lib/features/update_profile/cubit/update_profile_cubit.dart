// lib/features/update_profile/cubit/update_profile_cubit.dart
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dawri/features/update_profile/data/models/update_profile_model.dart';

part 'update_profile_state.dart';
part 'update_profile_cubit.freezed.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(const UpdateProfileState());

  final ImagePicker _imagePicker = ImagePicker();

  String? name;
  String? phone;
  String? email;

  /// Opens the device gallery, validates size, and updates the avatar preview.
  Future<void> pickAvatarFromGallery() async {
    emit(state.copyWith(isPickingAvatar: true, avatarError: null));
    try {
      final picked = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (picked == null) {
        emit(state.copyWith(isPickingAvatar: false));
        return;
      }

      final file = File(picked.path);
      final sizeBytes = await file.length();

      if (sizeBytes > UpdateProfileMockData.maxAvatarSizeBytes) {
        emit(state.copyWith(
          isPickingAvatar: false,
          avatarError: 'updateProfileErrorImageTooLarge',
        ));
        return;
      }

      emit(state.copyWith(
        isPickingAvatar: false,
        avatarPath: picked.path,
        isLocalAvatar: true,
      ));
    } catch (_) {
      emit(state.copyWith(
        isPickingAvatar: false,
        avatarError: 'updateProfileErrorPickFailed',
      ));
    }
  }

  void clearAvatarError() {
    emit(state.copyWith(avatarError: null));
  }

  void toggleReminderNotifications(bool value) {
    emit(state.copyWith(reminderNotifications: value));
  }

  void toggleWalletAlerts(bool value) {
    emit(state.copyWith(walletAlerts: value));
  }

  void toggleDarkMode(bool value) {
    emit(state.copyWith(darkMode: value));
  }

  Future<void> updateProfile() async {
    emit(state.copyWith(isUpdating: true));
    await Future.delayed(const Duration(milliseconds: 900));
    emit(state.copyWith(isUpdating: false, isSuccess: true));
  }

  void dismissSuccess() {
    emit(state.copyWith(isSuccess: false));
  }
}