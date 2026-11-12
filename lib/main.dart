import 'package:flutter/material.dart';

void main() {
  runApp(const BeranjYarApp());
}

class AppColors {
  static const bgDark = Color(0xFF071C13);
  static const bgCard = Color(0xFF0F2C1F);
  static const bgElevated = Color(0xFF143626);
  static const border = Color(0xFF1F4A36);
  static const textPrimary = Color(0xFFF8FAFC);
  static const textSecondary = Color(0xFFA7F3D0);
  static const textMuted = Color(0xFF6EE7B7);
  static const primary = Color(0xFFEAB308); // طلایی
  static const secondary = Color(0xFF10B981); // سبز
  static const accent = Color(0xFF34D399);
}

class BeranjYarApp extends StatelessWidget {
  const BeranjYarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'برنج‌یار',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgDark,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        fontFamily: 'Vazir',
      ),
      home: const HomeScreen(),
    );
  }
}

// ================= صفحه اصلی و منوی پایین =================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const Center(child: Text('صفحه زمین‌ها (به‌زودی)', style: TextStyle(color: AppColors.textPrimary))),
    const MarketplaceScreen(), // <- بازارچه به اینجا وصل شد
    const Center(child: Text('صفحه قراردادها (به‌زودی)', style: TextStyle(color: AppColors.textPrimary))),
    const Center(child: Text('صفحه پروفایل (به‌زودی)', style: TextStyle(color: AppColors.textPrimary))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.bgElevated,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textMuted,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'خانه'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'زمین‌ها'),
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'بازارچه'),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: 'قراردادها'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'پروفایل'),
        ],
      ),
    );
  }
}

// ================= صفحه داشبورد =================
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.eco, color: AppColors.primary, size: 28),
                      SizedBox(width: 8),
                      Text(
                        'اکوسیستم جامع برنج‌یار',
                        style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications, color: AppColors.primary),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.bgCard, AppColors.bgDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: const Icon(Icons.mic, color: AppColors.primary, size: 48),
              ),
              const SizedBox(height: 12),
              const Text(
                'دستیار صوتی هوشمند',
                style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                '(بگو تا ثبت شه)',
                style: TextStyle(color: AppColors.textMuted, fontSize: 12),
              ),
              const SizedBox(height: 32),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
                children: [
                  _buildFeatureCard('شناسه‌دار زمین', 'مدیریت هوشمند اراضی', Icons.map, AppColors.accent),
                  _buildFeatureCard('مترسک هوشمند', 'پایش لحظه‌ای مزرعه', Icons.settings_remote, AppColors.secondary),
                  _buildFeatureCard('دانه‌یار', 'آزمایش و انتخاب بذر', Icons.science, Colors.blue),
                  _buildFeatureCard('شالیکوبی و توزین', 'فرآوری و درجه‌بندی', Icons.factory, Colors.orange),
                  _buildFeatureCard('بازارچه نیازمندی‌ها', 'خرید و فروش محصولات', Icons.storefront, AppColors.primary),
                  _buildFeatureCard('قراردادها', 'زنجیره تأمین با اطمینان', Icons.handshake, Colors.purple),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(String title, String subtitle, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textMuted, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= صفحه بازارچه (جدید و اصلاح شده) =================
class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // اینجا نوع داده‌ها رو دقیق مشخص کردم که فلاتر ارور نده
    final List<Map<String, dynamic>> providers = [
      {'name': 'بانک نشای هاشمی', 'city': 'آمل', 'price': '۱۵ میلیون/هکتار', 'icon': '🌱', 'verified': true},
      {'name': 'ماشین نشاکار پیمانکار', 'city': 'بابل', 'price': '۳.۵ میلیون/هکتار', 'icon': '🚜', 'verified': false},
      {'name': 'کمباین برداشت قائم‌شهر', 'city': 'قائم‌شهر', 'price': '۵ میلیون/هکتار', 'icon': '🌾', 'verified': true},
      {'name': 'گروه کارگری نشاکاری', 'city': 'بابلسر', 'price': '۸۰۰ هزار/نفر', 'icon': '👷', 'verified': false},
    ];

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        backgroundColor: AppColors.bgDark,
        title: const Text('بازارچه نیازمندی‌ها', style: TextStyle(color: AppColors.textPrimary)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: providers.length,
        itemBuilder: (context, index) {
          final p = providers[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.bgCard,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Text(p['icon'] as String, style: const TextStyle(fontSize: 32)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(p['name'] as String, style: const TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold)),
                          if (p['verified'] as bool) ...[
                            const SizedBox(width: 4),
                            const Icon(Icons.verified, color: AppColors.primary, size: 16),
                          ]
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(p['city'] as String, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                      const SizedBox(height: 8),
                      Text(p['price'] as String, style: const TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.bgDark,
                  ),
                  onPressed: () {},
                  child: const Text('رزرو'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
