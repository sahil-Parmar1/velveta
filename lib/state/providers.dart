///this is for all provider defination

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/hover_state.dart';

final hoverProvider = StateProvider<HoverData>(
      (ref) => HoverData(isHovering: false, menuItem: ''),
);
