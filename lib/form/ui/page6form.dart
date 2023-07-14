import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vento_form_flutter/form/components/spacers.dart';
import 'package:vento_form_flutter/responsive.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:vento_form_flutter/form/components/toast.dart';
import 'package:vento_form_flutter/form/components/header.dart';
import 'package:vento_form_flutter/form/components/button.dart';
import 'package:vento_form_flutter/form/models/personModel.dart';
import 'package:vento_form_flutter/form/components/stepper.dart';

class Page6Form extends StatefulWidget {
  const Page6Form({super.key});

  @override
  State<Page6Form> createState() => _Page6FormState();
}

class _Page6FormState extends State<Page6Form> {
  late DropzoneViewController controller1;
  late DropzoneViewController controller2;
  bool highlighted1 = false;
  bool highlighted2 = false;
  @override
  Widget build(BuildContext context) {
    final mdq = MediaQuery.of(context).size;
    Responsive.initSizes(mdq.width, mdq.height);
    return Scaffold(
      body: SizedBox(
        height: Responsive.height,
        width: Responsive.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(),
            const MyStepper(
              currentPage: 6,
            ),
            SizedBox(
              height: Responsive.height * 0.5,
              width: Responsive.width / 1.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Stack(
                  //   children: [
                  //     SizedBox(
                  //       height: Responsive.height * 0.5,
                  //       width: Responsive.width / 5,
                  //       child: buildZone1(context),
                  //     ),
                  //     Positioned(
                  //       top: 0,
                  //       left: 0,
                  //       child: Image.asset(
                  //         "assets/images/upload_id.png",
                  //         width: Responsive.width / 5,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  GestureDetector(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        setState(() {
                          highlighted1 = true;
                        });
                      }
                    },
                    child: Image.asset(
                      "assets/images/upload_id.png",
                      width: Responsive.width / 5,
                    ),
                  ),
                  horizontalSpace,
                  horizontalSpace,
                  horizontalSpace,
                  GestureDetector(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        setState(() {
                          highlighted2 = true;
                        });
                      }
                    },
                    child: Image.asset(
                      "assets/images/upload_proof.png",
                      width: Responsive.width / 5,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Formato de archivo permitido (png, jpg, jpeg, pdf) y tamaño máximo de carga de 4 MB",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: Responsive.height * 0.2,
              width: Responsive.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customButton("Regresar", () {
                    Navigator.of(context).pop();
                  }),
                  customButton("Siguiente", () {
                      Navigator.of(context).pushNamed("/form_7");
                    if (highlighted1 && highlighted2) {
                    } else {
                      showToast("Ambo archivos son obligatorios", true);
                    }
                  }, highlight: true)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildZone1(BuildContext context) => Builder(
        builder: (context) => DropzoneView(
          operation: DragOperation.copy,
          cursor: CursorType.grab,
          onCreated: (ctrl) => controller1 = ctrl,
          onLoaded: () => print('Zone 1 loaded'),
          onError: (ev) => print('Zone 1 error: $ev'),
          onHover: () {
            setState(() => highlighted1 = true);
            print('Zone 1 hovered');
          },
          onLeave: () {
            setState(() => highlighted1 = false);
            print('Zone 1 left');
          },
          onDrop: (ev) async {
            print('Zone 1 drop: ${ev.name}');
            setState(() {
              highlighted1 = false;
            });
            final bytes = await controller1.getFileData(ev);
            print(bytes.sublist(0, 20));
          },
          onDropMultiple: (ev) async {
            print('Zone 1 drop multiple: $ev');
          },
        ),
      );
}
