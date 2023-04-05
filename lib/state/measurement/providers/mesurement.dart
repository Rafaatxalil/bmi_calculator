import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../enums/measurement.dart';

final measureProvider = StateProvider<Measurement>(
  (ref) => Measurement.metric,
);
