import 'package:core/data/models/userProfile.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends ChangeNotifier {
  // ignore: close_sinks
  final _streamProfile = BehaviorSubject<UserProfile>();
  Stream<UserProfile> get userProfile => _streamProfile.stream;

  void addUserProfile(UserProfile profile) {
    _streamProfile.add(profile);
  }
}
