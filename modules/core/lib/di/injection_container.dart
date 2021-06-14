import 'package:core/core.dart';
import 'package:provider/provider.dart';

final injectProviders = [
  Provider<FirebaseAuthApi>(create: (_) => FirebaseAuthApi()),
  Provider<FirebaseFirestoreApi>(create: (_) => FirebaseFirestoreApi()),
  ChangeNotifierProvider(create: (_) => UserBloc()),
];
