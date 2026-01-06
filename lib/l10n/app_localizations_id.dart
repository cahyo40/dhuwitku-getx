// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get app_name => 'Dhuwitku';

  @override
  String get personal_finance => 'Keuangan Pribadi';

  @override
  String get onboard_title_1 => 'Kendalikan Uang Anda, dengan Jelas';

  @override
  String get onboard_description_1 =>
      'Catat pemasukan dan pengeluaran tanpa ribet melalui antarmuka bersih yang dirancang untuk fokus dan ketenangan.';

  @override
  String get onboard_cta_1 => 'Mulai';

  @override
  String get onboard_title_2 => 'Berkolaborasi Tanpa Kekacauan';

  @override
  String get onboard_description_2 =>
      'Kelola keuangan bersama untuk acara, proyek, atau tim dengan kolaborasi transparan dan sinkronisasi real-time.';

  @override
  String get onboard_cta_2 => 'Lanjut';

  @override
  String get onboard_title_3 => 'Bekerja Meskipun Offline';

  @override
  String get onboard_description_3 =>
      'Tambah dan lihat transaksi kapan saja. Data akan otomatis tersinkron saat kembali online.';

  @override
  String get onboard_cta_3 => 'Masuk dengan Google';

  @override
  String get login_subtitle => 'Satu akun. Seluruh data keuangan Anda.';

  @override
  String get login_cta => 'Lanjutkan dengan Google';

  @override
  String get login_terms =>
      'Dengan melanjutkan, Anda menyetujui Ketentuan Layanan dan Kebijakan Privasi kami.';

  @override
  String get retry => 'Coba Lagi';

  @override
  String get good_morning => 'Selamat pagi';

  @override
  String get good_afternoon => 'Selamat siang';

  @override
  String get good_evening => 'Selamat sore';

  @override
  String hello(String name) {
    return 'Halo $name';
  }

  @override
  String get total_balance => 'Saldo Total';

  @override
  String last_month(String data) {
    return '$data% dari bulan lalu';
  }

  @override
  String get income => 'Pemasukan';

  @override
  String get expense => 'Pengeluaran';

  @override
  String get this_month => 'Bulan Ini';

  @override
  String get recent_transaction => 'Transaksi Terbaru';

  @override
  String get active_budget => 'Anggaran Aktif';

  @override
  String get all => 'Semua';

  @override
  String get transaction_list => 'Daftar Transaksi';

  @override
  String get error_title => 'Kesalahan';

  @override
  String get today => 'Hari ini';

  @override
  String get yesterday => 'Kemarin';

  @override
  String get home => 'Beranda';

  @override
  String get transaction => 'Transaksi';

  @override
  String get budget => 'Anggaran';

  @override
  String get report => 'Laporan';

  @override
  String get settings => 'Pengaturan';

  @override
  String get transaction_create => 'Buat Transaksi';

  @override
  String get reset => 'Atur Ulang';

  @override
  String get title_no_category => 'Belum Ada Kategori';

  @override
  String get desc_no_category =>
      'Tambahkan kategori untuk mengelola transaksi Anda.';

  @override
  String get add_category => 'Tambah Kategori';

  @override
  String get save_transaction => 'Simpan Transaksi';

  @override
  String get title => 'Judul';

  @override
  String get hint_input_title => 'Masukkan judul transaksi';

  @override
  String get amount => 'Jumlah';

  @override
  String get hint_input_amount => 'Masukkan jumlah';

  @override
  String get category => 'Kategori';

  @override
  String get hint_select_category => 'Pilih kategori';

  @override
  String get date => 'Tanggal';

  @override
  String get hint_select_date => 'Pilih tanggal';

  @override
  String get description => 'Deskripsi';

  @override
  String get hint_input_description => 'Masukkan deskripsi (opsional)';

  @override
  String get hint_select_budget => 'Pilih anggaran (opsional)';

  @override
  String get select_icon => 'Pilih Ikon';

  @override
  String get select_color => 'Pilih Warna';

  @override
  String get hint_input_category => 'Masukkan nama kategori';

  @override
  String get save_category => 'Simpan Kategori';
}
