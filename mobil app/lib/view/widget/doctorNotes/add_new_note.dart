import 'package:flutter/material.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/view/widget/doctorNotes/custom_text_form.dart';

class AddNewNote extends StatelessWidget {
  final TextEditingController? controller;
  final TextEditingController? controllerMedicin;
  final void Function()? onCancle;
  final void Function()? onAdd;
  final List<DropdownMenuItem<String>>? items;
  final void Function()? choseIcon;
  final void Function(String?)? onChanged;
  final IconData? icon;
  const AddNewNote(
      {super.key,
      this.onCancle,
      this.onAdd,
      this.controller,
      this.choseIcon,
      this.icon,
      this.onChanged,
      this.controllerMedicin,
      this.items});

  @override
  Widget build(BuildContext context) {
    bool iskeyboard = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            // duration: Duration(microseconds: 300),
            margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical:
                    iskeyboard ? 60 : MediaQuery.of(context).size.height / 4),
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.note_add,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        ' Add new note ',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      // height: 50,
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: CustomTextForm(
                          keyboardType: TextInputType.multiline,
                          controller: controller,
                          radios: 15,
                          lable: 'Note',
                          iconDataPrifix: Icons.note)),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: DropdownButtonFormField<String>(
                        focusColor: Colorapp.primaryColorgradint,
                        decoration: InputDecoration(
                          labelText: "Importance Level",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),

                        dropdownColor:
                            Colors.white, // تغيير لون خلفية القائمة المنبثقة
                        // value: _selectedValue,
                        items: items,
                        onChanged: onChanged,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 45,
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: CustomTextForm(
                          controller: controllerMedicin,
                          radios: 15,
                          lable: 'Prescribed Treatment',
                          iconDataPrifix: Icons.medical_services_rounded)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: onAdd,
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colorapp.green,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            'Add',
                            style:
                                TextStyle(color: Colorapp.whiteC, fontSize: 15),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colorapp.lghitSecund2,
                            borderRadius: BorderRadius.circular(15)),
                        child: MaterialButton(
                          onPressed: onCancle,
                          child: const Text(
                            'close',
                            style:
                                TextStyle(color: Colorapp.black, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )));
  }
}




// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DropdownExample(),
//     );
//   }
// }

// class DropdownExample extends StatefulWidget {
//   @override
//   _DropdownExampleState createState() => _DropdownExampleState();
// }

// class _DropdownExampleState extends State<DropdownExample> {
//   String? _selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dropdown with Custom Color'),
//       ),
//       body: 
//     );
//   }
// }