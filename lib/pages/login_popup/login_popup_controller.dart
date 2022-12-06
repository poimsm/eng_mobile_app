import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/repositories/sentence/sentence_repository.dart';
import 'package:eng_mobile_app/data/repositories/sentence/sentence_repository_impl.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:eng_mobile_app/utils/error_codes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class LoginState {
  LoginState({
    this.loading = false,
    this.hidePassword = false,
    this.enableToSaveOrEdit = false,
    this.showVideo = false,
    this.showBanner = false,
    this.showInvalidEmailErr = false,
    this.showServerErr = false,
    this.errMsg = '',
  });

  bool loading;
  bool hidePassword;
  bool enableToSaveOrEdit;
  bool showVideo;
  bool showBanner;
  bool showInvalidEmailErr;
  bool showServerErr;
  String errMsg;

  LoginState copyWith({
    loading,
    hidePassword,
    enableToSaveOrEdit,
    showVideo,
    showBanner,
    showInvalidEmailErr,
    showServerErr,
    errMsg,
  }) {
    return LoginState(
      loading: loading ?? this.loading,
      hidePassword: hidePassword ?? this.hidePassword,
      enableToSaveOrEdit: enableToSaveOrEdit ?? this.enableToSaveOrEdit,
      showVideo: showVideo ?? this.showVideo,
      showBanner: showBanner ?? this.showBanner,
      showInvalidEmailErr: showInvalidEmailErr ?? this.showInvalidEmailErr,
      showServerErr: showServerErr ?? this.showServerErr,
      errMsg: errMsg ?? this.errMsg,
    );
  }
}

class LoginPopupNotifier extends StateNotifier<LoginState> {
  LoginPopupNotifier(this._authService, this._sentenceRepository)
      : super(LoginState());

  final AuthService _authService;
  final SentenceRepository _sentenceRepository;

  bool checkValidEmail(String email) {
    state = state.copyWith(showInvalidEmailErr: false);
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (!emailValid) {
      state =
          state.copyWith(errMsg: 'Invalid email', showInvalidEmailErr: true);
    }

    return emailValid;
  }

  void checkEnableToSaveOrEdit(String sentenceText, String meaningText,
      bool isNewSentence, Sentence? sentence) {
    bool enable = false;

    if (isNewSentence) {
      enable = sentenceText.length > 2;
    } else {
      enable = sentenceText.length > 2 &&
          (sentenceText != sentence!.sentence ||
              meaningText != (sentence.meaning ?? ''));
    }

    if (state.enableToSaveOrEdit != enable) {
      state = state.copyWith(enableToSaveOrEdit: enable);
    }
  }

  void ressetErrorsAndStartLoading() async {
    state = state.copyWith(
        showInvalidEmailErr: false,
        showServerErr: false,
        errMsg: '',
        loading: true);
  }

  Future<bool> signIn({required String email, required String password}) async {
    state = state.copyWith(loading: true);
    final resp = await _authService.signIn(SignInPayload(
      email: email,
      password: password,
    ));
    await _sentenceRepository.deleteAllLocalSentences();
    state = state.copyWith(loading: false);

    if (!resp.ok) {
      String message = 'Something went wrong. Please try again later.';

      if (resp.data != null &&
          resp.data['error_code'] == ErrorCodes.EMAIL_OR_PASS_INCORRECT) {
        message = 'Email or password incorrect';
      }

      state = state.copyWith(showServerErr: true, errMsg: message);
      return false;
    }

    return true;
  }

  Future<bool> signUp({required String email, required String password}) async {
    state = state.copyWith(loading: true);
    final resp = await _authService.signUp(SignUpPayload(
      email: email,
      password: password,
    ));
    await _sentenceRepository.migrateLocalSentencesToUser();
    state = state.copyWith(loading: false);

    if (!resp.ok) {
      String message = 'Something went wrong. Please try again later.';

      if (resp.data != null &&
          resp.data['error_code'] == ErrorCodes.EMAIL_EXISTS) {
        message = 'Email already exists';
      }

      state = state.copyWith(showServerErr: true, errMsg: message);
      return false;
    }

    return true;
  }
}

final loginPopupProvider =
    StateNotifierProvider.autoDispose<LoginPopupNotifier, LoginState>((ref) {
  final authService = GetIt.I.get<AuthService>();
  final sentenceRepository = ref.watch(sentenceRepositoryProvider);
  return LoginPopupNotifier(authService, sentenceRepository);
});
