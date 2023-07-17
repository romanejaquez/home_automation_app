import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/landing/data/models/home_tile_option.dart';

class HomeTileOptionsViewmodel extends StateNotifier<List<HomeTileOption>> {

  final Ref ref;
  HomeTileOptionsViewmodel(super.state, this.ref);

  void onTileSelected(HomeTileOption option) {
    
  }
}