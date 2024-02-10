// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:my_canvas/canvas/_001_border_inside_container.dart';
import 'package:my_canvas/canvas/path/_002_conic_curve.dart';
import 'package:my_canvas/canvas/path/_003_bezier_curve.dart';
import 'package:my_canvas/canvas/path/_011_polygon.dart';
import 'package:my_canvas/canvas/path/_012_path_matrics.dart';
import 'package:my_canvas/canvas/path/_013_reset.dart';
import 'package:my_canvas/canvas/path/_014_shifting_path.dart';
import 'package:my_canvas/canvas/path/_015_transform_path.dart';
import 'package:my_canvas/canvas/path/_016_calculating_area_of_path.dart';
import 'package:my_canvas/canvas/path/_017_extends_width.dart';
import 'package:my_canvas/canvas/path/_018_contains_method.dart';
import 'package:my_canvas/canvas/path/_019_combining_method.dart';
import 'package:my_canvas/canvas/path/_020_mesh_gradient.dart';
import 'package:my_canvas/canvas/path/_021_draw_points.dart';
import 'package:my_canvas/canvas/path/_022_draw_raw_points.dart';
import 'package:my_canvas/canvas/path/_023_draw_image.dart';
import 'package:my_canvas/canvas/path/_024_draw_shadow_method.dart';
import 'package:my_canvas/canvas/path/_025_draw_paragraph.dart';
import 'package:my_canvas/canvas/path/_026_draw_atlas.dart';
import 'package:my_canvas/canvas/path/_027_clip_layers.dart';
import 'package:my_canvas/canvas/path/_028_place_img_in_the_text.dart';
import 'package:my_canvas/canvas/path/_029_gravity_simulation.dart';
import 'package:my_canvas/canvas/path/_031_save_and_restore.dart';
import 'package:my_canvas/canvas/path/_030_friction_simulation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        scaffoldBackgroundColor: const Color(0xFF010417),
        useMaterial3: true,
      ),
      home: const MyScafold(),
    );
  }
}

class MyScafold extends StatelessWidget {
  const MyScafold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // child: BorderInside(),
        // child: ConicToAndRelativeConicTo(),
        // child: BezierToAndRelativeBezierTo(),
        // child: PolygonsFlutter(),
        // child: PathMatrics(),
        // child: ResetAndUseSameInstanceOfPath(),
        // child: ShiftingPath(),
        // child: TransFormPath(),
        // child: CalculatingAreaOfPath(),
        // child: ExtendsWidth(),
        // child: ContainsMethod(),
        // child: Combining(),
        // child: MeshGradient(),
        // child: DrawRawPointss(),
        // child: DrawImageInCanvas(),
        // child: DrawShadowInCustomPaint(),
        // child: DrawParagraphInCustomPaint(),
        // child: DrawAtlasInCustomPaint(),
        // child: ClipLayersScreen(),
        // child: PLaceImgInsideText(),
        // child: GravitySimulationScreen(),
        // child: FrictionSimulationScreen(),
        child: SaveAndRestoreCanvasScreen(),
      ),
    );
  }
}




class PaintConst {
  static final grayFill = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;
}