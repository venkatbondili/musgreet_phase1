import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(215, 255, 195, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.2231444,size.height*0.3011600);
    path_0.quadraticBezierTo(size.width*0.2225778,size.height*0.3376600,size.width*0.2217111,size.height*0.7020400);
    path_0.lineTo(size.width*0.6111333,size.height*0.7023600);
    path_0.lineTo(size.width*0.6104556,size.height*0.3970200);
    path_0.quadraticBezierTo(size.width*0.4856889,size.height*0.4026600,size.width*0.4437444,size.height*0.4021600);
    path_0.quadraticBezierTo(size.width*0.4025111,size.height*0.4069600,size.width*0.3359778,size.height*0.2992800);
    path_0.quadraticBezierTo(size.width*0.3077694,size.height*0.2997500,size.width*0.2231444,size.height*0.3011600);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
