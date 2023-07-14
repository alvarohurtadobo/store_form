class Responsive {
  static double width = 0;
  static double height = 0;

  static double padding = 10;
  static double boxSeparation = 5;

  static double boxSize = 50;
  static double bigButtonSize = 70;
  static double buttonWidth = 70;
  static double buttonHeight = 70;
  static double tileNormal = 25;
  static double iconSide = 16;
  static double radius = 7;

  static double initialLogoSide = 70;

  static double headerHeight = 180;

  static double font02 = 36;
  static double font04 = 24;
  static double font06 = 18;
  static double font08 = 16;
  static double font10 = 14;
  static double font12 = 10;
  static double font14 = 8;

  static void initSizes(double newWidth, double newHeight) {
    width = newWidth;
    height = newHeight;

    padding = width / 60;
    boxSeparation = padding / 2;
    boxSize = width / 3.6;
    bigButtonSize = width / 2.8;
    buttonWidth = width/14;
    buttonHeight = height/16;
    tileNormal = width / 6.8;
    iconSide = width / 16;
    radius = boxSeparation;
    initialLogoSide = width / 2;

    headerHeight = height*0.12;
    print("Setting sizes to $width x $height ($headerHeight)");
  }
}
