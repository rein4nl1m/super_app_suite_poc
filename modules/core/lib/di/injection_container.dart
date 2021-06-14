import 'package:core/core.dart';
import 'package:provider/provider.dart';

List<Provider> injectProviders = [
  Provider<FirebaseAuthApi>(create: (_) => FirebaseAuthApi()),
  Provider<FirebaseFirestoreApi>(create: (_) => FirebaseFirestoreApi()),
];
