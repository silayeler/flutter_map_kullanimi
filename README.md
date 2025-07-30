# Flutter Map Uygulaması

Bu proje, **Flutter** ile geliştirilmiş bir harita tabanlı mobil uygulamadır. Kullanıcıya **Türkiye üzerindeki 100 favori konumu** interaktif olarak gösterir. 


## 🚀 Özellikler

- 📌 `flutter_map` paketi ile OpenStreetMap entegrasyonu  
- 🧭 Harita üzerinde 100 farklı konum (şehir, müze, göl, orman vb.)
- 📍 Marker’lara tıklanınca açıklama kutucuğu
- 📋 Marker altı mini bilgi etiketi (popup/snippet benzeri)
- 🧱 MVVM (Model-View-ViewModel) mimarisi kullanılmıştır
- 🌍 Türkiye’ye göre konumlandırma yapılmıştır
- Stack (üst üste bindirme) yapısı kullanılmıştır.Altta harita , harita üzerinde ise marker ın açıklama kutucuğu görünmektedir.

## 📦 Kullanılan Paketler

| Paket Adı           | Açıklama                              |
|---------------------|---------------------------------------|
| `flutter_map`       | Harita görünümü ve marker yönetimi    |
| `latlong2`          | Koordinat hesaplamaları               |
| `provider`          | State management (MVVM için)          |

## 🗂 Proje Yapısı (MVVM)

```shell
lib/
├── model/           # PlaceModel – konum verisi yapısı
├── viewmodel/       # MapViewModel – marker listesini yönetir
├── view/            # MapPage – harita arayüzü
└── main.dart        # Uygulama başlangıç dosyası
