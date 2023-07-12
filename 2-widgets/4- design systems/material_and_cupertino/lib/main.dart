import 'package:flutter/material.dart';
import 'package:material_and_cupertino/design_systems/google_material.dart';
import 'package:material_and_cupertino/design_systems/apple_cupertino.dart';
import 'package:material_and_cupertino/design_systems/microsoft_fluent.dart';

//Design Language Refrences:
// -Google Material: https://m3.material.io/
// -Apple Design: https://developer.apple.com/design/human-interface-guidelines/
// -Microsoft Fluent: https://fluent1.microsoft.design/

//Flutter widgets catalog: https://docs.flutter.dev/ui/widgets
void main() {
  runApp(
    // const GoogleMaterial(),
    const AppleCupertino(),
    // const MicrosoftFluent(),
  );
}
