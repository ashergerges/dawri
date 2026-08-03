// lib/core/utils/helper/fa_icon_mapper.dart
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Default glyph used whenever the backend sends an unknown or missing name.
const IconData kFaFallbackIcon = FontAwesomeIcons.fileContract;

/// Backend icon names (kebab-case, with or without the `fa-` prefix) mapped to
/// real [IconData]. Add new entries here as the API starts sending them —
/// nothing else needs to change.
const Map<String, IconData> _faIconsByName = {
  // money
  'coins': FontAwesomeIcons.coins,
  'sack-dollar': FontAwesomeIcons.sackDollar,
  'money-bill': FontAwesomeIcons.moneyBill,
  'money-bill-wave': FontAwesomeIcons.moneyBillWave,
  'wallet': FontAwesomeIcons.wallet,
  'credit-card': FontAwesomeIcons.creditCard,
  'receipt': FontAwesomeIcons.receipt,
  'dollar-sign': FontAwesomeIcons.dollarSign,
  // time
  'clock': FontAwesomeIcons.clock,
  'clock-rotate-left': FontAwesomeIcons.clockRotateLeft,
  'stopwatch': FontAwesomeIcons.stopwatch,
  'hourglass-half': FontAwesomeIcons.hourglassHalf,
  'calendar': FontAwesomeIcons.calendar,
  'calendar-days': FontAwesomeIcons.calendarDays,
  'calendar-check': FontAwesomeIcons.calendarCheck,
  'repeat': FontAwesomeIcons.repeat,
  // documents
  'file-contract': FontAwesomeIcons.fileContract,
  'file-signature': FontAwesomeIcons.fileSignature,
  'file-invoice': FontAwesomeIcons.fileInvoice,
  'file-lines': FontAwesomeIcons.fileLines,
  'pen-clip': FontAwesomeIcons.penClip,
  'layer-group': FontAwesomeIcons.layerGroup,
  'handshake': FontAwesomeIcons.handshake,
  'gavel': FontAwesomeIcons.gavel,
  // people / roles
  'user': FontAwesomeIcons.user,
  'users': FontAwesomeIcons.users,
  'user-tie': FontAwesomeIcons.userTie,
  'user-plus': FontAwesomeIcons.userPlus,
  'chalkboard-user': FontAwesomeIcons.chalkboardUser,
  'person-running': FontAwesomeIcons.personRunning,
  'whistle': FontAwesomeIcons.gavel,
  // sports
  'futbol': FontAwesomeIcons.futbol,
  'basketball': FontAwesomeIcons.basketball,
  'volleyball': FontAwesomeIcons.volleyball,
  'table-tennis-paddle-ball': FontAwesomeIcons.tableTennisPaddleBall,
  'dumbbell': FontAwesomeIcons.dumbbell,
  'trophy': FontAwesomeIcons.trophy,
  'medal': FontAwesomeIcons.medal,
  'star': FontAwesomeIcons.star,
  'solid-star': FontAwesomeIcons.solidStar,
  // status
  'circle-check': FontAwesomeIcons.circleCheck,
  'circle-xmark': FontAwesomeIcons.circleXmark,
  'circle-exclamation': FontAwesomeIcons.circleExclamation,
  'check': FontAwesomeIcons.check,
  'xmark': FontAwesomeIcons.xmark,
};

/// Resolves an API icon name such as `"fa-coins"` / `"coins"` / `"fa_coins"`
/// into [IconData], falling back to [fallback] when unknown or null.
IconData faIconFromName(String? name, {IconData fallback = kFaFallbackIcon}) {
  if (name == null || name.trim().isEmpty) return fallback;

  var key = name.trim().toLowerCase().replaceAll('_', '-').replaceAll(' ', '-');
  // Strip style prefixes the backend may include: fa-, fas-, far-, fa-solid-…
  for (final prefix in const ['fa-solid-', 'fa-regular-', 'fa-brands-', 'fas-', 'far-', 'fab-', 'fa-']) {
    if (key.startsWith(prefix)) {
      key = key.substring(prefix.length);
      break;
    }
  }

  return _faIconsByName[key] ?? fallback;
}

extension FaIconNameX on String? {
  /// `contract.salaryType?.icon.toFaIcon()`
  IconData toFaIcon({IconData fallback = kFaFallbackIcon}) =>
      faIconFromName(this, fallback: fallback);
}
