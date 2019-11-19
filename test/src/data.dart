import 'package:gurps_modifiers/src/modifier_data.dart';

///
/// [ModifierData] describes any instance-specific values for a Modifier.
///
class Data with ModifierData {
  /// The detail or specialization of this Modifier.
  @override
  final String detail;

  /// The level of this Modifer. If null, this Modifier does not have levels.
  @override
  final int level;

  Data({this.detail, this.level});
}
