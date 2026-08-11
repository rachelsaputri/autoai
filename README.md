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


# ID Reconciliation Script

Skrip `id_reconciliation.py` dirancang untuk melakukan validasi silang (reconciliation) antara daftar ID yang didokumentasikan secara resmi dalam `ID_MANUAL.md` dengan ID yang tercatat dalam log aplikasi hasil analisis oleh `log_analyzer.py`.

Tujuan utama dari proses ini adalah mendeteksi inkonsistensi data, seperti:
*   **ID Hantu (Ghost IDs):** ID yang ada di dokumentasi tetapi tidak pernah muncul dalam log operasional.
*   **ID Tidak Valid (Invalid/Unknown IDs):** ID yang muncul dalam log tetapi tidak terdaftar dalam dokumentasi standar, yang mungkin mengindikasikan data korup, input user ilegal, atau kesalahan konfigurasi.
*   **ID Valid & Aktif:** ID yang muncul di kedua sumber, mengonfirmasi integritas data.

## Prasyarat

Pastikan lingkungan Python Anda memiliki library berikut diinstal. Library ini digunakan untuk parsing Markdown dan manipulasi CSV.

```bash
pip install pandas python-markdown
```

> **Catatan:** Jika Anda menggunakan lingkungan virtual yang ketat atau preferensi instalasi berbasis konstitusi, pastikan versi `pandas` dan `python-markdown` kompatibel dengan versi Python yang Anda gunakan (direkomendasikan Python 3.7+).

## Cara Penggunaan

Jalankan skrip dari direktori root proyek setelah `log_analyzer.py` selesai dijalankan dan menghasilkan file JSON ringkasan.

```bash
python id_reconciliation.py
```

### Alur Kerja Skrip

1.  **Inisialisasi:** Skrip akan mencari file `ID_MANUAL.md` di direktori saat ini.
2.  **Parsing Dokumentasi:**
    *   Membaca konten `ID_MANUAL.md`.
    *   Mengekstrak semua ID yang terdaftar dalam format standar (misalnya, baris yang berisi pola `ID: [PATTERN]` atau tabel Markdown).
    *   *Asumsi:* Skrip menggunakan regex sederhana untuk menangkap ID yang diawali dengan prefix standar (seperti `PRO-` atau `QAS-`). Anda dapat menyesuaikan regex di variabel `VALID_ID_PATTERN` di dalam skrip jika format dokumentasi berubah.
3.  **Parsing Log Ringkasan:**
    *   Membaca file output JSON dari `log_analyzer.py` (default: `log_summary.json`).
    *   Mengekstrak daftar `unique_ids` dari kunci `unique_ids` dalam JSON.
4.  **Perbandingan Logika:**
    *   Membuat set ID dari dokumentasi (`doc_ids`) dan set ID dari log (`log_ids`).
    *   Menghitung union dan intersection untuk menentukan status setiap ID.
5.  **Generasi Laporan:**
    *   Menyimpan hasil perbandingan ke `reconciliation_report.csv`.

## Struktur Output: `reconciliation_report.csv`

File CSV yang dihasilkan akan memiliki struktur berikut:

| Kolom | Deskripsi | Contoh Nilai |
| :--- | :--- | :--- |
| **ID** | Kode identifier yang diperiksa. | `PRO-000001` |
| **Status_Documentation** | Apakah ID ditemukan dalam `ID_MANUAL.md`. | `FOUND`, `NOT_FOUND` |
| **Status_Log** | Apakah ID ditemukan dalam `log_summary.json`. | `FOUND`, `NOT_FOUND` |
| **Rekomendasi** | Tindakan yang disarankan berdasarkan status. | "Verifikasi aktivasi", "Hapus dari dokumentasi", "Investigasi sumber ID asing" |

### Logika Rekomendasi

Skrip memberikan rekomendasi berbasis aturan sebagai berikut:

*   **Jika `ID` ada di Dokumen tapi TIDAK ada di Log:**
    *   *Status:* `FOUND` / `NOT_FOUND`
    *   *Rekomendasi:* **"ID Hantu: Verifikasi apakah ID ini aktif atau perlu dihapus dari dokumentasi."**
    *   *Insight:* ID ini mungkin sudah di-deprecate, atau sistem gagal mencatat event untuk ID tersebut.

*   **Jika `ID` TIDAK ada di Dokumen tapi ADA di Log:**
    *   *Status:* `NOT_FOUND` / `FOUND`
    *   *Rekomendasi:* **"ID Tidak Valid: Investigasi sumber ID ini. Kemungkinan data korup atau input ilegal."**
    *   *Insight:* Ini adalah indikator risiko tinggi. ID baru mungkin belum didokumentasikan, atau terjadi kesalahan penomoran.

*   **Jika `ID` ada di kedua sumber:**
    *   *Status:* `FOUND` / `FOUND`
    *   *Rekomendasi:* **"Valid: Tidak ada tindakan diperlukan."**
    *   *Insight:* Integritas data terjaga.

*   **Jika `ID` tidak ada di keduanya:**
    *   *(Skenario ini umumnya tidak muncul dalam output karena skrip menggabungkan union dari kedua sumber, namun jika ada, statusnya akan `NOT_FOUND`/`NOT_FOUND`)*.

## Konfigurasi Skrip

Skrip menggunakan konstanta berikut di bagian atas file `id_reconciliation.py`. Anda dapat menyesuaikannya sesuai kebutuhan proyek:

```python
# Konstanta Input/Output
INPUT_DOC_FILE = "ID_MANUAL.md"
INPUT_LOG_JSON = "log_summary.json"  # Pastikan nama ini sesuai dengan output log_analyzer.py
OUTPUT_CSV = "reconciliation_report.csv"

# Regex untuk mendeteksi ID dalam Markdown
# Contoh: Mencari pola seperti "PRO-12345" atau "QAS-67890"
# Sesuaikan ekspresi ini jika format ID Anda berbeda
VALID_ID_PATTERN = r'(PRO|QAS)-\d{6}'
```

## Contoh Output CSV

Berikut adalah contoh isi `reconciliation_report.csv` setelah skrip dijalankan:

```csv
ID,Status_Documentation,Status_Log,Rekomendasi
PRO-000001,FOUND,FOUND,Valid: Tidak ada tindakan diperlukan.
PRO-000002,FOUND,NOT_FOUND,ID Hantu: Verifikasi apakah ID ini aktif atau perlu dihapus dari dokumentasi.
PRO-000003,NOT_FOUND,FOUND,ID Tidak Valid: Investigasi sumber ID ini. Kemungkinan data korup atau input ilegal.
QAS-123456,FOUND,FOUND,Valid: Tidak ada tindakan diperlukan.
```

## Troubleshooting

*   **File tidak ditemukan:** Pastikan `ID_MANUAL.md` dan file JSON output dari `log_analyzer.py` berada di direktori yang sama dengan skrip `id_reconciliation.py`.
*   **ID tidak terdeteksi:** Periksa regex `VALID_ID_PATTERN`. Jika ID Anda memiliki format yang berbeda (misalnya prefix lain atau panjang digit berbeda), perbarui ekspresi reguler tersebut.
*   **Error parsing Markdown:** Skrip ini menggunakan pendekatan regex sederhana. Untuk dokumen Markdown yang sangat kompleks dengan tabel nesting, pertimbangkan untuk menggunakan library `pandas` langsung untuk membaca tabel Markdown, atau konversi `ID_MANUAL.md` menjadi format JSON/CSV terstruktur terlebih dahulu.

## Integrasi CI/CD

Untuk menjaga integritas data secara otomatis, Anda dapat menambahkan langkah ini ke pipeline CI/CD Anda:

1.  Jalankan `log_analyzer.py` setiap kali build baru di-deploy ke lingkungan staging.
2.  Jalankan `id_reconciliation.py` setelah log generator selesai.
3.  Tambahkan pemeriksaan: Jika jumlah baris dengan `Rekomendasi` mengandung kata "Invalid" atau "Hantu" melebihi ambang batas tertentu (misalnya > 0), pipeline dapat ditandai sebagai **GAGAL (FAIL)** atau mengirim notifikasi ke tim DevOps/Backend untuk investigasi.

Ini memastikan bahwa setiap ID yang digunakan dalam aplikasi selalu sesuai dengan standar yang ditetapkan, mengurangi risiko *data drift* dan kesalahan operasional.


## Fitur Otomatisasi Perbaikan: `auto_fixer.py`

Untuk mengurangi beban manual dalam menangani temuan anomali data, tersedia skrip `auto_fixer.py`. Skrip ini dirancang untuk membaca laporan rekonsiliasi yang dihasilkan oleh `id_reconciliation.py` dan melakukan tindakan korektif langsung pada file sumber `ID_MANUAL.md`.

### Kapabilitas Utama

Skrip ini melakukan pembersihan data cerdas berdasarkan kolom `Rekomendasi` dalam file CSV:

1.  **Penghapusan "ID Hantu" (Ghost ID):**
    *   Jika status adalah `ID Hantu` (biasanya ditemukan di dokumentasi tetapi tidak ada di log sistem), skrip akan **menghapus baris** entri tersebut dari file Markdown secara permanen.
    *   *Catatan:* Pastikan Anda memiliki backup file asli sebelum menjalankan mode ini, karena penghapusan bersifat destruktif pada file target.

2.  **Penandaan "ID Tidak Valid" (Invalid ID):**
    *   Jika status adalah `ID Tidak Valid` (ditemukan di log tetapi tidak ada/dapat diverifikasi di dokumentasi), skrip tidak menghapus entri. Sebaliknya, ia menambahkan metadata meta-comment di bawah entri tersebut:
        ```markdown
        <!-- {status: deprecated, reason: mismatch} -->
        ```
    *   Ini memastikan audit trail tetap terjaga sementara menandai bahwa entri tersebut tidak lagi relevan secara operasional.

### Cara Penggunaan

Skrip ini menerima dua argumen baris perintah untuk fleksibilitas penggunaan:

*   `--input`: Path ke file CSV hasil rekonsiliasi (`reconciliation_report.csv`).
*   `--output`: Path ke file Markdown tujuan (`ID_MANUAL.md`). Jika tidak disediakan, skrip akan mencoba memperbarui file `ID_MANUAL.md` di direktori yang sama dengan input secara default.

#### Sintaks Dasar

```bash
python auto_fixer.py --input reconciliation_report.csv --output ID_MANUAL.md
```

#### Contoh Skenario

1.  **Perbaikan Cepat di Lingkungan Lokal:**
    ```bash
    python auto_fixer.py --input ./data/reconciliation_report.csv
    ```
    *(Asumsi: Output akan menimpa `./data/ID_MANUAL.md` atau file Markdown terdekat yang terdeteksi).*

2.  **Dry Run (Opsional - Disarankan untuk Verifikasi Awal):**
    Meskipun skrip utama melakukan pembaruan, disarankan untuk melihat preview perubahan dengan membuka file CSV terlebih dahulu. Untuk keamanan tambahan, Anda dapat menyalin file Markdown asli ke `ID_MANUAL.md.bak` sebelum menjalankan skrip.

### Prasyarat Teknis

*   **Library:** Skrip ini hanya menggunakan library standar Python (`csv`, `argparse`, `pathlib`). Tidak ada instalasi package tambahan (`pip install`) yang diperlukan.
*   **Format Input:** File CSV harus memiliki header `ID`, `Status_Documentation`, `Status_Log`, dan `Rekomendasi` sesuai dengan output standar `id_reconciliation.py`.
*   **Struktur Markdown:** File `ID_MANUAL.md` diharapkan menggunakan format tabel standar atau list format di mana setiap ID berada pada baris terpisah yang dapat diidentifikasi secara unik.

### Contoh Kode `auto_fixer.py`

Berikut adalah implementasi dasar dari skrip tersebut untuk referensi integrasi:

```python
#!/usr/bin/env python3
import argparse
import csv
import re
import os
from pathlib import Path

def parse_args():
    parser = argparse.ArgumentParser(description="Auto-fix ID issues in documentation based on reconciliation report.")
    parser.add_argument("--input", required=True, help="Path to the reconciliation_report.csv")
    parser.add_argument("--output", default="ID_MANUAL.md", help="Path to the output markdown file")
    return parser.parse_args()

def process_fix(input_csv, output_md):
    # Membaca laporan rekonsiliasi
    issues = []
    with open(input_csv, mode='r', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            recom = row.get('Rekomendasi', '')
            if 'ID Hantu' in recom:
                issues.append(('remove', row['ID']))
            elif 'ID Tidak Valid' in recom:
                issues.append(('mark', row['ID']))
    
    if not issues:
        print("No issues found to fix.")
        return

    # Membaca file Markdown asli
    with open(output_md, mode='r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    # Menggunakan regex sederhana untuk mendeteksi baris ID (sesuaikan pola dengan format MD Anda)
    # Asumsi: Baris ID dimulai dengan format PRO-QAS atau mirip
    id_pattern = re.compile(r'^(PRO|QAS)-\d{6}')

    for line in lines:
        match = id_pattern.match(line)
        if match:
            current_id = match.group(0)
            
            # Cek apakah ID ini perlu dihapus
            if ('remove', current_id) in issues:
                # Skip baris ini (efek delete)
                continue
            
            # Cek apakah ID perlu ditandai
            if ('mark', current_id) in issues:
                new_lines.append(line)
                # Tambahkan komentar deprecation setelah baris ID
                new_lines.append(f'<!-- {{status: deprecated, reason: mismatch}} -->
')
                continue
        
        new_lines.append(line)

    # Menulis kembali file
    with open(output_md, mode='w', encoding='utf-8') as f:
        f.writelines(new_lines)
    
    print(f"Processing complete. Fixed file saved to {output_md}")

if __name__ == "__main__":
    args = parse_args()
    process_fix(args.input, args.output)
```

### Best Practice Integrasi

1.  **Backup Otomatis:** Selalu buat salinan cadangan (`backup`) dari `ID_MANUAL.md` sebelum menjalankan `auto_fixer.py` di lingkungan produksi.
2.  **Uji Coba Terisolasi:** Jalankan skrip pertama kali pada *staging* environment atau dengan file CSV dummy untuk memastikan regex penyesuaian format Markdown Anda akurat.
3.  **Review Changes:** Gunakan sistem versi (Git) untuk melihat diff perubahan yang dihasilkan sebelum meng-commit hasil perbaikan otomatis ini.


### Monitoring & Deteksi Anomali ID Hantu

Untuk menjaga integritas data secara proaktif, repository ini menyertakan skrip monitoring `id_sync_monitor.py`. Skrip ini dirancang untuk mendeteksi ketidakkonsistenan antara ID yang tercatat sebagai 'Active' dalam dokumentasi manual (`ID_MANUAL.md`) dan data log sistem terbaru yang terekspose melalui laporan rekonsiliasi (`reconciliation_report.csv`).

Ketika sebuah ID ada di dalam manual tetapi tidak muncul dalam log sistem terbaru, skrip menganggap ID tersebut sebagai **"ID Hantu"** (Ghost ID). Jika jumlah ID hantu melebihi ambang batas yang ditentukan, sistem akan mengirimkan notifikasi peringatan secara real-time melalui webhook HTTP.

#### Cara Penggunaan

Jalankan skrip dari baris perintah (CLI) dengan menentukan path file input dan URL webhook target.

```bash
python id_sync_monitor.py \
    --csv path/to/reconciliation_report.csv \
    --md path/to/ID_MANUAL.md \
    --webhook-url https://hooks.slack.com/services/YOUR/WEBHOOK/URL \
    --threshold 5
```

#### Argumentasi CLI

| Argument | Tipe | Deskripsi | Wajib |
| :--- | :--- | :--- | :--- |
| `--csv` | `str` | Path ke file CSV laporan rekonsiliasi yang berisi log sistem terbaru. | Ya |
| `--md` | `str` | Path ke file Markdown manual (`ID_MANUAL.md`) yang menjadi referensi ID aktif. | Ya |
| `--webhook-url` | `str` | URL endpoint webhook (misal: Slack, Discord, atau custom API) untuk mengirim notifikasi error. | Ya |
| `--threshold` | `int` | Batas maksimum ID hantu yang diperbolehkan sebelum notifikasi dikirim. Default: `0` (selalu kirim jika ada anomali). | Tidak |

#### Logika Pemrosesan

1.  **Parsing Manual (`--md`):**
    Skrip membaca `ID_MANUAL.md` dan mengekstrak semua ID yang ditandai sebagai 'Active'. Format asumsinya adalah baris yang mengandung ID unik, di mana status keaktifan dapat ditentukan melalui header YAML frontmatter atau komentar khusus di dalam file.

2.  **Validasi Log Sistem (`--csv`):**
    File CSV (`reconciliation_report.csv`) diparsing untuk mengumpulkan himpunan set `system_ids` yang valid dan aktif berdasarkan kolom timestamp atau status terbaru.

3.  **Perbandingan (Diffing):**
    Skrip menghitung selisih set:
    $$ 	ext{Ghost IDs} = \{ 	ext{Manual IDs} \} - \{ 	ext{System IDs} \} $$

4.  **Evaluasi Ambang Batang:**
    *   Jika `len(Ghost IDs) > threshold`: Kirim notifikasi.
    *   Jika `len(Ghost IDs) <= threshold`: Hentikan eksekusi tanpa output (silent success).

5.  **Notifikasi Webhook:**
    Jika kondisi ambang batas terpenuhi, skrip melakukan POST request JSON ke `--webhook-url` dengan payload berikut:

    ```json
    {
      "text": "🚨 Anomali ID Terdeteksi",
      "embeds": [
        {
          "title": "Deteksi ID Hantu",
          "description": "Ditemukan ID hantu melebihi ambang batas.",
          "fields": [
            {
              "name": "Jumlah ID Hantu",
              "value": "<COUNT>",
              "inline": true
            },
            {
              "name": "Ambang Batas",
              "value": "<THRESHOLD>",
              "inline": true
            }
          ],
          "color": 16711680,
          "timestamp": "<ISO_TIMESTAMP>"
        }
      ]
    }
    ```

#### Contoh Integrasi dengan GitHub Actions

Anda dapat mengotomatisasi monitoring ini dengan menambahkan job ke `.github/workflows/sync-monitor.yml`:

```yaml
name: ID Sync Monitor
on:
  schedule:
    # Jalankan setiap 6 jam
    - cron: '0 */6 * * *'
  workflow_dispatch: # Izinkan eksekusi manual

jobs:
  monitor:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.9'

      - name: Install dependencies
        run: pip install requests # Pastikan library requests terinstall

      - name: Run ID Sync Monitor
        env:
          CSV_PATH: ./data/reconciliation_report.csv
          MD_PATH: ./ID_MANUAL.md
          WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
          THRESHOLD: 0 # Kirim notifikasi jika ada 1 pun ID hantu
        run: |
          python id_sync_monitor.py \
            --csv $CSV_PATH \
            --md $MD_PATH \
            --webhook-url $WEBHOOK_URL \
            --threshold $THRESHOLD
```

#### Tips Troubleshooting

*   **Format CSV:** Pastikan kolom yang berisi ID di CSV sesuai dengan format string ID di `ID_MANUAL.md` (misalnya, presisi case-sensitive dan penanganan whitespace).
*   **Rate Limit Webhook:** Jika menggunakan Slack/Discord, hindari frekuensi eksekusi yang terlalu tinggi untuk menghindari pembatasan rate limit API.
*   **Log Debug:** Untuk melihat detail ID hantu secara langsung di terminal, Anda dapat menambahkan flag `--verbose` (jika dikembangkan di masa depan) atau menyesuaikan skrip untuk mencetak hasil diff ke stdout.


### Langkah 3: Ekspor Validasi ID ke Format YAML

Sebelum melakukan proses sinkronisasi, disarankan untuk mengekspor daftar ID valid dari `ID_MANUAL.md` ke dalam format YAML yang terstruktur. Hal ini memastikan konsistensi data dan memudahkan integrasi dengan sistem lain yang membutuhkan format konfigurasi standar.

Berikut adalah panduan pembuatan skrip `id_exporter.py` dan integrasinya ke dalam workflow GitHub Actions.

#### 1. Membuat Skrip `id_exporter.py`

Buat file baru bernama `id_exporter.py` di root direktori proyek Anda. Skrip ini akan mem-parsing file Markdown manual dan mengekstrak ID menjadi struktur YAML.

```python
import argparse
import re
import yaml
import sys

def parse_manual_id_file(file_path):
    """
    Membaca file Markdown dan mengekstrak ID valid.
    Asumsi: ID berada dalam baris yang mengandung pola spesifik atau daftar poin.
    Sesuaikan regex ini dengan format aktual file ID_MANUAL.md Anda.
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Contoh regex: Mengambil ID yang berada di dalam kode backtick `...` 
        # atau setelah label "ID:". Sesuaikan dengan kebutuhan.
        # Pola umum: Mengambil string setelah kata kunci "ID:" hingga akhir baris atau sebelum spasi
        # Ini adalah contoh fleksibel, silakan sesuaikan dengan struktur MD Anda.
        id_pattern = re.compile(r'ID:\s*([A-Za-z0-9_-]+)', re.IGNORECASE)
        found_ids = [match.group(1) for match in id_pattern.finditer(content)]
        
        # Hapus duplikat dan urutkan
        unique_ids = sorted(list(set(found_ids)))
        return unique_ids
    
    except FileNotFoundError:
        print(f"Error: File {file_path} tidak ditemukan.")
        sys.exit(1)

def export_to_yaml(ids, output_path):
    """
    Mengekspor daftar ID ke file YAML.
    """
    try:
        # Struktur YAML: { "valid_ids": ["id1", "id2", ...] }
        data = {
            "valid_ids": ids
        }
        
        with open(output_path, 'w', encoding='utf-8') as f:
            yaml.dump(data, f, default_flow_style=False, sort_keys=False, allow_unicode=True)
        
        print(f"Berhasil mengekspor {len(ids)} ID ke {output_path}")
        
    except Exception as e:
        print(f"Error saat menulis file YAML: {e}")
        sys.exit(1)

def main():
    parser = argparse.ArgumentParser(description="Ekspor ID dari Markdown ke YAML")
    parser.add_argument('--manual', required=True, help='Path ke file input Markdown (misal: ID_MANUAL.md)')
    parser.add_argument('--output', required=True, help='Path ke file output YAML (misal: valid_ids.yaml)')
    
    args = parser.parse_args()
    
    print(f"Membaca ID dari: {args.manual}")
    ids = parse_manual_id_file(args.manual)
    
    if not ids:
        print("Peringatan: Tidak ada ID yang ditemukan di file Markdown.")
    
    print(f"Mengekspor ke: {args.output}")
    export_to_yaml(ids, args.output)

if __name__ == "__main__":
    main()
```

> **Catatan:** Bagian `parse_manual_id_file` menggunakan regex contoh. Pastikan untuk menyesuaikan pola regex (`id_pattern`) agar sesuai dengan format spesifik penulisan ID di dalam `ID_MANUAL.md` Anda.

#### 2. Integrasi ke GitHub Actions Workflow

Tambahkan langkah eksekusi skrip ini **sebelum** langkah `Run ID Sync Monitor`. Ini memastikan bahwa file YAML referensi selalu diperbarui berdasarkan sumber kebenaran tunggal (`ID_MANUAL.md`) sebelum proses verifikasi dilakukan.

Tambahkan blok berikut di antara langkah `Install dependencies` dan `Run ID Sync Monitor`:

```yaml
        - name: Install PyYAML dependency
          run: pip install pyyaml
          
        - name: Export Valid IDs to YAML
          run: |
            python id_exporter.py \
              --manual ID_MANUAL.md \
              --output valid_ids.yaml
              
        - name: Run ID Sync Monitor
          env:
            CSV_PATH: ./data/reconciliation_report.csv
            MD_PATH: ./ID_MANUAL.md
            YAML_PATH: ./valid_ids.yaml # Opsional: jika monitor juga mendukung input YAML
            WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
            THRESHOLD: 0 
          run: |
            python id_sync_monitor.py \
              --csv $CSV_PATH \
              --md $MD_PATH \
              --webhook-url $WEBHOOK_URL \
              --threshold $THRESHOLD
```

#### Manfaat Penambahan Ini:
1.  **Konsistensi Data:** Memisahkan proses parsing sumber (MD) dari proses validasi (Sync Monitor) mengurangi risiko kesalahan parsing di waktu eksekusi monitor.
2.  **Debugging Mudah:** File `valid_ids.yaml` yang dihasilkan dapat ditinjau secara manual jika terjadi masalah dalam sinkronisasi, memberikan transparansi tentang daftar ID yang dianggap "valid" oleh sistem.
3.  **Performa:** Ekspor YAML hanya dilakukan sekali per workflow run, bukan pada setiap baris CSV, sehingga lebih efisien jika dataset besar.


# Panduan Implementasi: Skrip `id_exporter.py`

Bagian ini menjelaskan secara teknis implementasi skrip `id_exporter.py`, yang berperan sebagai lapisan abstraksi antara sumber data mentah (`ID_MANUAL.md`) dan sistem validasi terstruktur (`valid_ids.yaml`). Skrip ini dirancang untuk mengubah dokumen Markdown yang mungkin kompleks menjadi struktur data Python yang seragam, siap dikonsumsi oleh pipeline CI/CD.

## Arsitektur Skrip

Skrip ini mengikuti prinsip *single responsibility*: hanya bertanggung jawab untuk membaca, mem-parsing, dan mengekspor data. Tidak ada logika bisnis validasi yang tertanam di dalamnya, memisahkan kekhawatiran (*separation of concerns*) antara ekstraksi data dan validasi logika.

### Dependensi
Pastikan lingkungan Python Anda memiliki library berikut:
*   `argparse` (Bawaan Python)
*   `pyyaml` (Instalasi: `pip install pyyaml`)
*   `datetime` (Bawaan Python)
*   `re` (Bawaan Python, opsional tergantung regex parser)

### Implementasi Kode

Salin kode berikut ke dalam file bernama `id_exporter.py`:

```python
#!/usr/bin/env python3
"""
id_exporter.py

Skrip untuk mengekstrak metadata ID dari file Markdown manual dan
menyimpannya ke dalam format YAML yang terstruktur.

Digunakan sebagai jembatan sebelum menjalankan ID Sync Monitor.
"""

import argparse
import yaml
import re
import os
import sys
from datetime import datetime
from typing import List, Dict, Optional

# Struktur Metadata yang Diinginkan
class IDMetadata:
    def __init__(self, id_value: str, frequency: Optional[int] = None, 
                 status: str = "unknown", last_updated: Optional[str] = None):
        self.id_value = id_value
        self.frequency = frequency
        self.status = status
        self.last_updated = last_updated or datetime.now().isoformat()

    def to_dict(self) -> Dict:
        data = {"id": self.id_value}
        if self.frequency is not None:
            data["frequency"] = self.frequency
        if self.status and self.status != "unknown":
            data["status"] = self.status
        if self.last_updated:
            data["last_updated"] = self.last_updated
        return data

def parse_manual_markdown(file_path: str) -> List[Dict]:
    """
    Membaca file Markdown dan mengekstrak blok metadata ID.
    
    Asumsi Format Markdown (contoh):
    ---
    - id: ID-001
      status: active
      frequency: 10
      last_updated: 2023-10-01T12:00:00
    ---
    Atau menggunakan heading per item:
    ### ID-001
    status: active
    frequency: 10
    """
    if not os.path.exists(file_path):
        raise FileNotFoundError(f"File tidak ditemukan: {file_path}")

    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    parsed_ids = []
    
    # Strategi Parsing 1: Mencoba format YAML/Key-Value di dalam blok Markdown
    # Regex ini mencari pola 'id: VALUE' diikuti oleh field opsional lainnya
    # Ini adalah pendekatan yang lebih robust untuk file yang sudah difinalisasi
    
    # Pola untuk satu blok ID
    # Kita akan mencari setiap blok yang dimulai dengan 'id:'
    lines = content.split('
')
    current_id_data = {}
    is_new_block = False
    
    for line in lines:
        stripped_line = line.strip()
        
        # Deteksi awal blok baru berdasarkan prefix 'id:' atau heading '# ... ID-...'
        # Contoh Heading: ### ID-MANUAL-123
        heading_match = re.match(r'^#{1,6}\s+ID[0-9A-Z-]+\s*$', stripped_line)
        id_line_match = re.match(r'^id:\s*(.+)$', stripped_line)
        
        if heading_match or id_line_match:
            # Simpan data blok sebelumnya jika ada
            if current_id_data and 'id' in current_id_data:
                parsed_ids.append(current_id_data)
            
            # Reset untuk blok baru
            current_id_data = {}
            is_new_block = True
            
            if heading_match:
                # Ambil ID dari heading (asumsi format Heading: # Header ID-XXX)
                # Jika heading hanya berisi ID, ambil kata terakhir
                parts = stripped_line.split()
                current_id_data['id'] = parts[-1]
            elif id_line_match:
                current_id_data['id'] = id_line_match.group(1).strip()
                
        elif is_new_block:
            # Parsing field lain dalam blok yang sama
            if re.match(r'^status:\s*(.+)', stripped_line):
                current_id_data['status'] = re.match(r'^status:\s*(.+)', stripped_line).group(1).strip()
            elif re.match(r'^frequency:\s*(.+)', stripped_line):
                freq_str = re.match(r'^frequency:\s*(.+)', stripped_line).group(1).strip()
                try:
                    current_id_data['frequency'] = int(freq_str)
                except ValueError:
                    # Jika frequency bukan integer, biarkan sebagai string atau handle error
                    pass
            elif re.match(r'^last_updated:\s*(.+)', stripped_line):
                current_id_data['last_updated'] = re.match(r'^last_updated:\s*(.+)', stripped_line).group(1).strip()
            
            # Jika menemukan baris kosong atau baris baru yang tidak sesuai pola, 
            # bisa menandakan akhir blok (tergantung struktur file).
            # Untuk fleksibilitas, kita asumsikan blok berlanjut sampai 'id:' berikutnya.
            
    # Jangan lupa menyimpan blok terakhir
    if current_id_data and 'id' in current_id_data:
        parsed_ids.append(current_id_data)

    return parsed_ids

def validate_parsed_data(data_list: List[Dict]) -> List[Dict]:
    """
    Validasi dasar terhadap data yang telah diparsing.
    Memastikan setiap entri memiliki kunci 'id' yang tidak kosong.
    """
    valid_ids = []
    errors = []
    
    for idx, item in enumerate(data_list):
        if not item.get('id'):
            errors.append(f"Baris {idx}: Metadata ID tidak valid (tidak ada kunci 'id').")
            continue
        
        # Normalisasi status
        status = item.get('status', 'unknown').lower()
        if status not in ['active', 'inactive', 'pending', 'unknown']:
            # Tandai status yang tidak dikenal sebagai pending/unknown untuk keamanan
            item['status'] = 'pending'
        
        valid_ids.append(item)
        
    if errors:
        for error in errors:
            print(f"Warning: {error}", file=sys.stderr)
            
    if not valid_ids:
        raise ValueError("Tidak ada ID valid yang diekstrak dari file Markdown.")
        
    return valid_ids

def main():
    parser = argparse.ArgumentParser(
        description="Ekstrak metadata ID dari Markdown dan simpan ke YAML.",
        formatter_class=argparse.RawTextHelpFormatter
    )
    parser.add_argument(
        '--manual', 
        type=str, 
        required=True, 
        help="Path ke file Markdown manual (misal: ID_MANUAL.md)"
    )
    parser.add_argument(
        '--output', 
        type=str, 
        required=True, 
        help="Path ke file YAML output (misal: valid_ids.yaml)"
    )
    
    args = parser.parse_args()
    
    print(f"Memulai ekstraksi data dari: {args.manual}")
    
    try:
        # 1. Parse
        raw_data = parse_manual_markdown(args.manual)
        print(f"Ditemukan {len(raw_data)} blok data kandidat.")
        
        # 2. Validasi
        valid_data = validate_parsed_data(raw_data)
        print(f"Setelah validasi, tersisa {len(valid_data)} ID yang valid.")
        
        # 3. Ekspor ke YAML
        # Konversi list of dict menjadi list of IDMetadata objects lalu ke dict
        id_metadata_objects = [
            IDMetadata(
                id_value=item['id'],
                frequency=item.get('frequency'),
                status=item.get('status', 'unknown'),
                last_updated=item.get('last_updated')
            ) for item in valid_data
        ]
        
        yaml_output_data = [obj.to_dict() for obj in id_metadata_objects]
        
        # Pastikan direktori output ada
        output_dir = os.path.dirname(os.path.abspath(args.output))
        if output_dir and not os.path.exists(output_dir):
            os.makedirs(output_dir)

        with open(args.output, 'w', encoding='utf-8') as f:
            yaml.dump(
                yaml_output_data, 
                f, 
                default_flow_style=False, 
                allow_unicode=True,
                sort_keys=False  # Pertahankan urutan jika penting
            )
            
        print(f"Berhasil menyimpan {len(yaml_output_data)} ID ke: {args.output}")
        
    except FileNotFoundError as e:
        print(f"Error File: {e}", file=sys.stderr)
        sys.exit(1)
    except ValueError as e:
        print(f"Error Data: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error Tak Terduga: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
```

## Penjelasan Detail Fitur

### 1. Parsing Fleksibel
Fungsi `parse_manual_markdown` dirancang untuk menangani dua format umum yang sering ditemukan dalam dokumentasi teknis:
*   **Format YAML-inside-MD:** Menggunakan regex untuk mendeteksi kunci `id:`, `status:`, dll.
*   **Format Heading-based:** Mendeteksi header Markdown (`### ID-XYZ`) sebagai pembatas blok data.

Ini memberikan toleransi terhadap variasi dalam penulisan `ID_MANUAL.md` tanpa harus mengubah kode skrip secara drastis.

### 2. Validasi Data Masuk (Data Validation)
Sebelum data ditulis ke disk, fungsi `validate_parsed_data` menjalankan sanity check:
*   Memastikan setiap entri memiliki kunci `id`.
*   Menormalisasi nilai `status` ke dalam set nilai yang dikenal (`active`, `inactive`, `pending`, `unknown`). Jika terdapat nilai liar (misal: "ok" atau "valid"), sistem secara otomatis将其转换为 `pending` untuk mencegah false positive dalam monitor sinkronisasi.
*   Memberikan *warning* ke stderr jika ada data yang dilewati, memungkinkan auditor mengetahui data apa yang hilang.

### 3. Struktur Output YAML
Output YAML yang dihasilkan (`valid_ids.yaml`) akan memiliki struktur seperti berikut:

```yaml
- id: ID-001
  status: active
  frequency: 15
  last_updated: '2023-10-27T10:00:00'
- id: ID-002
  status: inactive
  frequency: 2
  last_updated: '2023-10-26T14:30:00'
```

Struktur ini flat dan mudah dibaca oleh `id_sync_monitor.py` maupun manusia yang melakukan debugging manual.

## Cara Penggunaan

Setelah menyimpan kode di atas sebagai `id_exporter.py`, jalankan perintah berikut di terminal Anda:

```bash
python id_exporter.py --manual ID_MANUAL.md --output valid_ids.yaml
```

### Contoh Error Handling
Jika file `ID_MANUAL.md` tidak ditemukan:
```text
Error File: File tidak ditemukan: ID_MANUAL_MISSING.md
```

Jika file Markdown kosong atau tidak mengandung pola ID yang valid:
```text
Ditemukan 0 blok data kandidat.
Error Data: Tidak ada ID valid yang diekstrak dari file Markdown.
```

## Tips Perawatan

*   **Update Format Markdown:** Jika struktur `ID_MANUAL.md` berubah (misalnya, menambahkan field baru seperti `owner`), cukup tambahkan regex baru di dalam fungsi `parse_manual_markdown` dan class `IDMetadata`.
*   **Testing:** Gunakan file Markdown contoh dengan data yang salah (misal: status "error", frekuensi string) untuk memastikan fungsi `validate_parsed_data` menangani anomali dengan baik sebelum diintegrasikan ke pipeline utama.


# id_alert_engine.py

Modul ini bertindak sebagai lapisan notifikasi dalam pipeline pengelolaan ID. Setelah `id_exporter.py` mengekspor data ke dalam format YAML, `id_alert_engine.py` akan membaca file tersebut, memindai anomali status (seperti `Deprecated`) atau metadata yang hilang/invalid, dan mengirimkan laporan terstruktur melalui email.

Ini dirancang untuk memastikan bahwa tim teknis atau pemilik produk (owners) menerima notifikasi real-time saat ID yang seharusnya aktif mengalami degradasi status atau kehilangan konteks metadata yang kritis.

## Fitur Utama

*   **Pemindaian Status Cerdas:** Mengidentifikasi ID dengan status `"Deprecated"`, `"Invalid"`, atau frekuensi kemunculan (`frequency`) bernilai `0`.
*   **Konfigurasi SMTP Fleksibel:** Menggunakan file konfigurasi JSON terpisah untuk kerentanan kredensial yang lebih baik daripada hardcoding di dalam skrip.
*   **Laporan Ringkas:** Mengirim email HTML yang rapi berisi tabel daftar ID yang bermasalah, alasan deprecasi (jika tersedia), dan timestamp terakhir update.

## Persyaratan Sistem

Pastikan Anda memiliki pustaka berikut terinstall di environment Python Anda:

```bash
pip install pyyaml
```

## Format File Konfigurasi SMTP

Sebelum menjalankan skrip, Anda perlu menyiapkan file konfigurasi SMTP dalam format JSON. Simpan file ini dengan nama `smtp_config.json` (atau nama apa pun sesuai parameter `--smtp-config`).

Contoh isi `smtp_config.json`:

```json
{
    "smtp_server": "smtp.gmail.com",
    "smtp_port": 587,
    "use_tls": true,
    "username": "your_email@gmail.com",
    "password": "your_app_password",
    "sender_email": "your_email@gmail.com",
    "sender_name": "ID System Alert",
    "recipient_email": ["admin@example.com", "dev-team@example.com"],
    "subject_prefix": "[ID ALERT] "
}
```

> **Catatan Keamanan:** Jangan pernah menyimpan kredensial SMTP langsung di dalam kode skrip. Gunakan variabel environment atau file konfigurasi yang tidak dilacak oleh versi kontrol (misalnya, tambahkan `smtp_config.json` ke `.gitignore`).

## Cara Penggunaan

Jalankan skrip dengan menentukan path ke file YAML hasil ekspor dari `id_exporter.py` dan path ke file konfigurasi SMTP.

```bash
python id_alert_engine.py --yaml valid_ids.yaml --smtp-config smtp_config.json
```

### Argumen Baris Perintah

| Argumen | Deskripsi | Wajib? |
| :--- | :--- | :--- |
| `--yaml` | Path absolut atau relatif ke file YAML hasil ekspor (misal: `valid_ids.yaml`). | Ya |
| `--smtp-config` | Path ke file JSON konfigurasi SMTP. | Ya |

### Output Console

Jika eksekusi berhasil, skrip akan mencetak ringkasan ke terminal:

```text
[INFO] Membaca konfigurasi SMTP dari: smtp_config.json
[INFO] Memuat data ID dari: valid_ids.yaml
[INFO] Ditemukan 3 ID bermasalah (Deprecated/Frekvensi 0).
[INFO] Mengirimkan email notifikasi ke: admin@example.com
[SUCCESS] Email notifikasi berhasil dikirim.
```

Jika terjadi kegagalan SMTP atau data tidak valid:

```text
[ERROR] Gagal mengirim email: SMTPAuthenticationError: Login failed.
[ERROR] Gagal memuat YAML: ValidationError: Field 'frequency' expected type int.
```

## Contoh Logika Pendeteksian

Skrip ini akan menandai sebuah entri ID untuk notifikasi jika memenuhi salah satu kondisi berikut:

1.  **Status Deprecated:** Field `status` dalam data YAML adalah `"Deprecated"`.
2.  **Frekuensi Nol:** Field `frequency` bernilai `0` atau `null` (mengindikasikan ID tidak lagi digunakan atau data tidak lengkap).
3.  **Metadata Hilang:** Field `reason` (alasan deprecasi) kosong pada entri yang berstatus `Deprecated`.

## Tips Perawatan & Integrasi

### 1. Automasi dengan Cron/Task Scheduler
Untuk pemantauan berkelanjutan, tambahkan skrip ini ke crontab Linux atau Task Scheduler Windows untuk dijalankan setiap jam atau setiap hari:

```cron
# Jalankan setiap hari pada pukul 08:00 pagi
0 8 * * * /usr/bin/python3 /path/to/id_alert_engine.py --yaml /path/to/valid_ids.yaml --smtp-config /path/to/smtp_config.json >> /var/log/id_alert.log 2>&1
```

### 2. Kustomisasi Template Email
Jika Anda ingin mengubah tampilan email HTML, cari fungsi `generate_email_html` di dalam `id_alert_engine.py`. Anda dapat menyesuaikan template Jinja2 (jika digunakan) atau string f-string untuk menambahkan logo perusahaan atau footer legal.

### 3. Penanganan Error SMTP
Skrip ini menggunakan retry mechanism sederhana. Jika koneksi gagal, skrip akan mencoba ulang hingga 3 kali dengan jeda 5 detik. Jika konfigurasi salah (misal: port salah), skrip akan langsung abort dengan pesan error jelas untuk mempercepat debugging infrastruktur.

### 4. Pengembangan Lanjutan
*   **Webhook Support:** Anda dapat memperluas skrip ini untuk menambahkan endpoint Slack/Discord webhook sebagai alternatif email, terutama untuk tim DevOps yang lebih responsif terhadap notifikasi instan.
*   **Filtering Lanjutan:** Tambahkan argumen `--exclude-status` untuk mengecualikan status tertentu dari notifikasi jika ada status "Deprecated" yang sudah ditangani secara manual dan tidak memerlukan alarm.


## Deteksi Kadaluarsa Validasi (Validation Expiry Check)

Selain mendeteksi status deprecated, penting juga untuk memastikan bahwa ID yang masih berstatus **Active** memiliki metadata validasi yang terkini. Skrip `id_compliance_checker.py` dirancang untuk menjalankan audit kompliance berkala, memastikan tidak ada ID "Active" yang terlupakan atau tidak diverifikasi dalam jangka waktu tertentu.

### 1. Overview Skrip

Skrip ini bekerja sebagai layer keamanan tambahan dengan fokus pada integritas data. Alur kerjanya adalah sebagai berikut:

1.  Membaca file YAML input (output dari `id_exporter.py` atau skrip pendeteksi lain).
2.  Memfilter entri yang memiliki `status: "Active"`.
3.  Memeriksa field `last_validation_timestamp`.
    *   Jika field kosong atau hilang, dianggap **Expired**.
    *   Jika field berisi timestamp, skrip menghitung selisih waktu dengan waktu saat ini (`now`).
    *   Jika selisih waktu > 7 hari (168 jam), maka ID tersebut ditandai sebagai **Expired Validation**.
4.  Menghasilkan file CSV containing daftar ID yang tidak memenuhi kriteria validasi.

### 2. Instalasi dan Dependensi

Pastikan library berikut terinstall di environment Python Anda:

```bash
pip install pyyaml pandas python-dateutil
```

*   `pyyaml`: Untuk parsing file YAML.
*   `pandas`: Untuk pembuatan laporan CSV yang efisien.
*   `python-dateutil`: Untuk parsing string timestamp yang robust (mendukung berbagai format ISO 8601).

### 3. Implementasi Skrip (`id_compliance_checker.py`)

Simpan kode berikut sebagai `id_compliance_checker.py`:

```python
#!/usr/bin/env python3
"""
id_compliance_checker.py
Verifies that 'Active' IDs have a validation timestamp within the last 7 days.

Usage:
    python id_compliance_checker.py --yaml input_data.yaml --output expired_report.csv
"""

import argparse
import csv
import sys
from datetime import datetime, timedelta
from pathlib import Path

import yaml
import pandas as pd
from dateutil import parser as date_parser


# Konfigurasi
DAYS_THRESHOLD = 7
REQUIRED_FIELDS = ["id", "status", "last_validation_timestamp"]


def load_yaml_data(yaml_path: str) -> list:
    """Memuat dan memvalidasi struktur dasar data YAML."""
    path = Path(yaml_path)
    if not path.exists():
        raise FileNotFoundError(f"File YAML tidak ditemukan: {yaml_path}")
    
    with open(path, 'r', encoding='utf-8') as f:
        try:
            data = yaml.safe_load(f)
        except yaml.YAMLError as e:
            raise ValueError(f"Error parsing YAML: {e}")

    # Handle jika data berupa dictionary tunggal atau list
    if isinstance(data, dict):
        return [data]
    elif isinstance(data, list):
        return data
    else:
        raise ValueError("Format YAML tidak didukung. Harap gunakan List atau Dictionary.")


def parse_timestamp(ts_value) -> datetime:
    """Membantu memparse string timestamp menjadi objek datetime."""
    if ts_value is None:
        return None
    
    try:
        # dateutil.parser handles many ISO 8601 variants automatically
        return date_parser.parse(str(ts_value))
    except (ValueError, TypeError) as e:
        print(f"Warning: Tidak dapat memparse timestamp '{ts_value}'. Dianggap invalid.", file=sys.stderr)
        return None


def check_compliance(ids_data: list) -> pd.DataFrame:
    """
    Memindai data dan mengembalikan DataFrame berisi ID yang kadaluarsa validasinya.
    """
    expired_ids = []
    current_time = datetime.now()
    cutoff_time = current_time - timedelta(days=DAYS_THRESHOLD)

    print(f"[*] Memulai pemeriksaan kompliance. Batas waktu: {cutoff_time.isoformat()}")
    print(f"[*] Total entri data: {len(ids_data)}")

    for entry in ids_data:
        # Pastikan entri adalah dictionary
        if not isinstance(entry, dict):
            continue

        # Ambil status (default ke None jika tidak ada)
        status = entry.get("status")
        
        # Hanya proses jika status adalah "Active"
        if status != "Active":
            continue

        # Ambil ID dan Timestamp
        record_id = entry.get("id", "UNKNOWN_ID")
        raw_timestamp = entry.get("last_validation_timestamp")

        # Logika Pendeteksian Kadaluarsa
        is_expired = False
        reason = ""

        if raw_timestamp is None or raw_timestamp == "":
            is_expired = True
            reason = "Metadata Hilang (Null/Empty)"
        else:
            timestamp_obj = parse_timestamp(raw_timestamp)
            
            if timestamp_obj is None:
                # Jika parsing gagal, anggap expired karena data tidak valid
                is_expired = True
                reason = "Format Timestamp Invalid"
            elif timestamp_obj < cutoff_time:
                is_expired = True
                reason = f"Terlalu Lama (> {DAYS_THRESHOLD} hari)"

        if is_expired:
            expired_ids.append({
                "id": record_id,
                "status": "Active",
                "last_validation_timestamp": raw_timestamp,
                "expiry_reason": reason,
                "last_valid": timestamp_obj.isoformat() if timestamp_obj else "N/A"
            })

    # Buat DataFrame
    if expired_ids:
        df = pd.DataFrame(expired_ids)
        print(f"[!] Ditemukan {len(df)} ID yang kadaluarsa validasinya.")
        return df
    else:
        print("[✓] Tidak ada ID yang kadaluarsa. Semua validasi aktif.")
        return pd.DataFrame(columns=["id", "status", "last_validation_timestamp", "expiry_reason", "last_valid"])


def save_report(df: pd.DataFrame, output_path: str):
    """Menyimpan laporan ke dalam file CSV."""
    df.to_csv(output_path, index=False)
    print(f"[+] Laporan berhasil disimpan ke: {output_path}")


def main():
    parser = argparse.ArgumentParser(
        description="Periksa kepatuhan validasi timestamp untuk ID berstatus Active."
    )
    parser.add_argument(
        "--yaml", 
        required=True, 
        help="Path ke file input YAML (hasil dari id_exporter.py)"
    )
    parser.add_argument(
        "--output", 
        required=True, 
        help="Path ke file output CSV untuk laporan kompliance"
    )

    args = parser.parse_args()

    try:
        # 1. Load Data
        print(f"[*] Memuat data dari: {args.yaml}")
        data = load_yaml_data(args.yaml)
        
        # 2. Proses Logika
        report_df = check_compliance(data)
        
        # 3. Simpan Output
        if not report_df.empty:
            save_report(report_df, args.output)
        else:
            # Opsional: Buat file kosong jika tidak ada error, atau skip
            print("Tidak ada laporan yang dihasilkan (semua bersih).")
            
    except Exception as e:
        print(f"[ERROR] Terjadi kesalahan: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
```

### 4. Cara Penggunaan

#### Command Line Basic
Untuk menjalankan pemeriksaan dan menghasilkan laporan:

```bash
python id_compliance_checker.py --yaml valid_ids.yaml --output compliance_report.csv
```

#### Output CSV
File `compliance_report.csv` akan memiliki struktur kolom berikut:

| Kolom | Deskripsi |
| :--- | :--- |
| `id` | ID unik yang berstatus Active. |
| `status` | Selalu "Active" (karena ini adalah filter). |
| `last_validation_timestamp` | Nilai timestamp asli dari YAML. |
| `expiry_reason` | Alasan mengapa dianggap kadaluarsa (misal: "Terlalu Lama"). |
| `last_valid` | Timestamp parsed yang dianggap valid (ISO format). |

### 5. Integrasi dengan Pipeline existing

Skrip ini dapat digabungkan dengan `id_alert_engine.py` untuk membuat pipeline monitoring end-to-end.

**Skenario Alur Kerja:**

1.  **Ekspor:** `id_exporter.py` menghasilkan `data_daily.yaml`.
2.  **Audit:** `id_compliance_checker.py` membaca `data_daily.yaml` dan menghasilkan `audit_expired.csv`.
3.  **Alerting:** Skrip notifikasi (atau skrip baru) membaca `audit_expired.csv`. Jika baris ada, kirim email/notifikasi Slack kepada tim pemeliharaan untuk segera memvalidasi ID tersebut.

**Contoh Integrasi Cron:**

Tambahkan baris berikut ke `crontab -e` untuk menjalankan audit setiap pagi:

```cron
# Jalankan eksport data jam 00:00, lalu audit kompliance jam 01:00
0 0 * * * /usr/bin/python3 /opt/scripts/id_exporter.py --output /opt/data/daily.yaml
0 1 * * * /usr/bin/python3 /opt/scripts/id_compliance_checker.py --yaml /opt/data/daily.yaml --output /var/log/compliance_expired.csv >> /var/log/compliance_check.log 2>&1
```

### 6. Pertimbangan Teknis

*   **Timezone Awareness:** Skrip ini menggunakan `datetime.now()` yang bersifat lokal (naive). Jika server Anda berada di timezone berbeda dengan sumber data timestamp, pastikan untuk mengkonfigurasi timezone secara eksplisit (misal, menggunakan `pytz` atau `zoneinfo`) sebelum melakukan perbandingan waktu.
*   **Performa:** Untuk file YAML dengan ratusan ribu entri, penggunaan `pandas` membantu mempercepat proses filtering. Namun, parsing YAML tetap menjadi bottleneck I/O. Untuk skenario big data, pertimbangkan untuk mengonversi YAML ke Parquet atau JSON lines.
*   **Ekstensi Threshold:** Jika kebijakan perusahaan berubah menjadi 30 hari, Anda dapat mengubah variabel `DAYS_THRESHOLD = 7` menjadi `30` atau menambahkan argumen `--days 30` pada argparse di masa depan.


### 7. Pembuatan Laporan Audit Terpadu (`id_report_generator.py`)

Untuk memenuhi kebutuhan pelaporan manajemen dan audit eksternal, skrip `id_report_generator.py` disediakan sebagai tahap akhir dalam pipeline. Skrip ini berfungsi sebagai agregator data yang menggabungkan sumber data mentah (YAML) dengan hasil pemrosesan kompliance (CSV) menjadi satu dokumen Excel yang terstruktur dan siap cetak.

#### 7.1. Arsitektur dan Output

Skrip ini tidak melakukan perhitungan logika bisnis baru, melainkan fokus pada **penggabungan data (data joining)** dan **formatting**. Output yang dihasilkan adalah file Excel (`.xlsx`) dengan tiga sheet (tab) terpisah untuk memudahkan navigasi oleh auditor:

1.  **`Data_ID`**: Memuat data mentah dari file YAML asli (`id_exporter.py` output). Ini berfungsi sebagai "ground truth" untuk setiap entri ID.
2.  **`Audit_Kadaluarsa`**: Memuat detail pelanggaran dari file CSV (`id_compliance_checker.py` output). Sheet ini berfokus pada entri yang telah ditandai tidak valid.
3.  **`Ringkasan_Eksekusi`**: Berisi metadata teknis tentang laporan ini, termasuk timestamp generasi, path file input yang digunakan, dan status eksekusi skrip. Ini sangat penting untuk *audit trail* (jejak audit).

#### 7.2. Instalasi Dependensi

Skrip ini menggunakan pustaka `openpyxl` untuk manipulasi file Excel. Pastikan dependensi ini terinstall di lingkungan Python Anda:

```bash
pip install openpyxl
```

#### 7.3. Penggunaan (Usage)

Skrip dapat dijalankan dari baris perintah dengan menyediakan path untuk file input dan output.

**Sintaks:**
```bash
python id_report_generator.py --yaml <path_to_yam_file> --audit-csv <path_to_csv_file> --output <path_to_output_xlsx>
```

**Contoh Eksekusi:**
```bash
python id_report_generator.py \
  --yaml /opt/data/daily.yaml \
  --audit-csv /var/log/compliance_expired.csv \
  --output /reports/audit_laporan_20231027.xlsx
```

#### 7.4. Struktur Kode Skrip

Berikut adalah implementasi lengkap untuk `id_report_generator.py`:

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
id_report_generator.py

Skrip ini membaca data dari file YAML (hasil id_exporter.py) dan 
file CSV (hasil id_compliance_checker.py) untuk menggabungkannya menjadi 
laporan Excel (.xlsx) yang terstruktur.

Sheet Output:
1. Data_ID: Data mentah dari YAML.
2. Audit_Kadaluarsa: Detail pelanggaran dari CSV.
3. Ringkasan_Eksekusi: Metadata laporan.
"""

import argparse
import os
import sys
import yaml
import csv
import pandas as pd
from datetime import datetime
from openpyxl import Workbook
from openpyxl.styles import Font, Alignment, Border, Side, PatternFill

# Konfigurasi Style Dasar untuk Excel
HEADER_FONT = Font(bold=True, color="FFFFFF")
HEADER_FILL = PatternFill(start_color="4472C4", end_color="4472C4", fill_type="solid")
HEADER_BORDER = Border(left=Side(style='thin'), right=Side(style='thin'),
                       top=Side(style='thin'), bottom=Side(style='thin'))
HEADER_ALIGNMENT = Alignment(horizontal="center", vertical="center")

def parse_arguments():
    parser = argparse.ArgumentParser(description="Generate combined Audit Report from YAML and CSV sources.")
    parser.add_argument('--yaml', required=True, help="Path to the exported YAML file (from id_exporter.py)")
    parser.add_argument('--audit-csv', required=True, help="Path to the compliance audit CSV file (from id_compliance_checker.py)")
    parser.add_argument('--output', required=True, help="Path for the output Excel file (.xlsx)")
    return parser.parse_args()

def load_yaml_data(yaml_path):
    """Memuat data dari file YAML."""
    if not os.path.exists(yaml_path):
        raise FileNotFoundError(f"File YAML tidak ditemukan: {yaml_path}")
    
    with open(yaml_path, 'r', encoding='utf-8') as f:
        # Asumsi: YAML berisi daftar dictionary atau struktur yang dapat dikonversi ke DataFrame
        # Jika YAML memiliki struktur root key, sesuaikan dengan mengakses key tersebut.
        # Contoh: yaml_data = yaml.safe_load(f)
        # Untuk fleksibilitas, kita coba load sebagai list atau dict.
        raw_data = yaml.safe_load(f)
    
    if isinstance(raw_data, list):
        return pd.DataFrame(raw_data)
    elif isinstance(raw_data, dict):
        # Jika YAML berisi satu objek besar, konversi ke baris tunggal atau flatten
        # Di sini kita asumsikan untuk demo kita convert dict sederhana ke df
        return pd.DataFrame([raw_data])
    else:
        raise ValueError("Format YAML tidak didukung. Harap gunakan List atau Dict.")

def load_csv_data(csv_path):
    """Memuat data dari file CSV hasil audit."""
    if not os.path.exists(csv_path):
        raise FileNotFoundError(f"File CSV Audit tidak ditemukan: {csv_path}")
    return pd.read_csv(csv_path)

def apply_excel_formatting(ws, dataframe):
    """
    Memformat Header kolom di worksheet Excel agar terlihat profesional.
    """
    ws.auto_filter.ref = ws.dimensions
    for cell in ws[1]:
        cell.font = HEADER_FONT
        cell.fill = HEADER_FILL
        cell.border = HEADER_BORDER
        cell.alignment = HEADER_ALIGNMENT
    return ws

def generate_report(yaml_path, csv_path, output_path):
    print(f"[INFO] Memuat data YAML dari: {yaml_path}")
    df_yaml = load_yaml_data(yaml_path)
    
    print(f"[INFO] Memuat data CSV Audit dari: {csv_path}")
    df_csv = load_csv_data(csv_path)
    
    print("[INFO] Membuat workbook Excel...")
    wb = Workbook()
    
    # --- Sheet 1: Data_ID ---
    ws_data = wb.active
    ws_data.title = "Data_ID"
    
    # Bersihkan sheet awal jika ada
    wb.remove(wb["Sheet"])
    
    # Tulis data
    for r_idx, row in enumerate(df_yaml.values, 1):
        for c_idx, value in enumerate(row, 1):
            cell = ws_data.cell(row=r_idx, column=c_idx, value=value)
    
    # Tulis headers
    for col_idx, col_name in enumerate(df_yaml.columns, 1):
        cell = ws_data.cell(row=1, column=col_idx, value=col_name)
        cell.font = HEADER_FONT
        cell.fill = HEADER_FILL
        cell.border = HEADER_BORDER
        cell.alignment = HEADER_ALIGNMENT
        
    ws_data.auto_filter.ref = ws_data.dimensions
    # Set kolom width otomatis (sederhana)
    for column in ws_data.columns:
        max_length = 0
        column_letter = column[0].column_letter
        for cell in column:
            try:
                if len(str(cell.value)) > max_length:
                    max_length = len(str(cell.value))
            except:
                pass
        adjusted_width = (max_length + 2) * 1.2
        ws_data.column_dimensions[column_letter].width = adjusted_width

    # --- Sheet 2: Audit_Kadaluarsa ---
    ws_audit = wb.create_sheet("Audit_Kadaluarsa")
    
    for r_idx, row in enumerate(df_csv.values, 1):
        for c_idx, value in enumerate(row, 1):
            cell = ws_audit.cell(row=r_idx, column=c_idx, value=value)

    for col_idx, col_name in enumerate(df_csv.columns, 1):
        cell = ws_audit.cell(row=1, column=col_idx, value=col_name)
        cell.font = HEADER_FONT
        cell.fill = HEADER_FILL
        cell.border = HEADER_BORDER
        cell.alignment = HEADER_ALIGNMENT
        
    ws_audit.auto_filter.ref = ws_audit.dimensions
    for column in ws_audit.columns:
        max_length = 0
        column_letter = column[0].column_letter
        for cell in column:
            try:
                if len(str(cell.value)) > max_length:
                    max_length = len(str(cell.value))
            except:
                pass
        adjusted_width = (max_length + 2) * 1.2
        ws_audit.column_dimensions[column_letter].width = adjusted_width

    # --- Sheet 3: Ringkasan_Eksekusi ---
    ws_summary = wb.create_sheet("Ringkasan_Eksekusi")
    
    summary_data = [
        ["Parameter", "Nilai"],
        ["Timestamp Generated", datetime.now().strftime("%Y-%m-%d %H:%M:%S")],
        ["File Input YAML", os.path.abspath(yaml_path)],
        ["File Input CSV", os.path.abspath(csv_path)],
        ["Total Entri ID (YAML)", len(df_yaml)],
        ["Total Pelanggaran Ditemukan (CSV)", len(df_csv)],
        ["Status", "Berhasil"],
        ["Versi Skrip", "1.0"]
    ]
    
    for r_idx, row in enumerate(summary_data, 1):
        for c_idx, value in enumerate(row, 1):
            cell = ws_summary.cell(row=r_idx, column=c_idx, value=value)
            if r_idx == 1:
                cell.font = HEADER_FONT
                cell.fill = HEADER_FILL
                cell.border = HEADER_BORDER
            else:
                # Merge cell untuk label jika perlu, atau rata kiri
                cell.alignment = Alignment(horizontal="left")

    # Simpan file
    try:
        wb.save(output_path)
        print(f"[SUCCESS] Laporan berhasil dibuat: {os.path.abspath(output_path)}")
    except PermissionError:
        print(f"[ERROR] Gagal menyimpan file. Pastikan path '{output_path}' tidak sedang terbuka atau memiliki izin baca/tulis.", file=sys.stderr)
        sys.exit(1)

def main():
    args = parse_arguments()
    try:
        generate_report(args.yaml, args.audit_csv, args.output)
    except Exception as e:
        print(f"[ERROR] Terjadi kesalahan selama proses pembuatan laporan: {str(e)}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
```

#### 7.5. Integrasi ke Cron Job

Untuk mengotomatisasi pembuatan laporan harian, tambahkan baris berikut ke `crontab -e`. Skrip ini akan dijalankan segera setelah proses audit selesai.

```cron
# Jalankan eksport data jam 00:00
0 0 * * * /usr/bin/python3 /opt/scripts/id_exporter.py --output /opt/data/daily.yaml

# Jalankan audit kompliance jam 01:00
0 1 * * * /usr/bin/python3 /opt/scripts/id_compliance_checker.py --yaml /opt/data/daily.yaml --output /var/log/compliance_expired.csv >> /var/log/compliance_check.log 2>&1

# Jalankan generator laporan jam 02:00 (setelah audit selesai)
0 2 * * * /usr/bin/python3 /opt/scripts/id_report_generator.py \
  --yaml /opt/data/daily.yaml \
  --audit-csv /var/log/compliance_expired.csv \
  --output /reports/audit_laporan_$(date +\%Y\%m\%d).xlsx >> /var/log/report_generation.log 2>&1
```

#### 7.6. Pertimbangan Lanjutan untuk Laporan Excel

1.  **Formatting Kondisi (Conditional Formatting):**
    Jika Anda ingin menyorot baris dengan risiko tinggi di sheet `Audit_Kadaluarsa`, Anda dapat menggunakan fitur `openpyxl` untuk menambahkan conditional formatting. Misalnya, beri warna merah pada kolom `expiry_reason` jika mengandung kata "Critical".

2.  **Pengaturan Koneksi Data (Data Validation):**
    Untuk sheet `Data_ID`, jika daftar ID-nya sangat panjang, pertimbangkan untuk membatasi tampilan hanya pada kolom kunci (seperti `ID_Number`, `Status`, `Last_Valid`) untuk menjaga ukuran file tetap kecil dan performa Excel tetap ringan.

3.  **Keamanan:**
    Pastikan file Excel yang dihasilkan (`/reports/`) memiliki izin akses yang terbatas jika mengandung data sensitif. Gunakan `os.chmod` di dalam skrip atau set izin folder secara sistemik.
    ```python
    import os
    os.chmod(output_path, 0o640)  # Hanya owner dan group yang bisa baca
    ```


### 7.7. Ekstraksi Data Lanjutan dengan `excel_parser.py`

Setelah laporan Excel dihasilkan, seringkali diperlukan pemrosesan lanjutan untuk integrasi dengan sistem monitoring, notifikasi email, atau dashboard analitik. Untuk tujuan tersebut, skrip `excel_parser.py` menyediakan kemampuan untuk mengekstrak data spesifik dari sheet `Audit_Kadaluarsa` dan mengonversinya menjadi format JSON yang mudah diproses oleh aplikasi lain.

Skrip ini secara khusus dirancang untuk mengidentifikasi entitas dengan status `'Expired Validation'` dan memetakan alasan kadaluarsanya, menghasilkan output terstruktur berikut:

```json
{
  "extracted_at": "2023-10-27T02:15:00",
  "total_expired": 2,
  "expired_items": [
    {
      "id": "ID-1001",
      "status": "Expired Validation",
      "expiry_reason": "Certificate Expired"
    },
    {
      "id": "ID-1045",
      "status": "Expired Validation",
      "expiry_reason": "License Revoked"
    }
  ]
}
```

#### Instalasi Ketergantungan

Skrip ini bergantung pada perpustakaan `openpyxl` untuk membaca file Excel dan `pandas` (opsional, namun disarankan) untuk manipulasi data yang lebih efisien, atau `xlrd` jika menggunakan format `.xls` lama. Untuk format `.xlsx` modern, pastikan `openpyxl` terinstall:

```bash
pip install openpyxl
```

#### Implementasi Skrip

Simpan kode berikut sebagai `/opt/scripts/excel_parser.py`:

```python
#!/usr/bin/env python3
"""
excel_parser.py
Mengekstrak data dari sheet 'Audit_Kadaluarsa' pada file Excel hasil 
id_report_generator.py dan menghasilkan file JSON ringkasan untuk ID 
dengan status 'Expired Validation'.

Contoh Penggunaan:
    python3 excel_parser.py --input /reports/audit_laporan_20231027.xlsx --output /data/expired_summary.json
"""

import argparse
import json
import os
import sys
from datetime import datetime

try:
    import openpyxl
    import pandas as pd
except ImportError:
    print("Error: Diperlukan library 'openpyxl' dan 'pandas'. Instal dengan: pip install openpyxl pandas", file=sys.stderr)
    sys.exit(1)

def extract_expired_data(input_path, output_path):
    """
    Membaca file Excel, memfilter status 'Expired Validation', dan menyimpan hasil ke JSON.
    """
    if not os.path.exists(input_path):
        print(f"Error: File input tidak ditemukan: {input_path}", file=sys.stderr)
        sys.exit(1)

    try:
        # Load workbook dan ambil sheet 'Audit_Kadaluarsa'
        wb = openpyxl.load_workbook(input_path, read_only=True, data_only=True)
        
        # Cek apakah sheet 'Audit_Kadaluarsa' ada
        if 'Audit_Kadaluarsa' not in wb.sheetnames:
            print(f"Error: Sheet 'Audit_Kadaluarsa' tidak ditemukan dalam file {input_path}.", file=sys.stderr)
            wb.close()
            sys.exit(1)

        ws = wb['Audit_Kadaluarsa']
        expired_items = []
        
        # Asumsi header ada di baris pertama. Sesuaikan indeks kolom jika strukturnya berbeda.
        # Biasanya: Col A = ID, Col B = Status, Col C = Expiry_Reason
        # Kita iterasi dimulai dari baris kedua (index 1) karena baris 1 adalah header
        
        for row_idx, row in enumerate(ws.iter_rows(min_row=2, values_only=True), start=2):
            if len(row) < 3:
                continue
                
            item_id = row[0]
            status = row[1]
            reason = row[2]

            # Filter hanya status yang tepat 'Expired Validation' (case-insensitive untuk keamanan)
            if status and str(status).strip().lower() == 'expired validation':
                expired_items.append({
                    "id": str(item_id).strip() if item_id else "",
                    "status": status,
                    "expiry_reason": str(reason).strip() if reason else "Unknown"
                })

        wb.close()

        # Susun output JSON
        summary = {
            "extracted_at": datetime.now().isoformat(),
            "total_expired": len(expired_items),
            "expired_items": expired_items
        }

        # Tulis ke file output
        output_dir = os.path.dirname(output_path)
        if output_dir and not os.path.exists(output_dir):
            os.makedirs(output_dir, exist_ok=True)

        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(summary, f, indent=4, ensure_ascii=False)

        print(f"Berhasil. {len(expired_items)} entitas kadaluarsa diekstrak ke {output_path}")

    except Exception as e:
        print(f"Terjadi kesalahan saat memproses file: {e}", file=sys.stderr)
        sys.exit(1)

def main():
    parser = argparse.ArgumentParser(description="Ekstrak data audit kadaluarsa dari Excel ke JSON.")
    parser.add_argument('--input', required=True, help='Path ke file Excel input (misal: /reports/audit_laporan_YYYYMMDD.xlsx)')
    parser.add_argument('--output', required=True, help='Path ke file JSON output')
    
    args = parser.parse_args()
    extract_expired_data(args.input, args.output)

if __name__ == "__main__":
    main()
```

#### Otomatisasi Pas-Proses (Post-Processing Cron)

Untuk menjaga alur otomatisasi tetap lancar, tambahkan entri `cron` baru setelah generator laporan selesai, agar data JSON selalu siap untuk dikirim ke sistem monitoring atau diproses lebih lanjut.

Tambahkan baris berikut ke `crontab -e`:

```cron
# Jalankan parser data 02:05 (5 menit setelah generator laporan selesai)
# Menggunakan glob untuk mencocokkan file hari ini jika nama file dinamis, 
# atau sesuaikan path sesuai kebutuhan. Di sini kita asumsikan kita mencari file terbaru.
0 2 * * * /usr/bin/python3 /opt/scripts/excel_parser.py \
  --input /reports/audit_laporan_$(date +\%Y\%m\%d).xlsx \
  --output /data/expired_summary_$(date +\%Y\%m\%d).json >> /var/log/excel_parser.log 2>&1
```

> **Catatan Penting:** Pastikan direktori `/data/` sudah ada dan memiliki izin tulis yang sesuai untuk user yang menjalankan cron job. Jika struktur nama file Excel berubah, argumen `--input` pada crontab perlu disesuaikan.

#### Pertimbangan Skalabilitas

1.  **Kinerja pada File Besar:** Jika laporan Excel mengandung ratusan ribu baris, pembacaan sel-per-sel (`ws.iter_rows`) bisa menjadi lambat. Untuk kasus tersebut, pertimbangkan untuk menggunakan `pandas.read_excel` dengan parameter `engine='openpyxl'` dan filter dataframe sebelum konversi JSON, atau gunakan mode `read_only=True` yang sudah diterapkan dalam skrip di atas untuk menghemat memori.
2.  **Validasi Schema:** Output JSON dihasilkan dengan schema tetap. Jika downstream system memerlukan field tambahan (misalnya `timestamp_of_expiry`), pastikan kolom tersebut ada di sheet Excel dan ditambahkan ke dalam logika `append` pada skrip.
3.  **Handelling Missing Values:** Skrip ini memberikan nilai default `"Unknown"` jika kolom alasan kadaluarsa kosong. Ini mencegah error JSON serialization dan memudahkan debugging di dashboard downstream.


#### Otomatisasi Pas-Proses (Post-Processing Cron)

Untuk menjaga alur otomatisasi tetap lancar, tambahkan entri `cron` baru setelah generator laporan selesai, agar data JSON selalu siap untuk dikirim ke sistem monitoring atau diproses lebih lanjut.

Tambahkan baris berikut ke `crontab -e`:

```cron
# Jalankan parser data
02:05 (5 menit setelah generator laporan selesai)
# Menggunakan glob untuk mencocokkan file hari ini jika nama file dinamis,
# atau sesuaikan path sesuai kebutuhan. Di sini kita asumsikan kita mencari file terbaru.
0 2 * * * /usr/bin/python3 /opt/scripts/excel_parser.py \
  --input /reports/audit_laporan_$(date +\%Y\%m\%d).xlsx \
  --output /data/expired_summary_$(date +\%Y\%m\%d).json >> /var/log/excel_parser.log 2>&1
```

> **Catatan Penting:** Pastikan direktori `/data/` sudah ada dan memiliki izin tulis yang sesuai untuk user yang menjalankan cron job. Jika struktur nama file Excel berubah, argumen `--input` pada crontab perlu disesuaikan.

#### Pertimbangan Skalabilitas

1.  **Kinerja pada File Besar:** Jika laporan Excel mengandung ratusan ribu baris, pembacaan sel-per-sel (`ws.iter_rows`) bisa menjadi lambat. Untuk kasus tersebut, pertimbangkan untuk menggunakan `pandas.read_excel` dengan parameter `engine='openpyxl'` dan filter dataframe sebelum konversi JSON, atau gunakan mode `read_only=True` yang sudah diterapkan dalam skrip di atas untuk menghemat memori.
2.  **Validasi Schema:** Output JSON dihasilkan dengan schema tetap. Jika downstream system memerlukan field tambahan (misalnya `timestamp_of_expiry`), pastikan kolom tersebut ada di sheet Excel dan ditambahkan ke dalam logika `append` pada skrip.
3.  **Handelling Missing Values:** Skrip ini memberikan nilai default `"Unknown"` jika kolom alasan kadaluarsa kosong. Ini mencegah error JSON serialization dan memudahkan debugging di dashboard downstream.

---

### Penambahan: Dashboard Real-Time Updater

Setelah data diekstrak menjadi JSON, langkah selanjutnya adalah memvisualisasikan data tersebut ke dalam dashboard web agar pemangku kepentingan dapat memantau status kadaluarsa aset secara *real-time*. Skrip `json_to_dashboard_updater.py` dirancang khusus untuk tujuan ini.

#### Deskripsi Skrip

`json_to_dashboard_updater.py` adalah utility Python ringan yang mengambil file JSON yang dihasilkan oleh `excel_parser.py` dan menyuntikkan data tersebut ke dalam template HTML dasar (`index.html`). Skrip ini menggunakan pendekatan manipulasi string DOM berbasis JavaScript (`Chart.js`) untuk memperbarui dataset grafik tanpa memerlukan backend server yang kompleks.

Alur kerja skrip ini adalah:
1.  Membaca file konfigurasi template HTML.
2.  Membaca file JSON sumber data.
3.  Menyiapkan payload JSON yang disandikan (escaped) agar aman disisipkan ke dalam blok `<script>`.
4.  Melakukan pencarian dan penggantian string placeholder (`{{DASHBOARD_DATA}}`) dengan data JSON aktual.
5.  Menulis hasil HTML yang sudah diperbarui ke file output.

#### Instalasi dan Dependensi

Skrip ini **tidak memerlukan instalasi paket tambahan** (seperti `jinja2` atau `BeautifulSoup`) karena menggunakan modul standar Python:
*   `json`: Untuk parsing dan sanitasi data JSON.
*   `re` atau `str.replace`: Untuk manipulasi string sederhana.

Pastikan file template HTML (`index.html`) Anda mengandung elemen placeholder yang sesuai, seperti contoh di bawah ini:

```html
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Audit</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>Laporan Ekspired Assets</h1>
    <canvas id="expiredChart"></canvas>

    <script>
        // Placeholder data akan diganti oleh updater
        const chartData = {{DASHBOARD_DATA}}; 
        
        const ctx = document.getElementById('expiredChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: chartData.labels,
                datasets: [{
                    label: 'Jumlah Ekspired',
                    data: chartData.values,
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
            },
            options: { scales: { y: { beginAtZero: true } } }
        });
    </script>
</body>
</html>
```

#### Implementasi Skrip

Berikut adalah implementasi lengkap untuk `json_to_dashboard_updater.py`:

```python
#!/usr/bin/env python3
"""
json_to_dashboard_updater.py

Skrip ini membaca data JSON dari hasil parsing Excel dan memperbarui file 
HTML dashboard secara dinamis dengan mengganti placeholder data statis.

Fitur:
- Membaca file JSON sumber data.
- Memvalidasi struktur JSON dasar (opsional).
- Menyimpan data yang sudah disandikan ke dalam template HTML.
- Menghasilkan file HTML baru siap saji untuk web server statis.
"""

import argparse
import json
import sys
import os
import re

def sanitize_json_for_js(json_data):
    """
    Menyiapkan objek JSON untuk disisipkan ke dalam tag <script> JavaScript.
    Menggunakan json.dumps dengan indentasi untuk keterbacaan, 
    dan memastikan tidak ada karakter yang merusak sintaks JS.
    """
    try:
        # Konversi ke string JSON dengan indentasi agar mudah dibaca/debug
        return json.dumps(json_data, indent=4, ensure_ascii=False)
    except (TypeError, ValueError) as e:
        raise ValueError(f"Error serializing JSON data: {e}")

def update_dashboard_html(input_json_path, output_html_path, template_placeholder="{{DASHBOARD_DATA}}):
    """
    Membaca template HTML, mengganti placeholder dengan data JSON, 
    dan menulis ke file output.
    """
    # 1. Validasi Input File
    if not os.path.exists(input_json_path):
        raise FileNotFoundError(f"File JSON tidak ditemukan: {input_json_path}")
    
    # Kita asumsikan template selalu ada di path yang sama dengan script atau hardcode path
    # Untuk fleksibilitas, kita bisa menerima argumen tambahan untuk template, 
    # tapi untuk kesederhanaan, kita gunakan input file yang sama jika tidak ditentukan.
    # Namun, permintaan menyebutkan mengganti file yang 'dihasilkan oleh dashboard_generator.py'.
    # Jadi kita perlu path input HTML. Untuk skrip ini, kita anggap input JSON adalah sumber,
    # dan kita perlu template. Mari kita buat asumsi: input_json_path adalah data, 
    # dan kita perlu mencari template atau menggunakannya sebagai dasar.
    
    # *Revisi Logika*: Agar lebih robust, mari kita buat template dasar inline atau minta user menyediakan template.
    # Namun, instruksi meminta argumen --input (JSON) dan --output (HTML Result).
    # Jika --input adalah JSON, dari mana kita mendapat HTML template?
    # Asumsi: Skrip ini juga membutuhkan path template. Atau, skrip ini hanya memperbarui 
    # file HTML yang sudah ada jika template terintegrasi.
    
    # Untuk memenuhi permintaan "mengganti data statis pada elemen Chart.js ... dengan data real-time",
    # kita akan membaca template HTML dari file yang sama dengan nama basis input JSON atau argumen tambahan.
    # Agar paling kompatibel dengan alur sebelumnya, mari kita asumsikan template ada di direktori yang sama
    # dengan nama 'dashboard_template.html'. Jika user ingin file HTML spesifik, mereka bisa mereferensikannya.
    
    # *Koreksi berdasarkan prompt*: Prompt meminta argumen --input (JSON) dan --output (HTML Result).
    # Ini menyiratkan skrip ini mungkin membaca template dari lokasi default atau template itu sendiri adalah file HTML statis.
    # Mari kita tambahkan argumen opsional --template untuk fleksibilitas, atau gunakan default.
    # Untuk kepatuhan ketat terhadap prompt (hanya --input dan --output), kita akan mencari template 'default_dashboard.html'
    # di direktori yang sama, atau skrip ini dianggap sebagai bagian dari pipeline di mana HTML sebelumnya sudah ada.
    
    # Solusi Terbaik: Gunakan argumen --input untuk JSON, dan kita perlu source HTML.
    # Jika prompt membatasi hanya --input dan --output, maka skrip ini mungkin seharusnya membaca 
    # template dari stdin atau file default. Mari kita buat file default 'template_dashboard.html' sebagai bagian dari repo.
    
    template_file = "template_dashboard.html"
    if not os.path.exists(template_file):
        # Fallback: Buat template sederhana jika tidak ada
        create_default_template(template_file)
        print(f"Template default dibuat: {template_file}", file=sys.stderr)

    # 2. Baca Template HTML
    try:
        with open(template_file, 'r', encoding='utf-8') as f:
            html_template = f.read()
    except IOError as e:
        raise IOError(f"Gagal membaca template HTML: {e}")

    # 3. Baca dan Parse JSON
    try:
        with open(input_json_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
    except json.JSONDecodeError as e:
        raise ValueError(f"File JSON tidak valid: {e}")
    except IOError as e:
        raise IOError(f"Gagal membaca file JSON: {e}")

    # 4. Sanitasi dan Penggantian
    json_str = sanitize_json_for_js(data)
    
    # Ganti placeholder dengan data JSON
    if template_placeholder in html_template:
        updated_html = html_template.replace(template_placeholder, json_str)
    else:
        raise ValueError(f"Placeholder '{template_placeholder}' tidak ditemukan dalam template HTML.")

    # 5. Tulis Output
    try:
        with open(output_html_path, 'w', encoding='utf-8') as f:
            f.write(updated_html)
        print(f"Dashboard berhasil diperbarui: {output_html_path}")
    except IOError as e:
        raise IOError(f"Gagal menulis file output: {e}")

def create_default_template(filepath):
    """Membuat template HTML default dengan Chart.js untuk pengembangan awal."""
    default_html = """<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Audit</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>body { font-family: sans-serif; margin: 20px; }</style>
</head>
<body>
    <h1>Laporan Ekspired Assets</h1>
    <div style="width: 80%; margin: auto;">
        <canvas id="expiredChart"></canvas>
    </div>

    <script>
        // Placeholder data akan diganti oleh updater
        const chartData = {{DASHBOARD_DATA}}; 
        
        if (chartData.labels && chartData.values) {
            const ctx = document.getElementById('expiredChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: chartData.labels,
                    datasets: [{
                        label: 'Jumlah Ekspired per Kategori',
                        data: chartData.values,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    scales: { y: { beginAtZero: true } }
                }
            });
        } else {
            console.error("Data Chart tidak valid atau kosong.");
        }
    </script>
</body>
</html>"""
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(default_html)

def main():
    parser = argparse.ArgumentParser(
        description="Perbarui file HTML Dashboard dengan data JSON dari excel_parser.py"
    )
    parser.add_argument(
        "--input", 
        required=True, 
        help="Path ke file JSON hasil parsing Excel (misal: /data/expired_summary_20231025.json)"
    )
    parser.add_argument(
        "--output", 
        required=True, 
        help="Path ke file HTML output yang akan diperbarui (misal: /var/www/html/dashboard/index.html)"
    )
    
    args = parser.parse_args()
    
    try:
        update_dashboard_html(args.input, args.output)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
```

#### Integrasi Cron Job

Untuk mengotomatisasi pembaruan dashboard setiap kali data baru tersedia, tambahkan baris berikut ke `crontab -e` **setelah** entri `excel_parser.py` yang didefinisikan sebelumnya. Pastikan menunggu beberapa detik atau menit agar file JSON sudah selesai ditulis.

```cron
# Jalankan dashboard updater
# Menunggu 10 menit setelah generator laporan selesai (total +15 menit sejak tengah malam +5 menit)
# Asumsi: excel_parser berjalan pada jam 02:00, maka ini berjalan pada 02:10
10 2 * * * /usr/bin/python3 /opt/scripts/json_to_dashboard_updater.py \
  --input /data/expired_summary_$(date +\%Y\%m\%d).json \
  --output /var/www/html/dashboard/index.html \
  >> /var/log/dashboard_updater.log 2>&1
```

> **Catatan Infrastruktur:**
> *   Pastikan server web (misalnya Nginx atau Apache) sudah mengizinkan akses ke direktori `/var/www/html/dashboard/`.
> *   Jika menggunakan Nginx, pastikan `autoindex off;` dan konfigurasi MIME type untuk `.html` sudah benar.
> *   Untuk keamanan, jika dashboard berisi data sensitif, pertimbangkan untuk menambahkan autentikasi sederhana pada direktori web tersebut.

#### Penanganan Error di Browser

Skrip `json_to_dashboard_updater.py` dirancang untuk menghasilkan valid JavaScript. Namun, jika file JSON kosong atau memiliki skema yang tidak sesuai (misalnya, tidak ada kunci `labels` atau `values`), Chart.js akan melempar error di console browser.

Untuk mitigasi di sisi klien (browser), template `template_dashboard.html` menyertakan pengecekan dasar:
```javascript
if (chartData.labels && chartData.values) {
    // Render Chart
} else {
    console.error("Data Chart tidak valid atau kosong.");
}
```
Ini mencegah tampilan error visual pada halaman HTML jika pipeline data gagal.


### Penambahan Modul Audit Keamanan Data

Untuk melengkapi pipeline pemantauan data, kami menyertakan skrip `security_audit.py`. Skrip ini berfungsi sebagai lapisan pertahanan tambahan untuk mendeteksi anomali integritas data sebelum dipublikasikan ke dashboard. Skrip ini melakukan cross-referensi antara laporan rekonsiliasi CSV dan dokumen referensi ID Manual untuk mengidentifikasi pola ancaman seperti "ID Hantu" (ID yang muncul berulang kali dalam konteks tidak valid) atau upaya manipulasi data melalui duplikasi entri.

#### Prasyarat

Pastikan file berikut tersedia di jalur yang didefinisikan:
1.  `reconciliation_report.csv`: Laporan hasil rekonsiliasi data harian.
2.  `ID_MANUAL.md`: Dokumen referensi yang berisi daftar ID valid, status, dan metadata tambahan.

#### Instalasi dan Penggunaan

Skrip ini dapat dijalankan secara mandiri atau diintegrasikan ke dalam alur kerja otomatisasi yang sama dengan `excel_parser.py` dan `json_to_dashboard_updater.py`.

```bash
python3 security_audit.py \
  --csv /data/reconciliation_report.csv \
  --md /data/ID_MANUAL.md \
  --webhook-url "https://hooks.example.com/security-alerts" \
  --threshold 5
```

#### Parameter Argumen

| Argumen | Tipe | Deskripsi |
| :--- | :--- | :--- |
| `--csv` | `string` | Jalur absolut atau relatif ke file laporan rekonsiliasi (`.csv`). |
| `md` | `string` | Jalur ke file daftar ID manual (`.md`). |
| `--webhook-url` | `string` | URL endpoint webhook untuk mengirimkan laporan risiko jika anomali terdeteksi. |
| `--threshold` | `int` | Jumlah maksimum anomali yang diizinkan sebelum skrip mengirim notifikasi risiko (default: `0`). |

#### Mekanisme Deteksi Anomali

Skrip melakukan analisis berbasis aturan sebagai berikut:

1.  **Validasi Eksistensi ID**: Skrip membaca `ID_MANUAL.md` untuk membangun kamus ID valid. Setiap ID dalam `reconciliation_report.csv` yang tidak ditemukan di kamus ini dikategorikan sebagai **Unknown ID**.
2.  **Deteksi "ID Hantu"**: Jika sebuah ID yang tidak valid atau unknown muncul lebih dari satu kali dalam laporan rekonsiliasi dengan status yang sama (misalnya, "Failed" atau "Invalid"), hal ini dicatat sebagai indikasi **ID Hantu**.
3.  **Pola Manipulasi**: Kombinasi ID yang sering muncul dengan status anomali digunakan untuk menghitung skor risiko.

Jika jumlah anomali yang terdeteksi melebihi nilai `--threshold`, skrip akan menyusun payload JSON berisi ringkasan temuan dan mengirimkannya ke `--webhook-url`.

#### Contoh Payload Webhook

Jika anomali terdeteksi, payload yang dikirim ke webhook memiliki struktur berikut:

```json
{
  "alert_type": "SECURITY_AUDIT_FAILURE",
  "timestamp": "2023-10-27T02:15:00Z",
  "anomaly_count": 7,
  "threshold_breached": true,
  "details": [
    {
      "id": "GHOST_ID_001",
      "occurrences": 3,
      "status": "Invalid",
      "severity": "HIGH"
    },
    {
      "id": "UNKNOWN_REF_99",
      "occurrences": 2,
      "status": "Missing",
      "severity": "MEDIUM"
    }
  ],
  "summary": "Total 7 anomali terdeteksi. Teridentifikasi potensi 'ID Hantu' pada referensi GHOST_ID_001."
}
```

> **Catatan Keamanan:**
> *   Pastikan kredensial webhook (jika diperlukan) disimpan dalam variabel lingkungan, bukan di hardcode dalam skrip.
> *   Gunakan HTTPS untuk `--webhook-url` untuk memastikan enkripsi data saat transit.
> *   Untuk produksi, pertimbangkan untuk menambahkan validasi HMAC pada sisi server penerima webhook untuk memverifikasi bahwa permintaan berasal dari sumber yang tepercaya.

#### Integrasi dengan Cron

Tambahkan entri berikut ke `crontab -e` untuk menjalankan audit keamanan segera setelah data rekonsiliasi tersedia (misalnya, 15 menit setelah tengah malam):

```cron
# Jalankan audit keamanan data
# Menjalankan 15 menit setelah tengah malam
15 0 * * * /usr/bin/python3 /opt/scripts/security_audit.py \
  --csv /data/reconciliation_report.csv \
  --md /data/ID_MANUAL.md \
  --webhook-url "https://hooks.example.com/security-alerts" \
  --threshold 3 \
  >> /var/log/security_audit.log 2>&1
```


#### Export Metadata ke Format Terstruktur (YAML)

Untuk keperluan integrasi dengan sistem CI/CD, monitoring, atau database yang memerlukan struktur data terstruktur (bukan sekadar dokumen teks), alat ini menyediakan skrip `id_exporter.py`. Skrip ini membaca file `ID_MANUAL.md` yang telah difinalisasi, mengekstrak metadata kunci dari setiap entri ID, dan menyimpannya ke dalam format YAML yang konsisten.

##### Skrip: `id_exporter.py`

Skrip ini menggunakan library standar `argparse` untuk manajemen argumen dan `PyYAML` untuk serialisasi data. Pastikan library `PyYAML` telah terinstal:

```bash
pip install pyyaml
```

Salin kode berikut ke dalam file `id_exporter.py`:

```python
#!/usr/bin/env python3
"""
id_exporter.py

Mengekstrak metadata dari ID_MANUAL.md dan menyimpannya ke dalam file YAML.
Struktur Markdown yang diharapkan untuk setiap ID:
  ### ID_<HEX_ID>
  - **Status:** <status_string>
  - **Frekuensi:** <int>
  - **Timestamp:** <ISO_8601_string>
  - **Catatan:** <optional_notes>

Argumen:
  --manual: Path ke file Markdown input (wajib)
  --output: Path ke file YAML output (wajib)
"""

import argparse
import re
import sys
import yaml
from datetime import datetime
from typing import Dict, List, Optional


class MarkdownParserError(Exception):
    """Kustom exception untuk kesalahan parsing struktur Markdown."""
    pass


def parse_id_entry(header: str, content_lines: List[str]) -> Optional[Dict]:
    """
    Mengekstrak metadata dari blok teks setelah header ID.
    """
    # Pattern untuk mencari header ID (misal: ### ID_GHOST_ID_001)
    # Kita ambil bagian ID-nya
    id_match = re.match(r"###\s+(ID_[A-Za-z0-9_]+)", header)
    if not id_match:
        return None

    target_id = id_match.group(1)
    
    # Inisialisasi data default
    metadata = {
        "id": target_id,
        "status": "unknown",
        "frequency": 0,
        "last_updated": None,
        "notes": ""
    }

    # Parsing baris konten
    for line in content_lines:
        line = line.strip()
        if not line:
            continue

        # Cek Status
        if line.startswith("**Status:**") or line.startswith("- **Status:**"):
            status_val = line.split(":", 1)[1].strip()
            # Membersihkan tanda baca jika ada
            metadata["status"] = status_val.rstrip(".,")
            
        # Cek Frekuensi
        elif line.startswith("**Frekuensi:**") or line.startswith("- **Frekuensi:**"):
            try:
                freq_val = line.split(":", 1)[1].strip()
                metadata["frequency"] = int(freq_val)
            except ValueError:
                raise MarkdownParserError(f"Frekuensi tidak valid pada {target_id}: {freq_val}")
                
        # Cek Timestamp
        elif line.startswith("**Timestamp:**") or line.startswith("- **Timestamp:**"):
            ts_val = line.split(":", 1)[1].strip()
            try:
                # Validasi format ISO 8601 sederhana
                datetime.fromisoformat(ts_val.replace("Z", "+00:00"))
                metadata["last_updated"] = ts_val
            except ValueError:
                raise MarkdownParserError(f"Timestamp tidak valid pada {target_id}: {ts_val}")
        
        # Cek Catatan (Opsional)
        elif line.startswith("**Catatan:**") or line.startswith("- **Catatan:**"):
            metadata["notes"] = line.split(":", 1)[1].strip()

    return metadata


def read_and_parse_markdown(file_path: str) -> List[Dict]:
    """
    Membaca file Markdown, mengidentifikasi blok ID, dan mengekstrak metadata.
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
    except FileNotFoundError:
        print(f"Error: File tidak ditemukan: {file_path}", file=sys.stderr)
        sys.exit(1)
    except IOError as e:
        print(f"Error: Gagal membaca file: {e}", file=sys.stderr)
        sys.exit(1)

    # Regex untuk memisahkan blok berdasarkan header H3 (###)
    # Ini membagi teks berdasarkan header ID
    blocks = re.split(r"(###\s+ID_[A-Za-z0-9_]+)", content)
    
    # blocks[0] biasanya teks sebelum header pertama (abaikan)
    # Struktur blocks: [prefix, header1, content1, header2, content2, ...]
    
    parsed_data = []
    i = 1
    while i < len(blocks) - 1:
        header = blocks[i]
        content_text = blocks[i+1]
        
        # Bersihkan konten dari pemisah baris ganda di awal jika ada
        content_lines = content_text.strip().splitlines()
        
        try:
            entry = parse_id_entry(header, content_lines)
            if entry:
                parsed_data.append(entry)
        except MarkdownParserError as e:
            print(f"Warning: Lewati entri {header} karena error parsing: {e}", file=sys.stderr)
        
        # Lanjut ke pasangan berikutnya (header, content)
        i += 2

    if not parsed_data:
        raise MarkdownParserError("Tidak ada entri ID valid yang ditemukan dalam file Markdown.")

    return parsed_data


def write_yaml(data: List[Dict], output_path: str) -> None:
    """
    Menyimpan data yang sudah diparsing ke dalam file YAML.
    """
    try:
        # Gunakan safe_dump untuk keamanan, sort_keys=False untuk menjaga urutan
        yaml_content = yaml.safe_dump(
            {"exported_ids": data}, 
            default_flow_style=False, 
            sort_keys=False,
            allow_unicode=True
        )
        
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(yaml_content)
            
        print(f"Berhasil mengekspor {len(data)} entri ke {output_path}")
        
    except IOError as e:
        print(f"Error: Gagal menulis file YAML: {e}", file=sys.stderr)
        sys.exit(1)


def main():
    parser = argparse.ArgumentParser(
        description="Ekstrak metadata ID dari Markdown ke YAML."
    )
    parser.add_argument(
        "--manual", 
        required=True, 
        help="Path ke file ID_MANUAL.md"
    )
    parser.add_argument(
        "--output", 
        required=True, 
        help="Path ke file output YAML (misal: id_metadata.yaml)"
    )
    
    args = parser.parse_args()
    
    try:
        parsed_entries = read_and_parse_markdown(args.manual)
        write_yaml(parsed_entries, args.output)
    except MarkdownParserError as e:
        print(f"Gagal: {e}", file=sys.stderr)
        sys.exit(2)
    except Exception as e:
        print(f"Error tak terduga: {e}", file=sys.stderr)
        sys.exit(3)


if __name__ == "__main__":
    main()
```

##### Cara Penggunaan

Jalankan skrip dari baris perintah dengan menentukan path file Markdown input dan lokasi file YAML output:

```bash
python3 id_exporter.py \
  --manual /data/ID_MANUAL.md \
  --output /data/id_metadata.yaml
```

##### Contoh Output YAML (`id_metadata.yaml`)

Berdasarkan input Markdown, output YAML akan terlihat seperti ini:

```yaml
exported_ids:
- id: GHOST_ID_001
  status: Missing
  frequency: 2
  last_updated: '2023-10-27T10:15:00'
  notes: Potensi ID Hantu terdeteksi
- id: VALID_ID_002
  status: Verified
  frequency: 5
  last_updated: '2023-10-27T08:00:00'
  notes: 
```

##### Penanganan Error

Skrip ini mencakup mekanisme *error handling* berikut:

1.  **File Tidak Ditemukan:** Jika `--manual` tidak mengarah ke file yang ada, skrip akan menghentikan eksekusi dengan pesan error yang jelas.
2.  **Format Markdown Tidak Cocok:** Jika header tidak sesuai dengan pola `### ID_...`, blok tersebut akan diabaikan.
3.  **Validasi Tipe Data:** Jika nilai `Frekuensi` bukan angka atau `Timestamp` bukan format ISO 8601 yang valid, skrip akan mencetak *warning* dan melewatkan entri tersebut, lalu melanjutkan ke entri berikutnya. Ini mencegah skrip crash jika ada satu entri yang korup, sambil memberi tahu operator untuk memeriksa file tersebut.
4.  **Izin Penulisan:** Jika skrip tidak memiliki izin menulis ke direktori tujuan (`--output`), error `IOError` akan ditangkap dan ditampilkan.

##### Integrasi ke Cronjob

Untuk otomatisasi, tambahkan baris berikut ke `crontab -e` agar metadata diekspor setiap kali proses audit selesai:

```cron
# Ekspor metadata ID ke YAML setiap hari pukul 00:30
30 0 * * * /usr/bin/python3 /opt/scripts/id_exporter.py \
  --manual /data/ID_MANUAL.md \
  --output /data/id_metadata.yaml \
  >> /var/log/id_export.log 2>&1
```


##### Auditor Disparansi Metadata (yaml_audit_reporter.py)

Modul ini dirancang untuk melakukan validasi integritas data dengan membandingkan sumber kebenaran meta (`id_metadata.yaml`) terhadap sumber data operasional aktual (`log_analyzer.json`). Tujuannya adalah mengidentifikasi inkonsistensi antara konfigurasi yang diharapkan dengan perilaku sistem yang terekam di log.

**Fitur Utama:**
*   **Validasi Silang Data:** Membaca struktur YAML yang diekspor oleh `id_exporter.py` dan mem-parse file JSON ringkasan log.
*   **Kalkulasi Disparansi:** Menghitung selisih antara `frequency` dari metadata dan `frequency` aktual dari log untuk setiap ID unik.
*   **Ekspor Laporan CSV:** Menghasilkan file `disparity_report.csv` yang dapat dibuka langsung di spreadsheet untuk analisis lebih lanjut.

**Argumen Baris Perintah:**

| Argumen | Deskripsi | Wajib |
| :--- | :--- | :--- |
| `--yaml` | Path ke file metadata YAML (`id_metadata.yaml`). | Ya |
| `--log-json` | Path ke file ringkasan log JSON dari `log_analyzer.py`. | Ya |
| `--output` | Path keluaran untuk file laporan CSV (`disparity_report.csv`). | Ya |

**Contoh Penggunaan:**

```bash
python3 yaml_audit_reporter.py \
  --yaml /data/id_metadata.yaml \
  --log-json /var/log/analyzer/summary.json \
  --output /reports/disparity_check.csv
```

**Struktur Output CSV:**

File CSV yang dihasilkan memiliki header berikut:
1.  `ID`: Identifier unik entitas (misal: `VALID_ID_002`).
2.  `Metadata_Frequency`: Nilai frekuensi yang dicatat di metadata YAML.
3.  `Log_Frequency`: Nilai frekuensi aktual yang ditemukan dalam ringkasan log JSON.
4.  `Discrepancy`: Selisih antara Metadata dan Log (`Metadata - Log`). Nilai `0` menandakan konsistensi sempurna.

**Implementasi Python (`yaml_audit_reporter.py`):**

```python
import argparse
import csv
import json
import yaml
import sys
from pathlib import Path

def load_yaml_metadata(yaml_path):
    """Memuat dan memvalidasi struktur metadata YAML."""
    try:
        with open(yaml_path, 'r') as f:
            data = yaml.safe_load(f)
        if not isinstance(data, list):
            raise ValueError("Format YAML tidak valid: Expected list of records.")
        return data
    except FileNotFoundError:
        print(f"Error: File metadata tidak ditemukan di {yaml_path}", file=sys.stderr)
        sys.exit(1)
    except yaml.YAMLError as e:
        print(f"Error: Gagal mem-parse YAML: {e}", file=sys.stderr)
        sys.exit(1)

def load_log_json(log_path):
    """Memuat ringkasan log JSON."""
    try:
        with open(log_path, 'r') as f:
            data = json.load(f)
        
        # Asumsi struktur JSON: Dictionary dengan key ID dan value dict yang memiliki 'frequency'
        # Jika strukturnya berbeda, sesuaikan parsing di sini.
        return data
    except FileNotFoundError:
        print(f"Error: File log JSON tidak ditemukan di {log_path}", file=sys.stderr)
        sys.exit(1)
    except json.JSONDecodeError as e:
        print(f"Error: Gagal mem-parse JSON: {e}", file=sys.stderr)
        sys.exit(1)

def calculate_disparity(metadata_list, log_data):
    """Membandingkan metadata dengan log dan menghitung disparansi."""
    report = []
    
    for record in metadata_list:
        # Ambil ID, asumsi kunci 'id' ada di setiap record
        record_id = record.get('id')
        if not record_id:
            print(f"Warning: Record tanpa ID ditemukan, dilewati.")
            continue
            
        # Ambil frekuensi dari metadata
        meta_freq = record.get('frequency')
        
        # Ambil frekuensi dari log
        log_freq = log_data.get(record_id, {}).get('frequency', None)
        
        if log_freq is None:
            # Jika ID tidak ada di log, anggap frequency 0 atau catat sebagai anomali
            # Di sini kita ambil 0 untuk perhitungan diskrepansi, atau bisa flag sebagai 'Missing'
            log_freq = 0 
            
        try:
            meta_freq = int(meta_freq)
            log_freq = int(log_freq)
            discrepancy = meta_freq - log_freq
        except (ValueError, TypeError):
            print(f"Warning: Tipe data tidak valid untuk ID {record_id}, dilewati.")
            continue
            
        report.append({
            'ID': record_id,
            'Metadata_Frequency': meta_freq,
            'Log_Frequency': log_freq,
            'Discrepancy': discrepancy
        })
        
    return report

def save_to_csv(report, output_path):
    """Menyimpan laporan ke dalam file CSV."""
    try:
        file_path = Path(output_path)
        file_path.parent.mkdir(parents=True, exist_ok=True)
        
        with open(file_path, 'w', newline='', encoding='utf-8') as csvfile:
            fieldnames = ['ID', 'Metadata_Frequency', 'Log_Frequency', 'Discrepancy']
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
            
            writer.writeheader()
            writer.writerows(report)
            
        print(f"Laporan disparansi berhasil disimpan ke: {output_path}")
        print(f"Total entri diproses: {len(report)}")
        
    except IOError as e:
        print(f"Error: Tidak dapat menulis file ke {output_path}: {e}", file=sys.stderr)
        sys.exit(1)

def main():
    parser = argparse.ArgumentParser(
        description="Auditor Disparansi: Membandingkan metadata YAML dengan ringkasan log JSON."
    )
    parser.add_argument('--yaml', required=True, help='Path ke file metadata YAML (id_metadata.yaml)')
    parser.add_argument('--log-json', required=True, help='Path ke file ringkasan log JSON')
    parser.add_argument('--output', required=True, help='Path keluaran file CSV (disparity_report.csv)')
    
    args = parser.parse_args()
    
    print("Memulai proses audit disparansi...")
    
    # 1. Load Data
    metadata = load_yaml_metadata(args.yaml)
    log_summary = load_log_json(args.log_json)
    
    # 2. Proses Perbandingan
    report_data = calculate_disparity(metadata, log_summary)
    
    # 3. Simpan Hasil
    if report_data:
        save_to_csv(report_data, args.output)
    else:
        print("Tidak ada data yang diproses. Periksa input Anda.")
        sys.exit(1)

if __name__ == '__main__':
    main()
```

**Integrasi ke Cronjob (Tambahan):**

Untuk memastikan laporan disparansi diperbarui secara rutin setelah log dianalisis, tambahkan baris berikut setelah konfigurasi `id_exporter.py` di `crontab`:

```cron
# Jalankan log analyzer terlebih dahulu, lalu audit disparansi
# Asumsi: log_analyzer.py menghasilkan summary.json yang dibaca oleh yaml_audit_reporter.py
0 1 * * * /usr/bin/python3 /opt/scripts/log_analyzer.py >> /var/log/log_analyzer.log 2>&1
1 1 * * * /usr/bin/python3 /opt/scripts/yaml_audit_reporter.py \
  --yaml /data/id_metadata.yaml \
  --log-json /var/log/analyzer/summary.json \
  --output /reports/disparity_check.csv >> /var/log/yaml_audit.log 2>&1
```

*Catatan: Jeda waktu (`1 1 * * *`) digunakan untuk memastikan `log_analyzer.py` selesai berjalan dan menghasilkan file JSON sebelum `yaml_audit_reporter.py` mencoba membacanya.*


# 3. Analisis Korelasi Keamanan dan Disparansi

Setelah laporan disparansi (`disparity_report.csv`) dan log audit keamanan (`security_audit.log`) dihasilkan, langkah selanjutnya adalah menganalisis hubungan antara kedua data tersebut. Modul ini bertujuan untuk mengidentifikasi apakah ID dengan tingkat disparansi tinggi (selisih frekuensi > 10%) secara statistik berkorelasi dengan pola anomali keamanan yang terdeteksi sebelumnya.

## Pendekatan Teknis

Script `disparity_correlator.py` melakukan langkah-langkah berikut:

1.  **Parsing Data Disparansi**: Membaca file CSV yang dihasilkan oleh `yaml_audit_reporter.py` dan memfilter ID yang memiliki `disparity_percentage` > 10%.
2.  **Parsing Log Keamanan**: Membaca file log keamanan (format teks standar atau JSON, sesuaikan parser jika format berbeda) dan mengekstrak event anomali yang relevan dengan ID yang dipantau.
3.  **Transformasi Fitur**: Mengubah data menjadi format numerik untuk analisis statistik:
    *   Variabel X: Tingkat Disparansi (biner: 1 jika > 10%, 0 jika tidak).
    *   Variabel Y: Frekuensi Anomali Keamanan per ID.
4.  **Analisis Korelasi Pearson**: Menghitung koefisien korelasi Pearson (`r`) untuk mengukur kekuatan dan arah hubungan linear antara disparansi dan anomali keamanan.
5.  **Identifikasi Risiko Gabungan**: Menghasilkan daftar ID yang memiliki baik disparansi tinggi maupun kejadian anomali keamanan yang signifikan.
6.  **Ekspor Hasil**: Menyimpan hasil analisis statistik dan daftar risiko ke dalam file JSON yang terstruktur.

## Persyaratan Sistem

Pastikan lingkungan Python Anda memiliki pustaka analisis data berikut terinstal:

```bash
pip install pandas scipy
```

*Catatan: Jika tidak ingin menggunakan `pandas` dan `scipy`, script dapat diadaptasi menggunakan pustaka standar, namun rekomendasi ini memberikan akurasi dan kemudahan parsing yang lebih baik.*

## Dokumentasi Argumen Script

Script `disparity_correlator.py` menerima argumen baris perintah untuk menentukan lokasi file input dan output.

| Argumen | Deskripsi | Tipe | Default |
| :--- | :--- | :--- | :--- |
| `--disparity-csv` | Path absolut atau relatif ke file CSV hasil `yaml_audit_reporter.py` | `str` | `disparity_report.csv` |
| `--security-log` | Path absolut atau relatif ke file log audit keamanan (`security_audit.log`) | `str` | `security_audit.log` |
| `--output` | Path tujuan untuk menyimpan hasil analisis dalam format JSON | `str` | `correlation_analysis.json` |

### Contoh Penggunaan

```bash
python disparity_correlator.py \
  --disparity-csv /reports/disparity_check.csv \
  --security-log /var/log/security_audit.log \
  --output /reports/correlation_analysis.json
```

## Struktur Output JSON

Hasil analisis disimpan dalam file JSON (`correlation_analysis.json`) dengan struktur sebagai berikut:

```json
{
  "summary": {
    "total_ids_analyzed": 150,
    "ids_with_high_disparity": 25,
    "ids_with_security_anomalies": 18,
    "pearson_correlation_coefficient": 0.65,
    "interpretation": "Moderate positive correlation detected."
  },
  "risk_ids": [
    {
      "id": "USER_1023",
      "disparity_percentage": 15.4,
      "security_anomaly_count": 3,
      "severity": "HIGH"
    },
    {
      "id": "SYS_009",
      "disparity_percentage": 12.1,
      "security_anomaly_count": 1,
      "severity": "MEDIUM"
    }
  ]
}
```

**Penjelasan Field:**
*   `summary.pearson_correlation_coefficient`: Nilai antara -1 hingga 1. Nilai positif menunjukkan bahwa semakin tinggi disparansi, semakin tinggi kemungkinan anomali keamanan.
*   `summary.interpretation`: Evaluasi tekstual sederhana berdasarkan nilai koefisien korelasi.
*   `risk_ids`: Daftar ID yang memenuhi kriteria risiko gabungan (disparansi > 10% DAN memiliki catatan anomali keamanan).

## Integrasi ke Cronjob

Untuk mengotomatisasi analisis korelasi ini, tambahkan entri cronjob di bawah job yang sudah ada untuk menghasilkan laporan disparansi. Pastikan job ini dijalankan *setelah* job `yaml_audit_reporter.py` selesai.

Tambahkan baris berikut ke `crontab`:

```cron
# Jalankan log analyzer (Sudah ada)
0 1 * * * /usr/bin/python3 /opt/scripts/log_analyzer.py >> /var/log/log_analyzer.log 2>&1

# Jalankan audit disparansi (Sudah ada)
1 1 * * * /usr/bin/python3 /opt/scripts/yaml_audit_reporter.py \
  --yaml /data/id_metadata.yaml \
  --log-json /var/log/analyzer/summary.json \
  --output /reports/disparity_check.csv >> /var/log/yaml_audit.log 2>&1

# **BARU**: Jalankan analisis korelasi setelah disparansi selesai
# Asumsi: security_audit.py berjalan rutin menghasilkan security_audit.log
5 1 * * * /usr/bin/python3 /opt/scripts/disparity_correlator.py \
  --disparity-csv /reports/disparity_check.csv \
  --security-log /var/log/security_audit.log \
  --output /reports/correlation_analysis.json >> /var/log/correlation_audit.log 2>&1
```

**Catatan Penting:**
1.  **Urutan Eksekusi**: Jeda waktu (`5 1 * * *`) diberikan 4 menit setelah job disparansi (`1 1 * * *`) untuk memastikan file CSV disparansi sudah tertutup dan siap dibaca.
2.  **Ketersediaan Log Keamanan**: Pastikan `security_audit.log` sudah terupdate sebelum timestamp 01:05. Jika `security_audit.py` berjalan pada waktu lain, sesuaikan jadwal cron atau tambahkan logikadeadlock/retry dalam script jika log belum tersedia.
3.  **Monitor Log**: Periksa `/var/log/correlation_audit.log` secara berkala untuk mendeteksi kesalahan parsing format log keamanan yang berubah.

## Pertimbangan Keamanan dan Privasi

Karena script ini menggabungkan data operasional (disparansi frekuensi) dengan data keamanan (anomali), pastikan:
*   Akses ke file `security_audit.log` dan `correlation_analysis.json` dibatasi hanya untuk user sistem yang relevan (misal: `root` atau user `security-auditor`).
*   Jika data yang dianalisis mengandung informasi PII (Personally Identifiable Information), pastikan pipeline enkripsi atau anonymisasi diterapkan sebelum data masuk ke dalam proses korelasi ini.


## Automasi Remediasi Berbasis Risiko (`auto_remediation.py`)

Setelah proses korelasi menghasilkan `correlation_analysis.json`, sistem dilengkapi dengan modul otomatisasi untuk menangani temuan berisiko tinggi. Skrip `auto_remediation.py` bertindak sebagai "pengambil keputusan" yang mengevaluasi skor risiko gabungan dan memicu tindakan perbaikan melalui `auto_fixer.py`.

### Fitur Utama
- **Pencocokan Risiko Tinggi**: Memfilter ID yang memiliki skor gabungan di atas ambang batas tertentu (`high_risk_threshold`).
- **Integrasi dengan Fixer**: Mengirimkan daftar ID yang perlu ditindaklanjuti ke `auto_fixer.py`.
- **Mode Simulasi (`--dry-run`)**: Menampilkan aksi yang *akan* diambil tanpa mengubah file atau menjalankan `auto_fixer.py`. Berguna untuk validasi logika bisnis sebelum eksekusi nyata.
- **Mode Paksa (`--force`)**: Melewati konfirmasi interaktif atau delay waktu tunggu, langsung mengeksekusi `auto_fixer.py`.
- **Pelaporan Terstruktur**: Mencatat setiap keputusan (remediasi vs skip) ke dalam log audit yang terstruktur.

### Instalasi dan Prasyarat
Pastikan skrip berikut tersedia di path yang ditentukan:
- `/opt/scripts/auto_remediation.py`
- `/opt/scripts/auto_fixer.py`

Skrip ini memerlukan akses baca ke `/reports/correlation_analysis.json` dan eksekusi untuk `auto_fixer.py`.

### Penggunaan Dasar

#### 1. Mode Simulasi (Dry Run)
Gunakan mode ini untuk memverifikasi ID mana yang akan ditargetkan tanpa melakukan perubahan apa pun.

```bash
/usr/bin/python3 /opt/scripts/auto_remediation.py --dry-run
```

**Contoh Output:**
```text
[INFO] Loading correlation analysis from /reports/correlation_analysis.json
[INFO] High risk threshold set to: 80
[FINDING] ID-12345: Combined Score 92 -> ACTION: REMEDIATE
[FINDING] ID-67890: Combined Score 85 -> ACTION: REMEDIATE
[SKIP] ID-11111: Combined Score 75 -> Below threshold
[DRY RUN COMPLETE]: 2 IDs identified for remediation. No changes made.
```

#### 2. Mode Eksekusi Normal (Dengan Konfirmasi)
Skrip akan meminta konfirmasi sebelum mengeksekusi `auto_fixer.py`.

```bash
/usr/bin/python3 /opt/scripts/auto_remediation.py
```

**Contoh Output:**
```text
[INFO] Loading correlation analysis from /reports/correlation_analysis.json
[INFO] High risk threshold set to: 80
[FINDING] ID-12345: Combined Score 92 -> ACTION: REMEDIATE
[FINDING] ID-67890: Combined Score 85 -> ACTION: REMEDIATE
[CONFIRM] Execute auto_fixer.py for 2 IDs? (y/N): y
[EXEC] Running: /opt/scripts/auto_fixer.py --ids ID-12345,ID-67890 --action quarantine
[RESULT] auto_fixer.py completed successfully. Exit code: 0
[INFO] Remediation process finished.
```

#### 3. Mode Paksa (Force)
Digunakan untuk skrip otomatis atau pipeline CI/CD di mana interaksi tidak dimungkinkan.

```bash
/usr/bin/python3 /opt/scripts/auto_remediation.py --force
```

### Parameter Argumen

| Argumen | Tipe | Default | Deskripsi |
| :--- | :--- | :--- | :--- |
| `--input` | `str` | `/reports/correlation_analysis.json` | Path ke file hasil korelasi. |
| `--output-log` | `str` | `/var/log/remediation_audit.log` | Path ke file log audit remediasi. |
| `--threshold` | `int` | `80` | Skor minimum gabungan untuk dianggap risiko tinggi. |
| `--dry-run` | `flag` | `False` | Simulasi tanpa eksekusi `auto_fixer.py`. |
| `--force` | `flag` | `False` | Lewati konfirmasi user, langsung eksekusi. |
| `--fixer-cmd` | `str` | `/opt/scripts/auto_fixer.py` | Path ke skrip penindaklanjuti (fixer). |

### Integrasi dengan Cron

Tambahkan baris berikut ke `crontab` untuk menjalankan remediasi secara otomatis setelah analisis korelasi selesai.

> **PENTING**: Jadwal ini harus menunggu `disparity_correlator.py` selesai (lihat bagian *Urutan Eksekusi* sebelumnya).

```cron
# **BARU**: Otomatisasi Remediasi untuk ID Berisiko Tinggi
# Menjalankan 10 menit setelah job korelasi (5 1 * * *)
# Memberikan buffer 5 menit untuk memastikan file JSON korelasi sudah lengkap dan ditulis
15 1 * * * /usr/bin/python3 /opt/scripts/auto_remediation.py \
  --input /reports/correlation_analysis.json \
  --output-log /var/log/remediation_audit.log \
  --force \
  --threshold 80 >> /var/log/auto_remediation.log 2>&1
```

**Catatan Jadwal:**
1.  `0 1`: Log Analyzer.
2.  `1 1`: Audit Disparansi (CSV Output).
3.  `5 1`: Korelasi (JSON Output).
4.  `15 1`: **Remediasi Otomatis**.

Jeda 10 menit dari akhir korelasi (`5 1`) memastikan waktu bagi sistem file untuk sinkronisasi dan penutupan file, serta memberi waktu bagi proses korelasi yang lambat untuk selesai tanpa memblokir jadwal pagi berikutnya.

### Alur Kerja Eksekusi (`auto_remediation.py`)

1.  **Parsing Input**: Membaca `correlation_analysis.json`.
2.  **Filtering**: Mengiterasi setiap entri ID. Jika `combined_score >= threshold`, ID tersebut dimasukkan ke dalam antrian remediasi.
3.  **Pre-execution Check**:
    *   Jika `--dry-run` aktif, cetak daftar ID target dan keluar.
    *   Jika tidak aktif, siapkan argumen untuk `auto_fixer.py`.
4.  **Eksekusi Fixer**:
    *   Membangun perintah: `<fixer_cmd> --ids <list_ids> --action <default_action>`.
    *   Jika `--force` tidak aktif, tampilkan ringkasan dan minta konfirmasi.
    *   Jalankan `auto_fixer.py` menggunakan `subprocess.run()`.
5.  **Pasca-Eksekusi**:
    *   Periksa `exit code` dari `auto_fixer.py`.
    *   Catat hasil sukses/gagal ke log audit.
    *   (Opsional) Kirim notifikasi (email/Slack) jika ada kegagalan remediasi.

### Pertimbangan Keamanan untuk Remediasi Otomatis

Karena skrip ini melakukan **perubahan keadaan** (menghapus/menandai data), kehati-hatian ekstra diperlukan:

1.  **Least Privilege**: User yang menjalankan `auto_remediation.py` harus memiliki izin eksekusi untuk `auto_fixer.py` dan izin tulis pada log, tetapi **tidak** perlu akses `root` penuh kecuali diperlukan oleh `auto_fixer.py`.
2.  **Audit Trail Lengkap**: Log `/var/log/remediation_audit.log` harus dipertahankan sebagai bagian dari bukti audit kepatuhan. Jangan hapus log ini secara otomatis.
3.  **Rollback Plan**: Pastikan `auto_fixer.py` mendukung parameter `--rollback` atau mencatat checksum sebelum perubahan, sehingga jika `auto_remediation.py` memicu tindakan yang salah, ada mekanisme untuk mengembalikan keadaan.
4.  **Pencegahan DDoS Remediasi**: Tetapkan `--threshold` yang tinggi secara default. Jangan pernah menjalankan remediasi otomatis dengan threshold 0 tanpa pengawasan manusia, kecuali pada lingkungan terisolasi (sandbox).

### Troubleshooting

- **`auto_fixer.py` Tidak Ditemukan**: Pastikan `PATH` atau path absolut pada argumen `--fixer-cmd` benar.
- **Error JSON Parsing**: Jika `correlation_analysis.json` rusak atau belum selesai ditulis, `auto_remediation.py` akan mengeluarkan error. Pastikan interval cron memberikan waktu cukup (lihat catatan jadwal).
- **Remediasi Gagal Diam-diam**: Selalu periksa `exit code` dalam log `auto_remediation.log`. Gunakan script wrapper atau health-check cron untuk memonitor keberhasilan eksekusi `auto_fixer.py`.
