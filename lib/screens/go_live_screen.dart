import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:twich_clone/resources/firestore_mathods.dart';
import 'package:twich_clone/screens/broadcast_screen.dart';
import 'package:twich_clone/utils/colors.dart';
import 'package:twich_clone/utils/utils.dart';
import 'package:twich_clone/widgets/coustom_text_field.dart';
import 'package:twich_clone/widgets/custom_botton.dart';

class GoLiveScreen extends StatefulWidget {
  const GoLiveScreen({Key? key}) : super(key: key);

  @override
  State<GoLiveScreen> createState() => _GoLiveScreenState();
}

class _GoLiveScreenState extends State<GoLiveScreen> {
  TextEditingController textEditingController = TextEditingController();
  Uint8List? image;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }


  goLiveStream()async{
      String channelID = await FirestoreMethods().startLiveStream(context, textEditingController.text, image);

      if(channelID.isNotEmpty){
          showSnackBar(context, "Livestream has Started succesfully");
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BroadCastPage(),),);
      }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (() async {
                Uint8List? pickedImage = await pickImage();
                if (pickedImage != null) {
                  setState(() {
                    image = pickedImage;
                  });
                }
              }),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: image!= null ? SizedBox(height: 300, child: Image.memory(image!),): DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 4],
                  color: buttonColor,
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: buttonColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.folder_open,
                          color: buttonColor,
                          size: 40,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Select your thumbnail",
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const Text(
                  "title",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                CoustomTextField(controller: textEditingController),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: CustomButton(
                ontap: goLiveStream,
                text: 'Go Live',
              ),
            )
          ],
        ),
      ),
    );
  }
}
