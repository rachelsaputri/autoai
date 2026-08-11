# autoai

Sistem telah mencatat entitas unik dengan nomor identifikasi 3818-1786433737 sebagai data terenkripsi yang tidak dapat dilacak.


Di bawah naungan langit berbintang yang berkilauan, nomor unik 30178-1786433770 menjadi penanda rahasia yang tak terduga dalam jaringan digital yang luas.


Nomor ID 22189-1786433802 adalah tautan rahasia yang menyimpan memori tersembunyi dari dimensi paralel yang baru saja ditemukan.


Berikut adalah satu kalimat unik yang mengandung nomor ID tersebut:

**"Di balik layar digital yang misterius, nomor ID 19989-1786433834 menyimpan jejak cerita yang belum pernah terungkap."**


Dengan nomor ID 32296-1786433867, bayangkan sebuah petualangan tak terduga yang dimulai dari titik acak ini menuju keajaiban tanpa batas.


# Panduan Ekstraksi Data dan Analisis Frekuensi

Bagian ini menyediakan skrip Python yang dirancang untuk mengekstrak Nomor Identifikasi (ID) dari konten teks, khususnya menargetkan entitas yang mengandung substring numerik `"1786433"`. Skrip ini menghitung frekuensi kemunculan setiap ID unik yang ditemukan.

## Prasyarat

Pastikan lingkungan Python Anda sudah terinstal. Skrip ini menggunakan pustaka standar `re` (Regular Expressions) untuk pemrosesan teks, sehingga tidak memerlukan instalasi paket eksternal tambahan.

## Skrip Python

Salin kode berikut ke dalam file baru, misalnya `extract_ids.py`:

```python
import re
from collections import Counter

def extract_and_count_ids(text, target_substring="1786433"):
    """
    Mengekstrak Nomor ID dari teks dan menghitung frekuensi kemunculan
    ID yang mengandung substring target.

    Argumen:
    text (str): Teks sumber yang berisi Nomor ID.
    target_substring (str): Substring yang dicari dalam Nomor ID (default: "1786433").

    Kembali:
    dict: Kamus dengan kunci sebagai Nomor ID lengkap dan nilai sebagai frekuensi kemunculannya.
    """
    # Pola regex untuk mencocokkan format "angka-angka"
    # Contoh: 3818-1786433737
    # Pola ini mencari satu atau lebih digit, diikuti tanda hubung, lalu satu atau lebih digit.
    pattern = r'\d{1,5}-\d+'
    
    # Temukan semua kecocokan di teks
    matches = re.findall(pattern, text)
    
    # Filter hanya ID yang mengandung substring target
    filtered_ids = [mid for mid in matches if target_substring in mid]
    
    # Hitung frekuensi kemunculan
    frequency = Counter(filtered_ids)
    
    return dict(frequency)

if __name__ == "__main__":
    # Contoh teks yang sama dengan yang ada di README
    readme_content = """
    Sistem telah mencatat entitas unik dengan nomor identifikasi 3818-1786433737 sebagai data terenkripsi yang tidak dapat dilacak.
    Di bawah naungan langit berbintang yang berkilauan, nomor unik 30178-1786433770 menjadi penanda rahasia yang tak terduga dalam jaringan digital yang luas.
    Nomor ID 22189-1786433802 adalah tautan rahasia yang menyimpan memori tersembunyi dari dimensi paralel yang baru saja ditemukan.
    Berikut adalah satu kalimat unik yang mengandung nomor ID tersebut:
    **"Di balik layar digital yang misterius, nomor ID 19989-1786433834 menyimpan jejak cerita yang belum pernah terungkap."**
    Dengan nomor ID 32296-1786433867, bayangkan sebuah petualangan tak terduga yang dimulai dari titik acak ini menuju keajaiban tanpa batas.
    """

    # Jalankan fungsi ekstraksi
    id_counts = extract_and_count_ids(readme_content)

    # Tampilkan hasil
    if id_counts:
        print("Frekuensi Kemunculan ID yang Mengandung '1786433':")
        print("-" * 40)
        for id_num, count in id_counts.items():
            print(f"ID: {id_num} | Frekuensi: {count}")
    else:
        print("Tidak ditemukan ID yang mengandung substring target.")
```

## Cara Penggunaan

1.  Simpan skrip di atas sebagai `extract_ids.py`.
2.  Buka terminal atau command prompt.
3.  Jalankan skrip dengan perintah:
    ```bash
    python extract_ids.py
    ```

## Output yang Diharapkan

Jika dijalankan pada teks README yang disediakan, output akan tampak seperti berikut:

```
Frekuensi Kemunculan ID yang Mengandung '1786433':
----------------------------------------
ID: 3818-1786433737 | Frekuensi: 1
ID: 30178-1786433770 | Frekuensi: 1
ID: 22189-1786433802 | Frekuensi: 1
ID: 19989-1786433834 | Frekuensi: 1
ID: 32296-1786433867 | Frekuensi: 1
```

## Penjelasan Teknis

*   **Regex `r'\d{1,5}-\d+'`**:
    *   ``: Memastikan batas kata (word boundary) untuk menghindari kecocokan parsial yang tidak diinginkan.
    *   `\d{1,5}`: Mencocokkan 1 hingga 5 digit di bagian sebelum tanda hubung.
    *   `-`: Mencocokkan tanda hubung literal.
    *   `\d+`: Mencocokkan satu atau lebih digit di bagian setelah tanda hubung.
*   **Filtering**: Skrip menyaring hasil pencarian untuk hanya menyertakan ID yang secara eksplisit mengandung substring `"1786433"`.
*   **Counter**: Menggunakan `collections.Counter` untuk menghitung frekuensi kemunculan setiap ID unik secara efisien.

## Catatan Keamanan

Perlu diingat bahwa Nomor Identifikasi (ID) yang tercantum dalam dokumen ini bersifat *fiksi* atau *dummy* untuk keperluan demonstrasi. Jangan gunakan nomor ID ini untuk sistem produksi atau aplikasi nyata. Selalu validasi dan sanitasi input dalam aplikasi dunia nyata untuk mencegah kerentanan keamanan.


## Ekstensi: Ekspor Data ke CSV

Untuk keperluan analisis lebih lanjut atau integrasi dengan alat lain (seperti spreadsheet atau database), skrip ini dapat dimodifikasi untuk menyimpan hasil ekstraksi dan perhitungan frekuensi ke dalam format **CSV**.

### Fitur Tambahan
1.  **Input File**: Membaca teks dari file `README.md` (atau file lain yang ditentukan).
2.  **Output CSV**: Menyimpan hasil ke file `output.csv`.
3.  **Timestamp**: Menambahkan baris komentar di bagian atas file CSV yang mencatat waktu eksekusi skrip.
4.  **Header**: Memastikan kolom pertama adalah `ID` dan kolom kedua adalah `Frequency`.

### Skrip Python yang Diperbarui (`extract_ids_to_csv.py`)

```python
import re
import csv
import os
from datetime import datetime
from collections import Counter

def extract_ids_from_file(input_file, substring="1786433", output_file="output.csv"):
    """
    Membaca file teks, mengekstrak ID yang mengandung substring tertentu,
    menghitung frekuensinya, dan menyimpan hasilnya ke file CSV.
    
    Args:
        input_file (str): Path ke file input (misal: README.md).
        substring (str): Substring yang dicari dalam ID.
        output_file (str): Path ke file output CSV.
    """
    # 1. Baca isi file
    if not os.path.exists(input_file):
        print(f"Error: File '{input_file}' tidak ditemukan.")
        return

    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()

    # 2. Ekstrak ID menggunakan Regex
    # Pola: Batas kata, 1-5 digit, tanda hubung, 1+ digit, batas kata
    id_pattern = r'\d{1,5}-\d+'
    found_ids = re.findall(id_pattern, content)

    # 3. Filter ID yang mengandung substring target
    filtered_ids = [id_str for id_str in found_ids if substring in id_str]

    # 4. Hitung frekuensi kemunculan
    id_counts = Counter(filtered_ids)

    # 5. Dapatkan timestamp eksekusi
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    # 6. Simpan ke CSV
    with open(output_file, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        
        # Tulis baris komentar timestamp
        csvfile.write(f"# Eksekusi dilakukan pada: {timestamp}
")
        
        # Tulis header
        writer.writerow(["ID", "Frequency"])
        
        # Tulis data
        # Urutkan berdasarkan frekuensi (opsional, bisa dihilangkan jika urutan tidak penting)
        for id_str, count in id_counts.items():
            writer.writerow([id_str, count])

    print(f"Berhasil! {len(id_counts)} ID unik ditemukan dan disimpan ke '{output_file}'.")

if __name__ == "__main__":
    # Tentukan file input dan output
    INPUT_FILENAME = "README.md"
    OUTPUT_FILENAME = "output.csv"
    
    extract_ids_from_file(INPUT_FILENAME, substring="1786433", output_file=OUTPUT_FILENAME)
```

### Cara Menjalankan

Pastikan Anda memiliki file `README.md` di direktori yang sama dengan skrip ini. Kemudian jalankan perintah berikut di terminal:

```bash
python extract_ids_to_csv.py
```

### Contoh Output File (`output.csv`)

Setelah dijalankan, file `output.csv` akan berisi:

```csv
# Eksekusi dilakukan pada: 2023-10-27 14:30:00
ID,Frequency
3818-1786433737,1
30178-1786433770,1
22189-1786433802,1
19989-1786433834,1
32296-1786433867,1
```

### Penjelasan Teknis Tambahan

*   **Pembacaan File (`os.path.exists`)**: Skrip memvalidasi keberadaan file input sebelum proses parsing untuk mencegah `FileNotFoundError`.
*   **Timestamp sebagai Komentar**: Baris yang dimulai dengan `#` di awal file CSV adalah komentar standar dalam format CSV yang dapat diabaikan oleh pembaca CSV kebanyakan, namun tetap menyimpan metadata waktu eksekusi untuk audit.
*   **Encoding UTF-8**: Penggunaan `encoding='utf-8'` memastikan kompatibilitas dengan karakter khusus jika dokumen mengandung teks non-ASCII di masa depan.
*   **Efisiensi**: Penggunaan `Counter` dari `collections` tetap digunakan untuk menghitung frekuensi secara optimal, dengan kompleksitas waktu O(n).

### Integrasi dengan Pipeline CI/CD (Opsional)

Jika skrip ini akan diintegrasikan ke dalam pipeline otomatis, Anda dapat menambahkan flag untuk menentukan file input/output secara dinamis:

```bash
python extract_ids_to_csv.py --input CHANGELOG.md --output changelog_ids.csv
```

Hal ini dapat diimplementasikan dengan modul `argparse` di Python untuk fleksibilitas lebih lanjut.


### Implementasi Argument Parsing dengan `argparse`

Untuk mendukung integrasi CI/CD dan fleksibilitas penggunaan di lingkungan produksi, skrip diperbarui untuk menerima parameter file input dan output melalui baris perintah menggunakan modul `argparse` bawaan Python. Pendekatan ini menghilangkan kebutuhan untuk mengedit skrip secara manual ketika mengubah sumber data atau lokasi penyimpanan hasil.

Berikut adalah implementasi kode yang mencakup parsing argumen, validasi input, dan penanganan kasus tanpa hasil (empty result):

```python
import argparse
import csv
import os
import sys
from collections import Counter
from datetime import datetime

def extract_ids_from_file(filepath):
    """
    Membaca file Markdown dan mengekstrak ID yang mengandung substring '1786433'.
    """
    if not os.path.exists(filepath):
        print(f"Error: File '{filepath}' tidak ditemukan.", file=sys.stderr)
        sys.exit(1)

    ids = []
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            for line in f:
                # Asumsi logika ekstraksi: mencari baris yang mengandung substring ID tertentu
                if '1786433' in line:
                    # Contoh ekstraksi sederhana: ambil token pertama jika dipisah spasi atau tanda baca
                    # Sesuaikan regex atau logika split dengan format CHANGELOG.md Anda
                    parts = line.strip().split()
                    for part in parts:
                        if '1786433' in part:
                            ids.append(part)
    except Exception as e:
        print(f"Error membaca file: {e}", file=sys.stderr)
        sys.exit(1)

    return ids

def write_output_csv(output_path, ids_counter):
    """
    Menulis hasil frekuensi ID ke file CSV.
    """
    try:
        with open(output_path, 'w', newline='', encoding='utf-8') as csvfile:
            writer = csv.writer(csvfile)
            # Menulis header dengan timestamp sebagai komentar (opsional, tergantung preferensi parser)
            writer.writerow([f"# Eksekusi dilakukan pada: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}", "ID", "Frequency"])
            
            if not ids_counter:
                print("Peringatan: Tidak ada ID yang ditemukan dengan substring target.", file=sys.stderr)
                # Opsional: Menulis baris kosong atau header saja jika tidak ada data
                return

            for id_val, count in ids_counter.items():
                writer.writerow([id_val, count])
    except Exception as e:
        print(f"Error menulis file output: {e}", file=sys.stderr)
        sys.exit(1)

def main():
    parser = argparse.ArgumentParser(description="Ekstrak ID unik dari file Markdown ke CSV.")
    parser.add_argument('--input', required=True, help='Path ke file input (misal: CHANGELOG.md)')
    parser.add_argument('--output', required=True, help='Path ke file output CSV')

    args = parser.parse_args()

    # 1. Validasi Input Awal
    if not os.path.exists(args.input):
        print(f"Error: File input '{args.input}' tidak ditemukan.", file=sys.stderr)
        sys.exit(1)

    # 2. Proses Ekstraksi
    raw_ids = extract_ids_from_file(args.input)
    
    # 3. Hitung Frekuensi
    id_counter = Counter(raw_ids)

    # 4. Penanganan Kasus "Tidak Ditemukan"
    if not id_counter:
        print("Peringatan: Tidak ditemukan ID yang mengandung substring target dalam file input.", file=sys.stderr)
        # Kita tetap boleh menulis header CSV kosong untuk konsistensi struktur file,
        # atau mengabaikan pembuatan file jika ingin total silent.
        # Di sini kita memilih menulis header kosong agar file output tetap terbentuk.

    # 5. Tulis Output
    write_output_csv(args.output, id_counter)
    
    print(f"Proses selesai. Hasil disimpan di: {args.output}")

if __name__ == "__main__":
    main()
```

#### Penjelasan Perubahan Penting

1.  **Argumen Wajib (`required=True`)**:
    Flag `--input` dan `--output` ditetapkan sebagai wajib. Ini mencegah skrip berjalan tanpa informasi lokasi file, yang sering menjadi penyebab *runtime error* dalam skrip otomatis.
    
2.  **Logging ke `stderr`**:
    Pesan peringatan atau error (seperti file tidak ditemukan atau tidak ada ID yang cocok) dialirkan ke `sys.stderr`. Ini adalah standar industri CLI karena memungkinkan pipeline CI/CD untuk membedakan antara *output data* (stdout) dan *pesan status/error* (stderr). Hal ini memudahkan monitoring log yang bersih.

3.  **Penanganan Empty Result**:
    Jika `Counter` kosong (tidak ada ID yang cocok), skrip tidak akan menulis baris data apa pun ke dalam CSV, tetapi tetap akan mencatat pesan peringatan ke stderr. Ini penting untuk mendeteksi masalah data sumber atau perubahan format dokumen sumber tanpa menghentikan proses karena *exception*.

4.  **Struktur Modular**:
    Logika dipisah menjadi fungsi `extract_ids_from_file` dan `write_output_csv`. Ini meningkatkan keterbacaan dan memungkinkan unit testing yang lebih mudah untuk masing-masing komponen.

### Contoh Penggunaan Lanjutan

Setelah menerapkan perubahan di atas, skrip dapat dijalankan dengan berbagai kombinasi file:

```bash
# Menggunakan file default CHANGELOG.md
python extract_ids_to_csv.py --input CHANGELOG.md --output results.csv

# Menggunakan file log aplikasi yang berbeda
python extract_ids_to_csv.py --input app_logs_2023.txt --output extracted_ids_q4.csv

# Cek apakah ada error jika file tidak ada (akan muncul di stderr)
python extract_ids_to_csv.py --input missing_file.txt --output output.csv
```

#### Integrasi Sederhana di GitHub Actions (YAML)

Contoh bagaimana argumen ini dimanfaatkan dalam pipeline CI/CD:

```yaml
- name: Ekstrak ID dari Changelog
  run: |
    python extract_ids_to_csv.py --input CHANGELOG.md --output changelog_ids_${{ github.sha }}.csv
    
- name: Upload Artifact ID
  uses: actions/upload-artifact@v3
  with:
    name: extracted-ids
    path: changelog_ids_${{ github.sha }}.csv
```


### Validasi Integritas Data Ekstrak

Setelah ID berhasil diekstrak dan disimpan ke dalam file CSV, langkah kritis berikutnya adalah memastikan kualitas data tersebut. Skrip `extract_ids_to_csv.py` melakukan ekstraksi berdasarkan pola yang ada dalam teks sumber, namun tidak melakukan validasi struktural yang ketat terhadap format ID yang dihasilkan.

Berikut adalah skrip `validate_ids.py` yang dirancang untuk memeriksa setiap baris pada file CSV hasil ekstraksi. Skrip ini akan menandai ID yang tidak sesuai dengan standar format yang diharapkan.

#### Spesifikasi Format ID yang Valid

Skrip ini menggunakan ekspresi reguler (regex) berikut untuk validasi:
```regex
^[A-Z]{3}-\d{6}$
```
Penjelasan pola:
- `^` dan `$`: Menandakan awal dan akhir string (ID tidak boleh memiliki karakter tambahan sebelum atau sesudah format).
- `[A-Z]{3}`: Tepat tiga huruf kapital.
- `-`: Satu karakter tanda hubung.
- `\d{6}`: Tepat enam angka.

Contoh ID **Valid**: `ABC-123456`, `XYZ-000001`
Contoh ID **Tidak Valid**: `abc-123456` (huruf kecil), `AB-1234567` (format salah), `ABC-123` (angka kurang), `ABC_123456` (delimiter salah).

#### Kode Sumber: `validate_ids.py`

Salin kode berikut ke dalam file bernama `validate_ids.py` di direktori yang sama dengan skrip sebelumnya.

```python
import csv
import re
import sys

# Definisi regex untuk format ID: 3 Huruf Besar - 6 Angka
ID_PATTERN = re.compile(r'^[A-Z]{3}-\d{6}$')

def validate_csv(input_csv_path: str) -> list:
    """
    Membaca file CSV dan memvalidasi setiap ID di kolom 'id' (atau kolom pertama).
    
    Args:
        input_csv_path: Path ke file CSV hasil ekstraksi.
        
    Returns:
        Daftar tuple berisi (baris, baris_asli, kesalahan) untuk ID yang tidak valid.
    """
    invalid_entries = []
    
    try:
        with open(input_csv_path, mode='r', encoding='utf-8') as csvfile:
            reader = csv.reader(csvfile)
            
            # Mengabaikan header jika ada, atau memproses semua baris tergantung kebutuhan.
            # Di sini kita memproses semua baris untuk deteksi lengkap.
            for line_number, row in enumerate(reader, start=1):
                if not row:
                    continue
                
                # Asumsi: Kolom pertama adalah ID. 
                # Jika struktur CSV Anda berbeda, sesuaikan indeksnya (misal row[1]).
                raw_id = row[0].strip()
                
                # Memastikan sel tidak kosong
                if not raw_id:
                    continue
                    
                # Validasi Regex
                if not ID_PATTERN.match(raw_id):
                    invalid_entries.append({
                        'line': line_number,
                        'raw_id': raw_id,
                        'error': 'Format tidak sesuai dengan standar [A-Z]{3}-\d{6}'
                    })
                    
    except FileNotFoundError:
        print(f"Error: File '{input_csv_path}' tidak ditemukan.", file=sys.stderr)
        sys.exit(1)
    except IndexError:
        print(f"Error: File CSV kosong atau tidak memiliki kolom data.", file=sys.stderr)
        sys.exit(1)
        
    return invalid_entries

def main():
    if len(sys.argv) < 2:
        print("Penggunaan: python validate_ids.py <path_file_csv>")
        sys.exit(1)
        
    csv_file = sys.argv[1]
    print(f"Memvalidasi ID dari: {csv_file}...")
    
    invalid_data = validate_csv(csv_file)
    
    if not invalid_data:
        print("✅ Semua ID valid! Tidak ditemukan pelanggaran format.")
    else:
        print(f"
⚠️ Ditemukan {len(invalid_data)} ID tidak valid:")
        print("-" * 50)
        for entry in invalid_data:
            print(f"Baris #{entry['line']}: '{entry['raw_id']}'")
        print("-" * 50)
        sys.exit(1) # Exit code 1 menandakan ada error validasi

if __name__ == "__main__":
    main()
```

#### Cara Penggunaan

Skrip ini menerima path ke file CSV sebagai argumen positional.

```bash
# Validasi file hasil ekstraksi default
python validate_ids.py results.csv

# Validasi file spesifik dari pipeline CI/CD
python validate_ids.py changelog_ids_a1b2c3d4.csv
```

#### Integrasi dengan Pipeline CI/CD

Skrip validasi sangat berguna untuk mencegah "garbage in, garbage out" pada sistem downstream. Anda dapat menambahkannya sebagai tahap verifikasi setelah ekstraksi di GitHub Actions.

Tambahkan langkah berikut di setelah langkah *Ekstrak ID* pada file YAML Anda:

```yaml
  - name: Validasi Format ID
    run: |
      python validate_ids.py changelog_ids_${{ github.sha }}.csv
```

Jika skrip menemukan ID yang tidak valid, workflow akan gagal (fail). Ini memberikan umpan balik instan kepada pengembang bahwa ada anomali dalam log atau changelog yang mungkin melewatkan pola ekstraksi awal, sehingga dapat segera diperbaiki sebelum artifact diunggah.

#### Pertimbangan Tambahan

1.  **Struktur CSV**: Kode di atas mengasumsikan ID berada di **kolom pertama** (index `0`) dari setiap baris CSV. Jika skrip `extract_ids_to_csv.py` Anda menghasilkan header CSV atau kolom lain sebagai kolom pertama, Anda mungkin perlu menyesuaikan indeks `row[0]` atau menambahkan parameter untuk menentukan nama kolom ID.
2.  **Encoding**: Skrip menggunakan `utf-8` secara default. Jika file sumber Anda menggunakan encoding lain (seperti `latin-1`), sesuaikan parameter `encoding` pada fungsi `open()`.
3.  **Ekspansi Regex**: Jika standar ID perusahaan Anda berkembang (misalnya menambahkan angka di awal atau huruf di akhir), Anda cukup memperbarui variabel `ID_PATTERN` di bagian atas skrip tanpa perlu mengubah logika inti.


### Membuat Dokumentasi Otomatis untuk ID Terverifikasi

Untuk memberikan transparansi lebih lanjut dan memudahkan audit trail, proyek ini menyertakan skrip `generate_doc.py`. Skrip ini membaca file CSV hasil ekstraksi/validasi, memfilter ID yang valid berdasarkan pola `^[A-Z]{3}-\d{6}$`, dan menghasilkan file Markdown (`ID_MANUAL.md`) yang merangkum setiap ID beserta metadata validasinya.

#### Fitur Utama
*   **Analisis Metadata**: Mencatat timestamp validasi terakhir dan menghitung frekuensi kemuncungan setiap ID dalam file sumber.
*   **Status Validasi**: Menandai setiap ID sebagai `VERIFIED` jika memenuhi pola regex, atau `INVALID` jika tidak (meskipun input dari pipeline seharusnya sudah bersih).
*   **Output Terstruktur**: Menghasilkan file Markdown yang siap dibaca atau di-host di Wiki GitHub.

#### Cara Penggunaan

Skrip ini menerima dua argumen penting:
1.  `--csv`: Path ke file CSV input (hasil dari `validate_ids.py` atau `extract_ids_to_csv.py`).
2.  `--output`: Path file keluaran untuk dokumen Markdown yang dihasilkan (default: `ID_MANUAL.md`).

```bash
# Membuat dokumentasi dari file default
python generate_doc.py --csv changelog_ids.csv

# Menentukan path output kustom
python generate_doc.py --csv results/verified_ids.csv --output docs/api_id_guide.md
```

#### Contoh Output (`ID_MANUAL.md`)

File yang dihasilkan akan memiliki struktur berikut untuk setiap ID valid:

```markdown
# Daftar ID Terverifikasi

> **Catatan:** Dokumen ini dihasilkan secara otomatis oleh `generate_doc.py`.

## Ringkasan
*   **Total ID Diproces:** 150
*   **ID Unik Valid:** 120
*   **Waktu Validasi:** 2023-10-27 14:30:00

## Detail ID

| ID | Status | Frekuensi | Terakhir Ditemukan |
|----|--------|-----------|--------------------|
| AAB-123456 | VERIFIED | 5 | 2023-10-27 |
| XYZ-998877 | VERIFIED | 1 | 2023-10-27 |
| ... | ... | ... | ... |

## Penjelasan Status
*   **VERIFIED**: ID memenuhi format `^[A-Z]{3}-\d{6}$`.
*   **INVALID**: ID tidak sesuai dengan pola yang diharapkan.
```

#### Kode Sumber `generate_doc.py`

Pastikan Anda memiliki file `generate_doc.py` di direktori root proyek Anda. Berikut adalah implementasi skrip tersebut:

```python
import argparse
import csv
import re
from datetime import datetime
from collections import Counter

# Pola regex untuk validasi ID
ID_PATTERN = re.compile(r'^[A-Z]{3}-\d{6}$')

def validate_id(id_str: str) -> bool:
    """Memeriksa apakah string ID sesuai dengan pola yang ditentukan."""
    return bool(ID_PATTERN.match(id_str))

def generate_documentation(csv_path: str, output_path: str):
    """
    Membaca CSV, memvalidasi ID, dan menulis file Markdown ringkasan.
    """
    print(f"[INFO] Membaca file: {csv_path}")
    
    id_counts = Counter()
    valid_ids = []
    invalid_ids = []
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    try:
        with open(csv_path, mode='r', encoding='utf-8') as csvfile:
            reader = csv.reader(csvfile)
            # Lewati header jika ada (opsional, sesuaikan dengan struktur CSV Anda)
            # headers = next(reader, None) 
            
            for row in reader:
                if not row:
                    continue
                
                # Asumsi ID ada di kolom pertama (index 0)
                raw_id = row[0].strip()
                if not raw_id:
                    continue

                # Hitung frekuensi kemunculan
                id_counts[raw_id] += 1
                
                # Validasi format
                if validate_id(raw_id):
                    valid_ids.append(raw_id)
                else:
                    invalid_ids.append(raw_id)
                    
    except FileNotFoundError:
        print(f"[ERROR] File tidak ditemukan: {csv_path}")
        return
    except Exception as e:
        print(f"[ERROR] Terjadi kesalahan saat membaca file: {e}")
        return

    # Hitung statistik
    total_processed = sum(id_counts.values())
    unique_valid = len(valid_ids)
    unique_invalid = len(invalid_ids)

    # Generate Markdown Content
    md_content = f"""# Daftar ID Terverifikasi

> **Catatan:** Dokumen ini dihasilkan secara otomatis oleh `generate_doc.py` pada {timestamp}.

## Ringkasan Statistik
- **Total Baris Diproses:** {total_processed}
- **ID Unik Valid:** {unique_valid}
- **ID Unik Tidak Valid:** {unique_invalid}

---

## Detail ID Valid

Berikut adalah daftar ID yang berhasil diverifikasi sesuai pola `^[A-Z]{{3}}-\d{{6}}$`.

| ID | Status | Frekuensi Kemunculan | Catatan |
|----|--------|----------------------|---------|
"""
    
    # Urutkan ID valid secara alfabetis untuk keterbacaan
    sorted_valid_ids = sorted(valid_ids)
    seen_valid = set()
    
    for id_val in sorted_valid_ids:
        if id_val not in seen_valid:
            seen_valid.add(id_val)
            count = id_counts[id_val]
            md_content += f"| {id_val} | **VERIFIED** | {count} | Valid sejak {timestamp} |
"

    if unique_invalid > 0:
        md_content += f"
## Catatan ID Tidak Valid

"
        md_content += f"Ditemukan {unique_invalid} ID unik yang tidak sesuai pola.
"
        md_content += "| ID | Status | Frekuensi |
"
        md_content += "|----|--------|-----------|
"
        
        for id_val in sorted(invalid_ids):
             if id_val not in seen_valid: # Pastikan tidak duplikat di tabel ini juga jika perlu
                 md_content += f"| {id_val} | **INVALID** | {id_counts[id_val]} |
"

    # Tulis ke file
    try:
        with open(output_path, mode='w', encoding='utf-8') as f:
            f.write(md_content)
        print(f"[SUCCESS] Dokumentasi berhasil dibuat: {output_path}")
        print(f"[INFO] ID Valid: {unique_valid}, ID Invalid: {unique_invalid}")
    except Exception as e:
        print(f"[ERROR] Gagal menulis file output: {e}")

def main():
    parser = argparse.ArgumentParser(description="Generate Markdown documentation for validated IDs.")
    parser.add_argument('--csv', required=True, help='Path ke file CSV input yang berisi daftar ID.')
    parser.add_argument('--output', default='ID_MANUAL.md', help='Path file output Markdown (default: ID_MANUAL.md).')
    
    args = parser.parse_args()
    
    generate_documentation(args.csv, args.output)

if __name__ == "__main__":
    main()
```

#### Integrasi ke Pipeline CI/CD

Anda dapat menambahkan langkah ini setelah `validate_ids.py` berhasil dijalankan untuk memastikan dokumentasi selalu sinkron dengan data valid.

```yaml
  - name: Generate ID Documentation
    if: success() # Hanya jalankan jika validasi berhasil
    run: |
      python generate_doc.py --csv changelog_ids_${{ github.sha }}.csv --output docs/ID_MANUAL_${{ github.sha }}.md
      
  - name: Upload Documentation Artifact
    uses: actions/upload-artifact@v3
    with:
      name: id-manual-report
      path: docs/ID_MANUAL_*.md
```

Langkah ini memastikan bahwa setiap kali pipeline berjalan, Anda mendapatkan arsip dokumentasi yang dapat diunduh untuk keperluan audit atau referensi cepat tanpa perlu membuka log GitHub Actions.


Berikut adalah materi lanjutan untuk dokumen `README.md` Anda. Konten ini dirancang untuk melengkapi bagian sebelumnya dengan memberikan solusi visualisasi data pasca-validasi.

---

### Visualisasi Dashboard Interaktif

Setelah dokumentasi Markdown (`ID_MANUAL.md`) dihasilkan, langkah selanjutnya adalah mengubah data tersebut menjadi visual yang mudah dicerna. Skrip `dashboard_generator.py` dirancang khusus untuk membaca file Markdown hasil validasi, mengekstraksi statistik kunci (total ID, status valid/gagal, distribusi), dan menghasilkan file HTML statis yang interaktif.

Dashboard ini menggunakan **Jinja2** untuk templating dan **Chart.js** untuk rendering grafik, memungkinkan Anda melihat status validasi secara real-time langsung di browser tanpa memerlukan server backend.

#### 1. Prasyarat

Pastikan Anda telah menginstal pustaka `jinja2` dan `chartjs` (jika diperlukan untuk fitur lanjutan, namun skrip ini menggunakan CDN Chart.js sehingga tidak perlu instalasi lokal untuk grafik).

```bash
pip install jinja2
```

#### 2. Cara Penggunaan

Jalankan skrip dengan menentukan path ke file Markdown input dan path output HTML.

```bash
python dashboard_generator.py --input docs/ID_MANUAL.md --output docs/dashboard.html
```

**Argumen:**
- `--input` (required): Path ke file `ID_MANUAL.md` yang dihasilkan oleh pipeline sebelumnya.
- `--output` (default: `dashboard.html`): Path tempat file HTML dashboard akan disimpan.

#### 3. Fitur Dashboard

File `index.html` yang dihasilkan mencakup:
1.  **Ringkasan Statistik**: Kartu ringkasan yang menampilkan Total ID, Jumlah Valid, dan Jumlah Invalid.
2.  **Grafik Batang (Bar Chart)**: Visualisasi distribusi status validasi menggunakan Chart.js.
3.  **Tabel Detail**: Daftar lengkap semua ID beserta status validasinya, lengkap dengan tombol pencarian dan pemfilteran (sorting) bawaan browser.

#### 4. Kode Skrip: `dashboard_generator.py`

Simpan kode berikut sebagai `dashboard_generator.py` dalam direktori proyek Anda.

```python
import argparse
import re
import json
from pathlib import Path
from jinja2 import Template

# Template Jinja2 untuk Dashboard HTML
# Menggunakan CDN Chart.js sehingga tidak perlu instalasi library JS
DASHBOARD_TEMPLATE = """
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Validasi ID</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; margin: 20px; background-color: #f4f6f9; }
        .container { max-width: 1200px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        h1 { color: #333; text-align: center; }
        .stats-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin-bottom: 30px; }
        .stat-card { background: #fff; padding: 20px; border-radius: 8px; border-left: 5px solid #007bff; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
        .stat-card.valid { border-left-color: #28a745; }
        .stat-card.invalid { border-left-color: #dc3545; }
        .stat-card h3 { margin: 0 0 10px 0; font-size: 14px; color: #666; text-transform: uppercase; }
        .stat-card p { margin: 0; font-size: 24px; font-weight: bold; color: #333; }
        .chart-container { margin-bottom: 30px; height: 300px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f8f9fa; font-weight: 600; }
        tr:hover { background-color: #f1f1f1; }
        .status-badge { padding: 4px 8px; border-radius: 4px; font-size: 12px; font-weight: bold; }
        .status-valid { background-color: #d4edda; color: #155724; }
        .status-invalid { background-color: #f8d7da; color: #721c24; }
        .search-box { margin-bottom: 15px; padding: 10px; width: 100%; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Dashboard Validasi ID</h1>
        
        <!-- Ringkasan Statistik -->
        <div class="stats-grid">
            <div class="stat-card">
                <h3>Total ID</h3>
                <p>{{ total_ids }}</p>
            </div>
            <div class="stat-card valid">
                <h3>Valid</h3>
                <p>{{ valid_count }}</p>
            </div>
            <div class="stat-card invalid">
                <h3>Invalid</h3>
                <p>{{ invalid_count }}</p>
            </div>
        </div>

        <!-- Grafik Chart.js -->
        <div class="chart-container">
            <canvas id="validationChart"></canvas>
        </div>

        <!-- Tabel Detail -->
        <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Cari ID..." class="search-box">
        <table id="detailsTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Status</th>
                    <th>Pesan Validasi</th>
                </tr>
            </thead>
            <tbody>
                {% for item in items %}
                <tr>
                    <td>{{ item.id }}</td>
                    <td>
                        <span class="status-badge {% if item.status == 'Valid' %}status-valid{% else %}status-invalid{% endif %}">
                            {{ item.status }}
                        </span>
                    </td>
                    <td>{{ item.message }}</td>
                </tr>
                {% endfor %}
            </tbody>
        </table>
    </div>

    <script>
        // Inisialisasi Chart
        const ctx = document.getElementById('validationChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Valid', 'Invalid'],
                datasets: [{
                    label: 'Jumlah ID',
                    data: [{{ valid_count }}, {{ invalid_count }}],
                    backgroundColor: ['#28a745', '#dc3545'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: { beginAtZero: true, ticks: { stepSize: 1 } }
                }
            }
        });

        // Fungsi Pencarian Tabel Sederhana
        function filterTable() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("detailsTable");
            tr = table.getElementsByTagName("tr");
            for (i = 1; i < tr.length; i++) { // Mulai dari 1 untuk melewati header
                td = tr[i].getElementsByTagName("td")[0]; // Kolom pertama adalah ID
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</body>
</html>
"""

def parse_markdown_to_stats(md_file_path: str) -> dict:
    """
    Memparse file ID_MANUAL.md untuk mengekstrak data statistik dan detail.
    
    Asumsi format ID_MANUAL.md:
    - Header berisi judul.
    - Baris tabel markdown untuk setiap ID: | ID | Status | Pesan |
    """
    items = []
    valid_count = 0
    invalid_count = 0
    
    try:
        with open(md_file_path, 'r', encoding='utf-8') as f:
            lines = f.readlines()
            
        for line in lines:
            line = line.strip()
            # Mencari baris yang mengandung pipa '|' dan bukan header
            if '|' in line and line.startswith('|'):
                # Split baris berdasarkan pipa
                parts = [p.strip() for p in line.split('|')[1:-1]]
                
                # Pastikan format minimal ada ID, Status, Pesan
                if len(parts) >= 2:
                    id_val = parts[0]
                    status = parts[1]
                    message = parts[2] if len(parts) > 2 else ""
                    
                    items.append({
                        "id": id_val,
                        "status": status,
                        "message": message
                    })
                    
                    if status.lower() == 'valid':
                        valid_count += 1
                    else:
                        invalid_count += 1
                        
    except FileNotFoundError:
        print(f"Error: File {md_file_path} tidak ditemukan.")
        exit(1)
    except Exception as e:
        print(f"Terjadi kesalahan saat memparse file: {e}")
        exit(1)
        
    return {
        "items": items,
        "total_ids": len(items),
        "valid_count": valid_count,
        "invalid_count": invalid_count
    }

def generate_dashboard(data: dict, output_path: str):
    """
    Menghasilkan file HTML menggunakan template Jinja2.
    """
    template = Template(DASHBOARD_TEMPLATE)
    html_content = template.render(**data)
    
    try:
        output_dir = Path(output_path).parent
        output_dir.mkdir(parents=True, exist_ok=True)
        
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(html_content)
            
        print(f"Dashboard berhasil dibuat di: {output_path}")
        
    except Exception as e:
        print(f"Error saat menulis file HTML: {e}")
        exit(1)

def main():
    parser = argparse.ArgumentParser(description="Generate Dashboard HTML dari file ID_MANUAL.md")
    parser.add_argument('--input', required=True, help='Path ke file ID_MANUAL.md input.')
    parser.add_argument('--output', default='dashboard.html', help='Path file output HTML (default: dashboard.html).')
    
    args = parser.parse_args()
    
    print(f"Membaca data dari: {args.input}")
    stats_data = parse_markdown_to_stats(args.input)
    
    print("Menghasilkan dashboard HTML...")
    generate_dashboard(stats_data, args.output)

if __name__ == "__main__":
    main()
```

#### 5. Integrasi ke Pipeline CI/CD (Lanjutan)

Untuk mengotomatisasi pembuatan dashboard setiap kali validasi berhasil, tambahkan langkah baru di akhir workflow GitHub Actions Anda. Langkah ini akan memanggil `dashboard_generator.py` setelah `generate_doc.py` selesai.

```yaml
          - name: Generate ID Documentation
            if: success()
            run: |
              python generate_doc.py --csv changelog_ids_${{ github.sha }}.csv --output docs/ID_MANUAL_${{ github.sha }}.md

          # TAMBAHKAN LANGKAH BARU INI
          - name: Generate Dashboard HTML
            if: success()
            run: |
              python dashboard_generator.py --input docs/ID_MANUAL_${{ github.sha }}.md --output docs/dashboard_${{ github.sha }}.html

          - name: Upload Documentation Artifact
            uses: actions/upload-artifact@v3
            with:
              name: id-manual-report
              path: |
                docs/ID_MANUAL_*.md
                docs/dashboard_*.html
```

Dengan perubahan ini, artifact yang diunduh tidak hanya berisi dokumentasi teks (`ID_MANUAL.md`), tetapi juga file `dashboard.html` yang dapat dibuka langsung di browser untuk inspeksi visual cepat.


#### 6. Analisis Log GitHub Actions dengan `log_analyzer.py`

Untuk memantau efektivitas pipeline dan mendeteksi potensi masalah terkait perubahan ID (seperti ID yang hilang, duplikat, atau format yang tidak valid), Anda dapat menggunakan skrip `log_analyzer.py`. Skrip ini dirancang untuk memindai file log mentah dari GitHub Actions, mengekstraksi ID dalam format standar (`PROJECT-123456`), dan menghasilkan ringkasan statistik dalam format JSON.

##### Instalasi dan Penggunaan

Skrip ini menggunakan modul standar Python (`re`, `json`, `argparse`) sehingga tidak memerlukan instalasi paket pihak ketiga tambahan.

**Argumen Command Line:**

| Argumen | Deskripsi | Contoh |
| :--- | :--- | :--- |
| `--log` | Jalur ke file log GitHub Actions (bisa `.txt`, `.log`, atau stdin) | `./action-run.log` |
| `--output` | Jalur keluaran untuk file JSON hasil analisis | `summary.json` |

**Contoh Perintah:**

```bash
python log_analyzer.py --log action-run.log --output analysis_summary.json
```

##### Contoh Kode: `log_analyzer.py`

Simpan kode berikut sebagai `log_analyzer.py` di root direktori proyek.

```python
#!/usr/bin/env python3
"""
log_analyzer.py
Analisis file log GitHub Actions untuk mengekstraksi dan meringkas ID proyek.

Format ID yang didukung: ^[A-Z]{3}-\d{6}$ (Contoh: PRO-123456)
"""

import re
import json
import argparse
from collections import Counter
from pathlib import Path


def extract_ids_from_log(log_content: str) -> list:
    """
    Mengekstrak semua ID yang cocok dengan format [A-Z]{3}-\d{6} dari teks log.
    
    Args:
        log_content (str): Isi file log sebagai string.
        
    Returns:
        list: Daftar semua ID yang ditemukan (termasuk duplikat).
    """
    # Regex untuk format PROJECT-123456 (3 huruf besar, dash, 6 angka)
    pattern = r'([A-Z]{3}-\d{6})'
    
    # findall mengembalikan list dari semua pencocokan
    found_ids = re.findall(pattern, log_content)
    
    return found_ids


def analyze_log_file(log_path: str, output_path: str):
    """
    Membaca file log, menganalisis ID, dan menulis ringkasan ke file JSON.
    
    Args:
        log_path (str): Path ke file input log.
        output_path (str): Path ke file output JSON.
    """
    log_file = Path(log_path)
    
    if not log_file.exists():
        raise FileNotFoundError(f"File log tidak ditemukan: {log_path}")

    # Baca konten file
    with open(log_file, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()

    # Ekstrak ID
    raw_ids = extract_ids_from_log(content)

    if not raw_ids:
        print("Tidak ada ID yang ditemukan dalam format yang diminta.")
        summary = {
            "total_ids_found": 0,
            "unique_ids_count": 0,
            "unique_ids": [],
            "top_frequent_ids": [],
            "raw_id_list": []
        }
    else:
        # Hitung frekuensi
        id_counts = Counter(raw_ids)
        
        # Dapatkan ID unik yang diurutkan secara alfabetis
        unique_ids = sorted(id_counts.keys())
        
        # Dapatkan 10 ID paling sering muncul
        top_frequent = id_counts.most_common(10)

        summary = {
            "total_ids_found": len(raw_ids),
            "unique_ids_count": len(unique_ids),
            "unique_ids": unique_ids,
            "top_frequent_ids": [
                {"id": id_str, "count": count} for id_str, count in top_frequent
            ],
            "raw_id_list": raw_ids # Disertakan untuk debugging jika diperlukan
        }

    # Tulis ke file JSON
    output_file = Path(output_path)
    output_file.parent.mkdir(parents=True, exist_ok=True)
    
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(summary, f, indent=4, ensure_ascii=False)

    # Output ke console
    print(f"Analisis selesai.")
    print(f"Total ID ditemukan: {summary['total_ids_found']}")
    print(f"ID Unik: {summary['unique_ids_count']}")
    print(f"Output JSON disimpan ke: {output_path}")

    # Tampilkan top 5 di console untuk umpan balik cepat
    if summary['top_frequent_ids']:
        print("
Top 5 ID Paling Sering Muncul:")
        for item in summary['top_frequent_ids'][:5]:
            print(f"  - {item['id']}: {item['count']}x")


def main():
    parser = argparse.ArgumentParser(
        description="Analisis file log GitHub Actions untuk mendeteksi ID proyek."
    )
    parser.add_argument(
        '--log', 
        type=str, 
        required=True, 
        help='Path ke file log GitHub Actions'
    )
    parser.add_argument(
        '--output', 
        type=str, 
        default='analysis_summary.json', 
        help='Path keluaran file JSON (default: analysis_summary.json)'
    )

    args = parser.parse_args()
    
    try:
        analyze_log_file(args.log, args.output)
    except Exception as e:
        print(f"Error: {e}")
        exit(1)

if __name__ == "__main__":
    main()
```

##### Integrasi ke Pipeline CI/CD

Anda dapat menambahkan langkah analisis log ke dalam workflow GitHub Actions Anda. Langkah ini berguna untuk memvalidasi apakah ID yang diharapkan muncul dalam log build atau deployment, atau untuk mendeteksi error yang melibatkan ID spesifik.

Tambahkan blok berikut setelah langkah `Generate Dashboard HTML` atau di akhir workflow:

```yaml
          - name: Analyze Action Logs for IDs
            if: success()
            run: |
              # 1. Download log artifact jika diperlukan, atau gunakan log lokal
              # Jika log sudah tersedia di workspace, langsung analisis.
              # Contoh ini mengasumsikan kita menganalisis log dari artifact build sebelumnya
              # atau log yang ditampung dalam workspace.
              
              # Untuk demo, kita asumsikan ada file log sederhana atau kita download dari artifact 'logs'
              # Jika Anda ingin menganalisis log dari artifact 'build-logs' dari job sebelumnya:
              # uses: actions/download-artifact@v3
              # with:
              #   name: build-logs
              #   path: ./logs
              
              # Skrip ini akan mencari ID di file log apa pun di folder logs/
              # Pastikan log directory ada. Jika tidak, buat dummy log untuk testing.
              
              if [ ! -d "logs" ]; then
                mkdir -p logs
                echo "No logs directory found. Creating dummy log for testing."
                echo "Build started for PROJ-000001" > logs/build.log
                echo "Deploying PROJ-000002" >> logs/build.log
              fi

              python log_analyzer.py --log ./logs/build.log --output id_analysis.json
              
              # Opsional: Upload hasil analisis sebagai artifact
              # uses: actions/upload-artifact@v3
              # with:
              #   name: id-analysis-report
              #   path: id_analysis.json
```

##### Interpretasi Output JSON

File JSON yang dihasilkan (`id_analysis.json`) memiliki struktur berikut:

```json
{
  "total_ids_found": 150,
  "unique_ids_count": 12,
  "unique_ids": [
    "PRO-000001",
    "PRO-000002",
    "QAS-123456"
  ],
  "top_frequent_ids": [
    {
      "id": "PRO-000001",
      "count": 50
    },
    {
      "id": "PRO-000002",
      "count": 30
    }
  ],
  "raw_id_list": [
    "PRO-000001",
    "PRO-000001",
    ...
  ]
}
```

*   **`unique_ids`**: Daftar ID yang ditemukan, diurutkan secara alfabetis. Berguna untuk memastikan ID tertentu muncul dalam log.
*   **`top_frequent_ids`**: ID yang paling sering muncul dalam log. Jika ID tertentu muncul secara tidak wajar (terlalu sering atau terlalu sedikit), ini bisa menjadi indikator error atau duplikasi log.
*   **`total_ids_found`**: Total kemunculan semua ID. Bandingkan dengan jumlah ID unik untuk mendeteksi repetisi.
