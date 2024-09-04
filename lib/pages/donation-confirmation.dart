import 'package:flutter/material.dart';

class DonationConfirmation extends StatelessWidget {
  static const routeName = '/DonationConfirmationScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmação da Doação'),
      ),
      body: Align(
        alignment: Alignment(0.0, -0.5), // Move the container upwards
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(40.0), // Increased padding to make the green area larger
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.green,
                  width: 5.0,
                ),
              ),
              child: CustomPaint(
                size: Size(100, 100),
                painter: CheckmarkPainter(),
              ),
            ),
            SizedBox(height: 20.0), // Add some space between the checkmark and the text
            Container(
              width: 300.0, // Set a specific width for the text container
              child: Text(
                'Doação confirmada com sucesso, obrigado por ajudar um futuro mais verde!',
                textAlign: TextAlign.center, // Align the text in the center
                style: TextStyle(
                  fontSize: 24.0, // Make the text a bit larger
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
              ),
            ),
            SizedBox(height: 20.0), // Add some space between the text and the button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/DonationScreen');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Set the background color to green
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Make the button slightly rounded
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // Adjust padding to make it square
              ),
              child: Text(
                'Doar novamente',
                style: TextStyle(color: Colors.white), // Set the button text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckmarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 20.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.5)
      ..lineTo(size.width * 0.4, size.height * 0.7)
      ..lineTo(size.width * 0.8, size.height * 0.3);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
