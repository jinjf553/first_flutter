import 'package:flutter/cupertino.dart';

class AccountInfoAction {
  final UserEntity user;

  AccountInfoAction({
    @required this.user,
  });
}

ThunkAction<AppState> accountInfoAction({
  void Function(UserEntity) onSucceed,
  void Function(NoticeEntity) onFailed,
}) =>
    (Store<AppState> store) async {
      final wgService = await WgFactory().getWgService();
      final response = await wgService.get('/account/info');

      if (response.code == WgApiResponse.codeOk) {
        final user = UserEntity.fromJson(response.data['user']);
        store.dispatch(AccountInfoAction(user: user));
        if (onSucceed != null) onSucceed(user);
      } else {
        if (onFailed != null) onFailed(NoticeEntity(message: response.message));
      }
    };
