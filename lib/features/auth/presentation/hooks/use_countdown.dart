import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A running countdown; [restart] starts it again from the full duration.
typedef Countdown = ({Duration remaining, VoidCallback restart});

/// Ticks once a second from [duration] down to zero.
///
/// Why a hook: the timer is purely a presentation concern and must be
/// cancelled with the widget.
Countdown useCountdown(Duration duration) {
  final remaining = useState(duration);
  final runId = useState(0);

  useEffect(() {
    remaining.value = duration;
    final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final next = remaining.value - const Duration(seconds: 1);
      remaining.value = next;
      if (next <= Duration.zero) timer.cancel();
    });
    return timer.cancel;
  }, [runId.value]);

  return (remaining: remaining.value, restart: () => runId.value++);
}

/// `4:58` style label for [d].
String formatCountdown(Duration d) {
  final minutes = d.inMinutes;
  final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}
