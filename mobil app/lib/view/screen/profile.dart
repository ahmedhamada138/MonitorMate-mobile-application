import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/constans/imageasset.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // ارتفاع الـ AppBar
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colorapp.primaryColorgradint, Colorapp.primaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text(
            " Profile",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0, // إزالة الظل
          backgroundColor: Colors.transparent, // ضروري ليعمل التدرج
        ),
      ),
      body: Column(
        children: [
          upPage(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                SizedBox(height: 20),
                Text("Basic Information",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colorapp.primaryColorgradint)),
                ListTile(
                  title: Text("Name"),
                  subtitle: Text("Fatma Murad"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  title: Text("Gender"),
                  subtitle: Text("Female"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  title: Text("Location"),
                  subtitle: Text("Egypt"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  title: Text("Email"),
                  subtitle: Text("example@gmail.com"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  title: Text("Type"),
                  subtitle: Text("Dr"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                SizedBox(height: 20),
                Text("Education",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colorapp.primaryColorgradint)),
                ListTile(
                  title: Text("University"),
                  subtitle: Text("Azhar University"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget upPage(BuildContext context) {
  return Container(
    //
    height: MediaQuery.of(context).size.height / 5,
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      gradient: LinearGradient(colors: [
        Colorapp.primaryColorgradint,
        Colorapp.primaryColor,
      ]),
      color: Colors.teal,
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
    ),
    child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.orange,
        child: SvgPicture.asset(
          // fit: BoxFit.cover,
          ImageAsset.avatar,
          // height: 200,
          // width: 200,
        )
        //  Icon(Icons.person, color: Colors.white, size: 30),
        ),
  );
}
