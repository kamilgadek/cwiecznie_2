
import 'package:cwiecznie_2/app/home/add_opinion/add_opinion_page_content.dart';
import 'package:cwiecznie_2/app/home/my_account/my_account_page_content.dart';
import 'package:cwiecznie_2/app/home/restaurants/restaurants_page_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[300],
          title: const Text('Najlepsza pizza w Krakowie'),
        ),
        body: Builder(builder: (context) {
          if (currentIndex == 0) {
            return const ResturantsPageContent();
          }
          if (currentIndex == 1) {
            return const AddOpinionPageContent();
          }

          return MyAccountPageContent(email: widget.user.email);
        }),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.reviews), label: 'Opinie'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Dodaj'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Moje konto'),
          ],
        ),
      );
    });
  }
}





