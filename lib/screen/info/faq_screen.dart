import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/widget/xau_container.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ", style: textAppbarStyleWhite),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentWidth(context, 2)),
        child: XauriusContainer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(q1, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q1_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q2, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q2_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q3, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q3_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q4, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(q4_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        SizedBox(height: 5),
                        Text(q4_step_1, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q4_step_2, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q4_step_3, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q4_step_4, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                      ],
                    )),
                SizedBox(height: 10),
                Text(q5, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(q5_data_1, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_data_2, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_data_3, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_data_4, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_data_5, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_data_6, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_data_7, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_data_8, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_data_9, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        SizedBox(height: 5),
                        Text(q5_additional,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text(q5_additional_data_1, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_additional_data_2, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_additional_data_3, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_additional_data_4, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_additional_data_5, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_additional_data_6, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q5_additional_data_7, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                      ],
                    )),
                SizedBox(height: 10),
                Text(q6, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q6_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q7, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q7_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q8, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(q8_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        SizedBox(height: 5),
                        Text(q8_data_1, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q8_data_2, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q8_data_3, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                      ],
                    )),
                SizedBox(height: 10),
                Text(q9, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q9_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q10, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q10_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q11, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q11_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q12, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q12_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q13, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q13_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q14, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(q14_data_1, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q14_data_2, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q14_data_3, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q14_data_4, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                      ],
                    )),
                SizedBox(height: 10),
                Text(q15, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(q15_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        SizedBox(height: 5),
                        Text(q15_data_1, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q15_data_2, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q15_data_3, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        SizedBox(height: 10),
                        Text(ketentuan_kerjasama, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                      ],
                    )),
                SizedBox(height: 10),
                Text(q16, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(q16_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        SizedBox(height: 5),
                        Text(q16_step_1, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q16_step_2, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q16_step_3, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q16_step_4, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q16_step_5, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q16_step_6, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q16_step_7, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q16_step_8, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q16_step_9, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q16_step_10, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                      ],
                    )),
                SizedBox(height: 10),
                Text(q17, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(q17_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        SizedBox(height: 5),
                        Text(q17_step, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text(q17_step_1, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q17_step_2, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q17_step_3, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q17_step_4, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q17_step_5, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q17_step_6, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        SizedBox(height: 10),
                        Text(q17_additional,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text(q17_additional_1, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q17_additional_2, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q17_additional_3, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                      ],
                    )),
                SizedBox(height: 10),
                Text(q18, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(q18_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        SizedBox(height: 5),
                        Text(q18_step_1, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q18_step_2, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q18_step_3, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q18_step_4, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q18_step_5, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q18_step_6, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q18_step_7, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q18_step_8, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        SizedBox(height: 10),
                        Text(q18_additional,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text(q18_additional_1, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q18_additional_2, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q18_additional_3, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q18_additional_4, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q18_additional_5, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q18_additional_6, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                        Text(q18_additional_7, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor)),
                      ],
                    )),
                SizedBox(height: 10),
                Text(q19, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q19_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q20, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q20_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q21, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q21_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q22, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q22_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q23, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q23_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q24, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q24_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q25, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q25_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q26, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q26_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q27, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q27_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q28, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q28_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q29, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q29_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
                SizedBox(height: 10),
                Text(q30, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(q30_answer, style: Theme.of(context).textTheme.bodyText1.copyWith(color: brokenWhiteColor))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const String q1 = "Berapa biaya untuk menjual XAU saya ke IDR?";
const String q1_answer =
    "Harga XAU ke IDR ditentukan oleh sistem pada halaman antar muka Akun Xaurius yang diupdate setiap hari kerja pada pukul 09:30 WIB dan selain itu Anda harus membayar biaya layanan Rp 0,3%, biaya transfer antar bank Rp 6500 (jika ada), dan biaya lainnya terkait instruksi Pengguna berdasarkan syarat dan ketentuan Xaurius.?";
const String q2 = "Berapa biaya untuk menukarkan XAU saya ke Physical Gold?";
const String q2_answer =
    "Untuk menukarkan XAU menjadi Emas Fisik, Anda perlu membayar biaya layanan Rp 0,3%, Beban pajak (0,45% jika memiliki NPWP/0.90% jika tidak memiliki NPWP), dan biaya lainnya terkait instruksi Pengguna berdasarkan syarat dan ketentuan Xaurius.";
const String q3 = "Berapa jumlah minimal Token yang saya perlukan untuk menebus XAU menjadi Emas fisik?";
const String q3_answer = "Untuk menukarkan XAU ke Emas Fisik, Anda membutuhkan minimal 5 XAU.";
const String q4 = "Bagaimana cara saya menarik XAU yang saya miliki di XAURIUS.com?";
const String q4_answer = "Anda dapat menarik di XAURIUS setelah memverifikasi identitas Anda (KYC) dan mendaftarkan rekening bank milik anda.";
const String q4_step_1 = "Langkah 1 - Pilih menu penarikan token di dashboard Xaurius.com, lalu pilih token yang ingin Anda tarik.";
const String q4_step_2 = "Langkah 2 - Setor XAU Anda ke dompet penukaran yang disediakan.";
const String q4_step_3 = "Langkah 3 - Tentukan jumlah yang akan ditarik dan pilih rekening bank yang diverifikasi.";
const String q4_step_4 = "Langkah 4 - Klik 'Konfirmasi.'";
const String q5 = "Dokumen Apa yang Diperlukan untuk Proses Verifikasi Data yang dibutuhkan untuk Pendaftaran Individu";
const String q5_data_1 = "- E-mail aktif";
const String q5_data_2 = "- Nomor ponsel aktif";
const String q5_data_3 = "- Nama Lengkap";
const String q5_data_4 = "- Tanggal lahir";
const String q5_data_5 = "- KTP atau passport";
const String q5_data_6 = "- Nomor ID (KTP/Passport)";
const String q5_data_7 = "- Upload Foto KTP dan foto selfie dengan KTP";
const String q5_data_8 = "- Nomor NPWP (jika ada)";
const String q5_data_9 = "- Upload Foto NPWP dan foto selfie dengan NPWP";
const String q5_additional = "Dokumen tambahan";
const String q5_additional_data_1 = "- Pekerjaan";
const String q5_additional_data_2 = "- Keterangan Sumber dana";
const String q5_additional_data_3 = "- Tujuan membeli XAU";
const String q5_additional_data_4 = "- Info rekening bank";
const String q5_additional_data_5 = "- Nama Bank";
const String q5_additional_data_6 = "- Nomor rekening";
const String q5_additional_data_7 = "- Nama pemilik akun";
const String q6 = "Di mana cadangan cadangan XAU Gold disimpan? Apa buktinya?";
const String q6_answer =
    "Logam Mulia Fisik Xaurius memiliki akun Vault khusus yang tertarik untuk menyimpan Emas Fisik di Gudang penyimpanan kami di Indonesia. Untuk menciptakan kepercayaan dan akuntabilitas dalam operasi kami, XAU juga diaudit oleh akuntan pihak ketiga untuk melakukan audit bulanan terhadap akun VAULT kami dan token XAU yang beredar. Laporan audit ini dipublikasikan di situs resmi kami. Laporan tersebut menyertakan informasi tentang Logam Mulia yang dikelola Xaurius dan aktif sebagai nilai atas XAU Token menggunakan mekanisme dan kebijakan Xaurius.";
const String q7 = "Bisakah harga XAU naik?";
const String q7_answer =
    "Hal tersebut dimungkinkan, sesuai informasi harga yang tercantum pada halaman antar muka Pengguna Xaurius pada website dan/atau aplikasi Xaurius, Nilai 1 XAU akan dijamin selalu bernilai 1 Gram Logam Mulia Emas, dan berfluktuasi mengikuti tren harga emas dipasaran Nasional dan Pasar Global sehingga Harga XAU dapat naik dan turun mengikuti indeks harga pasar emas tetapi berdiri di atas blockchain.  ";
const String q8 = "Apa keunggulan penggunaan XAU?";
const String q8_answer = "Setidaknya ada 3 kegunaan dasar XAU yang bisa diterapkan oleh orang Indonesia:";
const String q8_data_1 =
    "1. Pengganti Emas Fisik \nKepemilikan emas fisik sangat merepotkan mengingat sifat fisiknya yang harus menyiapkan tempat khusus untuk menyimpannya. Sedangkan penyimpanan token XAU dapat dilakukan secara digital baik online maupun offline.";
const String q8_data_2 =
    "2. Kemudahan transfer Nilai Emas \nEmas fisik sangat sulit untuk dipindahkan dari satu tempat ke tempat lain, dan itu menambah biaya keamanan dan pengiriman yang besar. Dengan nilai XAU, emas dapat ditransfer kapan saja, di mana saja dengan biaya yang sangat kecil karena menggunakan teknologi blockchain.";
const String q8_data_3 = "3. Donasi Global \nXAU dapat menyederhanakan proses donasi lintas batas yang tidak dapat dilakukan dengan emas fisik.";
const String q9 = "Apakah ada periode Lock Up (periode terkunci) untuk Pembelian Token XAU?";
const String q9_answer =
    "Periode Lock Up tidak ada selama periode Token Sale, namun Lock Up dapat dilakukan pada transaksi dalam jumlah besar dengan beberapa persyaratan khusus yang akan disepakati antara pembeli dan penjual. Saat mendaftar dan melakukan transaksi pembelian XAU dalam Periode TOKEN SALE, Pengguna dianggap telah memahami dan menyetujui kebijakan Lock Up (Periode Terkunci) oleh Xaurius dan dianggap kebijakan internal Xaurius sesuai syarat dan ketentuan Xaurius. ";
const String q10 = "Di mana saya bisa mendapatkan hasil audit?";
const String q10_answer =
    "Laporan audit keuangan yang telah diverifikasi oleh akuntan publik dan quantity surveyor dapat dilihat di landing page website xaurius.com.";
const String q11 = "Siapa yang menerbitkan laporan yang diaudit?";
const String q11_answer =
    "Laporan audit yang dikeluarkan oleh akuntan publik berlisensi dan quantity surveyor berlisensi (secara bersama-sama disebut pihak ketiga). Anda bisa mengetahui detail informasi XAU pada setiap laporan audit.";
const String q12 = "Bagaimana kami bisa yakin dengan keamanan Kontrak Cerdas XAU?";
const String q12_answer =
    "Untuk XAU (ERC-20), keamanan kontrak pintar kami telah diuji dan disertifikasi oleh Layanan Audit Kontrak Cerdas. Sertifikasi ini dapat diperiksa melalui Xaurius.com";
const String q13 = "Apakah XAU dapat digunakan untuk investasi?";
const String q13_answer =
    "Tidak, tidak bisa. Memegang Token XAU di dompet tidak menghasilkan bunga. \n\nNamun, karena harga XAU dipatok ke Emas, Anda juga bisa mendapatkan untung dari perubahan harga Emas. Selain itu, untuk pengembangan tahap selanjutnya Token XAU dapat digunakan di aplikasi DeFi atau Staking untuk mendapatkan bunga atau pembagian keuntungan namun saat tidak tidak dimungkinkan dan akan diinformasikan selanjutnya pada media komunikasi Xaurius. \n\nToken XAU juga dapat digunakan untuk memperdagangkan aset kripto di bursa kripto dan Anda bisa mendapatkan margin keuntungan dari naik turunnya harga aset kripto menggunakan mekanisme dan peraturan Bappebti.";
const String q14 = "Apa itu XAU Token (XAU)?";
const String q14_data_1 =
    "- Dirilis pada tahun 2020, XAU Token (XAU) adalah stablecoin yang didukung 1 : 1 oleh Logam Mulia Emas fisik. XAU menawarkan stabilitas harga, di mana setiap token XAU bernilai 1 gram Emas.";
const String q14_data_2 =
    "- XAU dibuat menggunakan teknologi blockchain. Dengan menggunakan XAU, Anda dapat membuat transaksi aset menjadi lebih cepat, lebih murah, transparan, dan tanpa batas.";
const String q14_data_3 =
    "- XAU diterbitkan oleh PT Xaurius Aset Digital, sebuah perusahaan teknologi blockchain dengan entitas perusahaan yang terdaftar di Jakarta, Indonesia.";
const String q14_data_4 = "- XAU berjalan di rantai blockchain Ethereum (token ERC-20).";
const String q15 = "Apa itu Stablecoin?";
const String q15_answer =
    "Stablecoin adalah aset crypto dengan harga stabil yang berdiri di atas blockchain. Harga / nilai stablecoin didasarkan pada aset fisik lain yang nilainya stabil. \nContoh stablecoin:";
const String q15_data_1 = "USDT (Tether) - harga sebanding dengan 1 USD";
const String q15_data_2 = "DGX (Digix) - harga yang sebanding dengan 1 gram emas";
const String q15_data_3 = "XAU (Xaurius) - harga setara dengan 1 gram emas";
const String ketentuan_kerjasama = 'Ketentuan kerjasama \nKirim email ke email resmi kami: \n- Info@Xaurius.com \ndengan subjek "Kemitraan XAURIUS"';
const String q16 = "Bagaimana cara Set-up wallet XAU di Ledger Nano?";
const String q16_answer =
    "Ledger Nano S / X adalah dompet perangkat keras yang banyak digunakan untuk menyimpan kunci pribadi dengan aman (yang mewakili kepemilikan aset digital di blockchain).\nMenyiapkan XAU (ERC-20) di Ledger Nano S / X Aplikasi seluler / desktop yang menyertai Ledger, Ledger Live, belum mendukung token ERC-20, sehingga pengguna Ledger perlu menggunakan MyEtherWallet untuk menerima / mengirim XAU.";
const String q16_step_1 = "1. Buka halaman resmi MyEtherWallet di https://www.myetherwallet.com/ dan pastikan URL-nya benar.";
const String q16_step_2 = "2. Klik Akses Dompet Saya.";
const String q16_step_3 = "3. Pilih Perangkat Keras.";
const String q16_step_4 = "4. Klik pada Ledger";
const String q16_step_5 =
    "5. Pilih Ethereum. Jika Anda menggunakan aplikasi Ledger Live untuk menyiapkan Ledger Nano S Anda, pilih jalur derivasi m / 44 '/ 60' / 0 '/ 0. Jika tidak, pilih m / 44 ’/ 60’ / 0 ʹ.";
const String q16_step_6 = "6. Klik Berikutnya. Chrome harus membuat prompt. Pilih perangkat Ledger Anda dan klik Connect.";
const String q16_step_7 = "7. Anda akan melihat dashboard Anda.";
const String q16_step_8 = "8. Pada panel Token di sebelah kanan, klik pada tautan + Token Khusus.";
const String q16_step_9 =
    "9. Masukkan detail kontrak XAU di jendela popup. \nAlamat Kontrak Token: \n0xaaca2da0026c41fd49bd0636fbd67cf704e34b1d \nSimbol Token: \nXAU Desimal Presisi: 6";
const String q16_step_10 = "10. Klik Save, dan Anda akan melihat XAU Token Anda di panel token";
const String q17 = "Bagaimana cara Set-up wallet XAU di Truswallet?";
const String q17_answer =
    "XAU secara default tersedia untuk digunakan dengan Trust Wallet. \nAnda hanya perlu menambahkan token dengan satu ketukan sederhana.";
const String q17_step = "Membuat dompet baru (lewati ini jika Anda sudah memilikinya)";
const String q17_step_1 = "1. Unduh dan instal Trust Wallet di ponsel Anda.";
const String q17_step_2 = "2. Buka aplikasi dan ketuk Buat Dompet Baru.";
const String q17_step_3 = "3. Baca pemberitahuan dan centang kotak jika Anda setuju. Klik lanjutkan.";
const String q17_step_4 =
    "4. Tuliskan frasa sandi Anda di tempat yang aman, lalu klik lanjutkan. \n(PERINGATAN: frasa sandi digunakan untuk membuat kunci pribadi Anda dan merupakan tanggung jawab anda pribadi, yang mewakili kepemilikan aset di dunia blockchain. Jangan pernah membagikan frasa sandi Anda dengan orang lain.).";
const String q17_step_5 = "5. Ketuk kata-kata dengan urutan yang benar untuk membentuk frasa sandi Anda.";
const String q17_step_6 = "6. Anda telah membuat dompet Anda! Sekarang saatnya menambahkan XAU Token ke dompet Anda.";
const String q17_additional = "Menambahkan XAU ke dompet Anda";
const String q17_additional_1 = "1. Klik tombol + di kanan atas.";
const String q17_additional_2 = '2. Cari "XAU" dan pilih token mana yang ingin Anda tambahkan (atau hapus).';
const String q17_additional_3 = "3. Ketuk tombol kembali. Selamat, Anda sekarang dapat menerima dan mengirim XAU!";
const String q18 = "Bagaimana cara mengatur dompet XAU di Metamask?";
const String q18_answer =
    "Metamask adalah ekstensi browser dompet Ethereum yang mudah digunakan, tersedia untuk Chrome, Firefox, dan Opera. Panduan ini akan menunjukkan cara menyiapkan dompet Metamask Anda dan menambahkan XAU Token ke dalamnya. \nMenyiapkan Metamask ";
const String q18_step_1 = "1. Unduh dan instal Metamask dari Toko Web Chrome, Addons Firefox, atau Addons Opera.";
const String q18_step_2 = "2. Buka ekstensi dan lanjutkan.";
const String q18_step_3 = "3. Amankan dompet Anda dengan menambahkan kata sandi ke dalamnya.";
const String q18_step_4 = "4. Akun Anda akan memiliki gambar yang dibuat secara unik untuk membantu Anda membedakannya dari akun lain.";
const String q18_step_5 = "5. Bacalah Persyaratan Layanan, Pemberitahuan Privasi, dan Peringatan Phishing, lalu klik terima.";
const String q18_step_6 =
    "6. Tulis frase seed Anda di tempat yang aman, sehingga Anda dapat memulihkan dompet Anda dari komputer lain. (PERINGATAN: Jangan pernah membagikan frasa rahasia Anda!).";
const String q18_step_7 = "7. Verifikasikan bahwa Anda telah menuliskan frasa awal dengan memasukkannya di layar berikutnya.";
const String q18_step_8 = "8. Selamat! Sekarang Anda memiliki dompet Ethereum!";
const String q18_additional = "Mengintegrasikan XAU Token ke dompet elektronik/e-wallet Anda";
const String q18_additional_1 = '1. Pada Metamask, Perluas menu bar hamburger (≡) dan klik "Add Token".';
const String q18_additional_2 =
    "2. Klik pada tab Token Kustom dan masukkan detail token XAU Token. Alamat Kontrak Token: 0xaaca2da0026c41fd49bd0636fbd67cf704e34b1d";
const String q18_additional_3 = "3. Simbol Token: XAU.";
const String q18_additional_4 = "4. Desimal Presisi: 6.";
const String q18_additional_5 = "5. Anda seharusnya dapat melihat saldo XAU Anda (jika ada - jika tidak, saldo XAU akan ditampilkan 0).";
const String q18_additional_6 = "6. Klik Add Tokens untuk melanjutkan.";
const String q18_additional_7 = "7. Selamat! Anda sekarang dapat menggunakan XAU di dompet Metamask Anda!";
const String q19 = "Apakah orang asing diperbolehkan mendaftar?";
const String q19_answer =
    "Iya, asing diperbolehkan mendaftar. Namun, mereka harus memiliki rekening bank yang terdaftar di Indonesia untuk proses pencairan XAU di Indonesia serta mengikuti peraturan, syarat dan ketentuan yang berlaku di Indonesia.";
const String q20 = "Berapa lama waktu yang dibutuhkan untuk memverifikasi akun individu saya?";
const String q20_answer = "Akun diverifikasi dalam waktu kurang dari dua jam, tergantung pada beban antrian masuk.";
const String q21 =
    "Saya melakukan pembelian XAU dan status berhasil, tetapi XAU yang saya beli tidak masuk ke dompet saya, apa yang harus saya lakukan?";
const String q21_answer =
    "Tunggu waktu yang wajar sesuai dengan jenis blockchain yang dipilih, karena proses pengiriman XAU membutuhkan waktu yang dibutuhkan blockchain untuk melakukan konfirmasi, biasanya waktu yang dibutuhkan kurang dari 10 menit. Jika sudah melewati waktu yang semestinya, hubungi tim dukungan kami.";
const String q22 = "Saya sudah transfer untuk beli XAU, tapi status pembelian belum berhasil, apa yang harus saya lakukan?";
const String q22_answer =
    "Hubungi tim dukungan kami dengan menyertakan bukti transfer, alamat email untuk mendaftar akun, dan alamat tujuan pembelian.";
const String q23 = "Saya sudah transfer untuk beli XAU, tapi status pembelian belum berhasil, apa yang harus saya lakukan?";
const String q23_answer =
    "Hubungi tim dukungan kami dengan menyertakan bukti transfer, alamat email untuk mendaftar akun, dan alamat tujuan pembelian.";
const String q24 = "Berapa biaya transaksi pembelian Token XAU?";
const String q24_answer =
    "Biaya pembelian Token XAU di situs Xaurius adalah sesuai dengan harga beli pada dashboard atau halaman muka Akun Pengguna Xaurius ditambah dengan biaya layanan dan biaya dari Bank sesuai kebijakan masing-masing Bank.";
const String q25 = "Apakah ada batasan transaksi pembelian minimum?";
const String q25_answer = "Minimal pembelian 1 Token XAU.";
const String q26 = "Berapa lama proses pembelian Token XAU?";
const String q26_answer =
    "Sistem pembelian XAU kami otomatis - setelah Anda menyetor IDR ke bank kami, kami akan segera mengirimkan XAU ke alamat dompet tujuan Anda. Proses pengiriman tergantung pada jenis XAU atau blockchain yang digunakan; waktu rata-rata yang dibutuhkan kurang dari 10 menit.";
const String q27 = "Saya belum menerima transfer XAU untuk penukaran dompet saya, apa yang harus saya lakukan?";
const String q27_answer =
    "Hubungi tim dukungan kami dan lampirkan tanda terima transfer XAU (hash transaksi yang dapat dilacak di penjelajah blockchain).";
const String q28 = "Berapa lama waktu yang dibutuhkan sampai Rupiah diterima di rekening bank saya?";
const String q28_answer = 'Kurang dari 1 jam kerja setelah Anda mengklik "Konfirmasi", tergantung pada antrian penarikan.';
const String q29 = "Berapa lama waktu yang dibutuhkan sampai Fisik Emas saya diterima?";
const String q29_answer =
    'Untuk saat ini penarikan Fisik Emas hanya dapat dilakukan di Kantor Pusat Xaurius yang alamatnya akan tertera di contact atau media komunikasi Xaurius, anda harus mengkonfirmasi terlebih dahulu tentang waktu dan jadwal penarikan Emas Fisik kepada Customer Service Xaurius.';
const String q30 = "Apakah layanan pencetakan emas fisik XAU tersedia 24 jam?";
const String q30_answer =
    'Layanan penarikan XAU hanya tersedia selama jam kerja (08.00 - 17.00), setiap hari Senin - Jumat. Tidak ada layanan selama hari libur nasional.';
