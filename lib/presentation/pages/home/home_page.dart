import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:next_starter/common/extensions/context_extension.dart';
import 'package:next_starter/presentation/theme/app_assets.dart';
import 'package:next_starter/presentation/theme/theme.dart';

import '../../components/components.dart';
import '../../routes/app_router.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> body = [
    MainPage(),
    Container(
      child: Center(
        child: Text('Riwayat Pengajuan'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Account'),
      ),
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1D20),
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(
          color: ColorTheme.secondary,
        ),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedFontSize: 12,
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                AppAssets.icon_home,
              ),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                AppAssets.icon_wallet,
              ),
            ),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                AppAssets.icon_account,
              ),
            ),
            label: 'Akun Saya',
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, User👋',
              style: AppStyles.text20PxSemiBold.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 100,
              width: context.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ColorTheme.primary,
                boxShadow: [
                  BoxShadow(
                    color: ColorTheme.secondary.withOpacity(0.25),
                    blurRadius: 10,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Peminjaman',
                        style: AppStyles.text12PxMedium.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Rp 2.324.000',
                        style: AppStyles.text20PxSemiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(AppAssets.tax)
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainMenu(
                  image: AppAssets.icon_pengajuan,
                  label: 'Pengajuan\npeminjaman',
                ),
                MainMenu(
                  image: AppAssets.icon_bayar,
                  label: 'Bayar',
                ),
                MainMenu(
                  image: AppAssets.icon_topup,
                  label: 'Top Up\ne-Wallet',
                ),
                MainMenu(
                  image: AppAssets.icon_lainnya,
                  label: 'Lainnya',
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Rekomendasi',
              style: AppStyles.text16PxSemiBold.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  final String image;
  final String label;
  const MainMenu({
    super.key,
    required this.image,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 68,
            height: 84,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1E1D20),
                  ColorTheme.primary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: SvgPicture.asset(image),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            alignment: Alignment.center,
            height: 32,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: AppStyles.text12Px.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
