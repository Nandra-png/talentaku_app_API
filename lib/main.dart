import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/views/login/login.dart';
import 'package:talentaku_app/views/splash_screen/splashscreen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'controllers/navigation_controller.dart';
import 'views/home/home_screen.dart';
import 'views/laporan_siswa/laporan_siswa_screen.dart';
import 'views/kelas/kelas_screen.dart';
import 'views/profile/profile_screen.dart';
import 'widgets/bottom_nav.dart';

void main() async {
  // Inisialisasi locale data untuk format tanggal bahasa Indonesia
  await initializeDateFormatting('id_ID', null);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Splashscreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
      initialBinding: BindingsBuilder(() {
        Get.put(NavigationController());
      }),
    );
  }
}

class MainScreen extends GetView<NavigationController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            HomeScreen(),
            LaporanSiswaScreen(),
            ProfileScreen(),
            KelasScreen(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
