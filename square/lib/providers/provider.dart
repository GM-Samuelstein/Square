import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:square/providers/app_provider.dart';

class RiverpodProvider {
  static final appProvider = ChangeNotifierProvider((ref) => AppProvider());
}
