import 'package:flutter_zitherharp/flutter_zitherharp.dart';

abstract base class BaseRepository<C extends BaseCubit> {
  final C cubit;

  const BaseRepository(this.cubit);
}