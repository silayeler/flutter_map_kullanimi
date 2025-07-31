import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hakkında',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 255, 82, 82),
      ),
       body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Uygulama Hakkında',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 82, 82),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '''Bu uygulama, Türkiye'deki önemli ve turistik mekanları harita üzerinde görselleştirerek kullanıcıya interaktif bir deneyim sunmak amacıyla geliştirilmiştir. 

Google Maps entegrasyonu sayesinde kullanıcılar, harita üzerinde işaretlenmiş konumları görebilir, detaylı bilgilere ulaşabilir ve favori mekanlarını listeleyebilir. Aynı zamanda uygulama, MVVM (Model-View-ViewModel) mimarisi ile yapılandırılmış olup, kodun sürdürülebilirliğini ve ölçeklenebilirliğini artırmaktadır.

Kullanılan teknolojiler arasında Flutter framework, AutoRoute ile sayfa yönlendirme, Provider ile state yönetimi ve JSON üzerinden mock veri okuma yer almaktadır. 

Uygulama şu an için demo verilerle çalışmakta olup, ilerleyen versiyonlarda canlı veriler, kullanıcı konumuna göre filtreleme, favori listesi oluşturma, şehir bazlı kategori filtreleri ve daha fazlası planlanmaktadır.

Bu proje aynı zamanda yazılım geliştirme stajı kapsamında Flutter ve mobil uygulama geliştirme konularında öğrenilen bilgilerin pratiğe dökülmesi amacıyla hazırlanmıştır.

Geri bildirim ve katkılarınız bizim için değerlidir. İyi gezmeler dileriz!''',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
