import 'package:flutter/material.dart';

class TouchSignatureController extends ChangeNotifier {
  final List<Offset?> _points = [];

  List<Offset?> get points => List.unmodifiable(_points);

  bool get hasSignature => _points.where((p) => p != null).length >= 8;

  void addPoint(Offset? point) {
    _points.add(point);
    notifyListeners();
  }

  void clear() {
    _points.clear();
    notifyListeners();
  }
}

class TouchSignaturePad extends StatefulWidget {
  const TouchSignaturePad({
    super.key,
    required this.controller,
    required this.signerLabel,
    this.height = 140,
  });

  final TouchSignatureController controller;
  final String signerLabel;
  final double height;

  @override
  State<TouchSignaturePad> createState() => _TouchSignaturePadState();
}

class _TouchSignaturePadState extends State<TouchSignaturePad> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerUpdate);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerUpdate);
    super.dispose();
  }

  void _onControllerUpdate() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final hasSig = widget.controller.hasSignature;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.signerLabel,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: hasSig
                        ? Colors.green.withValues(alpha: 0.15)
                        : Colors.orange.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: hasSig ? Colors.green : Colors.orange,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        hasSig ? Icons.check_circle : Icons.edit,
                        size: 12,
                        color: hasSig ? Colors.green : Colors.orange,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        hasSig
                            ? 'Terverifikasi'
                            : 'Wajib disentuh & tanda tangan',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: hasSig ? Colors.green : Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.controller.points.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: widget.controller.clear,
                    icon: const Icon(Icons.clear, size: 14),
                    label: const Text('Hapus', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ],
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: widget.height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E232A) : const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: hasSig
                  ? Colors.green.withValues(alpha: 0.7)
                  : theme.dividerColor,
              width: 1.5,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: GestureDetector(
              onPanStart: (details) {
                widget.controller.addPoint(details.localPosition);
              },
              onPanUpdate: (details) {
                widget.controller.addPoint(details.localPosition);
              },
              onPanEnd: (_) {
                widget.controller.addPoint(null);
              },
              child: CustomPaint(
                painter: _SignaturePainter(
                  points: widget.controller.points,
                  color: isDark ? Colors.white : Colors.black87,
                ),
                child: widget.controller.points.isEmpty
                    ? Center(
                        child: Text(
                          'Goreskan tanda tangan dengan jari di sini',
                          style: TextStyle(
                            fontSize: 12,
                            color: theme.hintColor.withValues(alpha: 0.5),
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SignaturePainter extends CustomPainter {
  final List<Offset?> points;
  final Color color;

  _SignaturePainter({required this.points, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw baseline
    final linePaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.3)
      ..strokeWidth = 1.0;
    canvas.drawLine(
      Offset(16, size.height - 24),
      Offset(size.width - 16, size.height - 24),
      linePaint,
    );

    // Draw user signature stroke
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.5;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawCircle(points[i]!, 1.5, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SignaturePainter oldDelegate) => true;
}
