import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_exercise/presentation/ui/state_app.dart';

void main() {
  runApp( ProviderScope(child: StateApp()) );
}

