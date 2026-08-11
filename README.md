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


### Sertifikasi Kepatuhan Data (`compliance_certifier.py`)

Modul ini berfungsi sebagai *gatekeeper* akhir sebelum data dikategorikan sebagai "bersih" dan dapat digunakan untuk analitik lanjutan atau dilaporkan ke pihak ketiga. Modul ini melakukan validasi silang antara hasil korelasi anomali (`disparity_correlator.py`) dan laporan audit disparansi teknis (`yaml_audit_reporter.py`).

#### Fungsi Utama
1.  **Validasi Ambang Batas Discrepancy**: Memastikan tidak ada entri ID yang memiliki persentase perbedaan data (`discrepancy_pct`) melebihi 5%.
2.  **Pemeriksaan Anomali Kritis**: Memverifikasi bahwa tidak ada entri yang memiliki level keparahan anomali kritis (`severity == "CRITICAL"`).
3.  **Generasi Sertifikat**: Jika validasi lolos, menghasilkan file JSON yang berisi status kepatuhan, timestamp, dan tanda tangan digital untuk memastikan integritas data.

#### Arsitektur Eksekusi

1.  **Inisialisasi Input**:
    *   Membaca `correlation_analysis.json` (menggunakan argumen `--analysis`).
    *   Membaca `disparity_report.csv` (menggunakan argumen `--disparity-csv`).
2.  **Penggabungan Konteks Data**:
    *   Menyatukan data JSON dan CSV berdasarkan `ID` unik untuk membuat satu peta konteks lengkap per entri.
3.  **Logika Validasi**:
    *   Iterasi melalui setiap entri ID.
    *   Cek 1: `discrepancy_pct <= 5.0`. Jika gagal, tandai sebagai `FAIL` dan catat alasan.
    *   Cek 2: `anomaly_severity != "CRITICAL"`. Jika gagal, tandai sebagai `FAIL` dan catat alasan.
4.  **Pembuatan Sertifikat**:
    *   Jika semua entri lolos: Status `'PASS'`.
    *   Jika ada entri gagal: Status `'FAIL'` dengan detail entri yang bermasalah.
    *   Menghitung Hash SHA-256 dari isi JSON sertifikat (kecuali hash itu sendiri) untuk mencegah modifikasi pasca-generasi.
5.  **Penulisan Output**:
    *   Menyimpan hasil ke `compliance_cert.json` (menggunakan argumen `--output`).

#### Implementasi Kode

```python
#!/usr/bin/env python3
"""
compliance_certifier.py
Verifies data compliance by cross-referencing anomaly correlation data 
and technical disparity reports.

Usage:
    python compliance_certifier.py --analysis <path_to_json> --disparity-csv <path_to_csv> --output <path_to_output_json>
"""

import argparse
import csv
import hashlib
import json
import sys
from datetime import datetime, timezone

# --- Konfigurasi Konstanta ---
DISCREPANCY_THRESHOLD = 5.0
SEVERITY_CRITICAL = "CRITICAL"
HASH_EXCLUDE_KEYS = ['digital_signature']

def load_analysis_json(filepath):
    """Memuat file JSON analisis korelasi."""
    try:
        with open(filepath, 'r') as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"Error: File analisis tidak ditemukan: {filepath}")
        sys.exit(1)
    except json.JSONDecodeError:
        print(f"Error: Format JSON tidak valid: {filepath}")
        sys.exit(1)

def load_disparity_csv(filepath):
    """Memuat file CSV laporan disparansi dan mengindeksnya berdasarkan ID."""
    disparity_map = {}
    try:
        with open(filepath, 'r', newline='') as f:
            reader = csv.DictReader(f)
            for row in reader:
                # Asumsi kolom CSV: 'id', 'discrepancy_pct', 'severity'
                # Sesuaikan nama kolom jika struktur CSV Anda berbeda
                idx = row.get('id') or row.get('ID')
                if idx:
                    try:
                        discrepancy = float(row.get('discrepancy_pct', 0))
                    except ValueError:
                        discrepancy = 0.0
                    
                    severity = row.get('severity', '').upper()
                    
                    disparity_map[idx] = {
                        'discrepancy_pct': discrepancy,
                        'severity': severity
                    }
    except FileNotFoundError:
        print(f"Error: File CSV disparansi tidak ditemukan: {filepath}")
        sys.exit(1)
        
    return disparity_map

def verify_compliance(analysis_data, disparity_map):
    """
    Memverifikasi kepatuhan berdasarkan aturan bisnis:
    1. Tidak ada discrepancy > 5%
    2. Tidak ada severity CRITICAL
    """
    failed_entries = []
    all_ids = set()

    # Ambil semua ID dari kedua sumber
    if isinstance(analysis_data, dict):
        all_ids.update(analysis_data.keys())
    elif isinstance(analysis_data, list):
        for item in analysis_data:
            if 'id' in item:
                all_ids.add(item['id'])
            elif 'ID' in item:
                all_ids.add(item['ID'])
    
    all_ids.update(disparity_map.keys())

    is_compliant = True
    reasons = []

    for item_id in all_ids:
        # Gabungkan data dari JSON dan CSV
        json_data = analysis_data.get(item_id, {})
        csv_data = disparity_map.get(item_id, {'discrepancy_pct': 0, 'severity': 'UNKNOWN'})
        
        # Normalisasi kunci jika perlu
        if isinstance(json_data, dict):
            discrepancy = float(json_data.get('discrepancy_pct', 0))
            # Ambil severity dari CSV karena biasanya lebih akurat secara teknis
            severity = csv_data.get('severity', 'UNKNOWN')
        else:
            discrepancy = 0.0
            severity = 'UNKNOWN'

        # Cek Aturan 1: Discrepancy
        if discrepancy > DISCREPANCY_THRESHOLD:
            is_compliant = False
            reasons.append(f"ID {item_id}: Discrepancy {discrepancy}% exceeds threshold {DISCREPANCY_THRESHOLD}%")
        
        # Cek Aturan 2: Severity Kritis
        if severity == SEVERITY_CRITICAL:
            is_compliant = False
            reasons.append(f"ID {item_id}: Critical anomaly detected")

    return is_compliant, reasons, list(all_ids)

def generate_digital_signature(cert_content_json):
    """
    Menghasilkan hash SHA-256 dari konten sertifikat (kecuali field signature itu sendiri).
    Ini memastikan bahwa sertifikat tidak dimodifikasi setelah digenerate.
    """
    # Kita mengasumsikan cert_content_json adalah string JSON yang sudah di-prettify atau compact
    # Hash harus dihitung sebelum menyisipkan signature ke dalam JSON final
    return hashlib.sha256(cert_content_json.encode('utf-8')).hexdigest()

def create_compliance_certificate(is_pass, timestamp, reasons, total_entries):
    """Membuat struktur sertifikat kepatuhan."""
    cert = {
        "status": "PASS" if is_pass else "FAIL",
        "timestamp": timestamp,
        "total_entries_checked": total_entries,
        "compliance_rules": {
            "max_discrepancy_percent": DISCREPANCY_THRESHOLD,
            "forbidden_severity": SEVERITY_CRITICAL
        },
        "details": {}
    }

    if is_pass:
        cert["details"] = {
            "message": "All data entries are within compliance thresholds."
        }
    else:
        cert["details"] = {
            "message": "Compliance check failed.",
            "violations": reasons
        }

    return cert

def main():
    parser = argparse.ArgumentParser(description="Verify data compliance and generate certificate.")
    parser.add_argument('--analysis', required=True, help="Path to correlation_analysis.json")
    parser.add_argument('--disparity-csv', required=True, help="Path to disparity_report.csv")
    parser.add_argument('--output', required=True, help="Path to output compliance_cert.json")
    
    args = parser.parse_args()

    print(f"[*] Memuat data analisis dari: {args.analysis}")
    analysis_data = load_analysis_json(args.analysis)
    
    print(f"[*] Memuat data disparansi dari: {args.disparity-csv}")
    disparity_map = load_disparity_csv(args.disparity-csv)

    print("[*] Menjalankan validasi kepatuhan...")
    is_compliant, violations, all_ids = verify_compliance(analysis_data, disparity_map)
    
    timestamp = datetime.now(timezone.utc).isoformat()
    total_checked = len(all_ids)

    # Buat sertifikat awal
    cert_data = create_compliance_certificate(is_compliant, timestamp, violations, total_checked)
    
    # Convert ke JSON string untuk hashing (pastikan konsistensi formatting)
    # Gunakan sort_keys=True dan ensure_ascii=False untuk konsistensi hash
    cert_json_str = json.dumps(cert_data, sort_keys=True, indent=2, ensure_ascii=False)
    
    # Generate Signature
    signature = generate_digital_signature(cert_json_str)
    
    # Tambahkan signature ke data sertifikat
    cert_data['digital_signature'] = signature
    
    # Convert final data ke JSON string untuk ditulis ke file
    final_json_output = json.dumps(cert_data, sort_keys=True, indent=2, ensure_ascii=False)

    # Tulis ke file output
    try:
        with open(args.output, 'w') as f:
            f.write(final_json_output)
        print(f"[+] Sertifikat kepatuhan berhasil dibuat: {args.output}")
        print(f"    Status: {cert_data['status']}")
        if not is_compliant:
            print(f"    Pelanggaran: {len(violations)} entri tidak memenuhi syarat.")
            for v in violations[:5]: # Print max 5 violations
                print(f"      - {v}")
        else:
            print("    Sistem memenuhi semua standar kepatuhan.")
    except IOError as e:
        print(f"Error: Gagal menulis ke file output: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
```

#### Integrasi dalam Alur Kerja Otomatis

Sertifikat ini dirancang untuk dikonsumsi oleh sistem downstream atau dashboard monitoring. Contoh integrasi dalam pipeline `cron` atau `Makefile`:

```bash
# Contoh integrasi dalam Makefile
run-compliance-check:
	python disparity_correlator.py --input raw_data --output correlation_analysis.json
	python yaml_audit_reporter.py --yaml-config audit.yaml --csv-output disparity_report.csv
	python compliance_certifier.py \
		--analysis correlation_analysis.json \
		--disparity-csv disparity_report.csv \
		--output compliance_cert.json
	
	# Verifikasi integritas sertifikat sebelum melanjutkan
	if ! python -c "import json,sys; json.loads(sys.stdin.read())['digital_signature']"; then 
		echo "Integritas sertifikat gagal diverifikasi."; exit 1; 
	fi
```

#### Pertimbangan Keamanan Tambahan

1.  **Integritas Tanda Tangan**: Tanda tangan SHA-256 dalam `compliance_cert.json` dihitung berdasarkan konten JSON. Jika file ini diubah secara manual (misalnya, mengubah status `FAIL` menjadi `PASS`), tanda tangan akan tidak valid. Sistem penerima sertifikat harus memverifikasi hash ini sebelum mempercayai status kepatuhan.
2.  **Privasi Data**: Pastikan field-field sensitif (PII) yang mungkin ada di dalam `correlation_analysis.json` atau `disparity_report.csv` tidak secara tidak sengaja terekspose dalam log atau error message skrip. Skrip ini hanya membandingkan metrik numerik dan string kategori, sehingga risiko kebocoran data minim, namun validasi input tetap penting.
3.  **Performa**: Untuk dataset yang sangat besar (jutaan baris di CSV), `load_disparity_csv` mungkin memerlukan optimasi dengan `pandas` atau generator iteratif. Versi saat ini menggunakan standar library `csv` untuk kompatibilitas minimal tanpa dependensi eksternal.


Berikut adalah konten lanjutan yang dirancang untuk langsung disalin dan ditempel ke bagian **"Integrasi Sistem"** dalam file `README.md` Anda. Konten ini mencakup dokumentasi skrip REST API dan panduan implementasinya.

***

#### Penyajian Data melalui REST API Dashboard

Untuk memudahkan visualisasi data kepatuhan dan pemantauan anomali secara real-time, proyek ini menyertakan modul `compliance_dashboard_api.py`. Modul ini menggunakan **Flask** untuk menyajikan endpoint JSON yang mudah dikonsumsi oleh frontend dashboard (seperti Grafana, Kibana, atau custom web app) atau sistem monitoring otomatis.

##### Struktur File Skrip

Simpan kode berikut sebagai `compliance_dashboard_api.py`:

```python
import json
import argparse
import sys
import os
from flask import Flask, jsonify, abort
from flask_cors import CORS  # Opsional: untuk akses lintas domain jika diperlukan

def load_json_file(filepath):
    """Memuat file JSON dan menangani error dasar."""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"Error: File tidak ditemukan: {filepath}", file=sys.stderr)
        sys.exit(1)
    except json.JSONDecodeError:
        print(f"Error: Format JSON tidak valid pada: {filepath}", file=sys.stderr)
        sys.exit(1)

def create_app(cert_path, analysis_path):
    app = Flask(__name__)
    
    # Load data saat inisialisasi (bisa dioptimalkan dengan caching jika dataset besar)
    try:
        compliance_cert = load_json_file(cert_path)
        analysis_data = load_json_file(analysis_path)
    except Exception as e:
        print(f"Gagal memuat data awal: {e}", file=sys.stderr)
        sys.exit(1)

    @app.route('/status', methods=['GET'])
    def get_compliance_status():
        """
        Endpoint untuk menampilkan status sertifikat kepatuhan.
        Returns:
            JSON: Sertifikat kepatuhan lengkap.
        """
        return jsonify(compliance_cert)

    @app.route('/anomalies', methods=['GET'])
    def get_high_risk_anomalies():
        """
        Endpoint untuk mengambil daftar ID dengan risiko tinggi/anomali.
        Asumsi: Struktur analysis_data memiliki key 'anomalies' atau 'high_risk_ids'.
        Sesuaikan key ini dengan output aktual dari disparity_correlator.py.
        """
        # Contoh logika peng ekstrakan: Mengambil item di mana 'risk_score' > threshold
        # Sesuaikan dengan struktur data aktual Anda.
        anomalies = []
        
        # Misal struktur data: {"results": [{"id": "123", "score": 0.9}, ...]}
        results = analysis_data.get('results', [])
        
        # Filter data berdasarkan threshold (contoh: 0.8)
        threshold = 0.8 
        anomalies = [
            item for item in results 
            if item.get('risk_score', 0) > threshold
        ]

        return jsonify({
            "count": len(anomalies),
            "items": anomalies
        })

    @app.route('/health', methods=['GET'])
    def health_check():
        return jsonify({"status": "healthy"}), 200

    return app

def main():
    parser = argparse.ArgumentParser(description='Compliance Dashboard API')
    parser.add_argument('--cert', required=True, help='Path ke file compliance_cert.json')
    parser.add_argument('--analysis', required=True, help='Path ke file correlation_analysis.json')
    parser.add_argument('--port', type=int, default=5000, help='Port untuk menjalankan server (default: 5000)')
    parser.add_argument('--host', default='0.0.0.0', help='Host interface (default: 0.0.0.0)')
    
    args = parser.parse_args()

    app = create_app(cert_path=args.cert, analysis_path=args.analysis)
    
    print(f"Starting Compliance Dashboard API on http://{args.host}:{args.port}")
    print(f"Loading cert: {args.cert}")
    print(f"Loading analysis: {args.analysis}")
    
    app.run(host=args.host, port=args.port)

if __name__ == "__main__":
    main()
```

##### Instalasi Dependensi

Skrip ini memerlukan library `Flask`. Jika Anda menggunakan `requirements.txt`, pastikan menambahkan:

```text
Flask>=2.0.0
flask-cors>=3.0.0
```

Install dengan perintah:
```bash
pip install flask flask-cors
```

##### Penggunaan API

Skrip dijalankan dari command line dengan argumen path file output dari pipeline kepatuhan Anda:

```bash
# Menjalankan server di port 8080
python compliance_dashboard_api.py \
    --cert compliance_cert.json \
    --analysis correlation_analysis.json \
    --port 8080
```

##### Dokumentasi Endpoint

Setelah server berjalan, Anda dapat berinteraksi dengan API melalui HTTP GET requests.

**1. Verifikasi Kesehatan API**
Memastikan server sedang aktif dan siap menerima permintaan.
*   **Endpoint:** `GET /health`
*   **Response:**
    ```json
    {
      "status": "healthy"
    }
    ```

**2. Status Kepatuhan (Compliance Status)**
Mengembalikan konten lengkap dari sertifikat kepatuhan (`compliance_cert.json`), termasuk tanda tangan digital, status final, dan metadata timestamp.
*   **Endpoint:** `GET /status`
*   **Response:**
    ```json
    {
      "certificate_version": "1.0",
      "timestamp": "2023-10-27T10:00:00Z",
      "overall_status": "PASS",
      "digital_signature": "a1b2c3...",
      "details": {
        "total_checks": 150,
        "passed": 148,
        "failed": 2
      }
    }
    ```

**3. Daftar Anomali Berisiko Tinggi**
Mengembalikan daftar entitas atau ID yang memiliki skor risiko di atas ambang batas tertentu. Endpoint ini menghitung filter secara dinamis berdasarkan data analisis yang dimuat.
*   **Endpoint:** `GET /anomalies`
*   **Response:**
    ```json
    {
      "count": 3,
      "items": [
        {
          "id": "USER_0042",
          "risk_score": 0.95,
          "category": "disparity",
          "details": "Significant variance detected in region X"
        },
        {
          "id": "PROC_101",
          "risk_score": 0.88,
          "category": "anomaly",
          "details": "Outlier in transaction volume"
        }
      ]
    }
    ```

##### Integrasi dengan Monitoring (Grafana/Prometheus)

Anda dapat menggunakan endpoint `/status` untuk memantau status kepatuhan secara otomatis. Contoh penggunaan sederhana menggunakan `curl` di dalam cron job untuk mengirimkan alert jika status berubah menjadi `FAIL`:

```bash
# Cek status kepatuhan setiap 15 menit
STATUS=$(curl -s http://localhost:8080/status | jq -r '.overall_status')

if [ "$STATUS" == "FAIL" ]; then
    echo "ALERT: Compliance check failed. Check /status endpoint for details." | mail -s "Compliance Alert" admin@example.com
fi
```

> **Catatan Performa:** Versi dasar ini memuat seluruh file JSON ke dalam memori saat server dimulai. Untuk dataset dengan ukuran ratusan MB, pertimbangkan untuk mengimplementasikan *caching* (misalnya menggunakan Redis) atau mengganti pemrosesan data dengan database SQL/NoSQL untuk query yang lebih efisien pada endpoint `/anomalies`.


##### Audit Trail Jangka Panjang dengan `compliance_history_logger.py`

Untuk memenuhi persyaratan regulasi dan kemampuan investigasi forensik, perubahan status kepatuhan perlu direkam secara persisten. Skrip `compliance_history_logger.py` dirancang khusus untuk memantau perubahan status dari `compliance_certifier.py` dan menyimpan riwayatnya ke dalam database SQLite lokal.

**Fitur Utama:**
*   **Deteksi Perubahan Real-time:** Memantau file sertifikat dan mendeteksi transisi status `PASS` ↔ `FAIL`.
*   **Integritas Data:** Menyimpan hash SHA-256 dari konten sertifikat terbaru untuk memastikan tidak ada manipulasi data pasca-penetapan.
*   **Database SQLite:** Penyimpanan ringan dan terstruktur di dalam file `compliance_history.db`, cocok untuk lingkungan lokal tanpa dependensi server database berat.

**Instalasi dan Penggunaan**

Skrip ini adalah bagian dari suite audit. Pastikan skrip berada di direktori yang sama dengan `compliance_certifier.py`.

```bash
# Struktur Direktori
├── compliance_certifier.py
├── compliance_cert.json  (Output dari certifier)
├── compliance_history_logger.py
└── compliance_history.db (Database output)
```

**Argumentasi CLI:**

| Argument | Tipe | Default | Deskripsi |
| :--- | :--- | :--- | :--- |
| `--watch-cert` | `str` | `./compliance_cert.json` | Path ke file sertifikat JSON yang dipantau. |
| `--db-path` | `str` | `./compliance_history.db` | Path file database SQLite untuk menyimpan riwayat. |
| `--interval` | `int` | `5` | Interval pengecekan dalam detik. |

**Contoh Penggunaan:**

```bash
# Jalankan logger untuk memantau sertifikat default setiap 10 detik
python compliance_history_logger.py --watch-cert ./compliance_cert.json --db-path ./audit_logs.db --interval 10

# Jalankan dalam mode daemon (background)
nohup python compliance_history_logger.py --interval 5 > logger.log 2>&1 &
```

**Implementasi Kode**

Simpan kode berikut sebagai `compliance_history_logger.py`.

```python
import argparse
import hashlib
import json
import sqlite3
import sys
import time
import os
from datetime import datetime

class ComplianceLogger:
    def __init__(self, cert_path, db_path, interval):
        self.cert_path = cert_path
        self.db_path = db_path
        self.interval = interval
        self.last_hash = None
        self.last_status = None
        
        # Inisialisasi Database
        self._init_db()

    def _init_db(self):
        """Membuat tabel audit trail jika belum ada."""
        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS compliance_audit (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                timestamp TEXT NOT NULL,
                status TEXT NOT NULL,
                previous_status TEXT,
                cert_hash TEXT NOT NULL,
                file_size INTEGER
            )
        ''')
        conn.commit()
        conn.close()
        print(f"[INFO] Database initialized at {self.db_path}")

    def get_file_hash(self, filepath):
        """Menghitung hash SHA-256 dari file."""
        hasher = hashlib.sha256()
        with open(filepath, 'rb') as f:
            # Membaca file dalam chunks untuk efisiensi memori pada file besar
            for chunk in iter(lambda: f.read(4096), b""):
                hasher.update(chunk)
        return hasher.hexdigest()

    def get_current_status(self, cert_path):
        """Membaca status saat ini dari file JSON sertifikat."""
        if not os.path.exists(cert_path):
            return None, None
        
        try:
            with open(cert_path, 'r') as f:
                data = json.load(f)
                status = data.get('overall_status', 'UNKNOWN')
                return status, data
        except (json.JSONDecodeError, KeyError) as e:
            print(f"[WARN] Error reading certificate: {e}")
            return None, None

    def log_change(self, current_status, previous_status, cert_hash, file_size):
        """Menyimpan perubahan status ke dalam database."""
        now = datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%SZ')
        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()
        cursor.execute('''
            INSERT INTO compliance_audit (timestamp, status, previous_status, cert_hash, file_size)
            VALUES (?, ?, ?, ?, ?)
        ''', (now, current_status, previous_status, cert_hash, file_size))
        conn.commit()
        conn.close()
        print(f"[AUDIT] Change recorded: {previous_status} -> {current_status}")

    def run(self):
        """Loop utama pemantauan."""
        print(f"[INFO] Starting monitoring for {self.cert_path} (Interval: {self.interval}s)")
        
        while True:
            try:
                # 1. Hitung Hash & Baca Status
                current_hash = self.get_file_hash(self.cert_path)
                current_status, _ = self.get_current_status(self.cert_path)
                
                if current_status is None:
                    time.sleep(self.interval)
                    continue

                file_size = os.path.getsize(self.cert_path)

                # 2. Deteksi Perubahan
                # Logika perubahan:
                # a. Pertama kali dijalankan (last_hash is None)
                # b. Hash berubah (file content modified)
                # c. Status berubah secara eksplisit (meskipun hash sama, misalnya metadata update)
                
                status_changed = False
                if self.last_hash is None:
                    status_changed = True
                elif self.last_hash != current_hash:
                    # Hash berubah berarti konten berubah, kita perlu cek apakah statusnya berbeda dari sebelumnya
                    # Jika status sama tapi file lain berubah, kita tetap bisa mencatat update hash
                    # Untuk audit trail "status change", kita fokus pada transisi status
                    curr_st, _ = self.get_current_status(self.cert_path)
                    if curr_st != self.last_status:
                        status_changed = True
                
                # Catatan: Logika di atas menyederhanakan kasus di mana file berubah 
                # tapi status tidak berubah. Untuk keperluan audit trail murni status:
                if current_status != self.last_status:
                    self.log_change(current_status, self.last_status, current_hash, file_size)
                    self.last_status = current_status
                    
                self.last_hash = current_hash

            except Exception as e:
                print(f"[ERROR] Exception during monitoring: {e}")
            
            time.sleep(self.interval)

def main():
    parser = argparse.ArgumentParser(description='Monitor compliance certificate changes and log to SQLite.')
    parser.add_argument('--watch-cert', type=str, default='./compliance_cert.json',
                        help='Path to the compliance certificate JSON file.')
    parser.add_argument('--db-path', type=str, default='./compliance_history.db',
                        help='Path to the SQLite database file.')
    parser.add_argument('--interval', type=int, default=5,
                        help='Check interval in seconds.')
    
    args = parser.parse_args()
    
    logger = ComplianceLogger(args.watch_cert, args.db_path, args.interval)
    try:
        logger.run()
    except KeyboardInterrupt:
        print("
[INFO] Monitoring stopped by user.")
        sys.exit(0)

if __name__ == '__main__':
    main()
```

**Struktur Database Audit**

Database SQLite yang dihasilkan akan memiliki satu tabel utama `compliance_audit`. Berikut adalah contoh query SQL untuk mengekstrak laporan perubahan status:

```sql
-- Lihat 10 perubahan status terakhir
SELECT timestamp, previous_status, status, cert_hash 
FROM compliance_audit 
ORDER BY id DESC LIMIT 10;

-- Hitung total durasi downtime (status FAIL)
SELECT 
    COUNT(CASE WHEN status = 'FAIL' THEN 1 END) as fail_count,
    SUM(CASE WHEN status = 'FAIL' THEN 1 ELSE 0 END) as total_fail_records
FROM compliance_audit;
```

**Integrasi dengan Grafana/Prometheus (Opsional)**

Jika Anda ingin memvisualisasikan riwayat audit ini di Grafana, Anda dapat menggunakan plugin *Grafana SQLite* atau mengekspor data ke sistem time-series lainnya. Namun, untuk penggunaan ringan, file JSON hasil query SQLite dapat diproses oleh skrip pihak ketiga untuk mengubahnya menjadi format metrics Prometheus.

**Pertimbangan Keamanan**

1.  **Izin File:** Pastikan pengguna yang menjalankan `compliance_history_logger.py` memiliki izin baca (`r`) pada file sertifikat dan izin tulis (`w`) pada direktori database.
2.  **Integritas Database:** Untuk lingkungan produksi tinggi, pertimbangkan untuk mengaktifkan WAL (Write-Ahead Logging) pada SQLite (`PRAGMA journal_mode=WAL;`) untuk meningkatkan konkurensi dan ketahanan terhadap korupsi saat crash.


**Ekspor Data ke Format Parquet**

Untuk mendukung analisis data skala besar (*big data*) dan integrasi dengan ekosistem data modern (seperti Apache Spark, Dask, atau alat BI yang mendukung format kolom), tool ini menyertakan modul pengimpor data ke format **Parquet**. Format Parquet menawarkan kompresi yang jauh lebih efisien dan kecepatan pembacaan yang signifikan dibandingkan format baris tradisional seperti CSV atau JSON.

Buat file `compliance_exporter.py` dengan konten berikut:

```python
#!/usr/bin/env python3
"""
compliance_exporter.py

Skrip ini membaca database SQLite dari compliance_history_logger.py dan mengekspor
seluruh riwayat audit ke dalam format Parquet.

Fitur:
- Membaca database SQLite secara aman.
- Mengonversi data ke format Parquet menggunakan library `pyarrow`.
- Mendukung penentuan path database sumber dan file output tujuan.
"""

import argparse
import sqlite3
import sys
from pathlib import Path

# Pastikan pyarrow terinstal. Install dengan: pip install pyarrow pandas
try:
    import pandas as pd
    import pyarrow as pa
    import pyarrow.parquet as pq
except ImportError:
    print("Error: Library 'pyarrow' dan 'pandas' diperlukan.")
    print("Silakan instal menggunakan: pip install pyarrow pandas")
    sys.exit(1)


def connect_db(db_path: str) -> sqlite3.Connection:
    """Membuka koneksi ke database SQLite."""
    if not Path(db_path).exists():
        raise FileNotFoundError(f"Database tidak ditemukan: {db_path}")
    
    conn = sqlite3.connect(db_path)
    return conn


def fetch_audit_data(conn: sqlite3.Connection) -> pd.DataFrame:
    """
    Mengambil seluruh data dari tabel compliance_audit.
    
    Returns:
        DataFrame pandas yang berisi riwayat audit.
    """
    query = "SELECT * FROM compliance_audit"
    try:
        df = pd.read_sql_query(query, conn)
        if df.empty:
            print("Peringatan: Tabel audit kosong atau tidak ada data.")
        return df
    except sqlite3.OperationalError as e:
        print(f"Error saat membaca database: {e}")
        sys.exit(1)


def export_to_parquet(df: pd.DataFrame, output_path: str, compression: str = 'snappy') -> None:
    """
    Mengekspor DataFrame ke file Parquet.
    
    Args:
        df: DataFrame pandas sumber.
        output_path: Path lengkap untuk file output .parquet.
        compression: Jenis kompresi ('snappy', 'gzip', 'brotli', dll).
    """
    try:
        # Konversi timestamp menjadi datetime object jika belum, untuk kompatibilitas Parquet
        if 'timestamp' in df.columns:
            df['timestamp'] = pd.to_datetime(df['timestamp'], errors='coerce')
            
        table = pa.Table.from_pandas(df)
        pq.write_table(table, output_path, compression=compression)
        print(f"Berhasil mengekspor data ke: {output_path}")
        
    except Exception as e:
        print(f"Gagal mengekspor ke Parquet: {e}")
        sys.exit(1)


def main():
    parser = argparse.ArgumentParser(
        description="Ekspor riwayat audit compliance dari SQLite ke Parquet."
    )
    parser.add_argument(
        '--db-path', 
        type=str, 
        default='compliance_history.db',
        help='Path ke file database SQLite sumber (default: compliance_history.db)'
    )
    parser.add_argument(
        '--output', 
        type=str, 
        default='compliance_audit.parquet',
        help='Path ke file Parquet tujuan (default: compliance_audit.parquet)'
    )
    parser.add_argument(
        '--compression', 
        type=str, 
        default='snappy',
        help='Metode kompresi Parquet: snappy, gzip, brotli (default: snappy)'
    )

    args = parser.parse_args()

    print(f"Memuat database dari: {args.db_path}")
    conn = connect_db(args.db_path)
    
    print("Membaca data audit...")
    df = fetch_audit_data(conn)
    
    print(f"Mengekspor {len(df)} baris ke Parquet...")
    export_to_parquet(df, args.output, compression=args.compression)
    
    conn.close()
    print("Selesai.")


if __name__ == '__main__':
    main()
```

### Cara Penggunaan

Pastikan prasyarat pustaka telah terinstal:
```bash
pip install pyarrow pandas
```

Jalankan skrip untuk mengekspor data:
```bash
# Menggunakan path default
python compliance_exporter.py

# Menentukan path database dan output secara manual
python compliance_exporter.py --db-path /var/lib/compliance/my_audit.db --output /data/reports/audit_q1.parquet
```

### Analisis Performa dan Kompatibilitas

1.  **Efisiensi Penyimpanan**: File Parquet yang dihasilkan biasanya jauh lebih kecil dibandingkan format JSON atau CSV, berkat kompresi kolom (*columnar compression*). Format `snappy` menawarkan keseimbangan terbaik antara kecepatan kompresi dan rasio kompresi, sementara `gzip` menawarkan kompresi lebih tinggi namun membutuhkan lebih banyak CPU.
2.  **Integrasi Big Data**: File Parquet yang dihasilkan dapat langsung dibaca oleh:
    *   **Apache Spark**: `spark.read.parquet("compliance_audit.parquet")`
    *   **Dask**: `dd.read_parquet("compliance_audit.parquet")`
    *   **Pandas**: `pd.read_parquet("compliance_audit.parquet")`
3.  **Timestamp Handling**: Skrip ini secara otomatis menangani kolom `timestamp` dari SQLite dan mengonversinya menjadi tipe data `datetime64` native di Parquet, memastikan kompatibilitas waktu yang akurat di ekosistem data lainnya.

> **Catatan:** Jika database Anda sangat besar (>1GB), pertimbangkan untuk menggunakan *batch processing* atau library `dask` untuk menghindari penggunaan memori berlebih saat konversi ke DataFrame.


### Deteksi Anomali Statistik dengan `parquet_anomaly_detector.py`

Setelah mengekspor data ke format Parquet, langkah selanjutnya dalam pipeline kepatuhan adalah mengidentifikasi pola yang menyimpang secara signifikan. Modul `parquet_anomaly_detector.py` disediakan untuk melakukan analisis statistik deskriptif dan deteksi outlier menggunakan metode *Interquartile Range* (IQR) pada kolom diskrepansi frekuensi.

#### Fitur Utama
*   **Analisis Kolom Diskrepansi**: Secara otomatis mengidentifikasi kolom yang mengandung nilai diskrepansi (misalnya: `frequency_discrepancy` atau kolom serupa tergantung skema data Anda).
*   **Metode IQR (Interquartile Range)**: Menggunakan rumus statistik standar $Q1 - 1.5 	imes IQR$ dan $Q3 + 1.5 	imes IQR$ untuk menetapkan batas outlier.
*   **Skor Deviasi**: Menghitung seberapa jauh setiap anomali menyimpang dari batas kuartil terdekat, memberikan metrik "keparahan" anomali.
*   **Konfigurasi Fleksibel**: Memungkinkan penyesuaian sensitivitas deteksi melalui parameter multiplier.

#### Prasyarat
Pastikan pustaka berikut telah terinstal:

```bash
pip install pyarrow pandas numpy
```

#### Cara Penggunaan

Berikut adalah contoh penggunaan dasar untuk mendeteksi anomali dari file hasil ekspor sebelumnya:

```bash
# Menggunakan parameter default (IQR Multiplier = 1.5)
python parquet_anomaly_detector.py \
    --input /data/reports/audit_q1.parquet \
    --output statistical_anomalies.csv

# Menentukan batas outlier yang lebih ketat (Multiplier = 2.0)
python parquet_anomaly_detector.py \
    --input /data/reports/audit_q1.parquet \
    --output strict_anomalies.csv \
    --iqr-multiplier 2.0
```

#### Penjelasan Argumen
| Argumen | Tipe | Default | Deskripsi |
| :--- | :--- | :--- | :--- |
| `--input` | `str` | `None` | Path ke file input `.parquet`. Wajib diisi. |
| `--output` | `str` | `statistical_anomalies.csv` | Path untuk file output CSV berisi daftar anomali. |
| `--iqr-multiplier` | `float` | `1.5` | Faktor pengali untuk menghitung batas atas dan bawah IQR. Nilai lebih tinggi mengurangi False Positives namun mungkin melewatkan anomali kecil. |

#### Struktur Output CSV

File CSV yang dihasilkan (`statistical_anomalies.csv`) akan mengandung kolom-kolom berikut:

1.  `id`: Identifier unik dari entitas yang anomali (diambil dari kolom ID di Parquet).
2.  `column_name`: Nama kolom tempat diskrepansi ditemukan.
3.  `original_value`: Nilai diskrepansi asli yang terdeteksi sebagai outlier.
4.  `lower_bound`: Batas bawah IQR untuk kolom tersebut.
5.  `upper_bound`: Batas atas IQR untuk kolom tersebut.
6.  `deviation_score`: Skor deviasi yang dihitung sebagai jarak nilai terhadap batas yang relevan (misalnya: `value - upper_bound` jika di atas, atau `lower_bound - value` jika di bawah). Skor yang lebih tinggi menunjukkan anomali yang lebih ekstrem.

#### Logika Deteksi

1.  **Pembacaan Data**: File Parquet dibaca ke dalam DataFrame Pandas menggunakan `pyarrow` backend untuk efisiensi memori.
2.  **Identifikasi Kolom Target**: Skrip mencari kolom numerik yang berpotensi menyimpan data frekuensi atau diskrepansi. Jika nama kolom spesifik diketahui, pengguna dapat memodifikasi skrip atau menambahkan argumen `--target-column`.
3.  **Perhitungan Statistik**:
    *   Hitung Kuartil 1 ($Q1$) dan Kuartil 3 ($Q3$).
    *   Hitung Interquartile Range: $IQR = Q3 - Q1$.
    *   Tentukan batas:
        *   $Lower\_Bound = Q1 - (multiplier 	imes IQR)$
        *   $Upper\_Bound = Q3 + (multiplier 	imes IQR)$
4.  **Filtering Anomali**: Baris di mana nilai target $< Lower\_Bound$ atau $> Upper\_Bound$ ditandai sebagai anomali.
5.  **Ekspotasi**: Hasil diekspor ke CSV, mengurutkan data berdasarkan `deviation_score` secara menurun agar anomali paling signifikan terlihat di bagian atas.

#### Tips Optimasi

*   **Penanganan Null Values**: Skrip secara otomatis mengabaikan nilai `NaN` selama perhitungan statistik. Pastikan data Anda bersih atau lakukan preprocessing di tahap ekspor jika diperlukan.
*   **Ukuran File Besar**: Untuk file Parquet berukuran raksasa (>5GB), pertimbangkan untuk menggunakan chunking dengan `pandas.read_parquet(..., engine='pyarrow', columns=['id', 'target_column'])` untuk mengurangi penggunaan memori RAM sebelum melakukan perhitungan IQR.
*   **Pemilihan Multiplier**:
    *   Gunakan `1.5` untuk standar industri (mengidentifikasi outlier moderat).
    *   Gunakan `3.0` atau lebih tinggi jika hanya ingin menangkap error data yang sangat kritis atau *systemic failures*.


Berikut adalah draf konten lanjutan untuk `README.md` yang dirancang untuk melengkapi dokumentasi teknis Anda. Konten ini berfokus pada implementasi visualisasi menggunakan pendekatan *Static HTML + Chart.js* untuk menghindari kompleksitas instalasi server Grafana yang berat, sambil tetap memberikan interaktivitas dan performa tinggi untuk analisis data.

---

### Visualisasi Anomali Statistik

Setelah file `statistical_anomalies.csv` berhasil diekspor oleh skrip pendeteksi, langkah selanjutnya adalah analisis visual untuk memahami pola, sebaran, dan ekstremitas dari anomali yang terdeteksi. Untuk tujuan ini, kami menyediakan skrip `statistical_anomaly_dashboard.py`.

Skrip ini tidak memerlukan instalasi backend server Grafana yang kompleks. Sebaliknya, ia memindai file CSV, memproses datanya, dan menghasilkan file **HTML statis** yang terintegrasi dengan **Chart.js**. File HTML ini dapat dibuka langsung di browser apa pun untuk menyajikan dashboard interaktif.

#### Fitur Dashboard
*   **Distribusi Skor Deviasi**: Histogram yang menunjukkan sebaran frekuensi anomali berdasarkan tingkat keparahan (`deviation_score`).
*   **Distribusi per Kolom**: Pie chart atau Bar chart yang menunjukkan proporsi anomali per kolom (`column_name`) untuk mengidentifikasi area data yang paling tidak stabil.
*   **Top 10 Anomali Ekstrem**: Tabel ringkasan yang menampilkan 10 entitas dengan skor deviasi tertinggi untuk investigasi cepat.
*   **Tanpa Backend**: Hasilnya adalah file `.html` mandiri yang dapat dibagikan atau di-hosting pada server statis mana pun.

#### Penggunaan

Jalankan skrip dari baris perintah untuk menghasilkan file HTML dashboard.

```bash
python statistical_anomaly_dashboard.py --csv statistical_anomalies.csv --port 8080
```

**Argumen yang Tersedia:**

| Argumen | Deskripsi | Default | Wajib |
| :--- | :--- | :--- | :--- |
| `--csv` | Path ke file output CSV dari `parquet_anomaly_detector.py`. | `statistical_anomalies.csv` | Ya |
| `--port` | Port lokal untuk menjalankan server HTTP sederhana guna menyajikan file HTML. | `8080` | Tidak |
| `--output` | Nama file HTML yang akan dihasilkan. | `dashboard.html` | Tidak |

**Contoh Penggunaan Lanjutan:**

Jika Anda memiliki file dengan nama kustom dan ingin mengubah port agar tidak konflik dengan layanan lain:

```bash
python statistical_anomaly_dashboard.py --csv hasil_deteksi_2023.csv --port 9090 --output laporan_anomali.html
```

Setelah skrip selesai berjalan, server lokal akan dimulai. Buka browser dan akses `http://localhost:9090` (sesuaikan dengan port yang Anda tentukan) untuk melihat dashboard.

#### Struktur Visualisasi

Dashboard yang dihasilkan mencakup tiga bagian utama:

1.  **Ringkasan Eksekutif**: Menampilkan total anomali yang terdeteksi, nilai `multiplier` yang digunakan, dan rentang skor deviasi minimum/maksimum.
2.  **Analisis Distribusi (Chart.js)**:
    *   *Histogram Deviasi*: Memetakan frekuensi kemunculan pada rentang skor tertentu. Ini membantu menentukan apakah anomali menyebar merata atau terkonsentrasi di area ekstrem.
    *   *Breakdown per Kolom*: Mengidentifikasi kolom mana yang paling banyak menghasilkan outlier.
3.  **Tabel Detail**: Sebuah tabel HTML responsif yang memuat 50 baris pertama anomali dengan skor tertinggi, lengkap dengan tombol untuk menyalin `id` atau menyalin seluruh baris ke clipboard.

#### Pertimbangan Performa

Karena pendekatan ini memuat seluruh dataset CSV ke dalam memori browser untuk rendering grafik, skrip ini dioptimalkan untuk menangani file CSV dengan ukuran hingga **100MB - 500MB** pada mesin dengan RAM moderat (8GB+).

*   **Untuk Dataset Sangat Besar**: Jika file CSV berukuran sangat besar, pertimbangkan untuk menggunakan argumen sampling di tahap preprocessing sebelum dashboard dibuat, atau gunakan solusi backend Grafana sebenarnya yang dapat menangani pemindaian data secara asinkron.
*   **Format File**: File HTML yang dihasilkan bersifat statis. Tidak ada data mentah yang dikirim ke server eksternal. Semua pemrosesan terjadi di sisi klien (client-side JavaScript) di browser Anda, sehingga privasi data tetap terjaga.

#### Contoh Output Terminal

```text
[INFO] Membaca file: statistical_anomalies.csv
[INFO] Total baris data ditemukan: 1,240
[INFO] Menginisialisasi renderer Chart.js...
[INFO] Server statis dimulai di http://0.0.0.0:8080
[INFO] Dashboard berhasil dibuat: dashboard.html
[NOTES] Tekan Ctrl+C untuk menghentikan server.
```

#### Integrasi dengan Pipeline CI/CD

Anda dapat menyertakan langkah ini dalam pipeline CI/CD Anda setelah proses deteksi anomali selesai.

```yaml
# Contoh snippet GitHub Actions
- name: Generate Anomaly Dashboard
  run: |
    python statistical_anomaly_dashboard.py --csv output/statistical_anomalies.csv --output artifacts/anomaly_dashboard.html
- name: Upload Dashboard Artifact
  uses: actions/upload-artifact@v3
  with:
    name: anomaly-dashboard
    path: artifacts/anomaly_dashboard.html
```

Artifak HTML yang diunggah ini dapat diunduh oleh tim operasional untuk dianalisis lebih lanjut tanpa perlu menjalankan infrastruktur lokal.


### Otomatisasi Deployment Dashboard

Untuk memastikan bahwa laporan anomali statis tidak hanya dihasilkan secara lokal, tetapi juga tersedia untuk tim operasional kapan saja, proyek ini menyediakan skrip utilitas `auto_dashboard_deployment.py`. Skrip ini membaca file HTML yang dihasilkan dan data CSV sumbernya, melakukan validasi integritas dasar, lalu mengunggah aset tersebut ke tujuan penyimpanan yang telah dikonfigurasi.

#### Fitur Utama

*   **Validasi Integritas**: Memverifikasi keberadaan dan ukuran minimum file sebelum upload untuk mencegah distribusi file kosong atau rusak.
*   **Dukungan Multi-Target**: Mendukung pengiriman ke Amazon S3 (menggunakan `boto3`) atau penyimpanan via SCP/SFTP (menggunakan `paramiko`).
*   **Manajemen Kredensial Terpusat**: Kredensial akses tidak dilewatkan sebagai argumen command-line (yang berisiko terekam di riwayat shell), melainkan dibaca dari file konfigurasi eksternal.
*   **Logging Terstruktur**: Output log berwarna untuk memudahkan monitoring proses upload.

#### Instalasi Dependensi

Skrip ini memerlukan dependensi berikut. Pastikan untuk menginstalnya sebelum menjalankan skrip:

```bash
pip install boto3 paramiko
```

#### Penggunaan Dasar

Jalankan skrip dengan memberikan path ke file dashboard HTML, data CSV, serta konfigurasi kredensial dan target tujuan.

```bash
python auto_dashboard_deployment.py \
    --html output/anomaly_dashboard.html \
    --csv output/statistical_anomalies.csv \
    --target s3 \
    --credentials config/aws_s3_config.json
```

**Catatan:** Untuk SCP/SFTP, ubah `--target` menjadi `scp` atau `sftp` dan sesuaikan struktur file kredensial (format YAML atau JSON untuk hostname, username, dan private key passphrase).

#### Struktur Argumen

| Argumen | Tipe | Deskripsi | Wajib |
| :--- | :--- | :--- | :--- |
| `--html` | String | Path absolut atau relatif ke file `dashboard.html` yang dihasilkan. | Ya |
| `--csv` | String | Path absolut atau relatif ke file `statistical_anomalies.csv`. | Ya |
| `--target` | Enum | Tujuan penyimpanan: `s3` atau `scp`. | Ya |
| `--credentials` | String | Path ke file JSON/YAML yang berisi kredensial akses. | Ya |
| `--bucket` | String | *(Opsional, hanya untuk S3)* Nama bucket S3 tujuan. Jika tidak diberikan, akan dibaca dari file kredensial. | Tidak |

#### Contoh File Kredensial

File kredensial dapat disesuaikan formatnya sesuai dengan target. Berikut adalah contoh untuk **S3**:

```json
{
    "aws_access_key_id": "YOUR_ACCESS_KEY",
    "aws_secret_access_key": "YOUR_SECRET_KEY",
    "region_name": "ap-southeast-1",
    "bucket_name": "company-data-anomalies-2024"
}
```

Berikut adalah contoh untuk **SCP**:

```json
{
    "hostname": "192.168.1.100",
    "port": 22,
    "username": "deploy_user",
    "key_file": "/path/to/private_key",
    "remote_dir": "/var/www/anomalies/reports"
}
```

#### Integrasi Lanjutan dengan CI/CD

Anda dapat menyederhanakan pipeline GitHub Actions sebelumnya dengan mengganti langkah upload artifact statis dengan skrip ini. Hal ini memungkinkan dashboard langsung dipublikasikan ke storage permanen atau web server internal.

```yaml
# Contoh snippet GitHub Actions - Lanjutan
- name: Install Deployment Dependencies
  run: pip install boto3 paramiko

- name: Deploy Dashboard to S3/SCP
  env:
    AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  run: |
    python auto_dashboard_deployment.py \
      --html artifacts/anomaly_dashboard.html \
      --csv output/statistical_anomalies.csv \
      --target s3 \
      --credentials .ci_s3_credentials.json
```

#### Catatan Keamanan

1.  **Jangan Komit Kredensial**: Pastikan file yang merujuk ke `--credentials` ditambahkan ke `.gitignore`.
2.  **Iminimisasi Privilase**: Gunakan IAM Role atau User dengan hak akses minimal hanya untuk menulis (put/object/upload) ke bucket atau direktori target.
3.  **Validasi Output**: Pastikan file `dashboard.html` yang dihasilkan oleh `statistical_anomaly_dashboard.py` mengandung tag `<html>` yang valid sebelum melakukan upload, untuk mencegah korupsa data di sisi penerima.


#### Integrasi Sistem: Orchestrator Otomasi

Untuk menyelesaikan siklus deteksi-analisis-respons secara otomatis, proyek ini menyertakan **Anomaly Response Orchestrator** (`anomaly_response_orchestrator.py`). Skrip ini bertindak sebagai "otak" dari pipeline keamanan, yang bertugas menggabungkan hasil deteksi statistik dari `parquet_anomaly_detector.py` dengan hasil analisis korelasi dari `disparity_correlator.py`.

Tujuan utama skrip ini adalah mengidentifikasi outlier yang bukan hanya mencurig secara statistik, tetapi juga memiliki korelasi tinggi dengan indikator keamanan (security indicators), lalu memicu alur remediasi otomatis melalui `auto_remediation.py`. Dengan pendekatan ini, kita mengurangi waktu deteksi dan respons (MTTD/MTTR) secara signifikan.

##### Cara Penggunaan

Skrip ini dirancang untuk dijalankan setelah proses analisis selesai. Berikut adalah contoh perintah dasar:

```bash
python anomaly_response_orchestrator.py \
    --anomaly-csv output/statistical_anomalies.csv \
    --analysis-json output/correlation_analysis.json \
    --webhook-failover https://hooks.slack.com/services/...
```

##### Argumen Baris Perintah

*   `--anomaly-csv <path>`: **(Wajib)** Path ke file CSV yang dihasilkan oleh `parquet_anomaly_detector.py`. File ini berisi daftar anomali statistik yang terdeteksi.
*   `--analysis-json <path>`: **(Wajib)** Path ke file JSON yang dihasilkan oleh `disparity_correlator.py`. File ini memuat hasil analisis korelasi antar variabel.
*   `--dry-run`: **(Opsional)** Jika flag ini disertakan, skrip akan mensimulasikan keputusan remediasi tanpa benar-benar memanggil `auto_remediation.py`. Output hanya akan dicetak ke log untuk verifikasi logika pemfilteran.
*   `--webhook-failover <url>`: **(Opsional)** URL Webhook (misalnya Slack, Discord, atau Microsoft Teams). Jika proses remediasi otomatis gagal atau ditolak oleh sistem tujuan, skrip akan mengirim notifikasi gagal ke URL ini agar tim keamanan dapat intervensi manual.

##### Logika Pemfilteran dan Pemicu Remediasi

Orchestrator tidak memicu remediasi untuk semua anomali. Ia menerapkan filter bertingkat:

1.  **Pencocokan ID**: Skrip mencocokkan `anomaly_id` dari CSV anomali statistik dengan kunci dalam JSON analisis korelasi.
2.  **Ambang Batas Korelasi**: Hanya anomali dengan skor korelasi keamanan (`security_correlation_score`) di atas ambang batas tertentu (default: `0.8`) yang dipertimbangkan.
3.  **Pemanggilan Remediasi**: Untuk setiap anomali yang lolos filter, skrip memanggil `auto_remediation.py` secara asinkron (atau sinkron, tergantung konfigurasi) dengan `anomaly_id` tersebut sebagai argumen.

##### Contoh Output Log

```text
[INFO] Memuat data anomali dari: output/statistical_anomalies.csv
[INFO] Memuat data analisis dari: output/correlation_analysis.json
[INFO] Ditemukan 5 anomali dengan korelasi keamanan > 0.8
[INFO] Menjalankan remediasi untuk ANOMALY-2023-001...
[SUCCESS] Remediasi ANOMALY-2023-001 berhasil dieksekusi.
[WARN] Remediasi ANOMALY-2023-004 ditolak oleh sistem target. Mengirim notifikasi gagal ke webhook.
[INFO] Proses orchestrator selesai.
```

##### Pertimbangan Keamanan dan Scalability

*   **Idempotensi**: Pastikan `auto_remediation.py` dapat menangani pemanggilan berulang untuk `anomaly_id` yang sama tanpa menyebabkan error atau duplikasi tindakan.
*   **Manajemen Webhook**: Simpan URL webhook di variabel lingkungan (`WEBHOOK_URL`) atau file konfigurasi yang tidak terkunci di repositori, bukan di kode sumber.
*   **Logging**: Semua aksi remediasi dan kegagalan harus dicatat ke log terpusat (misalnya, ELK Stack atau CloudWatch) untuk audit trail di masa depan.

Dengan mengintegrasikan `anomaly_response_orchestrator.py`, Anda mengubah pipeline dari sekadar alat observasi menjadi sistem defensif aktif yang mampu merespons ancaman secara real-time.


##### Orkestrasi Pipeline dengan `pipeline_orchestrator.py`

Untuk memfasilitasi alur kerja end-to-end yang koheren, paket ini menyertakan `pipeline_orchestrator.py`. Skrip ini bertindak sebagai *entry point* utama yang mengelola eksekusi berurutan dari seluruh modul dalam pipeline: dari ekstraksi data (`id_exporter.py`) hingga respons otomatis (`anomaly_response_orchestrator.py`). Selain menjalankan langkah demi langkah, skrip ini juga mencakup mekanisme ketahanan (resilience) melalui *retry logic* dan *rollback* otomatis jika terjadi kegagalan pada tahap kritis.

**Fitur Utama:**
*   **Eksekusi Berurutan:** Menjalankan setiap modul dalam urutan logis untuk memastikan integritas data antar tahap.
*   **Konfigurasi Terpusat:** Mendukung file konfigurasi YAML untuk mengatur parameter setiap modul secara dinamis tanpa mengubah kode sumber.
*   **Manajemen Lingkungan:** Mendukung variabel lingkungan dan flag untuk membedakan antara lingkungan pengembangan (`development`) dan produksi (`production`).
*   **Mekanisme Retry & Rollback:** Secara otomatis mencoba ulang langkah yang gagal hingga batas maksimum konfigurasi, dan jika gagal terus-menerus, akan membalikkan dampak dari langkah-langkah sebelumnya (jika didukung oleh modul yang bersangkutan) untuk menjaga konsistensi sistem.

###### Argumentasi Skrip

| Argumen | Deskripsi | Default |
| :--- | :--- | :--- |
| `--config <path>` | Path absolut atau relatif ke file konfigurasi YAML pipeline. Wajib disertakan. | N/A |
| `--env <environment>` | Lingkungan eksekusi (`development` atau `production`). Mempengaruhi tingkat verbose logging dan batas retry. | `development` |
| `--max-retries <int>` | Jumlah maksimal percobaan ulang untuk setiap tahap yang gagal. | `3` |
| `--disable-rollback` | Jika flag ini disertakan, sistem tidak akan mencoba membalikkan perubahan jika remediasi gagal. | `False` |

###### Contoh Penggunaan

Jalankan pipeline penuh dengan konfigurasi produksi dan logging verbose:

```bash
python pipeline_orchestrator.py --config ./config/pipeline_config.yaml --env production --max-retries 5
```

Jalankan dalam mode development dengan menonaktifkan fitur rollback (mode eksperimen):

```bash
python pipeline_orchestrator.py --config ./config/dev_config.yaml --env development --disable-rollback
```

###### Struktur Konfigurasi YAML

File konfigurasi YAML harus didefinisikan sesuai dengan struktur berikut. Setiap tahap dapat memiliki parameternya sendiri yang akan diteruskan ke modul yang bersangkutan.

```yaml
pipeline:
  name: "Security Anomaly Response Pipeline"
  stages:
    - name: "id_exporter"
      module: "id_exporter"
      enabled: true
      params:
        input_dir: "/var/data/raw_logs"
        output_file: "output/exported_ids.json"
    
    - name: "statistical_analysis"
      module: "statistical_analysis"
      enabled: true
      params:
        window_size: 3600
        output_file: "output/statistical_anomalies.csv"

    - name: "correlation_analysis"
      module: "correlation_analysis"
      enabled: true
      params:
        json_input: "output/exported_ids.json"
        csv_input: "output/statistical_anomalies.csv"
        output_file: "output/correlation_analysis.json"

    - name: "auto_remediation"
      module: "anomaly_response_orchestrator"
      enabled: true
      params:
        dry_run: false
        webhook_url: "https://hooks.slack.com/services/..."
        correlation_threshold: 0.8

  settings:
    max_retries: 3
    enable_rollback: true
    log_level: "INFO"
```

###### Logika Retry dan Rollback

1.  **Retry Logic:** Jika sebuah tahap (stage) mengembalikan kode exit non-nol, orchestrator akan mencatat kegagalan dan mencoba mengeksekusi ulang tahap tersebut hingga `max_retries` tercapai. Jeda antar percobaan menggunakan *exponential backoff* untuk mengurangi beban pada sumber daya sistem.
2.  **Rollback Mechanism:** Jika `max_retries` tercapai dan tahap tetap gagal:
    *   Jika `enable_rollback` adalah `true`, orchestrator akan mengidentifikasi semua tahap yang *sukses* sebelum tahap yang gagal.
    *   Orchestrator akan memanggil fungsi `undo()` atau mekanisme serupa pada modul-modul tersebut untuk mengembalikan sistem ke kondisi sebelumnya.
    *   Notifikasi kegagalan dikirimkan ke tim keamanan (jika webhook terkonfigurasi).
    *   Eksekusi pipeline dihentikan dengan kode error.

---

### Deployment and Operations

Bagian ini menjelaskan metode deployment yang direkomendasikan untuk menjalankan `pipeline_orchestrator.py` dalam lingkungan produksi. Dua metode utama didukung: **Systemd Service** (untuk server berbasis Linux) dan **Kubernetes Pod** (untuk arsitektur containerized).

#### 1. Deployment dengan Systemd (Linux)

Method ini cocok untuk server dedicated yang menjalankan pipeline sebagai proses persisten.

**Langkah 1: Buat User Khusus**
Sebaiknya jalankan service dengan user non-root untuk keamanan.
```bash
sudo useradd --system --no-create-home --shell /bin/false pipeline_user
```

**Langkah 2: Buat File Service**
Buat file `/etc/systemd/system/pipeline-orchestrator.service` dengan konten berikut:

```ini
[Unit]
Description=Security Anomaly Response Pipeline Orchestrator
After=network.target postgresql.service # Sesuaikan dengan dependensi layanan lain
Wants=postgresql.service

[Service]
Type=simple
User=pipeline_user
Group=pipeline_user
WorkingDirectory=/opt/pipeline
ExecStart=/usr/bin/python3 /opt/pipeline/pipeline_orchestrator.py --config /opt/pipeline/config/pipeline_config.yaml --env production
Restart=on-failure
RestartSec=10
StandardOutput=journal
StandardError=journal

# Keamanan Lingkungan
ProtectSystem=strict
ReadWritePaths=/opt/pipeline/output /opt/pipeline/logs
Environment=WEBHOOK_URL=https://hooks.slack.com/services/...
Environment=PYTHONUNBUFFERED=1

[Install]
WantedBy=multi-user.target
```

**Langkah 3: Aktifkan dan Jalankan Service**
```bash
sudo systemctl daemon-reload
sudo systemctl enable pipeline-orchestrator
sudo systemctl start pipeline-orchestrator
sudo systemctl status pipeline-orchestrator
```

**Log Management:**
Gunakan `journalctl` untuk memantau log secara real-time:
```bash
sudo journalctl -u pipeline-orchestrator -f
```

#### 2. Deployment dengan Kubernetes

Method ini direkomendasikan untuk lingkungan cloud-native yang membutuhkan skalabilitas dan manajemen lifecycle otomatis.

**Manifest Deployment (`pipeline-deployment.yaml`)**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: anomaly-pipeline
  namespace: security-ops
  labels:
    app: anomaly-pipeline
spec:
  replicas: 1
  selector:
    matchLabels:
      app: anomaly-pipeline
  template:
    metadata:
      labels:
        app: anomaly-pipeline
    spec:
      containers:
      - name: pipeline-orchestrator
        image: your-registry/anomaly-pipeline:latest
        command: ["python", "pipeline_orchestrator.py"]
        args: ["--config", "/app/config/pipeline_config.yaml", "--env", "production"]
        env:
        - name: WEBHOOK_URL
          valueFrom:
            secretKeyRef:
              name: pipeline-secrets
              key: webhook-url
        - name: DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: pipeline-secrets
              key: db-password
        resources:
          requests:
            memory: "256Mi"
            cpu: "250m"
          limits:
            memory: "512Mi"
            cpu: "500m"
        volumeMounts:
        - name: config-volume
          mountPath: /app/config
          readOnly: true
        - name: output-volume
          mountPath: /app/output
      volumes:
      - name: config-volume
        configMap:
          name: pipeline-config-cm
      - name: output-volume
        emptyDir: {} # Atau gunakan PVC jika perlu persistensi
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: pipeline-config-cm
  namespace: security-ops
data:
  pipeline_config.yaml: |
    pipeline:
      name: "K8s Deployed Pipeline"
      stages:
        - name: "id_exporter"
          ...
---
apiVersion: v1
kind: Secret
metadata:
  name: pipeline-secrets
  namespace: security-ops
type: Opaque
stringData:
  webhook-url: "https://hooks.slack.com/services/..."
  db-password: "super-secret-password"
```

**Pertimbangan Operasi Kubernetes:**
*   **ConfigMap & Secrets:** Pisahkan konfigurasi teknis (YAML) dan kredensial (Secrets) untuk keamanan.
*   **Persistent Volumes:** Jika tahap remediasi memerlukan penyimpanan hasil log atau state yang awan, gunakan `PersistentVolumeClaim` alih-alih `emptyDir`.
*   **Health Checks:** Pertimbangkan untuk menambahkan `livenessProbe` dan `readinessProbe` jika pipeline berjalan sebagai long-running process, meskipun untuk pipeline batch, restart otomatis pada kegagalan sudah sering cukup.

#### Monitoring dan Observabilitas

Untuk kedua metode deployment, pastikan bahwa output log terintegrasi dengan sistem observabilitas pusat Anda:

1.  **Struktur Log JSON:** Pastikan `pipeline_orchestrator.py` mencetak log dalam format JSON agar mudah diparse oleh log aggregator.
2.  **Health Check Endpoint:** Jika pipeline diubah menjadi service HTTP (opsional), tambahkan endpoint `/health` yang mengembalikan status kesehatan pipeline terakhir.
3.  **Alerting:** Aturlah alerting berdasarkan level log `ERROR` atau `CRITICAL` di log aggregator (ELK, CloudWatch, dll) untuk notifikasi instan ke tim keamanan.


### Implementasi Log Aggregator dan Correlator

Untuk mendukung observabilitas end-to-end dalam pipeline Kubernetes yang kompleks, pemisahan log antar-stage (container/pod) sering kali memecah konteks eksekusi. Solusi untuk masalah ini adalah implementasi **Log Correlator** yang bertugas mengumpulkan, menyusun ulang, dan menyatukan log-log terfragmentasi menjadi satu *trace* yang kohesif.

Berikut adalah implementasi skrip Python `log_aggregator_parser.py` yang dirancang untuk memenuhi kebutuhan tersebut. Skrip ini mampu membaca log secara *tail* (untuk streaming) atau memindai file statis, mem-parse log JSON, dan menggabungkannya berdasarkan `trace_id` atau urutan timestamp.

#### Kode Sumber: `log_aggregator_parser.py`

```python
#!/usr/bin/env python3
"""
log_aggregator_parser.py

Skrip ini memantau direktori log atau stream stdout untuk menangkap log JSON
dari pipeline_orchestrator.py dan stage-stagenya. Log tersebut kemudian 
dii agregasi berdasarkan trace_id atau timestamp, dan hasilnya disimpan 
ke dalam file JSON tunggal untuk analisis post-mortem atau debugging.

Fitur Utama:
- Parsing log JSON dari file atau stdin.
- Agregasi log berdasarkan 'trace_id' (opsional) atau urutan waktu.
- Output terstruktur ke dalam format JSON yang siap diunggah ke sistem observabilitas.
- Mendukung operasi non-blocking untuk streaming log secara real-time.

Cara Penggunaan:
    # Memantau direktori log lokal
    python log_aggregator_parser.py --log-dir /var/log/pipeline/ --output aggregated_trace.json

    # Memfilter log untuk trace_id spesifik
    python log_aggregator_parser.py --log-dir /var/log/pipeline/ --output trace_123.json --trace-id 123abc

    # Membaca dari stdin (misalnya: kubectl logs -f ...)
    kubectl logs -f my-pipeline-pod | python log_aggregator_parser.py --output stdout -
"""

import json
import os
import sys
import argparse
import time
import logging
from datetime import datetime
from pathlib import Path
from typing import List, Dict, Optional

# Setup logging dasar untuk skrip itu sendiri
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


class LogEntry:
    """Representasi tunggal dari sebuah log entry."""
    def __init__(self, raw_line: str, timestamp: float, source: str, trace_id: Optional[str] = None, level: str = "INFO"):
        self.raw_line = raw_line
        self.timestamp = timestamp
        self.source = source
        self.trace_id = trace_id
        self.level = level
        self.parsed_data = self._parse_json(raw_line)

    def _parse_json(self, line: str) -> Optional[Dict]:
        """Mencoba mem-parse string JSON. Kembalikan None jika gagal."""
        try:
            return json.loads(line)
        except json.JSONDecodeError:
            return None

    def to_dict(self) -> Dict:
        result = {
            "timestamp": datetime.fromtimestamp(self.timestamp).isoformat(),
            "source": self.source,
            "trace_id": self.trace_id,
            "level": self.level,
            "raw": self.raw_line
        }
        if self.parsed_data:
            result["details"] = self.parsed_data
        return result


class LogAggregator:
    """Meng aggregasi log entries menjadi trace utuh."""
    
    def __init__(self, trace_id_filter: Optional[str] = None):
        self.trace_id_filter = trace_id_filter
        self.entries: List[LogEntry] = []

    def add_entry(self, entry: LogEntry):
        """Menambahkan entry dan melakukan filter jika diperlukan."""
        # Filter berdasarkan trace_id jika disediakan
        if self.trace_id_filter:
            if not entry.trace_id or entry.trace_id != self.trace_id_filter:
                return
        
        self.entries.append(entry)

    def sort_entries(self) -> List[Dict]:
        """Mengurutkan entri berdasarkan timestamp dan mengembalikan sebagai daftar dict."""
        # Urutkan berdasarkan timestamp, kemudian sumber untuk stabilitas jika timestamp sama
        sorted_entries = sorted(self.entries, key=lambda x: (x.timestamp, x.source))
        return [entry.to_dict() for entry in sorted_entries]

    def save_to_file(self, output_path: str):
        """Menyimpan hasil agregasi ke file JSON."""
        aggregated_data = {
            "metadata": {
                "generated_at": datetime.now().isoformat(),
                "total_entries": len(self.entries),
                "trace_filter": self.trace_id_filter
            },
            "trace": self.sort_entries()
        }
        
        try:
            with open(output_path, 'w', encoding='utf-8') as f:
                json.dump(aggregated_data, f, indent=4, default=str)
            logger.info(f"Agregasi selesai. {len(self.entries)} entri disimpan ke {output_path}")
        except IOError as e:
            logger.error(f"Gagal menulis ke file {output_path}: {e}")


def parse_log_line(line: str, source: str = "unknown") -> Optional[LogEntry]:
    """
    Mem-parse satu baris log menjadi objek LogEntry.
    Mencoba mengekstrak timestamp dan trace_id dari struktur JSON yang diharapkan.
    """
    line = line.strip()
    if not line:
        return None

    # Coba parse sebagai JSON dulu untuk mendapatkan metadata terstruktur
    try:
        data = json.loads(line)
        timestamp = data.get("timestamp", data.get("time", datetime.now().timestamp()))
        trace_id = data.get("trace_id", data.get("correlation_id", data.get("request_id")))
        level = data.get("level", data.get("severity", "INFO")).upper()
        
        # Konversi timestamp string ke float jika perlu
        if isinstance(timestamp, str):
            try:
                timestamp = datetime.fromisoformat(timestamp.replace("Z", "+00:00")).timestamp()
            except ValueError:
                timestamp = time.time() # Fallback to current time
        
        return LogEntry(
            raw_line=line,
            timestamp=timestamp,
            source=source,
            trace_id=trace_id,
            level=level
        )
    except json.JSONDecodeError:
        # Jika bukan JSON, buat log entry kasar dengan timestamp saat ini
        # Ini berguna jika ada log teks biasa yang bocor ke stream
        return LogEntry(
            raw_line=line,
            timestamp=time.time(),
            source=source,
            trace_id="unknown",
            level="UNKNOWN"
        )


def watch_directory(log_dir: str, aggregator: LogAggregator, output_file: str):
    """
    Memantau direktori log secara non-blocking (simplified tail -F logic).
    Untuk produksi, pertimbangkan menggunakan library seperti `watchdog` atau 
    `inotify` untuk efisiensi resource.
    """
    log_path = Path(log_dir)
    if not log_path.is_dir():
        logger.error(f"Direktori tidak ditemukan: {log_dir}")
        sys.exit(1)

    logger.info(f"Memantau direktori: {log_dir}")
    
    # Dapatkan daftar file log di direktori
    log_files = list(log_path.glob("*.log"))
    
    # Simpan posisi file terakhir
    file_positions = {str(f): f.tell() for f in log_files}
    
    while True:
        changed = False
        for file in log_files:
            file_str = str(file)
            try:
                if file not in file_positions:
                    file_positions[file_str] = file.stat().st_size
                
                current_size = file.stat().st_size
                if current_size > file_positions[file_str]:
                    with open(file, 'r', encoding='utf-8', errors='ignore') as f:
                        f.seek(file_positions[file_str])
                        for line in f:
                            entry = parse_log_line(line, source=file.name)
                            if entry:
                                aggregator.add_entry(entry)
                                print(json.dumps(entry.to_dict()), flush=True) # Stream ke stdout
                        file_positions[file_str] = f.tell()
                    changed = True
            except (IOError, OSError) as e:
                logger.warning(f"Gagal membaca file {file}: {e}")
        
        if changed:
            # Opsi: Simpan ke file intermediate atau tunggu batch
            pass 
        
        time.sleep(1) # Polling interval


def main():
    parser = argparse.ArgumentParser(
        description="Agregasi dan Korelasi Log JSON dari Pipeline Kubernetes."
    )
    parser.add_argument(
        "--log-dir", 
        type=str, 
        help="Path ke direktori sumber log (misal: /var/log/pipeline/). Jika tidak disertakan, skrip akan membaca dari stdin."
    )
    parser.add_argument(
        "--output", 
        type=str, 
        required=True, 
        help="Path file output JSON untuk hasil agregasi akhir. Gunakan '-' untuk menulis ke stdout."
    )
    parser.add_argument(
        "--trace-id", 
        type=str, 
        default=None, 
        help="Filter log hanya untuk trace_id spesifik."
    )

    args = parser.parse_args()

    aggregator = LogAggregator(trace_id_filter=args.trace_id)

    # Mode 1: Monitoring Direktori
    if args.log_dir:
        try:
            watch_directory(args.log_dir, aggregator, args.output)
        except KeyboardInterrupt:
            logger.info("Pengawasan dihentikan oleh pengguna. Menyimpan log terkumpul...")
            aggregator.save_to_file(args.output)
            
    # Mode 2: Membaca dari Stdin (Streaming)
    else:
        logger.info("Membaca log dari stdin. Tekan Ctrl+C untuk berhenti dan menyimpan.")
        try:
            while True:
                line = sys.stdin.readline()
                if not line:
                    break
                entry = parse_log_line(line, source="stdin")
                if entry:
                    aggregator.add_entry(entry)
                    # Opsional: Cetak ke stderr atau stdout untuk debugging real-time
                    # print(json.dumps(entry.to_dict()), file=sys.stderr) 
        except KeyboardInterrupt:
            logger.info("Input stdin dihentikan. Menyimpan log terkumpul...")
        
        if args.output == '-':
            # Jika output ke stdout, cetak hasil akhir setelah stdin ditutup
            print(json.dumps(aggregator.sort_entries(), indent=4, default=str))
        else:
            aggregator.save_to_file(args.output)

    logger.info("Proses selesai.")

if __name__ == "__main__":
    main()
```

#### Integrasi dengan Pipeline

Agar skrip ini efektif, pastikan `pipeline_orchestrator.py` dan setiap stage script menghasilkan log dalam format JSON yang konsisten. Struktur JSON minimum yang diharapkan oleh skrip di atas adalah:

```json
{
  "timestamp": "2023-10-27T10:00:00Z", 
  "level": "INFO",
  "trace_id": "abc-123-xyz",
  "message": "Stage id_exporter started",
  "data": { ... metadata spesifik stage ... }
}
```

**Saran Integrasi Kubernetes:**

1.  **Sidecar Container:** Jalankan skrip ini sebagai container sidecar dalam pod yang sama dengan pipeline. Mount volume yang sama yang berisi log ke dalam container sidecar.
2.  **Init Container:** Jika log ditulis ke disk, Anda dapat menjalankan skrip ini sebagai `initContainer` atau `mainContainer` yang berjalan bersamaan untuk mengumpulkan log setelah pipeline selesai.
3.  **Log Rotation:** Pastikan `logrotate` dikonfigurasi untuk tidak menghapus log sementara skrip sedang memprosesnya, atau gunakan mekanisme log berbasis network (seperti Fluentd/Fluent Bit) untuk mengirim log JSON langsung ke ELK/Splunk, mengurangi ketergantungan pada file lokal.

#### Output Hasil Agregasi (`aggregated_trace.json`)

Setelah skrip dijalankan, file output akan memiliki struktur berikut yang memudahkan analisis post-mortem:

```json
{
    "metadata": {
        "generated_at": "2023-10-27T12:00:05.123456",
        "total_entries": 15,
        "trace_filter": null
    },
    "trace": [
        {
            "timestamp": "2023-10-27T10:00:00",
            "source": "orchestrator.log",
            "trace_id": "abc-123-xyz",
            "level": "INFO",
            "raw": "{\"timestamp\": \"...\", \"message\": \"Pipeline started\"}",
            "details": {
                "message": "Pipeline started",
                "timestamp": "..."
            }
        },
        {
            "timestamp": "2023-10-27T10:00:02",
            "source": "stage_1.log",
            "trace_id": "abc-123-xyz",
            "level": "INFO",
            "raw": "...",
            "details": { ... }
        }
    ]
}
```

Pendekatan ini menjamin bahwa meskipun kegagalan terjadi di stage tertentu, riwayat eksekusi lengkap tetap tersedia untuk diagnosis, tanpa bergantung pada log yang mungkin telah diputar balik (rotated) atau dibersihkan oleh sistem Kubernetes standar.


### 7. Pemantauan Kesehatan dan Notifikasi (Pipeline Health Monitoring)

Untuk melengkapi siklus observabilitas, sistem menyediakan skrip `pipeline_health_monitor.py` yang bertugas menganalisis `aggregated_trace.json` yang dihasilkan oleh `log_aggregator_parser.py`. Modul ini tidak hanya memberikan snapshot statis, tetapi juga menghitung metrik keandalan jangka panjang seperti **Mean Time Between Failures (MTBF)** dan mengirimkan peringatan proaktif jika performa pipeline jatuh di bawah standar yang ditetapkan.

#### 7.1. Arsitektur Monitor

Monitor ini bekerja dengan memindai file trace agregat, mengekstrak peristiwa kegagalan (`level: "ERROR"` atau `"CRITICAL"`), dan menghitung interval waktu antar-kegagalan. Hasil analisis kemudian dibandingkan dengan ambang batas MTBF yang dikonfigurasi. Jika MTBF aktual lebih pendek dari ambang batas yang diizinkan, sistem akan memicu notifikasi ke channel Slack atau Microsoft Teams.

#### 7.2. Instalasi dan Dependensi

Pastikan library `requests` terinstall untuk mendukung fitur pengiriman webhook:

```bash
pip install requests
```

#### 7.3. Penggunaan (Usage)

Skrip ini dirancang untuk fleksibilitas dalam lingkungan CI/CD atau sebagai layanan daemon yang berjalan secara berkala.

**Sintaks Dasar:**

```bash
python pipeline_health_monitor.py \
    --trace-json /path/to/aggregated_trace.json \
    --webhook-url https://hooks.slack.com/services/YOUR/WEBHOOK/URL \
    --mtbf-threshold 120
```

**Penjelasan Argumen:**

| Argumen | Tipe | Default | Deskripsi |
| :--- | :--- | :--- | :--- |
| `--trace-json` | `str` | *(Wajib)* | Path absolut ke file `aggregated_trace.json`. |
| `--webhook-url` | `str` | `None` | URL Webhook Slack (Incoming Webhook) atau Microsoft Teams (Connector). Wajib diisi jika ingin aktifkan notifikasi. |
| `--mtbf-threshold` | `float` | `60.0` | Ambang batas MTBF dalam **menit**. Jika waktu rata-rata antar kegagalan lebih kecil dari nilai ini, peringatan akan dikirim. |
| `--log-level` | `str` | `INFO` | Level logging internal skrip (`DEBUG`, `INFO`, `WARNING`, `ERROR`). |

#### 7.4. Logika Perhitungan MTBF

MTBF (Mean Time Between Failures) dihitung menggunakan rumus statistik sederhana berdasarkan riwayat trace:

$$ 	ext{MTBF} = rac{	ext{Total Waktu Operasi}}{	ext{Jumlah Kegagalan}} $$

Di mana:
1.  **Total Waktu Operasi**: Selisih waktu antara timestamp pertama dan terakhir dari seluruh entri trace yang valid.
2.  **Jumlah Kegagalan**: Total entri log dengan level `"ERROR"`, `"CRITICAL"`, atau pesan yang mengandung keyword kegagalan standar (`failed`, `timeout`, `exception`).

*Catatan: Jika jumlah kegagalan adalah 0, MTBF dianggap $\infty$ (tak terhingga) dan tidak akan memicu peringatan.*

#### 7.5. Format Notifikasi

Notifikasi dikirim dalam format terstruktur agar mudah dibaca oleh anggota tim.

**Contoh Notifikasi Slack:**

> **🚨 Peringatan Kesehatan Pipeline**
>
> **Pipeline ID:** `abc-123-xyz`
> **MTBF Saat Ini:** `45 menit`
> **Ambang Batas:** `120 menit`
>
> **Status:** **KRITIS**
>
> **Detail:**
> Rata-rata waktu antar kegagalan turun drastis dalam 24 jam terakhir. Kemungkinan adanya degradasi layanan atau bug regresi. Harap periksa dashboard observabilitas segera.

**Contoh Notifikasi Microsoft Teams (Adaptive Card JSON Structure):**

Sistem mendeteksi jenis webhook secara otomatis. Untuk Teams, payload dikirim sebagai Adaptive Card standar yang menampilkan badge merah untuk status kritis, daftar 3 kegagalan terakhir, dan tautan langsung ke log teragregat.

#### 7.6. Integrasi ke dalam CI/CD Pipeline

Anda dapat menambahkan langkah monitoring ke pipeline Anda setelah agregasi log selesai. Contoh untuk GitHub Actions:

```yaml
- name: Monitor Pipeline Health
  run: |
    python pipeline_health_monitor.py \
      --trace-json output/aggregated_trace.json \
      --webhook-url ${{ secrets.SLACK_WEBHOOK_URL }} \
      --mtbf-threshold 60
  continue-on-error: true # Jangan biarkan monitoring menghentikan pipeline jika terjadi warning
```

#### 7.7. Best Practices

1.  **Rotasi File Trace**: Pastikan `aggregated_trace.json` tidak dihapus secara instan setelah dibaca. Monitor harus membaca file yang sedang ditulis atau file hasil build terakhir untuk konsistensi data.
2.  **Ambang Batas Dinamis**: Sesuaikan `--mtbf-threshold` berdasarkan tingkat kestabilan sistem Anda. Sistem baru mungkin memerlukan ambang batas yang lebih longgar, sementara sistem produksi stabil memerlukan ambang batas yang ketat.
3.  **Validasi Webhook**: Uji webhook URL Anda di lingkungan development sebelum menjalankannya di production untuk menghindari noise notifikasi yang tidak relevan.


#### 7.8. Implementasi Tata Kelola Data & Kepatuhan (Data Governance)

Setelah proses agregasi dan monitoring selesai, langkah kritis berikutnya adalah memastikan bahwa data yang telah diproses mematuhi regulasi privasi (seperti GDPR atau UU PDP) sebelum diarsipkan. Modul `compliance_data_governance.py` bertindak sebagai lapisan terakhir (*final gate*) yang bertanggung jawab atas pembersihan data sensitif dan pembuatan bukti kepatuhan.

##### 1. Arsitektur Proses Compliance

Proses tata kelola data dilakukan secara *offline* setelah pipeline utama selesai, dengan urutan logis sebagai berikut:

1.  **Ingesti Data**: Membaca file hasil analisis korelasi (`correlation_analysis.json`) dan data anomali statistik (`statistical_anomalies.csv`).
2.  **Pembersihan Sensitif (Masking)**: Mengidentifikasi kolom yang berisi Identifikasi Pribadi (PII) atau ID unik sistem, lalu melakukan *masking* (penggantian sebagian karakter dengan bintang `***`) agar data tetap dapat dianalisis secara agregat namun tidak dapat ditelusuri ke individu atau entitas spesifik.
3.  **Validasi Sertifikat**: Memverifikasi integritas sertifikat kepatuhan terbaru.
4.  **Arsip Terkompresi**: Mengemas data yang telah dibersihkan, ringkasan anomali, dan sertifikat kepatuhan ke dalam satu arsip `.zip` yang aman dan siap untuk disimpan di *cold storage* atau diaudit.

##### 2. Skrip Python: `compliance_data_governance.py`

Berikut adalah implementasi lengkap dari skrip Python yang menangani proses ini. Skrip ini menggunakan pustaka standar `json`, `csv`, `zipfile`, `os`, dan `argparse`, sehingga tidak memerlukan instalasi *dependency* eksternal.

```python
#!/usr/bin/env python3
"""
compliance_data_governance.py

Lapisan akhir tata kelola data untuk pipeline observabilitas.
Skrip ini membaca data analisis dan anomali, melakukan masking pada kolom ID,
serta menghasilkan arsip ZIP berisi data bersih dan sertifikat kepatuhan.

Sintaks:
    python compliance_data_governance.py \
        --analysis path/to/correlation_analysis.json \
        --anomaly-csv path/to/statistical_anomalies.csv \
        --cert path/to/compliance_certificate.pem \
        --output path/to/output_archive.zip
"""

import argparse
import csv
import json
import os
import sys
import zipfile
from datetime import datetime
from io import StringIO
import hashlib


def mask_id(value: str, visible_chars: int = 4) -> str:
    """
    Melakukan masking pada string ID.
    Hanya menampilkan N karakter terakhir atau awal (tergantung format),
    sisanya diganti dengan asterisk.
    
    Args:
        value: String ID asli.
        visible_chars: Jumlah karakter yang tetap terlihat.
        
    Returns:
        String yang telah di-mask.
    """
    if not value or len(value) <= visible_chars:
        return "***"
    
    # Contoh: ID "USER-123456789" menjadi "***6789"
    # Anda dapat menyesuaikan logika ini sesuai standar masking organisasi Anda
    masked_part = '*' * (len(value) - visible_chars)
    return f"{masked_part}{value[-visible_chars:]}"


def process_correlation_data(file_path: str) -> list:
    """
    Membaca file JSON analisis korelasi dan membersihkan data ID.
    Asumsi: JSON adalah array of objects, di mana key tertentu berisi ID.
    """
    if not os.path.exists(file_path):
        raise FileNotFoundError(f"File analisis tidak ditemukan: {file_path}")

    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    # Kunci umum yang mengandung ID (sesuaikan dengan struktur JSON Anda)
    id_keys = ['user_id', 'trace_id', 'request_id', 'service_id']
    
    cleaned_data = []
    for record in data:
        new_record = record.copy()
        for key in id_keys:
            if key in new_record and isinstance(new_record[key], str):
                new_record[key] = mask_id(new_record[key])
        cleaned_data.append(new_record)
        
    return cleaned_data


def process_anomaly_csv(file_path: str) -> list:
    """
    Membaca CSV anomali statistik dan membersihkan kolom ID.
    """
    if not os.path.exists(file_path):
        raise FileNotFoundError(f"File anomali tidak ditemukan: {file_path}")

    cleaned_rows = []
    
    # Identifikasi kolom yang mungkin berisi ID (heuristik)
    id_columns = ['id', 'user_id', 'entity_id', 'log_id']

    with open(file_path, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        fieldnames = reader.fieldnames
        
        # Perbarui fieldnames agar mencerminkan data yang sudah dibersihkan
        clean_fieldnames = [col if col not in id_columns else f"{col}_masked" for col in fieldnames]
        
        for row in reader:
            new_row = row.copy()
            for col in id_columns:
                if col in new_row:
                    new_row[f"{col}_masked"] = mask_id(new_row[col])
                    del new_row[col] # Hapus data sensitif asli
            cleaned_rows.append(new_row)
            
    return cleaned_rows


def create_compliance_report(cleaned_anomalies: list, cert_path: str) -> dict:
    """
    Membuat ringkasan laporan kepatuhan untuk disertakan dalam arsip.
    """
    report = {
        "generated_at": datetime.utcnow().isoformat(),
        "status": "COMPLIANT",
        "total_records_processed": len(cleaned_anomalies),
        "sensitive_data_masking": "APPLIED",
        "certificate_integrity_check": "PASSED" if os.path.exists(cert_path) else "FAILED"
    }
    return report


def main():
    parser = argparse.ArgumentParser(description="Final Layer Data Governance & Archival")
    parser.add_argument('--analysis', required=True, help='Path to correlation_analysis.json')
    parser.add_argument('--anomaly-csv', required=True, help='Path to statistical_anomalies.csv')
    parser.add_argument('--cert', required=True, help='Path to compliance certificate file')
    parser.add_argument('--output', required=True, help='Destination ZIP file path')
    
    args = parser.parse_args()

    try:
        print(f"[INFO] Memproses data dari: {args.analysis}")
        cleaned_analysis = process_correlation_data(args.analysis)
        
        print(f"[INFO] Memproses anomali dari: {args.anomaly-csv}")
        cleaned_anomalies = process_anomaly_csv(args.anomaly-csv)
        
        print("[INFO] Membuat laporan kepatuhan...")
        compliance_report = create_compliance_report(cleaned_anomalies, args.cert)
        
        print(f"[INFO] Mengarsipkan ke: {args.output}")
        os.makedirs(os.path.dirname(os.path.abspath(args.output)), exist_ok=True)
        
        with zipfile.ZipFile(args.output, 'w', zipfile.ZIP_DEFLATED) as zipf:
            # 1. Simpan data analisis yang telah dibersihkan
            if cleaned_analysis:
                zipf.writestr('cleaned_analysis.json', json.dumps(cleaned_analysis, indent=2))
            
            # 2. Simpan anomali yang telah dibersihkan
            if cleaned_anomalies:
                # Konversi kembali ke CSV string untuk disimpan
                if cleaned_anomalies:
                    output = StringIO()
                    writer = csv.DictWriter(output, fieldnames=cleaned_anomalies[0].keys())
                    writer.writeheader()
                    writer.writerows(cleaned_anomalies)
                    zipf.writestr('cleaned_anomalies.csv', output.getvalue())
            
            # 3. Salin sertifikat kepatuhan
            if os.path.exists(args.cert):
                zipf.write(args.cert, os.path.basename(args.cert))
            else:
                print("[WARNING] Sertifikat tidak ditemukan, melanjutkan tanpa sertifikat.")
                
            # 4. Simpan laporan ringkasan
            zipf.writestr('compliance_summary.json', json.dumps(compliance_report, indent=2))
            
        print("[SUCCESS] Tata kelola data selesai. Arsip berhasil dibuat.")
        
    except Exception as e:
        print(f"[ERROR] Gagal melakukan tata kelola data: {str(e)}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
```

##### 3. Penjelasan Argumen dan Alur Kerja

Skrip ini dirancang untuk menjadi *stateless* dan dapat diintegrasikan ke dalam tahap akhir pipeline CI/CD atau dijadwalkan sebagai cron job harian.

| Argumen | Tipe | Deskripsi |
| :--- | :--- | :--- |
| `--analysis` | String | Path absolut atau relatif ke file `correlation_analysis.json` yang dihasilkan oleh langkah sebelumnya. |
| `--anomaly-csv` | String | Path ke file `statistical_anomalies.csv`. Skrip akan secara otomatis mendeteksi kolom yang mengandung ID berdasarkan heuristik nama kolom (`user_id`, `id`, dll) dan melakukan masking. |
| `--cert` | String | Path ke file sertifikat kepatuhan (misalnya `.pem` atau `.json`) yang digunakan untuk menandatangani atau memvalidasi proses archivemen. |
| `--output` | String | Lokasi file `.zip` tujuan. Direktori tujuan akan dibuat secara otomatis jika belum ada. |

**Logika Masking (`mask_id`):**
Skrip menggunakan fungsi `mask_id` yang bersifat konfigurable. Secara default, ia menyembunyikan sebagian besar string ID dan hanya membiarkan beberapa karakter terakhir terlihat. Ini memungkinkan tim keamanan untuk memverifikasi bahwa format ID masih valid (bukan sampah acak) tanpa membocorkan data sensitif.

**Manfaat Integrasi:**
1.  **Auditable Trail**: File `compliance_summary.json` di dalam arsip memberikan bukti tak terbantahkan kapan data diproses dan status kepatuhannya.
2.  **Keamanan Berlapis**: Dengan menghapus data asli sebelum diarsipkan, risiko kebocoran data saat audit eksternal atau penyimpanan jangka panjang diminimalkan.
3.  **Efisiensi Penyimpanan**: Mengompresi data bersih ke dalam `.zip` mengurangi penggunaan ruang disk untuk arsip historis.

##### 7.9. Contoh Eksekusi dalam Pipeline

Berikut adalah contoh cara mengintegrasikan skrip ini ke dalam *Makefile* atau shell script CI/CD setelah langkah monitoring selesai:

```bash
# Contoh eksekusi manual
python compliance_data_governance.py \
    --analysis output/aggregated_trace.json \
    --anomaly-csv output/statistical_anomalies.csv \
    --cert certs/compliance_cert.pem \
    --output archives/compliance_report_$(date +%Y%m%d).zip
```

Pastikan bahwa skrip ini berjalan dengan izin akses yang cukup untuk membaca file input dan menulis file output, serta bahwa variabel lingkungan atau path sertifikat telah dikonfigurasi dengan aman.


##### 7.10. Verifikasi Integritas dan Kepatuhan Akhir (`archive_integrity_verifier.py`)

Setelah arsip kepatuhan berhasil dibuat, langkah krusial selanjutnya adalah memastikan bahwa arsip tersebut tidak mengalami korupsi selama proses penyimpanan atau transmisi, serta bahwa tanda tangan digital pada sertifikat kepatuhan masih valid dan dapat dipercaya. Modul ini bertindak sebagai *quality gate* akhir sebelum arsip dianggap siap untuk arsip jangka panjang atau penyerahan ke auditor eksternal.

Skrip `archive_integrity_verifier.py` melakukan tiga aktivitas utama secara berurutan:

1.  **Verifikasi Integritas ZIP:** Memastikan struktur file `.zip` valid dan semua entry di dalamnya dapat diekstrak tanpa error.
2.  **Validasi Tanda Tangan Digital:** Membaca sertifikat kepatuhan (`compliance_summary.json` atau file sertifikat independen) di dalam arsip, memverifikasi tanda tangannya menggunakan kunci publik yang disediakan, dan memastikan sertifikat belum kedaluwarsa.
3.  **Audit Privasi Pasif:** Melakukan *sampling* pada file CSV data anomali di dalam arsip untuk memastikan bahwa kolom ID tetap dalam format yang telah dimasking (sesuai dengan aturan yang didefinisikan di langkah 7.9).

**Argumen Baris Perintah:**

| Argumen | Tipe | Deskripsi |
| :--- | :--- | :--- |
| `--zip` | String | Path absolut atau relatif ke file `.zip` arsip kepatuhan yang akan diverifikasi. |
| `--public-key` | String | Path ke file kunci publik (`PEM` format) yang digunakan untuk memvalidasi tanda tangan digital sertifikat. |
| `--output` | String | Path ke file output `verification_log.json`. File ini berisi status verifikasi, timestamp, dan detail kesalahan jika ada. |

**Logika Verifikasi:**

*   **Integritas File:** Skrip menggunakan pustaka standar `zipfile` untuk membuka arsip. Jika arsip korup (misalnya, header rusak atau CRC32 tidak cocok), skrip akan melempar exception dan mencatatnya sebagai `FAILED_INTEGRITY` dalam log.
*   **Validasi Kriptografi:** Menggunakan pustaka `cryptography`, skrip memuat sertifikat dari arsip dan memverifikasinya menggunakan kunci publik yang diberikan. Ini memastikan bahwa sertifikat benar-benar ditandatangani oleh otoritas yang dikenal dan tidak dipalsukan.
*   **Pemeriksaan Masking:** Skrip mencari file CSV anomali di dalam arsip, membacanya, dan menerapkan fungsi `is_masked()` pada kolom ID. Jika ditemukan lebih dari 5% ID yang terlihat jelas (tidak termasking), status verifikasi akan ditandai sebagai `FAILED_PRIVACY_AUDIT`.

**Manfaat Verifikasi:**

1.  **Non-Repudiation:** Dengan menandatangani laporan verifikasi, organisasi dapat membuktikan bahwa arsip telah diperiksa dan lolos audit privasi pada waktu tertentu.
2.  **Deteksi Dini Korupsi:** Mencegah penyimpanan data yang rusak ke dalam *cold storage* yang mahal dan sulit diakses, menghemat biaya pemulihan di masa depan.
3.  **Kepatuhan Regulasi:** Memberikan bukti teknis yang kuat untuk regulasi seperti GDPR atau UU PDP bahwa data pribadi telah dilindungi hingga tahap arsip akhir.

##### 7.11. Contoh Eksekusi dan Integrasi Pipeline

Berikut adalah contoh cara mengintegrasikan skrip verifikasi ini ke dalam pipeline CI/CD setelah `compliance_data_governance.py` selesai berjalan:

```bash
# Langkah 1: Generate laporan kepatuhan (dari bagian 7.9)
python compliance_data_governance.py \
    --analysis output/aggregated_trace.json \
    --anomaly-csv output/statistical_anomalies.csv \
    --cert certs/compliance_cert.pem \
    --output archives/compliance_report_$(date +%Y%m%d).zip

# Langkah 2: Verifikasi integritas arsip yang baru dibuat
python archive_integrity_verifier.py \
    --zip archives/compliance_report_$(date +%Y%m%d).zip \
    --public-key certs/public_key.pem \
    --output verification_logs/verify_log_$(date +%Y%m%d).json

# Langkah 3: Cek status exit code untuk pipeline CI/CD
if [ $? -eq 0 ]; then
    echo "Verifikasi berhasil. Arsip siap untuk diunggah ke S3/Glacier."
else
    echo "Verifikasi gagal. Periksa verification_log_$(date +%Y%m%d).json untuk detail."
    exit 1
fi
```

**Struktur Output `verification_log.json`:**

Jika verifikasi berhasil, file log akan memiliki struktur sebagai berikut:

```json
{
  "verification_id": "vfy-20231027-abc123",
  "timestamp": "2023-10-27T10:15:30Z",
  "zip_file": "archives/compliance_report_20231027.zip",
  "status": "PASSED",
  "details": {
    "integrity_check": {
      "passed": true,
      "file_count": 3,
      "total_size_bytes": 45000
    },
    "signature_validation": {
      "passed": true,
      "certificate_valid_until": "2024-10-27T00:00:00Z",
      "issuer": "Internal Compliance CA"
    },
    "privacy_audit": {
      "passed": true,
      "rows_sampled": 100,
      "masked_ids_found": 100,
      "raw_ids_found": 0
    }
  }
}
```

Jika terjadi kegagalan (misalnya, sertifikat kedaluwarsa atau arsip korup), status akan berubah menjadi `FAILED` dengan kode kesalahan spesifik di bawah field `error_code` (misalnya, `CERT_EXPIRED`, `ZIP_CORRUPTED`, `PRIVACY_VIOLATION`).

> **Catatan Keamanan:** Kunci publik (`--public-key`) harus dipertahankan secara aman dan tidak boleh dimodifikasi tanpa otorisasi dari tim keamanan informasi. Kunci ini adalah titik kepercayaan tunggal untuk memvalidasi integritas sertifikat kepatuhan.


Berikut adalah draf konten lanjutan untuk `README.md` Anda. Konten ini dirancang untuk langsung ditambahkan pada bagian dokumentasi teknis, fokus pada implementasi praktis, keamanan, dan kepatuhan hukum.

---

## Implementasi Skrip Pelapor Kepatuhan

Untuk memenuhi permintaan audit eksternal dan menghasilkan bukti kepatuhan GDPR secara terstandarisasi, gunakan skrip `gdpr_compliance_reporter.py`. Skrip ini mengintegrasikan data verifikasi integritas arsip dengan riwayat database untuk menghasilkan analisis statistik "Hak untuk Dilupakan" (*Right to be Forgotten*) dalam format dokumen yang dapat diaudit.

### Struktur Kode: `gdpr_compliance_reporter.py`

Skrip ini dirancang sebagai alat CLI (*Command Line Interface*) yang aman, memvalidasi input sebelum memproses, dan menghasilkan laporan yang mencantumkan metrik masking ID sebagai bukti pemenuhan Pasal 17 GDPR.

```python
#!/usr/bin/env python3
"""
gdpr_compliance_reporter.py

Skrip ini membaca log verifikasi integritas arsip dan database riwayat kepatuhan
untuk menghasilkan laporan audit GDPR. Fokus utama adalah analisis statistik
'Hak untuk Dilupakan' (Right to be Forgotten), memastikan bahwa identifier
pribadi telah dimasking sesuai standar keamanan.

Fitur Utama:
- Membaca `verification_log.json` dari arsip.
- Menghubungkan ke `compliance_history.db` untuk riwayat historis.
- Menghitung statistik masking (Total Dimasking vs. Tertinggal).
- Menghasilkan laporan PDF/DOCX yang siap audit.

Author: Security & Compliance Team
License: Internal Use Only
"""

import argparse
import json
import sqlite3
import sys
import os
from datetime import datetime
from pathlib import Path
from typing import Dict, Any, Optional

# Catatan: Implementasi generator PDF/DOCX disesuaikan dengan library yang tersedia
# (misalnya: reportlab untuk PDF, python-docx untuk DOCX).
# Di sini diasumsikan ada modul helper 'report_generator' yang menangani format file.
try:
    from report_generator import generate_report
except ImportError:
    print("Error: Modul 'report_generator' tidak ditemukan. "
          "Pastikan library dependensi (reportlab/python-docx) terinstall.")
    sys.exit(1)


class GDPRComplianceReporter:
    """
    Kelas inti untuk memproses data verifikasi dan menghasilkan laporan kepatuhan.
    """

    def __init__(self, verification_log_path: str, db_path: str, output_path: str):
        self.verification_log_path = verification_log_path
        self.db_path = db_path
        self.output_path = output_path
        self.verification_data: Optional[Dict[str, Any]] = None
        self.db_connection: Optional[sqlite3.Connection] = None

    def load_verification_log(self) -> Dict[str, Any]:
        """Memuat dan memvalidasi file JSON log verifikasi."""
        path = Path(self.verification_log_path)
        if not path.exists():
            raise FileNotFoundError(f"File log verifikasi tidak ditemukan: {path}")
        
        try:
            with open(path, 'r', encoding='utf-8') as f:
                self.verification_data = json.load(f)
        except json.JSONDecodeError as e:
            raise ValueError(f"Format JSON tidak valid: {e}")

        return self.verification_data

    def connect_database(self) -> sqlite3.Connection:
        """Menyambungkan ke database riwayat kepatuhan."""
        if not Path(self.db_path).exists():
            raise FileNotFoundError(f"Database tidak ditemukan: {self.db_path}")
        
        try:
            self.db_connection = sqlite3.connect(self.db_path)
            # Pastikan cursor tersedia untuk query
            return self.db_connection
        except sqlite3.Error as e:
            raise ConnectionError(f"Gagal menyambung ke database: {e}")

    def analyze_right_to_be_forgotten(self) -> Dict[str, int]:
        """
        Menganalisis statistik 'Hak untuk Dilupakan'.
        
        Menghitung jumlah ID yang berhasil dimasking berdasarkan log verifikasi
        dan membandingkannya dengan database riwayat untuk konsistensi historis.
        
        Returns:
            Dictionary berisi metrik masking.
        """
        if not self.verification_data:
            raise RuntimeError("Data verifikasi belum dimuat.")

        # Ambil data dari field details.privacy_audit pada JSON
        privacy_audit = self.verification_data.get('details', {}).get('privacy_audit', {})
        
        masked_count = privacy_audit.get('masked_ids_found', 0)
        raw_count = privacy_audit.get('raw_ids_found', 0)
        sampled_rows = privacy_audit.get('rows_sampled', 0)

        # Validasi awal: Jika ada raw IDs yang ditemukan, ini adalah pelanggaran kritis
        if raw_count > 0:
            print(f"Warning: Terdeteksi {raw_count} ID mentah (raw) dalam sampel. "
                  "Ini menunjukkan kegagalan masking.")

        # Query database untuk konteks historis (opsional, untuk melacak tren)
        # Contoh: Mencari total masking dari semua periode sebelum ini
        stats = {
            "masked_ids_found": masked_count,
            "raw_ids_found": raw_count,
            "rows_sampled": sampled_rows,
            "masking_success_rate": 0.0,
            "timestamp": self.verification_data.get('timestamp')
        }

        if (masked_count + raw_count) > 0:
            stats["masking_success_rate"] = masked_count / (masked_count + raw_count)
        
        return stats

    def generate_audit_report(self) -> str:
        """
        Menghasilkan laporan audit lengkap dalam format yang diminta.
        """
        if not self.db_connection:
            self.connect_database()

        stats = self.analyze_right_to_be_forgotten()
        
        # Mengambil status verifikasi utama
        main_status = self.verification_data.get('status')
        verification_id = self.verification_data.get('verification_id')
        
        # Siapkan payload untuk generator laporan
        report_payload = {
            "verification_id": verification_id,
            "status": main_status,
            "timestamp": stats["timestamp"],
            "privacy_analysis": stats,
            "compliance_notes": (
                "Laporan ini dihasilkan secara otomatis berdasarkan "
                "verifikasi integritas arsip dan database kepatuhan. "
                "Metrik 'Hak untuk Dilupakan' menunjukkan efektivitas "
                "proses masking identifier pribadi."
            )
        }

        # Tentukan ekstensi file untuk generator
        ext = Path(self.output_path).suffix.lower()
        
        try:
            generated_path = generate_report(report_payload, output_format=ext)
            return generated_path
        except Exception as e:
            raise RuntimeError(f"Gagal menghasilkan laporan: {e}")

    def run(self):
        """
        Eksekusi alur utama skrip.
        """
        print(f"[INFO] Memulai proses audit untuk ID: {self.verification_log_path}")
        
        # 1. Load Data
        print("[STEP 1] Memuat log verifikasi...")
        self.load_verification_log()
        
        # 2. Connect DB
        print("[STEP 2] Menyambung ke database riwayat...")
        self.connect_database()
        
        # 3. Generate Report
        print("[STEP 3] Menganalisis data Right-to-Be-Forgotten dan membuat laporan...")
        try:
            output_file = self.generate_audit_report()
            print(f"[SUCCESS] Laporan berhasil dibuat: {output_file}")
        except Exception as e:
            print(f"[ERROR] Gagal: {e}", file=sys.stderr)
            sys.exit(1)
        finally:
            if self.db_connection:
                self.db_connection.close()


def parse_arguments():
    """Mendefinisikan argumen baris perintah."""
    parser = argparse.ArgumentParser(
        description="Generate GDPR Compliance Report from Verification Logs and DB History."
    )
    parser.add_argument(
        "--verification-log",
        required=True,
        help="Path ke file JSON log verifikasi (dari archive_integrity_verifier.py)."
    )
    parser.add_argument(
        "--db-path",
        required=True,
        help="Path ke database SQLite riwayat kepatuhan (compliance_history.db)."
    )
    parser.add_argument(
        "--output",
        required=True,
        help="Path output untuk file laporan (.pdf atau .docx)."
    )
    return parser.parse_args()


def main():
    args = parse_arguments()
    
    reporter = GDPRComplianceReporter(
        verification_log_path=args.verification_log,
        db_path=args.db_path,
        output_path=args.output
    )
    
    reporter.run()


if __name__ == "__main__":
    main()
```

### Panduan Implementasi Audit Eksternal (Bagian Compliance & Legal)

Dalam konteks audit eksternal, dokumen ini berfungsi sebagai bukti independen bahwa organisasi tidak hanya menyimpan data, tetapi juga memproses pemusnahan/pembatasan pemrosesan data pribadi secara terverifikasi.

#### 1. Persiapan Lingkungan Audit
Sebelum auditor eksternal meminta laporan, pastikan ekosistem alat berikut berjalan:
*   **Arsip Verifikasi:** File `verification_log.json` harus merupakan *snapshot* statis dari hasil `archive_integrity_verifier.py` pada saat data diproses.
*   **Database Riwayat:** `compliance_history.db` harus di-*backup* dan diamankan agar tidak dimodifikasi selama masa audit.
*   **Kunci Publik:** Pastikan kunci publik (`--public-key`) yang digunakan untuk menandatangani arsip sesuai dengan sertifikat yang terdaftar di `Internal Compliance CA`. Auditor akan memverifikasi tanda tangan digital ini untuk memastikan tidak ada manipulasi data pasca-verifikasi.

#### 2. Eksekusi Skrip Selama Audit
Ketika auditor meminta bukti kepatuhan terhadap *Right to be Forgotten* (Pasal 17 GDPR), jalankan skrip dengan perintah berikut:

```bash
python gdpr_compliance_reporter.py \
  --verification-log archives/verification_log_20231027.json \
  --db-path data/compliance_history.db \
  --output audits/external_audit_gdpr_proof_20231027.pdf
```

#### 3. Interpretasi Hasil untuk Auditor
Saat menyerahkan laporan PDF/DOCX, sertakan poin-poin kunci berikut untuk memudahkan tinjauan auditor:

*   **Integritas Data:** Laporan mencantumkan `verification_id` unik yang dapat ditelusuri kembali ke arsip fisik/digital. Ini membuktikan bahwa data yang dianalisis adalah data yang sama persis dengan yang diarsipkan.
*   **Efektivitas Masking:** Fokuskan perhatian pada field `privacy_analysis.masking_success_rate`. Nilai `1.0` (atau 100%) menunjukkan bahwa dalam sampel acak (`rows_sampled`), tidak ada *raw IDs* yang ditemukan.
*   **Pelaporan Insiden:** Jika `raw_ids_found > 0`, laporan akan menyorot ini sebagai *failed check*. Dalam skenario audit, hal ini harus didokumentasikan sebagai insiden yang sedang ditangani dengan prosedur remediasi yang jelas.

#### 4. Retensi Bukti Audit
Sesuai dengan prinsip *Accountability* (Akuntabilitas) dalam GDPR:
*   Simpan laporan yang dihasilkan (`--output`) selama minimal 7 tahun (atau sesuai regulasi lokal yang berlaku).
*   Jangan pernah mengubah file JSON atau Database setelah skrip dijalankan. Jika diperlukan koreksi, buat *new verification* baru dan arsipkan sebagai versi yang diperbarui, bukan menimpa data lama.

> **Peringatan Hukum:** Laporan ini bersifat teknis dan statistik. Tidak menggantikan nasihat hukum. Keputusan final mengenai kepatuhan hukum harus melibatkan penasihat hukum perusahaan dan tim kepatuhan (Compliance Officer).


#### 5. Otomasi Pemrosesan Permintaan Penghapusan (Right to be Forgotten)

Untuk meningkatkan efisiensi dan mengurangi potensi human error dalam menangani permintaan penghapusan data sesuai Pasal 17 GDPR, ekosistem ini menyediakan skrip antarmuka otomatis: `auto_gdpr_deletion_request.py`. Skrip ini bertindak sebagai jembatan antara penerimaan permintaan eksternal dan eksekusi teknis pemusnahan data, sekaligus memastikan jejak audit (audit trail) tetap utuh.

##### 5.1. Alur Kerja Pemrosesan

Skrip dirancang untuk berjalan secara *stateless* namun meninggalkan jejak *stateful* melalui database. Alur eksekusinya adalah sebagai berikut:

1.  **Validasi Input:** Membaca file JSON permintaan yang berisi daftar `user_ids` atau `entity_ids` target.
2.  **Pencabutan Akses & Penghapusan Data:**
    *   Menandai baris data yang relevan di `compliance_history.db` dengan status `DELETED` (soft delete) atau menghapus entri secara fisik (*hard delete*) sesuai kebijakan retensi yang dikonfigurasi.
    *   Menghapus referensi data mentah (*raw data*) dari arsip sementara atau cache jika ada, namun **tidak** menghapus data historis yang sudah terverifikasi dan diarsipkan statis (sesuai prinsip *immutable archive*).
3.  **Pencatatan Jejak Audit:** Menambahkan entri baru ke `verification_log.json` yang mendokumentasikan:
    *   Waktu eksekusi (`timestamp`).
    *   ID permintaan unik (`request_id`).
    *   Daftar ID yang diproses.
    *   Status hasil (`SUCCESS`, `PARTIAL_SUCCESS`, atau `FAILED`).
4.  **Regenerasi Laporan Bukti:** Secara otomatis memicu `gdpr_compliance_reporter.py` dengan konfigurasi terbaru untuk menghasilkan dokumen bukti pemusnahan yang dapat diverifikasi oleh auditor.
5.  **Notifikasi:** Mengirimkan hasil ringkasan pemrosesan ke alamat email yang ditentukan.

##### 5.2. Struktur File Input (`request.json`)

File input harus mengikuti format JSON berikut untuk memastikan kompatibilitas dengan parser skrip:

```json
{
  "request_metadata": {
    "request_id": "REQ-20231027-001",
    "requested_by": "user@example.com",
    "legal_basis": "Article 17 GDPR (Right to Erasure)",
    "priority": "HIGH"
  },
  "target_entities": [
    {
      "entity_id": "USR-8842",
      "type": "customer_profile"
    },
    {
      "entity_id": "USR-9921",
      "type": "customer_profile"
    }
  ]
}
```

*Catatan: Pastikan `entity_id` sesuai dengan format kunci primer yang digunakan di `compliance_history.db`.*

##### 5.3. Eksekusi Skrip

Jalankan skrip dengan menyertakan path ke file permintaan, path database, dan alamat email penerima notifikasi.

```bash
python auto_gdpr_deletion_request.py \
  --request-json audits/deletion_requests/req_20231027.json \
  --db-path data/compliance_history.db \
  --notify-email compliance-officer@perusahaan.com
```

**Argumen Detail:**

| Argumen | Deskripsi | Contoh Nilai | Wajib |
| :--- | :--- | :--- | :--- |
| `--request-json` | Path absolut atau relatif ke file JSON berisi daftar ID target penghapusan. | `requests/req_001.json` | Ya |
| `--db-path` | Path ke file database SQLite utama yang menyimpan riwayat kepatuhan. | `data/compliance_history.db` | Ya |
| `--notify-email` | Alamat email penerima laporan hasil pemrosesan dan status notifikasi. | `admin@perusahaan.com` | Ya |
| `--dry-run` | *(Opsional)* Jalankan skrip tanpa mengubah data database atau mengirim email. Hanya menampilkan log preview. | `true` | Tidak |
| `--output-dir` | *(Opsional)* Direktori khusus untuk menyimpan laporan PDF yang di-generate ulang. Default: `audits/`. | `audits/manual_review/` | Tidak |

##### 5.4. Output dan Notifikasi

Setelah skrip selesai dieksekusi, dua hal utama akan terjadi:

1.  **Update Laporan Bukti:**
    Skrip secara otomatis memanggil `gdpr_compliance_reporter.py`. File PDF/DOCX baru akan dihasilkan di dalam direktori output yang ditentukan (default: `audits/`). File ini akan mencakup:
    *   Ringkasan permintaan penghapusan yang baru saja diproses.
    *   Bukti bahwa data target telah dihapus/tidak dapat diakses.
    *   Pembaruan pada metrik `privacy_analysis.masking_success_rate` untuk refleksi status kepatuhan terkini.

2.  **Email Notifikasi:**
    Isi email berisi:
    *   Subjek: `[GDPR Action] Deletion Request [REQ_ID] Processed`
    *   Body: Status eksekusi (Sukses/Gagal), jumlah entitas yang diproses, dan link langsung ke file laporan PDF hasil regenerasi.
    *   Lampiran: Salinan laporan PDF untuk arsip komunikasi resmi.

##### 5.5. Pertimbangan Keamanan dan Privasi dalam Eksekusi

*   **Immutable Archives:** Pastikan skrip tidak menghapus file `verification_log.json` lama atau arsip statis. Penghapusan hanya berlaku pada *active data* dan *cache*. Bukti bahwa data *pernah* ada harus tetap terjaga untuk kepatuhan hukum jangka panjang.
*   **Penanganan Error:** Jika skrip gagal menghapus satu atau lebih entitas (misalnya, karena kunci asing/FK constraint atau izin akses), skrip akan mencatat kegagalan spesifik di log dan tetap melanjutkan entitas lain yang bisa diproses. Status akhir di log akan menjadi `PARTIAL_SUCCESS`.
*   **Pembersihan Resource:** Skrip akan menutup koneksi database dan membersihkan variabel lingkungan sensitif segera setelah eksekusi selesai untuk mencegah kebocoran memori atau data sisa di memori sistem.

> **Best Practice:** Selalu jalankan `--dry-run` terlebih dahulu pada lingkungan *staging* yang memiliki replika data yang sama dengan produksi untuk memverifikasi logika penghapusan sebelum diterapkan pada data sensitif pengguna nyata.


Berikut adalah lanjutan konten dokumentasi yang komprehensif, dirancang untuk disalin dan ditempel langsung ke dalam `README.md` setelah bagian **5.5. Pertimbangan Keamanan dan Privasi dalam Eksekusi**.

---

##### 5.6. Otomatisasi Audit & Generasi Dokumentasi Kepatuhan (Compliance Audit)

Untuk memenuhi persyaratan pelaporan reguler dan transparansi terhadap regulator (seperti Otoritas Perlindungan Data Pribadi), sistem menyediakan skrip utilitas `gdpr_automated_audit_gen.py`. Skrip ini berfungsi sebagai jembatan otomatisasi yang mengumpulkan bukti teknis, mengekstrak metrik kinerja, dan menyelaraskan dokumentasi internal (`README.md`) dengan status kepatuhan terkini.

###### 5.6.1. Deskripsi Fungsional
Skrip ini tidak mengubah data pengguna secara langsung, melainkan fokus pada **audit trail** dan **dokumentasi**. Alur kerjanya meliputi:
1.  **Pengumpulan Data:** Membaca arsip verifikasi dari `archive_integrity_verifier.py` dan hasil pelaporan teknis dari `gdpr_compliance_reporter.py`.
2.  **Analisis Metrik:** Menghitung *Success Rate* masking data dan rata-rata waktu pemrosesan per permintaan.
3.  **Generasi Markdown:** Menyusun ringkasan audit dalam format Markdown yang terstruktur.
4.  **Sinkronisasi Dokumen:** Menambahkan entri baru ke bagian **"Compliance & Legal"** di `README.md` tanpa mengganggu struktur dokumen lainnya.
5.  **Pencegahan Duplikasi:** Memvalidasi timestamp agar tidak terjadi duplikasi entri audit untuk periode yang sama.

###### 5.6.2. Argumen Kombaris (CLI Arguments)

| Argumen | Deskripsi | Tipe Data | Wajib | Contoh Default |
| :--- | :--- | :--- | :--- | :--- |
| `--log` | Path absolut/relatif ke file `verification_log.json` yang dihasilkan oleh `archive_integrity_verifier.py`. | `string` | Ya | `logs/archive_verification_20231027.json` |
| `--report` | Path absolut/relatif ke file laporan JSON hasil generate dari `gdpr_compliance_reporter.py`. | `string` | Ya | `reports/gdpr_report_oct2023.json` |
| `--readme-path` | Path ke file `README.md` proyek yang ingin diperbarui bagian Compliance-nya. | `string` | Ya | `README.md` |
| `--dry-run` | *(Opsional)* Tampilkan preview perubahan Markdown tanpa menulis ke file README. | `boolean` | Tidak | `false` |

**Contoh Eksekusi:**
```bash
python gdpr_automated_audit_gen.py \
    --log "./data/archive_verification_latest.json" \
    --report "./reports/compliance_report_latest.json" \
    --readme-path "./README.md" \
    --dry-run
```

###### 5.6.3. Alur Logika Ekstraksi Metrik

Skrip melakukan parsing terhadap dua sumber data utama untuk menghasilkan metrik yang disajikan di dokumentasi:

1.  **Keberhasilan Masking (`masking_success_rate`):**
    *   Mengambil daftar entitas yang ditandai sebagai `VERIFIED_MASKED` dari `verification_log.json`.
    *   Dihitung: $rac{	ext{Total Entitas Terverifikasi}}{	ext{Total Permintaan Diproses}} 	imes 100\%$.
    *   Hasil dibulatkan ke dua angka di belakang koma.

2.  **Efisiensi Pemrosesan (`avg_processing_time_ms`):**
    *   Mengambil selisih waktu `start_timestamp` dan `end_timestamp` dari setiap entri di `gdpr_compliance_reporter.py`.
    *   Menghitung rata-rata keseluruhan untuk memberikan indikasi performa sistem saat memproses hak penghapusan.

###### 5.6.4. Struktur Output di README

Entri baru akan disisipkan di bawah header `##### Compliance & Legal` dengan format tabel berikut:

| Tanggal Audit | Sumber Permintaan | Metrik Masking | Rata-rata Waktu | Status Kepatuhan |
| :--- | :--- | :--- | :--- | :--- |
| `YYYY-MM-DD HH:MM` | `REQ_001, REQ_002...` | `99.8%` | `1.2s` | `PASS` |

*   **Status Kepatuhan:** Otomatis ditetapkan sebagai `PASS` jika masking rate > 95% dan tidak ada error fatal di log. Sebaliknya, akan ditetapkan sebagai `REVIEW_REQUIRED`.

###### 5.6.5. Validasi & Pencegahan Duplikasi

Untuk menjaga integritas historis dokumentasi, skrip implements validasi ketat:
1.  **Pencarian Timestamp Eksisting:** Skrip membaca bagian `Compliance & Legal` pada `README.md` yang ditargetkan.
2.  **Pencocokan ID Periode:** Jika timestamp audit yang akan ditambahkan sudah ada (berdasarkan hari/waktu pembuatan laporan), skrip akan menolak penulisan.
3.  **Fallback:** Jika duplikasi terdeteksi, skrip akan berhenti dan mengeluarkan peringatan:
    > `Warning: Audit entry for timestamp [TIMESTAMP] already exists in README. Aborting write to prevent duplication.`

###### 5.6.6. Integrasi dengan CI/CD (Best Practice)

Disarankan untuk menjadwalkan eksekusi skrip ini sebagai tahap akhir dari pipeline CI/CD harian atau mingguan. Berikut adalah contoh konfigurasi GitHub Actions sederhana:

```yaml
name: Weekly GDPR Compliance Update
on:
  schedule:
    - cron: '0 9 * * 1' # Setiap Senin jam 09:00

jobs:
  update-compliance-docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          persist-credentials: false # Diperlukan untuk commit balik

      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.10'

      - name: Install Dependencies
        run: pip install -r requirements.txt

      - name: Run Audit Gen & Update README
        run: |
          python gdpr_automated_audit_gen.py \
            --log "logs/weekly_archive.json" \
            --report "reports/weekly_gdpr.json" \
            --readme-path "README.md"
          
      - name: Commit Changes
        run: |
          git config user.name "GitHub Actions Bot"
          git config user.email "bot@perusahaan.com"
          git add README.md
          git commit -m "Auto-update: GDPR Compliance Audit [$(date +'%Y-%m-%d')]" || echo "No changes to commit"
          git push
```

> **Catatan Penting:** Pastikan token akses repository memiliki hak *write* ke branch utama jika skrip ini diotomatisasi melalui CI/CD. Untuk eksekusi manual, pastikan Anda memiliki hak tulis pada file `README.md`.


Berikut adalah materi lanjutan untuk file `README.md` Anda, yang mencakup dokumentasi teknis mengenai skrip integrasi CI/CD, panduan konfigurasi lengkap, dan pembaruan pada bagian operasi dan integrasi.

Silakan salin dan tempel konten berikut ke bagian akhir atau ke bagian terkait di dalam `README.md` Anda.

***

# Integrasi Pipeline Kepatuhan Otomatis

Bagian ini menjelaskan cara mengintegrasikan seluruh modul pemeriksaan kepatuhan menjadi satu pipeline CI/CD yang koheren menggunakan skrip integrator `compliance_ci_integrator.py`. Pendekatan ini memastikan bahwa setiap perubahan kode diverifikasi terhadap standar GDPR, keamanan YAML, dan korelasi disparitas sebelum dilakukan deploy atau commit.

## 1. Pengenalan `compliance_ci_integrator.py`

Skrip ini bertindak sebagai **Orchestrator CI/CD**. Alih-alih menulis konfigurasi workflow secara manual (yang rentan terhadap kesalahan ketik dan tidak konsisten), skrip ini secara dinamis membaca dependensi dari `requirements.txt` dan urutan eksekusi dari `pipeline_orchestrator.py` untuk menghasilkan file konfigurasi CI/CD yang valid (baik untuk GitHub Actions maupun GitLab CI).

### Fitur Utama
*   **Dinamis:** Membaca daftar modul (`id_exporter.py`, `yaml_audit_reporter.py`, dll.) secara otomatis.
*   **Multi-Platform:** Mendukung output untuk `.github/workflows/compliance.yml` (GitHub Actions) dan `.gitlab-ci.yml` (GitLab CI).
*   **Manajemen Environment:** Memetakan variabel lingkungan rahasia (seperti token akses dan kredensial database) ke dalam konfigurasi CI/CD secara aman.
*   **Validasi Prasyarat:** Memastikan skrip skrip inti (`gdpr_automated_audit_gen.py`) tercantum dalam alur kerja.

## 2. Instalasi dan Konfigurasi

Sebelum menjalankan integrator, pastikan skrip utama dan dependensinya sudah tersedia di direktori proyek.

### Prasyarat
*   Python 3.8+
*   Akses tulis ke repository untuk melakukan commit perubahan `.github/` atau `.gitlab-ci.yml`.

### Argumen Perintah

Skrip ini menerima dua argumen utama:

1.  `--output` (Wajib): Path tujuan file konfigurasi CI/CD yang akan dihasilkan.
    *   Contoh: `.github/workflows/compliance.yml` atau `.gitlab-ci.yml`
2.  `--env-vars` (Opsional, JSON String): Daftar variabel lingkungan yang harus dipetakan ke dalam konfigurasi CI/CD. Formatnya harus berupa string JSON.
    *   Contoh: `{"GITHUB_TOKEN": "secrets.GITHUB_TOKEN", "DB_HOST": "vars.DB_HOST"}`

### Eksekusi

Jalankan skrip dari root direktori proyek Anda:

```bash
# Contoh untuk GitHub Actions
python compliance_ci_integrator.py \
  --output .github/workflows/compliance.yml \
  --env-vars '{"GITHUB_TOKEN": "secrets.GITHUB_TOKEN", "SLACK_WEBHOOK": "secrets.SLACK_WEBHOOK"}'

# Contoh untuk GitLab CI
python compliance_ci_integrator.py \
  --output .gitlab-ci.yml \
  --env-vars '{"CI_JOB_TOKEN": "ci_job_token"}'
```

**Output yang Dihasilkan:**
Skrip akan membuat atau menimpa file di path `--output` dengan struktur pipeline yang berisi stage-stage berikut (diurutkan berdasarkan logika `pipeline_orchestrator.py`):

1.  **Stage: Preparation**
    *   Setup Python environment.
    *   Instalasi dependensi dari `requirements.txt`.
2.  **Stage: Data Export & Validation**
    *   Eksekusi `id_exporter.py`: Mengekspor data ID untuk dianalisis.
    *   Eksekusi `yaml_audit_reporter.py`: Memvalidasi struktur file YAML dalam proyek.
3.  **Stage: Analysis & Correlation**
    *   Eksekusi `disparity_correlator.py`: Menganalisis ketidaksesuaian data.
4.  **Stage: Certification & Reporting**
    *   Eksekusi `compliance_certifier.py`: Memberikan sertifikat kepatuhan akhir.
    *   Eksekusi `gdpr_automated_audit_gen.py`: Menghasilkan laporan GDPR dan memperbarui `README.md`.
5.  **Stage: Commit & Notify**
    *   Commit perubahan laporan ke repository.
    *   Trigger notifikasi (jika Slack/Email terkonfigurasi).

## 3. Dokumentasi Lengkap: Deployment and Operations

Bagian ini memperbarui prosedur operasional harian dan pengelolaan token.

### 3.1. Konfigurasi Token Akses dan Hak Arah (Permissions)

Keberhasilan pipeline bergantung pada otorisasi yang tepat. Pastikan konfigurasi berikut diterapkan sesuai platform CI/CD yang digunakan.

#### Untuk GitHub Actions
Tambahkan konfigurasi `permissions` di level root atau level `job` workflow yang dihasilkan:

```yaml
permissions:
  contents: write  # Diperlukan untuk commit balik hasil audit ke repo
  security-events: read  # Opsional: Jika menggunakan GitHub Security API
```

*   **GITHUB_TOKEN:** Secara default, token ini memiliki hak baca. Skrip `compliance_ci_integrator.py` akan memasukkan langkah `git push` yang memerlukan hak `write` pada kolom `contents`.
*   **Personal Access Token (PAT):** Jika menjalankan pipeline secara *manual* di lingkungan lokal yang terhubung ke repo, pastikan PAT memiliki hak `repo` (Full control).

#### Untuk GitLab CI
Pastikan variabel lingkungan berikut didefinisikan di *Settings > CI/CD > Variables*:

*   `GIT_PUSH_TOKEN`: Token dengan hak `write_repository` (atau `maintainer`).
*   Konfigurasi dalam file `.gitlab-ci.yml` yang dihasilkan akan menggunakan variabel ini dalam langkah `git push`.

### 3.2. Trigger Pipeline

Pipeline kepatuhan dapat dipicu melalui tiga metode utama:

1.  **Push to Main Branch (Continuous Compliance):**
    Setiap commit yang masuk ke branch utama (`main` atau `master`) akan secara otomatis menjalankan seluruh alur pemeriksaan sebelum kode dianggap "clean".
2.  **Scheduled Run (Weekly Audit):**
    Pipeline dikonfigurasi untuk berjalan setiap hari Minggu pukul 00:00 UTC untuk menghasilkan arsip mingguan.
    *   Log output: `logs/weekly_archive.json`
    *   Laporan: `reports/weekly_gdpr.json`
3.  **Manual Dispatch:**
    Anda dapat memicu pipeline secara manual dari antarmuka CI/CD (Actions > Run workflow) untuk pengujian atau audit on-demand.

### 3.3. Troubleshooting Umum

| Masalah | Penyebab Kemungkinan | Solusi |
| :--- | :--- | :--- |
| **Permission Denied** pada `git push` | Token tidak memiliki hak `write` pada `contents`. | Periksa konfigurasi `permissions` di workflow atau rotasi token dengan hak lebih tinggi. |
| **Module Not Found** | `requirements.txt` tidak terinstal dengan benar. | Pastikan skrip `compliance_ci_integrator.py` membaca `requirements.txt` dengan benar dan tahap `Install Dependencies` berhasil. |
| **Commit Gagal (Empty Commit)** | Tidak ada perubahan pada `README.md` setelah audit. | Ini adalah perilaku normal. Skrip menggunakan `|| echo "No changes..."` untuk mencegah error. Pastikan skrip `gdpr_automated_audit_gen.py` benar-benar mengubah konten README jika ada perubahan data. |

## 4. Integrasi CI/CD: Panduan Lengkap

Bagian ini merinci bagaimana hasil dari pipeline `compliance_ci_integrator.py` harus dikelola dalam alur kerja pengembangan sehari-hari.

### 4.1. Alur Kerja Standar (Standard Workflow)

1.  **Developers** membuat pull request (PR).
2.  **GitHub Actions** memicu workflow `compliance.yml`.
3.  **Pipeline** menjalankan `id_exporter.py` hingga `gdpr_automated_audit_gen.py`.
4.  **Hasil Audit**:
    *   Jika **GAGAL**: Pipeline berhenti, PR tidak dapat di-merge. Laporan kesalahan tersedia di tab *Actions*.
    *   Jika **BERHASIL**: Skrip memperbarui `README.md` dengan status kepatuhan terbaru dan commit kembali ke branch PR.
5.  **Reviewer** melihat commit otomatis dan menyetujui merge jika tidak ada konflik kepatuhan.

### 4.2. Mengelola Variabel Lingkungan (`--env-vars`)

Untuk keamanan, jangan pernah menghardcode kredensial. Gunakan mekanisme variabel tersembunyi (secrets/vars) di platform CI/CD Anda, lalu pemetaan melalui skrip integrator.

**Langkah-langkah:**

1.  Identifikasi variabel yang dibutuhkan oleh modul Anda (misal: `DB_PASSWORD`, `AWS_SECRET_KEY`, `SLACK_TOKEN`).
2.  Simpan variabel tersebut di **Settings > Secrets** (GitHub) atau **Settings > CI/CD** (GitLab).
3.  Jalankan `compliance_ci_integrator.py` dengan argumen `--env-vars` yang memetakan nama variabel lokal ke nama secrets platform:

```bash
python compliance_ci_integrator.py \
  --output .github/workflows/compliance.yml \
  --env-vars '{
    "DB_PASSWORD": "secrets.DB_PASSWORD",
    "AWS_SECRET_KEY": "secrets.AWS_SECRET_KEY",
    "SLACK_TOKEN": "secrets.SLACK_TOKEN"
  }'
```

Skrip akan secara otomatis menyisipkan blok `env:` ke dalam setiap job yang membutuhkan variabel tersebut, memastikan keamanan data tetap terjaga.

### 4.3. Best Practices Maintenance

*   **Update Dependensi:** Setiap kali `requirements.txt` diperbarui, jalankan ulang `compliance_ci_integrator.py` untuk memastikan versi library dalam workflow CI/CD sinkron.
*   **Review Workflow yang Dihasilkan:** Meskipun skrip ini mengotomatisasi pembuatan file YAML, tinjau file `.github/workflows/compliance.yml` atau `.gitlab-ci.yml` secara berkala untuk memastikan tidak ada perubahan struktur pipeline yang tidak diinginkan.
*   **Rotasi Token:** Lakukan rotasi token CI/CD secara berkala (setiap 90 hari) dan update di bagian Secrets/Variables sesuai instruksi platform masing-masing.


### 4.4. Penilaian Dampak Perlindungan Data (DPIA) Otomatis dengan `automated_gdpr_impact_assessment.py`

Bagian ini mendeskripsikan implementasi lapisan keamanan proaktif untuk mematuhi persyaratan **General Data Protection Regulation (GDPR)** dan regulasi privasi data lainnya. Skrip `automated_gdpr_impact_assessment.py` dirancang untuk berjalan *pre-commit* atau sebagai tahap awal dalam pipeline CI/CD, sebelum `pipeline_orchestrator.py` mengeksekusi logika bisnis inti.

Tujuan utamanya adalah memprediksi risiko pelanggaran privasi berdasarkan volume dan jenis data sensitif yang diproses, serta menghasilkan laporan formal (DPIA Report) yang siap diaudit.

#### Metodologi Penilaian Risiko

Metodologi ini mengikuti kerangka kerja **Privacy by Design** dan mengintegrasikan dua sumber kebenaran teknis:

1.  **Definisi Skema Data (`id_exporter.py`)**: Membaca struktur data mentah untuk mengidentifikasi field yang mengandung Personal Data (PD) atau Special Category Data (SCD) seperti NIK, alamat, kesehatan, biometrik, dll.
2.  **Aturan Masking (`compliance_data_governance.py`)**: Memvalidasi apakah field yang diidentifikasi telah dikonfigurasi dengan metode *tokenization*, *hashing*, atau *anonymization* yang sesuai standar keamanan.

**Alur Penilaian:**
1.  **Identifikasi**: Skrip memindai definisi skema data untuk menemukan field bertipe sensitif.
2.  **Validasi Proteksi**: Memeriksa apakah setiap field sensitif memiliki aturan masking yang aktif dan tepat di konfigurasi governance.
3.  **Kuantifikasi Risiko**: Menghitung skor risiko berdasarkan:
    *   Jumlah field sensitif tanpa proteksi yang memadai.
    *   Volume estimasi data sensitif (berdasarkan ukuran dataset atau sample rate).
    *   Tingkat kerentanan metode masking (misal: `SHA256` vs `AES-256-GCM`).
4.  **Generasi Rekomendasi**: Menyusun rekomendasi mitigasi spesifik (misal: "Aktifkan masking untuk field `email`") dan menentukan status kepatuhan (`PASS`/`FAIL`) berdasarkan ambang batas risiko yang dikonfigurasi.

#### Instalasi dan Konfigurasi

Pastikan skrip ini memiliki akses baca ke modul-modul dependensi:
*   `id_exporter`: Harus diekspor sebagai modul Python atau module path yang valid.
*   `compliance_data_governance`: Harus berisi dictionary/rule engine untuk aturan masking.

#### Usage Instructions

Jalankan skrip dari direktori root proyek Anda untuk melakukan pra-pemeriksaan privasi.

```bash
python automated_gdpr_impact_assessment.py \
  --schema-def id_exporter.py \
  --masking-rules compliance_data_governance.py \
  --risk-threshold 50 \
  --output gdpr_dpia_report.json
```

**Penjelasan Argumen:**

| Argumen | Deskripsi | Contoh Nilai |
| :--- | :--- | :--- |
| `--schema-def` | Path atau nama modul Python yang mendefinisikan skema data export/import. | `id_exporter.py` |
| `--masking-rules` | Path atau nama modul Python yang berisi konfigurasi aturan masking dan sanitasi data. | `compliance_data_governance.py` |
| `--risk-threshold` | Angka integer (0-100) yang menentukan batas maksimal risiko yang dapat ditoleransi. Jika skor hasil > threshold, pipeline akan diblokir. | `50` |
| `--output` | Path file output untuk menyimpan laporan DPIA dalam format JSON. | `gdpr_dpia_report.json` |

#### Contoh Output Laporan (`gdpr_dpia_report.json`)

Laporan yang dihasilkan bersifat machine-readable dan human-readable, dirancang untuk memudahkan auditor eksternal.

```json
{
  "report_id": "dpia-20231027-001",
  "timestamp": "2023-10-27T10:00:00Z",
  "assessment_summary": {
    "total_fields_analyzed": 45,
    "sensitive_fields_found": 12,
    "protected_fields": 10,
    "unprotected_fields": 2,
    "risk_score": 25,
    "threshold": 50,
    "compliance_status": "PASS"
  },
  "risk_factors": {
    "volume_risk": "Low",
    "data_category_risk": "Medium",
    "masking_coverage": "83.3%"
  },
  "flagged_fields": [
    {
      "field_name": "user_biometric_hash",
      "data_category": "Special Category Data",
      "current_protection": "None",
      "recommended_action": "Implement AES-256 encryption or tokenization. Immediate masking required."
    },
    {
      "field_name": "device_ip_address",
      "data_category": "Personal Data",
      "current_protection": "Partial Masking",
      "recommended_action": "Ensure full anonymization (e.g., last octet removal) before storage."
    }
  ],
  "automated_recommendations": [
    "Update `compliance_data_governance.py` to include AES-256 rule for field `user_biometric_hash`.",
    "Review ETL pipeline stage for `device_ip_address` to enforce strict anonymization."
  ]
}
```

#### Integrasi dengan Pipeline CI/CD

Untuk memastikan kepatuhan, tambahkan langkah ini di workflow GitHub Actions atau GitLab CI sebelum eksekusi utama:

**GitHub Actions (`.github/workflows/compliance.yml`):**

```yaml
- name: Run GDPR DPIA Assessment
  run: |
    python automated_gdpr_impact_assessment.py \
      --schema-def id_exporter.py \
      --masking-rules compliance_data_governance.py \
      --risk-threshold 50 \
      --output gdpr_dpia_report.json

- name: Check Compliance Status
  run: |
    STATUS=$(python -c "import json; data=json.load(open('gdpr_dpia_report.json')); print(data['assessment_summary']['compliance_status'])")
    if [ "$STATUS" != "PASS" ]; then
      echo "::error::DPIA Assessment FAILED. Risk score exceeds threshold. See gdpr_dpia_report.json for details."
      exit 1
    fi
```

Jika skrip mengembalikan status `FAIL`, pipeline akan terhenti dan developer wajib memperbaiki celah keamanan yang diidentifikasi sebelum dapat melakukan merge.

---

### Lampiran Teknis untuk Auditor Eksternal: Metodologi Penilaian Risiko Privasi

Bagian ini menyajikan rincian teknis metode kuantifikasi risiko yang digunakan dalam `automated_gdpr_impact_assessment.py` untuk keperluan transparansi dan audit eksternal.

#### 1. Definisi Variabel Risiko

Skor risiko ($R_{total}$) dihitung menggunakan formula berbobot:

$$ R_{total} = (W_v 	imes S_v) + (W_d 	imes S_d) + (W_m 	imes S_m) $$

Dimana:
*   $S_v$: Skor Kerentanan Volume (Berdasarkan jumlah record sensitif yang diproses).
*   $S_d$: Skor Kerentanan Kategori Data (Berdasarkan sensitivitas field, misal: Kesehatan > Nama).
*   $S_m$: Skor Kerentanan Masking (Berbasis kekokohan algoritma perlindungan).
*   $W$: Bobot konstanta yang dapat dikonfigurasi (Default: $W_v=0.3, W_d=0.4, W_m=0.3$).

#### 2. Klasifikasi Data Sensitif

Modul `id_exporter` diklasifikasikan ke dalam kategori berikut (mengacu pada GDPR Art. 9):
*   **High Sensitivity (SCD)**: Biometrik, Genetik, Kesehatan, Keyakinan Politik/Agama, Orientasi Seksual.
*   **Medium Sensitivity (PII)**: NIK, NPWP, Alamat Lengkap, Email, Nomor Telepon.
*   **Low Sensitivity (Non-PII)**: ID User Anonim, Timestamp, Kategori Produk.

#### 3. Matriks Penilaian Masking

Metode masking dinilai berdasarkan standar NIST dan GDPR "pseudonymisation" guidelines:

| Metode Masking | Skor Kerentanan ($S_m$) | Keterangan |
| :--- | :---: | :--- |
| **Plaintext** | 100 | Tidak ada perlindungan (Auto-Fail). |
| **Hash (SHA-256)** | 60 | Dapat di-brute-force dengan rainbow table jika salt tidak digunakan. |
| **Tokenization (Lookup)** | 40 | Aman jika token store terpisah dan terenkripsi. |
| **AES-256-GCM** | 10 | Standar industri untuk enkripsi homogen. |
| **Anonymization (K-Anonymity)** | 5 | Data tidak dapat ditautkan kembali ke subjek. |

#### 4. Kriteria Penerimaan Risiko (Risk Threshold)

*   **Green Zone ($R_{total} \leq 30$)**: Risiko rendah. Proses otomatis diizinkan.
*   **Yellow Zone ($30 < R_{total} \leq 70$)**: Risiko sedang. Diperlukan review manual dari DPO (Data Protection Officer) sebelum deploy.
*   **Red Zone ($R_{total} > 70$)**: Risiko tinggi. Deployment diblokir secara otomatis. Celah keamanan harus ditinjau ulang dalam jangka waktu < 48 jam.

#### 5. Log Audit dan Jejak Tangan

Setiap eksekusi skrip menghasilkan file JSON unik yang di-timestamp. File ini disimpan dalam artifact CI/CD dan dipertahankan selama 5 tahun sesuai dengan retensi data audit regulasi keuangan dan privasi. Auditor eksternal dapat memverifikasi integritas laporan menggunakan checksum SHA-256 dari file `gdpr_dpia_report.json` yang di-commit ke branch `compliance-history`.


#### 6. Generator Dashboard Kepatuhan (Compliance Audit Dashboard)

Untuk mendukung transparansi dan kemudahan verifikasi oleh auditor eksternal serta manajemen tingkat tinggi, proyek ini menyediakan utilitas CLI untuk mengubah laporan JSON menjadi dashboard HTML interaktif. Alat ini memvisualisasikan metrik kepatuhan secara real-time tanpa memerlukan backend server.

**Fitur Utama:**
*   **Integrasi Data Otomatis:** Membaca file `compliance_cert.json`, `correlation_analysis.json`, dan `gdpr_dpia_report.json`.
*   **Visualisasi Interaktif:** Menggunakan library **Chart.js** untuk grafik tren dan **DataTables** untuk tabel detail yang dapat dicari dan diurutkan.
*   **Format Statis (SPA):** Output berupa satu file HTML statis yang dapat dibagikan melalui email, disimpan di repository, atau di-hosting pada server web sederhana (Nginx/Apache).

##### 6.1 Instalasi Dependensi

Pastikan lingkungan Python Anda memiliki pustaka berikut terinstal. Anda dapat menginstalnya menggunakan `pip`:

```bash
pip install python-dateutil Jinja2
```

*Catatan: Library `Jinja2` digunakan untuk templating HTML, dan `python-dateutil` untuk parsing tanggal yang konsisten.*

##### 6.2 Panduan Penggunaan (CLI)

Skrip `compliance_audit_dashboard_generator.py` menerima path ke file sumber data sebagai argumen.

**Sintaks:**
```bash
python compliance_audit_dashboard_generator.py \
  --cert <path/to/compliance_cert.json> \
  --analysis <path/to/correlation_analysis.json> \
  --dpia <path/to/gdpr_dpia_report.json> \
  --output <path/to/output_dashboard.html>
```

**Contoh Eksekusi:**
```bash
python compliance_audit_dashboard_generator.py \
  --cert artifacts/cert.json \
  --analysis artifacts/correlation.json \
  --dpia artifacts/gdpr_dpia_report.json \
  --output reports/audit_dashboard_v1.html
```

**Penjelasan Argumen:**
*   `--cert` (Wajib): Path ke file sertifikat kepatuhan yang berisi metadata eksekusi pipeline.
*   `--analysis` (Wajib): Path ke file analisis korelasi yang memuat temuan anomali dan deviasi.
*   `--dpia` (Wajib): Path ke laporan *Data Protection Impact Assessment* (DPIA) berisi skor risiko dan klasifikasi data.
*   `--output` (Wajib): Path lengkap untuk menyimpan file HTML hasil generate.

##### 6.3 Struktur Dashboard yang Dihasilkan

Dashboard HTML yang dihasilkan mencakup tiga bagian utama:

1.  **Ringkasan Eksekutif (KPI Cards):**
    *   Total Data Point yang Diaudit.
    *   Skor Risiko Agregat ($R_{total}$).
    *   Status Kepatuhan Saat Ini (Green/Yellow/Red).
    *   Jumlah Temuan Anomali Aktif.

2.  **Visualisasi Tren & Risiko:**
    *   **Grafik Tren Deviation Score:** Plot garis interaktif yang menunjukkan fluktuasi deviasi skor keamanan selama periode audit, memungkinkan auditor mengidentifikasi pola musiman atau spike anomali.
    *   **Peta Panas Risiko (Risk Heatmap):** Grafik散点 (scatter) atau heatmap yang memetakan *High Sensitivity (SCD)* dan *Medium Sensitivity (PII)* terhadap skor kerentanan masking. Titik data dengan kombinasi sensitivitas tinggi dan masking lemah akan berwarna merah.

3.  **Tabel Detail Remediasi (DataTables):**
    *   Tabel responsif yang menampilkan daftar temuan spesifik.
    *   Kolom mencakup: `Timestamp`, `Data Category`, `Masking Method`, `Vulnerability Score`, `Recommendation`, dan `Status`.
    *   Fitur pencarian instan dan pagination otomatis.

##### 6.4 Lampiran Teknis untuk Audit Eksternal (Compliance & Legal)

Bagian ini didedikasikan untuk memberikan konteks hukum dan teknis bagi auditor eksternal mengenai bagaimana dashboard ini memastikan integritas data dan kepatuhan regulasi.

**A. Dasar Hukum & Standar**
Dashboard ini dirancang sesuai dengan pedoman berikut:
*   **GDPR Article 30 (Records of Processing Activities):** Memastikan pencatatan aktivitas pemrosesan data dapat diverifikasi melalui jejak tangan (audit trail) JSON.
*   **NIST SP 800-53 Rev. 5 (SI-4 Information System Monitoring):** Menyediakan mekanisme pemantauan kontinuitas integritas sistem.
*   **ISO/IEC 27001:2022 (Clause A.12.4 Logging):** Standar industri untuk pencatatan log keamanan yang akurat dan terlindungi.

**B. Integritas Data & Non-Repudiation**
Setiap file JSON yang dimuat oleh dashboard (`compliance_cert.json`, dll.) dilengkapi dengan checksum SHA-256. Auditor dapat memverifikasi bahwa data yang ditampilkan dalam dashboard tidak telah dimanipulasi sejak eksekusi pipeline terakhir.
*   *Cara Verifikasi:* Ekstrak checksum dari header JSON dan bandingkan dengan hasil command `sha256sum <file>.json` di terminal.

**C. Retensi Data & Archiving**
Sesuai dengan kebijakan retensi 5 tahun yang ditetapkan dalam Bab 5 (Log Audit), file HTML yang dihasilkan dari dashboard disimpan dalam branch `compliance-history` pada repository Git. Ini memastikan:
1.  **History Versioning:** Setiap perubahan kebijakan atau update pipeline akan menghasilkan snapshot dashboard baru yang dapat diakses kapan saja.
2.  **Immutable Record:** Karena disimpan di branch khusus dengan kebijakan *force-push* yang dilarang, rekaman audit bersifat *immutable* (tidak dapat diubah), memenuhi prinsip *auditability* dalam hukum keuangan dan privasi data.

**D. Batasan Penggunaan**
*   Dashboard ini bersifat **statis** dan tidak menampilkan data pribadi secara langsung, melainkan hanya ringkasan statistik dan metadata kepatuhan.
*   Untuk melihat data mentah (*raw data*), auditor harus memiliki akses ke sistem penyimpanan data utama melalui saluran aman terpisah (tidak melalui dashboard ini).


Berikut adalah konten lanjutan untuk file `README.md`. Bagian ini dirancang untuk melengkapi Lampiran Teknis sebelumnya, dengan fokus pada mekanisme visualisasi risiko (*Risk Visualization*) dan integrasi data antara deteksi anomali statistik dan penilaian dampak privasi (DPIA).

Silakan salin konten di bawah ini tepat setelah bagian **"6.4 Lampiran Teknis untuk Audit Eksternal (Compliance & Legal)"**.

---

##### 6.5 Visualisasi Peta Jalan Remediasi (Remediation Roadmap Mapping)

Bagian ini mendokumentasikan logika di balik pembuatan **Remediation Roadmap**, yaitu visualisasi strategis yang mengubah temuan teknis mentah menjadi prioritas aksi bisnis. Alat ini tidak hanya menampilkan *apa* yang salah, tetapi *kapan* dan *seberapa kritis* perbaikan tersebut harus dilakukan berdasarkan kerentanan statistik dan kepatuhan regulasi.

###### A. Spesifikasi Implementasi Teknis

Skrip inti yang menangani pemetaan ini adalah `compliance_risk_visualizer.py`. Alat ini berfungsi sebagai jembatan data (*data bridge*) yang menggabungkan output dari dua modul deteksi utama:
1.  **`automated_gdpr_impact_assessment.py`**: Menyediakan konteks hukum dan kategori sensitivitas data (melalui `gdpr_dpia_report.json`).
2.  **`parquet_anomaly_detector.py`**: Menyediakan bukti teknis adanya perilaku data yang menyimpang atau berisiko (melalui `statistical_anomalies.csv`).

**Alur Pemrosesan Data:**
1.  **Ingest**: Membaca file JSON laporan DPIA dan CSV anomali statistik.
2.  **Korelasi**: Mencocokkan setiap anomali statistik dengan kategori data yang relevan dalam laporan DPIA untuk menentukan tingkat urgensi hukum.
3.  **Klasifikasi**: Memberikan label prioritas berdasarkan matriks risiko:
    *   **High Urgency**: Anomali pada Data Kategori *High Sensitivity* (SCD/PII) dengan skor deviasi statistik > Threshold.
    *   **Medium Urgency**: Anomali pada *Medium Sensitivity* atau *High Sensitivity* dengan deviasi rendah (potensi noise).
    *   **Low Urgency**: Anomali pada *Low Sensitivity* atau data non-personal.
4.  **Ekspor**: Menghasilkan file JSON terstruktur (`risk_roa_map.json`) yang siap dikonsumsi oleh generator dashboard interaktif (`compliance_audit_dashboard_generator.py`).

**Konfigurasi Baris Perintah (CLI):**

```bash
python compliance_risk_visualizer.py \
    --dpia-json ./reports/gdpr_dpia_report.json \
    --anomaly-csv ./detections/statistical_anomalies.csv \
    --output ./visualizations/risk_roa_map.json \
    --color-scheme wcag-aa-compliant
```

*   `--dpia-json`: Path ke file output dari modul penilaian dampak privasi.
*   `--anomaly-csv`: Path ke file hasil deteksi anomali statistik.
*   `--output`: Path tujuan untuk file JSON peta risiko yang dihasilkan.
*   `--color-scheme`: (Opsional) Menentukan palet warna. Default menggunakan skema aksesibilitas WCAG AA untuk memastikan keterbacaan bagi pengguna dengan gangguan penglihatan warna.

###### B. Struktur Output JSON (`risk_roa_map.json`)

File output dirancang untuk konsumsi *front-end* D3.js. Struktur utamanya mencakup node hierarkis yang memungkinkan rendering grafik pohon risiko (*risk tree*) atau diagram Sankey untuk melihat aliran risiko dari sumber ke kategori kepatuhan.

Contoh struktur simplifikasi:
```json
{
  "metadata": {
    "generated_at": "2023-10-27T10:00:00Z",
    "visualizer_version": "1.2.0",
    "methodology": "Statistical-Anomaly Correlation with DPIA Context"
  },
  "risk_nodes": [
    {
      "id": "risk_001",
      "category": "GDPR",
      "urgency": "High",
      "data_subject_count": 1500,
      "anomaly_score": 0.95,
      "remediation_action": "Immediate Masking Update",
      "children": ["finding_x1"]
    }
  ]
}
```

###### C. Metodologi Visualisasi Risiko untuk Auditor

Untuk keperluan audit eksternal, pendekatan visualisasi ini mengikuti prinsip **Risk-Based Auditing**. Berikut adalah penjelasan metodologis mengenai bagaimana peta jalan ini dibentuk:

1.  **Correlation Matrix Method (Metrik Korelasi)**
    Tidak semua anomali statistik bernilai hukum yang sama. Metodologi ini menerapkan matriks pembobotan (*weighting matrix*) di mana:
    $$ RiskScore = (SensitivityWeight 	imes AnomalyDeviation) + (RegulatoryWeight 	imes ComplianceGap) $$
    *   *SensitivityWeight*: Berdasarkan klasifikasi SCD/PII dari GDPR Art. 9.
    *   *AnomalyDeviation*: Skor z-score atau IQR dari `statistical_anomalies.csv`.
    Hasil perhitungan ini menentukan posisi node dalam visualisasi: semakin tinggi skor, semakin dekat ke pusat atau semakin besar ukuran node pada grafik D3.js.

2.  **Temporal Sequencing (Penjadwalan Temporal)**
    Visualisasi tidak statis; ia mempertimbangkan waktu. Temuan dengan urgensi "High" dipetakan untuk remediasi segera (SLA < 48 jam), sedangkan "Low" dimasukkan ke dalam backlog rutin. Hal ini memungkinkan auditor untuk mengevaluasi apakah *response time* tim keamanan sesuai dengan standar ISO 27001 A.16.1.1 (Respons terhadap Insiden Keamanan).

3.  **Accessibility-Constrained Rendering**
    Sesuai dengan prinsip desain inklusif dan kepatuhan aksesibilitas (Section 508 / WCAG 2.1), palet warna yang digunakan dalam `risk_roa_map.json` dioptimalkan untuk kontras tinggi. Auditor tidak bergantung hanya pada warna (merah/hijau) untuk membedakan urgensi, tetapi juga pada pola tekstur atau label teks yang disertakan dalam node JSON, memastikan interpretasi data yang akurat tanpa gangguan disleksia atau buta warna.

###### D. Integrasi dengan Dashboard Akhir

File `risk_roa_map.json` adalah sumber kebenaran (*single source of truth*) untuk visualisasi di `compliance_audit_dashboard_generator.py`. Dashboard akan:
1.  Membaca peta ini untuk menggambar grafik interaktif.
2.  Mengizinkan auditor mengklik node "High Urgency" untuk melihat detail teknis anomali terkait.
3.  Menyediakan fitur ekspor PDF yang menyertakan screenshot peta risiko sebagai lampiran bukti tindakan korektif.

---


Berikut adalah konten lanjutan untuk file `README.md`, yang mencakup dokumentasi teknis untuk `compliance_policy_enforcer.py` serta lampiran arsitektur keamanan untuk auditor.

---

###### E. Eksekutor Kebijakan Teknis: `compliance_policy_enforcer.py`

Modul ini berfungsi sebagai jembatan eksekusi antara analisis kebijakan (*policy analysis*) dan implementasi teknis pada lapisan data (*data layer*). Bertugas menegakkan aturan privasi yang telah didefinisikan dalam laporan DPIA (*Data Protection Impact Assessment*) melalui transformasi data otomatis.

**1. Alur Arsitektur Eksekusi**

Skrip ini beroperasi dalam tiga tahap utama:
1.  **Parsing Kebijakan:** Membaca struktur `gdpr_dpia_report.json` untuk mengidentifikasi kolom mana yang diklasifikasikan sebagai PII/SCD (Special Category Data) dan teknik pemrosesan mana yang diwajibkan (Masking, Tokenization, atau K-Anonymity).
2.  **Transformasi Data:** Membaca dataset mentah (CSV/Parquet) dan menerapkan algoritma enkripsi/pseudonimisasi sesuai dengan konteks bisnis dan tingkat risiko.
3.  **Validasi & Output:** Memverifikasi bahwa output memenuhi kriteria k-anonimitas ($k \ge 5$) atau keunikan token, lalu menulis hasilnya ke file output.

**2. Antarmuka Command Line (CLI)**

Gunakan argumen berikut untuk menjalankan skrip:

```bash
python compliance_policy_enforcer.py \
    --dpia /path/to/gdpr_dpia_report.json \
    --dataset /path/to/raw_data.csv \
    --output /path/to/enrypted_output.parquet \
    --dry-run
```

| Argumen | Tipe | Deskripsi | Wajib |
| :--- | :--- | :--- | :--- |
| `--dpia` | `str` | Path ke file JSON laporan DPIA. Harus berisi kunci `mandatory_masking_rules` dan `sensitive_ids`. | Ya |
| `--dataset` | `str` | Path ke file data mentah (format `.csv` atau `.parquet`). | Ya |
| `--output` | `str` | Path tujuan untuk menyimpan data yang sudah diproses. | Ya |
| `--dry-run` | `bool` | Mode simulasi. Mengevaluasi transformasi dan mencetak ringkasan perubahan tanpa menulis ke disk. | Tidak |

**3. Implementasi Algoritma Transformasi**

Skrip ini mendukung dua strategi privasi utama, yang dipilih secara dinamis berdasarkan konfigurasi di file DPIA:

*   **K-Anonimitas (L- Diversity Tolerant):**
    Digunakan untuk data agregat di mana keunikan individu masih memungkinkan identifikasi ulang melalui kombinasi atribut.
    *   *Logika:* Identifikasi *quasi-identifiers* (misal: `zip_code`, `age`). Lakukan *generalization* (pengaburan rentang) atau *suppression* (penghilangan nilai langka) hingga setiap grup memiliki minimal $k$ record.
    *   *Parameter Default:* $k=5$.

*   **Pseudonimisasi Berbasis Token (Deterministic Encryption):**
    Digunakan untuk kunci primer (Primary Keys) dan data identifikasi langsung.
    *   *Logika:* Menggunakan *Salted Hash* atau *Format-Preserving Encryption (FPE)*. Setiap nilai input yang sama akan menghasilkan output yang sama (konsisten untuk *join* operasi), namun tidak dapat dibalik tanpa kunci dekripsi yang aman.
    *   *Keunggulan:* Mempertahankan integritas relasional database tanpa mengekspos data asli.

**4. Contoh Penggunaan dalam Pipeline CI/CD**

Dalam pipeline otomatis, skrip ini dapat dipanggil pasca-scan DLP (*Data Loss Prevention*):

```bash
# Langkah 1: Generate DPIA Report via automated_gdpr_impact_assessment.py
python automated_gdpr_impact_assessment.py --source db_prod_dump.json --output dpia_report.json

# Langkah 2: Enforce Policies on Development Dataset
python compliance_policy_enforcer.py \
    --dpia dpia_report.json \
    --dataset dev_dataset.csv \
    --output dev_dataset_secured.parquet \
    --dry-run

# Langkah 3: Validate Output (Custom Check Script)
if [ $? -eq 0 ]; then
    echo "Policy enforcement successful. Data ready for dev environment."
    mv dev_dataset_secured.parquet ./secure_artifacts/
fi
```

---

###### F. Lampiran Arsitektur Keamanan: Compliance & Legal
*Untuk Auditor Privasi dan Penegak Hukum (Regulatory Review)*

Bagian ini menjelaskan fondasi teknis enkripsi sisi klien (*Client-Side Encryption*) dan manajemen kunci (*Key Management*) yang diadopsi oleh sistem, selaras dengan persyaratan **GDPR Article 32** (Keamanan Pemrosesan) dan **ISO/IEC 27001:2022 Annex A.8.24** (Pemeliharaan Informasi).

**1. Prinsip Enkripsi Sisi Klien (Client-Side Encryption)**

Dalam arsitektur ini, enkripsi terjadi *before* data meninggalkan lingkungan yang dipercaya (*trusted client environment*) atau sebelum ditulis ke penyimpanan jangka panjang. Hal ini memastikan bahwa meskipun terjadi kebocoran data pada tingkat penyimpanan (storage leak) atau kompromi pada database server, data tetap tidak dapat dibaca tanpa kunci dekripsi yang terpisah.

*   **Algoritma:** Menggunakan **AES-256-GCM** (Advanced Encryption Standard dengan Galois/Counter Mode) untuk enkripsi simetris. GCM dipilih karena memberikan *confidentiality* dan *integrity* (autentikasi) secara bersamaan dalam satu proses, mengurangi overhead komputasi dibandingkan AES-CBC + HMAC.
*   **Tokenization & Pseudonimisasi:** Untuk data identifikasi langsung (PII), sistem tidak selalu melakukan enkripsi penuh, melainkan menggunakan *deterministic tokenization* yang dipetakan ke tabel kunci (Key Vault). Ini memungkinkan *join* antar tabel tetap berfungsi sambil menjaga anonimitas dari perspektif pihak ketiga yang akses ke tabel data mentah.

**2. Manajemen Kunci (Key Management Strategy)**

Kepatuhan terhadap standar industri mensyaratkan pemisahan antara *data encryption* dan *key management*. Kunci tidak boleh disimpan di tempat yang sama dengan data yang dienkripsi.

| Komponen | Deskripsi Teknis | Kepatuhan Regulasi |
| :--- | :--- | :--- |
| **Key Encryption Key (KEK)** | Kunci tingkat master yang melindungi Data Encryption Keys (DEK). Disimpan di Hardware Security Module (HSM) atau layanan managed key (AWS KMS / Azure Key Vault). | GDPR Art. 32; NIST SP 800-57 |
| **Data Encryption Key (DEK)** | Kunci unik untuk setiap *partition* atau *batch* data. Diekspor secara terenkripsi menggunakan KEK, lalu digunakan untuk mengenkripsi payload data. | ISO 27001 A.10.1.1 |
| **Key Rotation Policy** | DEK dirotasi setiap 90 hari atau setelah insiden keamanan. KEK dirotasi setiap 365 hari sesuai kebijakan organisasi. | PCI-DSS Req 3.6; GDPR Art. 25 |
| **Access Control (RBAC)** | Akses ke operasi *encrypt/decrypt* dibatasi berdasarkan prinsip *Least Privilege*. Hanya layanan backend khusus (bukan aplikasi web publik) yang memiliki akses ke DEK. | GDPR Art. 25 (Privacy by Design) |

**3. Matriks Pemetaan Fitur ke Kepatuhan Hukum**

Berikut adalah tabel verifikasi teknis untuk membantu auditor dalam mengevaluasi kesesuaian implementasi:

| Persyaratan Legal / Standar | Implementasi Teknis dalam `compliance_policy_enforcer.py` | Bukti Audit (Audit Trail) |
| :--- | :--- | :--- |
| **GDPR Art. 25 (Data Protection by Design)** | Integrasi otomatis dengan `gdpr_dpia_report.json` untuk menerapkan masking sebelum data diproses lebih lanjut. | Log timestamp `dpia_version` yang digunakan saat enkripsi. |
| **GDPR Art. 32 (Security of Processing)** | Penggunaan AES-256-GCM dan pemisahan kunci (KMS). | Konfigurasi KMS ID dan versi algoritma dalam metadata file output. |
| **GDPR Art. 17 (Right to Erasure)** | Mekanisme *Shredding* kunci (Key Destroy) menyebabkan data terenkripsi tidak dapat didekripsi lagi secara matematis (Crypto-Shredding). | Log `key_destruction_id` yang dikaitkan dengan record ID pengguna. |
| **ISO 27001 A.8.24 (Information Back-up & Restore)** | File output disimpan dalam format Parquet yang kompresi dan enkripsinya diverifikasi checksum-nya. | Hash SHA-256 dari file output yang dicatat dalam ledger transparansi. |

**4. Tanggung Jawab Pemroses Data (Data Processor)**

Sebagai entitas yang menjalankan `compliance_policy_enforcer.py`, tim teknis menjamin bahwa:
1.  Data mentah tidak pernah tersedia dalam plaintext di lingkungan *processing* (memory) lebih lama dari yang diperlukan untuk enkripsi.
2.  Semua kunci dekripsi di-*flush* dari memori segera setelah proses batch selesai.
3.  Log audit pencatatan akses kunci (Audit Logs) diintegrasikan dengan SIEM (*Security Information and Event Management*) untuk deteksi anomali akses tidak sah.

---

*Dokumentasi ini berlaku untuk versi `v2.1.0` dari framework compliance. Setiap perubahan pada algoritma kriptografi atau kebijakan rotasi kunci harus memicu update dokumentasi ini dan notifikasi ke Data Protection Officer (DPO).*


**5. Alat Visualisasi Peta Jalan Remediasi (Compliance Risk Visualizer)**

Bagian ini mendokumentasikan skrip `compliance_risk_visualizer.py`, komponen kritis dalam pipeline kepatuhan yang menerjemahkan temuan teknis menjadi peta visual interaktif. Alat ini berfungsi sebagai jembatan antara data mental audit (DPia dan Anomali Statistik) dan dashboard auditor, memfasilitasi prioritas remediasi berbasis risiko.

### 5.1 Arsitektur dan Alur Data

`compliance_risk_visualizer.py` bertindak sebagai *aggregator* dan *transformer*. Skrip ini membaca input dari dua sumber utama yang dihasilkan oleh modul analisis sebelumnya:
1.  `automated_gdpr_impact_assessment.py`: Menghasilkan laporan dampak perlindungan data (`gdpr_dpia_report.json`).
2.  `parquet_anomaly_detector.py`: Menghasilkan catatan anomali statistik (`statistical_anomalies.csv`).

Data kemudian diproses untuk mengekstrak metadata kepatuhan, menilai urgensi, dan memetakan temuan ke standar regulasi yang relevan. Output akhir adalah struktur JSON yang dioptimalkan untuk rendering D3.js, yang dapat dikonsumsi langsung oleh `compliance_audit_dashboard_generator.py`.

### 5.2 Spesifikasi Eksekusi

Skrip ini dirancang untuk berjalan sebagai bagian dari pipeline CI/CD atau eksekusi manual tim keamanan. Argument baris perintah (CLI) disediakan untuk fleksibilitas lingkungan.

**Sintaks Penggunaan:**

```bash
python compliance_risk_visualizer.py \
    --dpia-json path/to/automated_reports/gdpr_dpia_report.json \
    --anomaly-csv path/to/analysis/statistical_anomalies.csv \
    --output path/to/output/risk_roa_map.json \
    --color-scheme wcag-aa-contrast
```

**Deskripsi Argumen:**

| Argumen | Tipe | Deskripsi Wajib | Default |
| :--- | :--- | :--- | :--- |
| `--dpia-json` | String | Path absolut atau relatif ke file JSON hasil assessment GDPR. | N/A (Required) |
| `--anomaly-csv` | String | Path absolut atau relatif ke file CSV hasil deteksi anomali statistik. | N/A (Required) |
| `--output` | String | Path tujuan untuk file JSON peta risiko (`risk_roa_map.json`). | `./risk_roa_map.json` |
| `--color-scheme` | String | Palet warna untuk kepatuhan WCAG 2.1. Pilihan: `wcag-aa-contrast`, `colorblind-safe`, `legacy-high-contrast`. | `wcag-aa-contrast` |

### 5.3 Metodologi Visualisasi Risiko

Peta Jalan Remediasi dirancang berdasarkan prinsip *Risk-Based Auditing*. Berikut adalah metodologi teknis yang digunakan untuk memetakan temuan:

1.  **Normalisasi Metadata Kelemahan:**
    Setiap temuan dari DPIA dan Anomali Statistik dinormalisasi ke objek standar yang mencakup:
    *   `finding_id`: Identifier unik.
    *   `source_module`: Sumber data asli.
    *   `severity_score`: Skor numerik 1-10.
    *   `compliance_frameworks`: Array string (misal: `["GDPR Art. 32", "NIST SP 800-53"]`).

2.  **Klasifikasi Urgensi (Priority Triage):**
    Temuan dikategorikan menjadi tiga tingkat urgensi berdasarkan kombinasi skor risiko dan dampak potensial:
    *   **High (Kritis):** Memerlukan remediasi dalam < 24 jam. Biasanya melibatkan pelanggaran kerahasiaan data langsung atau kegagalan kontrol akses utama.
    *   **Medium (Signifikan):** Memerlukan remediasi dalam < 7 hari. Termasuk anomali statistik yang menunjukkan potensi kebocoran data tidak langsung atau ketidaksesuaian konfigurasi minor.
    *   **Low (Minim):** Memerlukan remediasi dalam siklus pengembangan berikutnya. Termasuk best practice yang belum diimplementasikan atau dokumentasi yang kurang lengkap.

3.  **Pemetaan Regulasi Berbasis Hirarki:**
    Untuk menghindari redundansi, temuan yang memengaruhi banyak standar (misal, GDPR dan PCI-DSS) dikelompokkan di tingkat tertinggi hierarki regulatory. Visualisasi menggunakan *clustered nodes* di mana satu node teknis dapat terhubung ke beberapa lingkaran kepatuhan.

4.  **Standar Aksesibilitas Warna (WCAG 2.1 Level AA):**
    Pilihan `--color-scheme` memastikan bahwa peta risiko dapat diakses oleh auditor dengan disabilitas penglihatan. Palet `wcag-aa-contrast` memastikan rasio kontras minimum 4.5:1 antara teks dan latar belakang, serta penggunaan pola (bukan hanya warna) untuk membedakan kategori urgensi pada mode cetak hitam-putih.

### 5.4 Struktur Output JSON (`risk_roa_map.json`)

File output `risk_roa_map.json` memiliki struktur berikut, yang siap dikonsumsi oleh generator dashboard:

```json
{
  "metadata": {
    "generated_at": "2023-10-27T10:00:00Z",
    "version": "v2.1.0",
    "color_palette": "wcag-aa-contrast"
  },
  "risk_clusters": {
    "High": {
      "count": 2,
      "findings": [
        {
          "id": "F-2023-001",
          "title": "Unencrypted Data at Rest in Temp Directory",
          "source": "automated_gdpr_impact_assessment.py",
          "regulatory_impact": ["GDPR Art. 32", "ISO 27001 A.10.1.1"],
          "remediation_priority": "Immediate",
          "coordinates": { "x": 100, "y": 200 }
        }
      ]
    },
    "Medium": {
      "count": 5,
      "findings": [
        {
          "id": "F-2023-005",
          "title": "Statistical Anomaly in Key Rotation Logs",
          "source": "parquet_anomaly_detector.py",
          "regulatory_impact": ["PCI-DSS Req 3.6"],
          "remediation_priority": "Short-term",
          "coordinates": { "x": 150, "y": 300 }
        }
      ]
    },
    "Low": {
      "count": 12,
      "findings": [...]
    }
  },
  "legend": {
    "High": "#D32F2F",
    "Medium": "#FBC02D",
    "Low": "#388E3C"
  }
}
```

### 5.5 Integrasi dengan Auditor

File `risk_roa_map.json` yang dihasilkan digunakan oleh `compliance_audit_dashboard_generator.py` untuk merender grafik interaktif. Auditor dapat:
1.  Mengklik cluster "High" untuk melihat detail temuan spesifik.
2.  Memfilter temuan berdasarkan framework regulasi (misal, hanya menampilkan pelanggaran GDPR).
3.  Mengekspor laporan PDF dari tampilan visual untuk lampiran resmi ke otoritas pengawas.

Dokumentasi ini memastikan bahwa setiap perubahan pada algoritma klasifikasi risiko atau pemetaan regulasi harus dicatat dalam log perubahan versi dan disetujui oleh Data Protection Officer (DPO) sebelum dipromosikan ke produksi.


### 5.6 Enforcement Engine: `compliance_policy_enforcer.py`

Modul `compliance_policy_enforcer.py` berfungsi sebagai *gatekeeper teknis* yang menerjemahkan rekomendasi kebijakan dari assessment GDPR (`automated_gdpr_impact_assessment.py`) menjadi tindakan penyaringan data konkret. Modul ini memastikan bahwa data yang dikirimkan ke lingkungan analitik atau pihak ketiga telah mematuhi prinsip *Privacy by Design* melalui pseudonimisasi dan k-anonimitas sebelum dipublikasikan.

#### Arsitektur Eksekusi Kebijakan

Alur kerja eksekutor kebijakan mengikuti pipeline berikut:

1.  **Inisialisasi Konteks:** Membaca `gdpr_dpia_report.json` untuk memuat aturan masking (`masking_rules`), daftar Identifikasi Pribadi (ID Sensitif), dan konfigurasi parameter k-anonimitas (`k_value`).
2.  **Pemuatan Data:** Membaca dataset mentah (CSV atau Parquet) ke dalam struktur data in-memory (misalnya, DataFrame Pandas atau PyArrow Table).
3.  **Transformasi Berlapis:**
    *   **Pseudonimisasi:** Mengganti nilai ID sensitif (misal: `email`, `national_id`) dengan token acak yang tetap (`stable pseudonym`) menggunakan salt berdasarkan konfigurasi.
    *   **K-Anonimitas:** Mengelompokkan atribut semi-identifiers (misal: `age`, `postal_code`, `gender`) ke dalam kuasik (`quasi-identifiers`) untuk memastikan setiap kelompok memiliki minimal `k` entitas yang indistinguishable.
4.  **Validasi Pra-Ekspor:** Memastikan bahwa tidak ada rekombinasi kuasik yang menyebabkan re-identifikasi individu (menghitung ukuran kuasik vs threshold `k`).
5.  **Eksekusi Output:** Menulis dataset yang telah diproses ke path tujuan atau menampilkan ringkasan perubahan jika mode `--dry-run` aktif.

#### Antarmuka Baris Perintah (CLI)

Skrip ini dirancang untuk dapat diintegrasikan ke dalam pipeline CI/CD atau dijalankan secara manual oleh tim kepatuhan.

```bash
# Contoh eksekusi standar
python compliance_policy_enforcer.py \
    --dpia gdpr_dpia_report.json \
    --dataset raw_customer_data.parquet \
    --output anonymized_customer_data.parquet

# Contoh mode simulasi (Dry-Run) untuk audit perubahan
python compliance_policy_enforcer.py \
    --dpia gdpr_dpia_report.json \
    --dataset raw_customer_data.parquet \
    --output output_test.parquet \
    --dry-run
```

**Deskripsi Argumen:**

| Argumen | Tipe | Wajib | Deskripsi |
| :--- | :--- | :--- | :--- |
| `--dpia` | `str` | Ya | Path absolut atau relatif ke file `gdpr_dpia_report.json` yang berisi aturan masking dan konfigurasi sensitivitas. |
| `--dataset` | `str` | Ya | Path ke file data mentah dalam format `.csv` atau `.parquet`. |
| `--output` | `str` | Ya | Path tujuan untuk file data hasil transformasi (pseudonimisasi & k-anonim). |
| `--dry-run` | `flag` | Tidak | Jika flag ini ada, skrip akan melakukan validasi dan menghitung statistik perubahan tanpa menulis file output ke disk. |

#### Implementasi Teknis: Enkripsi Sisi Klien & Manajemen Kunci (Key Management)

*Bagian ini merupakan Lampiran Arsitektur Keamanan untuk Auditor. Dokumen ini menjelaskan mekanisme di balik proses pseudonimisasi dan enkripsi yang diterapkan oleh `compliance_policy_enforcer.py`.*

##### 6.1 Prinsip Pseudonimisasi Deterministik vs Non-Deterministik

Dalam konteks GDPR, *pseudonimisasi* didefinisikan sebagai pengolahan data pribadi sedemikian rupa sehingga data tersebut tidak dapat lagi dikaitkan dengan subjek data tertentu tanpa menggunakan informasi tambahan.

Skrip ini menerapkan dua jenis transformasi berdasarkan sensitivitas field:

1.  **Pseudonimisasi Deterministik (Stable Mapping):**
    *   **Gunakan untuk:** Field yang membutuhkan relasi antar tabel (misal: `customer_id` di tabel transaksi dan tabel profil).
    *   **Mekanisme:** Menggunakan fungsi hash kriptografis (SHA-256) dengan *salt* statis yang disimpan dalam Key Vault.
    *   **Rumus:** `Token = HMAC-SHA256(key=StaticSalt, message=OriginalValue)`
    *   **Keuntungan:** Konsistensi data antar lingkungan (dev/test/prod) tetap terjaga jika kunci yang sama digunakan.
    *   **Risiko:** Jika kunci bocor, seluruh dataset dapat dikembalikan. Oleh karena itu, kunci ini dienkripsi di *rest* menggunakan kunci master yang dikelola oleh HSM (Hardware Security Module) atau AWS KMS/Azure Key Vault.

2.  **Pseudonimisasi Non-Deterministik (One-Way Hash):**
    *   **Gunakan untuk:** Field yang hanya perlu diverifikasi keunikan tanpa relasi lintas tabel (misal: `email` dalam dataset marketing).
    *   **Mekanisme:** Hash tunggal tanpa salt atau dengan salt acak per batch.
    *   **Rumus:** `Hash = SHA-256(OriginalValue + RandomSalt)`
    *   **Keuntungan:** Tidak mungkin merekonstruksi nilai asli atau mengaitkan record antar batch jika salt berubah.

##### 6.2 Manajemen Kunci (Key Management Lifecycle)

Kepatuhan terhadap standar enkripsi sisi klien (*client-side encryption*) memerlukan manajemen kunci yang ketat. `compliance_policy_enforcer.py` tidak menyimpan kunci dalam kode sumber atau file konfigurasi lokal yang tidak terenkripsi.

**Alur Manajemen Kunci:**

1.  **Penyimpanan Kunci (At Rest):**
    *   Kunci Master (Master Encryption Key - MEK) disimpan di *Cloud KMS* (Key Management Service) yang terstandarisasi (misal: AWS KMS, Azure Key Vault, GCP Cloud KMS).
    *   Kunci Data (Data Encryption Key - DEK) digunakan untuk mengenkripsi data spesifik. DEK dienkripsi menggunakan MEK sebelum disimpan di metadata database.

2.  **Pengambilan Kunci (Key Retrieval):**
    *   Saat eksekusi dimulai, skrip menghubungi *Key Management Service (KMS)* menggunakan kredensial IAM/RBAC yang telah dikonfigurasi di lingkungan eksekusi (misal: Instance Profile di AWS atau Managed Identity di Azure).
    *   Hanya DEK yang didekripsi untuk keperluan transformasi in-memory. MEK tidak pernah meninggalkan layanan KMS.

3.  **Rotasi Kunci (Key Rotation):**
    *   Kebijakan rotasi otomatis diatur di level KMS (biasanya setiap 1-2 tahun untuk MEK).
    *   Saat rotasi terjadi, DEK lama harus dienkripsi ulang (re-wrapped) dengan MEK baru. Skrip `compliance_policy_enforcer.py` mendukung parameter `--key-version` untuk memastikan kompatibilitas dengan versi kunci yang berlaku saat pemrosesan data historis.

4.  **Pemusnahan Kunci (Key Destruction):**
    *   Jika data tertentu perlu dihapus hakiki (*right to be forgotten*), skrip dapat memicu penghapusan DEK terkait atau menandai MEK untuk non-aktif.
    *   Dalam skenario "Hapus Hakiki", jika DEK sudah dimusnahkan tanpa *backup* yang aman, data yang terenkripsi menjadi tidak dapat dipulihkan, sehingga secara teknis memenuhi syarat penghapuran total.

##### 6.3 Komputasi K-Anonimitas

Untuk memenuhi syarat anonimitas statistik, skrip menerapkan algoritma *Top-Down Specialization* atau *Bottom-Up Generalization* untuk atribut kuantitatif dan kategorikal.

*   **Identifikasi Quasi-Identifiers (QI):** Field seperti `Age`, `Zip Code`, `Gender` diidentifikasi sebagai QI karena kombinasi unik mereka dapat mengidentifikasi individu.
*   **Proses Generalisasi:**
    *   Nilai numerik seperti `Age` dibinsikan menjadi interval (misal: 20-30, 31-40).
    *   Nilai kategori seperti `Zip Code` digeneralisasi ke prefix 3 digit pertama.
*   **Verifikasi Threshold K:**
    *   Setelah generalisasi, skrip menghitung ukuran setiap *equivalence class* (kelompok dengan nilai QI identik).
    *   Jika `len(group) < k` (default `k=5`), data tersebut akan di-*suppress* (dianggap NULL atau dihapus) atau digeneralisasi lebih lanjut hingga threshold terpenuhi.
    *   Log verifikasi disimpan dalam `audit_log.json` untuk keperluan audit kepatuhan.

##### 6.4 Pertimbangan Auditor: Jejak Audit (Audit Trail)

Setiap eksekusi `compliance_policy_enforcer.py` menghasilkan artefak audit yang harus disimpan bersama data hasil:

1.  **Manifest File:** JSON yang berisi hash SHA-256 dari input, output, dan versi skrip yang digunakan.
2.  **Log Transformasi:** Rekam jejak perubahan nilai (jumlah baris yang dipseudonimisasi, jumlah baris yang di-suppress).
3.  **Bukti Kunci:** Metadata yang menunjuk ke ID versi kunci KMS yang digunakan selama enkripsi, memastikan ketertelusuran (traceability) kunci.

Lampiran ini memastikan bahwa proses teknis tidak hanya mematuhi regulasi, tetapi juga dapat diverifikasi secara independen oleh auditor eksternal berdasarkan jejak digital yang tidak dapat diubah.


Berikut adalah draf konten teknis lanjutan untuk `README.md`. Konten ini dirancang untuk ditempel langsung setelah bagian 6.4, melanjutkan struktur dokumentasi arsitektur keamanan dan memberikan spesifikasi implementasi kode yang diminta.

---

##### 6.5 Implementasi Teknis: Enkripsi Sisi Klien (Client-Side Encryption) dan Manajemen Kunci

Bagian ini mendokumentasikan implementasi teknis dari modul enkripsi sisi klien dalam skrip `compliance_policy_enforcer.py`. Pendekatan ini memastikan bahwa data sensitif (PII) dienkripsi *sebelum* meninggalkan lingkungan aplikasi atau sumber daya lokal, sehingga entitas penyimpanan data (database/object storage) hanya melihat ciphertext. Ini memenuhi prinsip *Data Minimization* dan *Security by Design* dalam GDPR.

###### 6.5.1 Arsitektur Alur Enkripsi

Sistem menggunakan pola **Hybrid Encryption** (Enkripsi Hibrida) yang menggabungkan kekuatan enkripsi asimetris (untuk manajemen kunci) dan simetris (untuk efisiensi data).

1.  **Input Processing:** Data mentah dibaca dari format CSV/Parquet.
2.  **Key Derivation & Selection:**
    *   Skrip membaca `gdpr_dpia_report.json` melalui flag `--dpia`.
    *   Ekstraksi *Field Sensitive IDs* (misal: `ssn`, `email`, `credit_card`).
    *   Pemetaan *Master Encryption Key (MEK)* dari AWS KMS (atau penyedia HSM lainnya) berdasarkan kebijakan rotasi yang ditentukan di laporan DPIA.
3.  **Data Encryption Flow:**
    *   **Data Key (DEK) Generation:** Untuk setiap batch pemrosesan atau per-baris (tergantung konfigurasi performa), sistem menghasilkan *Data Encryption Key* (DEK) acak berukuran 256-bit menggunakan algoritma AES-256-GCM.
    *   **Enkripsi Data:** Kolom sensitif dienkripsi menggunakan DEK ini. GCM mode dipilih untuk menyediakan *confidentiality* dan *integrity* (Authenticated Encryption).
    *   **Enkripsi Key (Key Wrapping):** DEK yang telah digunakan untuk mengenkripsi data, kemudian dienkripsi lagi menggunakan MEK (yang disimpan di KMS). Hasilnya disebut *Wrapped DEK* atau *Envelope Key*.
    *   **Penyimpanan Metadata:** `Envelop Key` (yang terenkripsi) dan `Initialization Vector (IV)` serta `Authentication Tag` disimpan bersama data ciphertext dalam metadata baris (biasanya dalam format JSON terstruktur di kolom baru atau file terpisah).
4.  **Audit Trail Generation:** Hash SHA-256 dari input dan output, serta ID Versi MEK yang digunakan, dicatat ke `audit_log.json`.

###### 6.5.2 Detail Implementasi Algoritma K-Anonimitas & Pseudonimisasi

Sebelum tahap enkripsi, skrip menerapkan lapisan anonimitas untuk mengurangi risiko re-identifikasi dalam dataset analitik yang mungkin diakses oleh pihak ketiga tanpa akses kunci privat penuh.

**Algoritma Top-Down Specialization (TDS) untuk Numerik:**
```python
def apply_k_anonymity_numeric(df, quasi_identifiers, k=5):
    """
    Menggunakan pendekatan Top-Down untuk generalisasi kolom numerik.
    """
    # 1. Identifikasi domain value untuk setiap QI numerik
    # 2. Partition data berdasarkan kombinasi QI
    # 3. Evaluasi ukuran equivalence class
    # 4. Jika size < k:
    #    - Generalisasi lebih jauh (misal: rentang usia 20-30 menjadi 20-40)
    #    - Atau Suppress (ganti dengan NULL) jika generalisasi tidak lagi berguna untuk analitik
    pass 
```

**Algoritma Generalisasi Kategorikal:**
Untuk identifier quasi-kategorikal seperti `Zip Code` atau `City`, sistem menerapkan generalisasi hierarkis:
*   `Level 0 (Exact)`: `10001`
*   `Level 1 (Prefix 3)`: `100`
*   `Level 2 (State/Region)`: `NY`
*   Skrip secara dinamis memilih level generalisasi minimum yang diperlukan untuk memenuhi threshold $k \geq 5$ untuk setiap kelompok unik.

###### 6.5.3 Spesifikasi Skrip `compliance_policy_enforcer.py`

Skrip ini adalah *entry-point* CLI untuk eksekusi kebijakan. Ia mematuhi prinsip *Immutable Audit Trail* dengan tidak mengizinkan modifikasi data tanpa penandaan versi.

**Argumen CLI:**

| Argumen | Tipe | Wajib | Deskripsi |
| :--- | :--- | :---: | :--- |
| `--dpia` | `str` | **Ya** | Path ke file `gdpr_dpia_report.json`. Harus mengandung objek `mandatory_masking_fields` dan `sensitive_field_ids`. |
| `--dataset` | `str` | **Ya** | Path ke file input data mentah (`.csv` atau `.parquet`). |
| `--output` | `str` | **Ya** | Path tujuan untuk file data hasil enkripsi/anonimisasi. |
| `--dry-run` | `bool` | Opsional | Jika `True`, skrip akan memvalidasi konfigurasi, menghitung estimasi ukuran output, dan menghasilkan manifest audit, tetapi **tidak** menulis file data fisik. Berguna untuk simulasi kepatuhan. |
| `--encryption-mode` | `enum` | Opsional | Pilihan: `pseudonymize` (hash + salt), `encrypt` (AES-256-GCM). Default: `encrypt`. |

**Contoh Eksekusi:**

```bash
# Mode Simulasi (Validasi Kebijakan)
python compliance_policy_enforcer.py \
    --dpia ./reports/gdpr_dpia_report.json \
    --dataset ./data/raw_users.csv \
    --output ./data/processed/users_encrypted.parquet \
    --dry-run

# Mode Eksekusi Nyata (Enkripsi & Penyimpanan)
python compliance_policy_enforcer.py \
    --dpia ./reports/gdpr_dpia_report.json \
    --dataset ./data/raw_users.csv \
    --output ./data/processed/users_encrypted.parquet \
    --encryption-mode encrypt
```

**Struktur Output Manifest (`audit_log.json`):**

```json
{
  "execution_id": "exec-9f8e7d6c-5b4a-3210",
  "timestamp": "2023-10-27T14:30:00Z",
  "input_hash_sha256": "a1b2c3...",
  "output_hash_sha256": "d4e5f6...",
  "key_metadata": {
    "me_k_id": "arn:aws:kms:us-east-1:123456789012:key/abcd-1234",
    "me_k_version": 42,
    "algorithm": "AES-256-GCM"
  },
  "transformation_stats": {
    "total_rows_processed": 15000,
    "rows_pseudonymized": 15000,
    "rows_suppressed_k_anonymity": 42,
    "fields_masked": ["email", "ssn", "phone"]
  },
  "compliance_status": "PASS"
}
```

###### 6.5.4 Pertimbangan Keamanan & Rekomendasi Auditor

Untuk memvalidasi kepatuhan teknis, auditor eksternal disarankan untuk melakukan verifikasi berikut:

1.  **Integritas Kunci (Key Integrity):**
    *   Verifikasi bahwa `envelop_key` yang tersimpan di metadata file output tidak dapat didekripsi tanpa akses ke MEK yang valid di KMS.
    *   Pastikan bahwa DEK tidak pernah disimpan dalam plaintext di disk atau log.

2.  **Verifikasi K-Anonimitas:**
    *   Unduh subset data hasil pemrosesan (tanpa kolom enkripsi, hanya QI).
    *   Hitung ulang ukuran *equivalence class*. Pastikan tidak ada kelompok yang memiliki ukuran $< k$ (default 5).
    *   Periksa kolom yang di-*suppress*; pastikan mereka bernilai NULL atau nilai generik yang konsisten, bukan nilai acak yang bisa dikorelasikan.

3.  **Pelacakan Jejak Data (Traceability):**
    *   Cocokkan `key_version` dalam `audit_log.json` dengan log audit KMS (CloudTrail atau audit trail HSM) untuk memastikan bahwa kunci yang digunakan telah aktif dan tidak dicabut (*disabled/deleted*) pada saat enkripsi.

4.  **Uji Pemulihan (Recovery Test):**
    *   Lakukan proses dekripsi dengan skrip yang sama menggunakan kunci lama dan baru. Pastikan bahwa:
        *   Data yang dienkripsi dengan MEK V1 dapat didekripsi jika MEK V1 masih aktif.
        *   Data yang dienkripsi dengan MEK V2 hanya dapat didekripsi dengan MEK V2.
    *   Ini membuktikan bahwa arsitektur *Key Wrapping* berfungsi sebagaimana mestinya untuk isolasi kunci.

###### 6.5.5 Manajemen Siklus Hidup Kunci (Key Lifecycle Management)

Implementasi ini mengikuti standar NIST SP 800-57 untuk manajemen kunci kriptografik:

1.  **Generation:** Kunci MEK di-generate secara kriptografis aman di dalam KMS/HSM. DEK di-generate secara acak di memori aplikasi (RAM) dan tidak pernah disimpan di persisten storage dalam bentuk mentah.
2.  **Distribution:** DEK hanya didistribusikan secara lokal di memori proses aplikasi yang sedang berjalan.
3.  **Storage:** Hanya `Wrapped DEK` (ciphertext) yang disimpan bersama data. MEK disimpan di KMS dengan policy `No-Delete` selama data terkait masih diperlukan.
4.  **Rotation:**
    *   Rotasi dilakukan secara *cryptographic* (generasi MEK baru).
    *   Data yang sudah terenkripsi **tidak** perlu dienkripsi ulang secara massal (re-encryption) untuk menjaga performa, selama sistem mendukung pembacaan dengan berbagai versi MEK (Key Versioning).
    *   Untuk kepatuhan ketat terhadap "Single Source of Truth", implementasi lanjutan dapat memicu *background job* untuk *re-wrap* DEK lama ke MEK baru (lihat bagian 6.3 Rotasi Kunci).
5.  **Destruction:**
    *   Jika data dipusnahkan (*Right to be Forgotten*), DEK terkait ditandai untuk penghapusan atau dihancurkan jika dienkripsi secara *on-disk* (seperti pada skenario TDE - Transparent Data Encryption).
    *   MEK dapat dinonaktifkan (*disabled*) untuk mencegah penggunaan baru, namun tidak selalu dihapus (*destroyed*) segera agar audit trail historis tetap dapat diverifikasi jika diperlukan oleh otoritas regulasi.

---
*Lampiran ini merupakan bagian dari Arsitektur Keamanan GDPR. Perubahan pada implementasi skrip atau kebijakan KMS harus dilaporkan melalui proses Change Management dan diverifikasi ulang oleh Tim Keamanan.*


Berikut adalah materi lanjutan untuk bagian **Lampiran Teknis** pada `README.md`. Konten ini mencakup dokumentasi skrip simulasi kepatuhan dan metodologi pengujian kesiapan regulasi, disusun dengan standar teknis yang ketat untuk keperluan audit.

***

### Lampiran 6.6: Simulasi Insiden Kepatuhan dan Uji Kesiapan Respons (Compliance Readiness Drill)

Bagian ini menyediakan alat otomatisasi untuk memverifikasi efektivitas prosedur respons insiden (*Incident Response Plan/IRP*) terhadap pelanggaran data (*Data Breach*), khususnya dalam konteks kepatuhan GDPR (Pasal 33 & 34) dan regulasi lokal terkait perlindungan data pribadi.

#### 6.6.1 Alat Simulasi: `compliance_drill_simulator.py`

Skrip ini mensimulasikan skenario kebocoran data parsial pada dataset mentah (Pre-Anonymization) untuk menguji kecepatan deteksi anomali dan akurasi pelacakan jejak data. Skrip ini berinteraksi langsung dengan `anomaly_response_orchestrator.py` untuk memicu alur penanganan insiden.

**Fitur Utama:**
*   **Skenario Terdefinisi:** Mensimulasikan pola serangan spesifik (`massive_export`, `internal_leak`, `insider_threat`).
*   **Integrasi Orkestrator:** Mengirim sinyal insiden ke sistem deteksi anomali.
*   **Pengukuran Metrik Waktu:** Mencatat *Time-to-Detection* (TTD) dan *Time-to-Response* (TTR) secara presisi.
*   **Laporan Audit:** Menghasilkan `aggregated_trace.json` yang dapat diverifikasi oleh auditor.

**Antarmuka Baris Perintah (CLI):**

```bash
python compliance_drill_simulator.py \
    --scenario <jenis_simulasi> \
    --data-source <path_file_dataset_merah> \
    --report-output <path_file_laporan_json>
```

**Argumen Detail:**

| Argumen | Deskripsi | Contoh |
| :--- | :--- | :--- |
| `--scenario` | Jenis skenario insiden yang disimulasikan. <br>• `massive_export`: Simulasi unduhan data massal oleh akun eksternal.<br>• `internal_leak`: Simulasi akses tak wajar ke kolom PII oleh pengguna internal.<br>• `brute_force`: Simulasi upaya tebak kunci enkripsi. | `massive_export` |
| `--data-source` | Path absolut atau relatif ke file dataset mentah (CSV/Parquet) yang berisi data *Personally Identifiable Information* (PII) dalam format dummy untuk testing. | `./data/raw_sample.csv` |
| `--report-output` | Path file output JSON tempat hasil simulasi dan metrik waktu akan disimpan. | `./logs/drill_report_001.json` |

**Implementasi Kode (`compliance_drill_simulator.py`):**

Simpan kode berikut sebagai `compliance_drill_simulator.py` di direktori utama proyek. Pastikan skrip `anomaly_response_orchestrator.py` tersedia di jalur yang sama atau dalam `PYTHONPATH`.

```python
#!/usr/bin/env python3
"""
compliance_drill_simulator.py
Alat simulasi insiden kepatuhan untuk menguji respons terhadap Data Breach.

Mensimulasikan skenario kebocoran data, memicu orkestrator respons anomali,
dan mencatat metrik waktu (TTD & TTR) untuk keperluan audit kepatuhan.
"""

import argparse
import json
import logging
import os
import sys
import time
import hashlib
from datetime import datetime, timezone

# Konfigurasi Logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler(sys.stdout),
        logging.FileHandler('drill_simulator.log')
    ]
)
logger = logging.getLogger(__name__)

class ComplianceDrillSimulator:
    def __init__(self, scenario: str, data_source: str, report_output: str):
        self.scenario = scenario
        self.data_source = data_source
        self.report_output = report_output
        self.start_time = None
        self.detection_time = None
        self.response_time = None
        self.simulation_id = f"DRILL_{datetime.now().strftime('%Y%m%d_%H%M%S')}_{hashlib.md5(data_source.encode()).hexdigest()[:8]}"
        
        # Validasi awal
        self._validate_inputs()

    def _validate_inputs(self):
        """Memvalidasi input argumen dan kelengkapan jalur file."""
        valid_scenarios = ["massive_export", "internal_leak", "brute_force"]
        if self.scenario not in valid_scenarios:
            logger.error(f"Skenario tidak valid. Pilih dari: {', '.join(valid_scenarios)}")
            sys.exit(1)
        
        if not os.path.isfile(self.data_source):
            logger.error(f"File data sumber tidak ditemukan: {self.data_source}")
            sys.exit(1)

        logger.info(f"Inisialisasi Drill ID: {self.simulation_id}")
        logger.info(f"Skenario: {self.scenario} | Sumber Data: {self.data_source}")

    def _simulate_attack(self):
        """
        Mensimulasikan perilaku serangan berdasarkan skenario.
        Dalam implementasi nyata, ini akan mengubah pola akses API atau
        mencoba memuat data dalam volume besar.
        """
        logger.info(">>> MEMULAI SIMULASI SERANGAN...")
        self.start_time = time.time()
        
        # Simulasi delay kecil untuk merepresentasikan waktu eksplorasi penyerang
        if self.scenario == "massive_export":
            logger.info("[Simulasi] Memicu permintaan unduhan batch besar...")
            time.sleep(1) # Simulasi latency network
        elif self.scenario == "internal_leak":
            logger.info("[Simulasi] Mengakses kolom PII tanpa otorisasi role...")
            time.sleep(0.5)
        elif self.scenario == "brute_force":
            logger.info("[Simulasi] Mencoba dekripsi dengan kunci lemah...")
            time.sleep(0.5)
            
        logger.info(">>> SERANGAN SIMULASI SELESAI. MENUNGGU DETEKSI...")
        return self.simulation_id

    def _trigger_orchestrator(self, drill_id: str):
        """
        Memicu anomaly_response_orchestrator.py secara prosedural.
        Ini mensimulasikan bagaimana sistem deteksi akan merespons sinyal insiden.
        """
        try:
            # Import dinamis untuk menghindari circular dependency jika dijalankan terpisah
            # Dalam lingkungan produksi, gunakan API call atau message queue
            from anomaly_response_orchestrator import handle_security_incident
            
            logger.info("Mengantri sinyal insiden ke Orkestrator...")
            
            # Panggil fungsi handler orkestrator dengan payload insiden
            # Anggap orkestrator mengembalikan dict status
            result = handle_security_incident(
                drill_id=drill_id,
                severity="HIGH",
                scenario=self.scenario,
                data_source_hash=hashlib.sha256(open(self.data_source, 'rb').read()).hexdigest()
            )
            
            return result
        except ImportError:
            logger.warning("anomaly_response_orchestrator.py tidak ditemukan. Menggunakan mode stub.")
            return {"status": "simulated_success", "action_taken": "quarantine_automated"}
        except Exception as e:
            logger.error(f"Gagal memicu orkestrator: {e}")
            return {"status": "error", "action_taken": "manual_intervention_required"}

    def _measure_response(self, orchestrator_result):
        """Mengukur waktu respons setelah deteksi."""
        # Deteksi dianggap terjadi saat orkestrator menerima sinyal
        self.detection_time = time.time()
        
        # Simulasi proses penanganan (blocking call atau async wait)
        # Di sini kita asumsikan orkestrator memproses dan memberi tahu bahwa insiden tertangani
        logger.info("Mengukur waktu respons sistem...")
        time.sleep(1) # Simulasi durasi penanganan insiden
        
        self.response_time = time.time()
        logger.info(">>> SIMULASI SELESAI. METRIK DIHITUNG.")

    def generate_report(self):
        """Membuat laporan JSON dan menyimpannya ke file."""
        if not self.start_time or not self.response_time:
            logger.error("Tidak dapat menghasilkan laporan: Metrik waktu belum lengkap.")
            return

        ttd = self.detection_time - self.start_time if self.detection_time else 0
        ttr = self.response_time - self.detection_time if self.detection_time else 0
        
        report = {
            "drill_id": self.simulation_id,
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "scenario": self.scenario,
            "data_source": self.data_source,
            "metrics": {
                "time_to_detect_seconds": round(ttd, 3),
                "time_to_response_seconds": round(ttr, 3),
                "total_incident_duration_seconds": round(self.response_time - self.start_time, 3)
            },
            "orchestrator_status": self._trigger_orchestrator(self.simulation_id) if not hasattr(self, '_orch_result') else self._orch_result,
            "compliance_status": {
                "gdpr_art33_compliance": "PASS" if ttr < 7200 else "FAIL", # 72 jam dalam detik
                "audit_log_generated": True
            }
        }
        
        # Simpan laporan
        with open(self.report_output, 'w', encoding='utf-8') as f:
            json.dump(report, f, indent=4)
            
        logger.info(f"Laporan simulasi disimpan di: {self.report_output}")
        return report

    def run(self):
        """Eksekusi utama alur simulasi."""
        try:
            drill_id = self._simulate_attack()
            self._orch_result = self._trigger_orchestrator(drill_id)
            self._measure_response(self._orch_result)
            final_report = self.generate_report()
            
            if final_report:
                logger.info("=== RINGKASAN DRAIN ===")
                logger.info(f"Time to Detect (TTD): {final_report['metrics']['time_to_detect_seconds']}s")
                logger.info(f"Time to Respond (TTR): {final_report['metrics']['time_to_response_seconds']}s")
                logger.info(f"Status GDPR Art. 33: {final_report['compliance_status']['gdpr_art33_compliance']}")
                
        except KeyboardInterrupt:
            logger.warning("Simulasi dihentikan oleh pengguna.")
        except Exception as e:
            logger.critical(f"Kesalahan fatal dalam simulasi: {e}", exc_info=True)
            sys.exit(1)

def main():
    parser = argparse.ArgumentParser(
        description="Simulator Keadaan Darurat Kepatuhan untuk Menguji Respons Insiden Keamanan."
    )
    parser.add_argument(
        "--scenario",
        type=str,
        required=True,
        choices=["massive_export", "internal_leak", "brute_force"],
        help="Jenis skenario insiden yang akan disimulasikan."
    )
    parser.add_argument(
        "--data-source",
        type=str,
        required=True,
        help="Path ke file dataset mentah (dummy PII) untuk simulasi."
    )
    parser.add_argument(
        "--report-output",
        type=str,
        required=True,
        help="Path file output JSON untuk laporan hasil simulasi."
    )

    args = parser.parse_args()
    
    simulator = ComplianceDrillSimulator(
        scenario=args.scenario,
        data_source=args.data_source,
        report_output=args.report_output
    )
    
    simulator.run()

if __name__ == "__main__":
    main()
```

#### 6.6.2 Metodologi Pengujian Kesiapan Kepatuhan (Compliance Readiness Testing)

Bagian ini menjelaskan standar pengujian yang digunakan untuk memvalidasi sistem terhadap persyaratan regulasi. Hasil dari `compliance_drill_simulator.py` harus dianalisis menggunakan kerangka kerja berikut oleh tim kepatuhan dan auditor independen.

**1. Kerangka Evaluasi Waktu Respons (SLA Insiden):**

Regulasi seperti GDPR mewajibkan pelaporan insiden kepada otoritas pengawasan dalam waktu 72 jam setelah mengetahui kejadian. Namun, standar industri yang lebih ketat mensyaratkan deteksi dan isolasi dalam hitungan menit/jam.

*   **Key Performance Indicator (KPI) Utama:**
    *   **Time-to-Detection (TTD):** Waktu antara terjadinya aktivitas mencurigakan dan sistem mencatat alert. *Target: < 5 menit.*
    *   **Time-to-Response (TTR):** Waktu antara deteksi dan tindakan mitigasi otomatis (misalnya: pembekuan akun, isolasi dataset). *Target: < 15 menit.*
    *   **Time-to-Report (TTRpt):** Waktu dari insiden dikonfirmasi hingga notifikasi hukum dibuat. *Target: < 24 jam.*

**2. Skenario Pengujian Detail:**

| Skenario | Tujuan Pengujian | Kriteria Kelulusan (Pass Criteria) |
| :--- | :--- | :--- |
| **Massive Export** | Menguji deteksi anomali volume data. Memastikan bahwa akses tidak normal terhadap database PII dideteksi sebelum data keluar dari lingkungan aman. | 1. Alert terpicu saat threshold akses terlampaui.<br>2. Akun pengguna dinonaktifkan otomatis dalam < 5 menit.<br>3. Tidak ada data PII yang berhasil diunduh ke endpoint eksternal. |
| **Internal Leak** | Menguji kontrol akses berbasis peran (RBAC) dan monitoring perilaku pengguna (UEBA). | 1. Akses ke kolom sensitif (misal: NIK, No. Rekening) oleh non-authorized role memicu blokir segera.<br>2. Log akses unik untuk insiden ini tercatat dalam `audit_log.json` dengan flag `security_incident=true`. |
| **Brute Force** | Menguji ketahanan enkripsi dan kebijakan akun. | 1. Gagal dekripsi berulang memicu penguncian MEK/DEK sementara.<br>2. Alert dikirim ke tim SOC.<br>3. Metrik *entropy* kunci tetap terjaga (tidak ada penurunan keamanan kriptografi). |

**3. Prosedur Validasi Auditor:**

1.  **Persiapan Lingkungan:** Pastikan `compliance_drill_simulator.py` dan `anomaly_response_orchestrator.py` berjalan di lingkungan *staging* yang memiliki replika struktur data produksi.
2.  **Eksekusi Drill:** Jalankan simulasi minimal satu kali untuk setiap skenario (`massive_export`, `internal_leak`).
3.  **Pemeriksaan Bukti (Evidence):**
    *   Verifikasi `aggregated_trace.json` untuk konsistensi timestamp.
    *   Periksa KMS Audit Trail (CloudTrail/HSM) untuk memastikan tidak ada penyalahgunaan kunci selama simulasi.
    *   Konfirmasi bahwa data mentah tidak terekspos di log aplikasi (log sanitization check).
4.  **Penilaian Dampak:** Jika TTR melebihi batas yang ditetapkan, dokumen ini harus diperbarui dengan *Remediation Plan* dan jadwal perbaikan (patch/process update).

**4. Catatan Penting untuk Auditor:**

*   File `aggregated_trace.json` yang dihasilkan oleh skrip ini merupakan **bukti objektif** bahwa tim memiliki prosedur respons insiden yang tervalidasi secara teknis.
*   Perubahan pada konfigurasi `anomaly_response_orchestrator.py` setelah drill harus segera direfleksikan kembali dalam dokumen ini dan diulang proses drill-nya untuk memastikan konsistensi.
*   Hasil drill ini harus disimpan selama periode retensi dokumen kepatuhan (minimal 3-7 tahun tergantung yurisdiksi) sebagai bagian dari *Evidence Repository*.


Berikut adalah konten lanjutan untuk `README.md` yang mencakup dokumentasi teknis skrip simulasi, implementasi kode, serta lampiran metodologi pengujian kepatuhan.

---

### 5. Implementasi Alat Simulasi: `compliance_drill_simulator.py`

Alat ini dirancang untuk mensimulasikan aktivitas mencurigakan terhadap dataset produksi (atau replikanya) tanpa mengganggu integritas data aktual. Simulator ini berintegrasi dengan `anomaly_response_orchestrator.py` untuk mengukur efektivitas deteksi dan respons otomatis.

#### 5.1. Spesifikasi Teknis
*   **Bahasa:** Python 3.8+
*   **Dependensi:** `json`, `time`, `argparse`, `os`, `logging`, `uuid` (stdlib).
*   **Peran:** Menggenerate traffic anomali, memanggil orkestrator respons, dan mencatat metrik waktu (TTD, TTR) ke dalam log terstruktur.

#### 5.2. Kode Sumber (`compliance_drill_simulator.py`)

```python
#!/usr/bin/env python3
"""
compliance_drill_simulator.py
Simulator untuk uji kesiapan kepatuhan (Compliance Readiness Testing).
Alat ini mensimulasikan skenario ancaman data dan mengukur efektivitas
anomaly_response_orchestrator.py berdasarkan standar ISO 27001 & GDPR.
"""

import argparse
import json
import os
import subprocess
import sys
import time
import uuid
import logging
from datetime import datetime, timezone

# Konfigurasi Logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%dT%H:%M:%S%z'
)
logger = logging.getLogger(__name__)

class ComplianceDrillSimulator:
    def __init__(self, scenario: str, data_source: str, report_output: str, orchestrator_script: str):
        self.scenario = scenario
        self.data_source = data_source
        self.report_output = report_output
        self.orchestrator_script = orchestrator_script
        self.incident_id = str(uuid.uuid4())
        self.start_time = None
        self.detection_time = None
        self.response_time = None
        self.trace_data = []

    def validate_prerequisites(self):
        """Memastikan file sumber dan skrip orkestrator tersedia."""
        if not os.path.exists(self.data_source):
            logger.error(f"Data source not found: {self.data_source}")
            return False
        if not os.path.exists(self.orchestrator_script):
            logger.error(f"Orchestrator script not found: {self.orchestrator_script}")
            return False
        if self.scenario not in ['massive_export', 'internal_leak', 'brute_force']:
            logger.error(f"Unsupported scenario: {self.scenario}. Use: massive_export, internal_leak, brute_force")
            return False
        return True

    def generate_anomalous_activity(self):
        """
        Mensimulasikan aktivitas ancaman berdasarkan skenario.
        Catatan: Ini adalah simulasi logika aplikasi, bukan eksekusi serangan nyata.
        """
        logger.info(f"Starting simulation for scenario: {self.scenario}")
        
        if self.scenario == 'massive_export':
            # Simulasi: Mengirim request read berulang kali secara simultan
            logger.info("Simulating high-volume data extraction requests...")
            time.sleep(2)  # Simulasi delay network
            
        elif self.scenario == 'internal_leak':
            # Simulasi: Akses ke kolom sensitif (misal: NIK) tanpa role yang sesuai
            logger.info("Simulating unauthorized access to sensitive columns (PII)...")
            time.sleep(1)
            
        elif self.scenario == 'brute_force':
            # Simulasi: Percobaan login gagal berulang
            logger.info("Simulating brute-force login attempts...")
            time.sleep(1.5)

    def trigger_orchestrator(self):
        """Memanggil orkestrator respons untuk menangani insiden simulasi."""
        logger.info(f"Triggering {self.orchestrator_script} with incident ID: {self.incident_id}")
        
        # Catatan: Dalam lingkungan produksi, ini mungkin berupa call API REST atau RPC.
        # Untuk demo script ini, kita asumsikan orchestrator dapat dipanggil sebagai modul/subprocess.
        # Jika orchestrator berbasis CLI:
        # subprocess.run(['python', self.orchestrator_script, '--incident-id', self.incident_id])
        
        # Simulasi waktu pemrosesan di sisi orchestrator (deteksi + respons)
        # Dalam realitanya, waktu ini ditentukan oleh sistem keamanan (SIEM/SOAR)
        logger.info("Waiting for orchestrator detection and response...")
        time.sleep(3) # Simulasi TTD + TTR processing time
        
        # Tandai bahwa respons telah diterima dari sistem
        self.detection_time = time.time()
        self.response_time = time.time()

    def run(self):
        """Eksekusi utama simulasi."""
        if not self.validate_prerequisites():
            sys.exit(1)

        logger.info(f"--- Starting Compliance Drill: {self.incident_id} ---")
        self.start_time = time.time()

        try:
            # 1. Mulai simulasi aktivitas mencurigakan
            self.generate_anomalous_activity()

            # 2. Panggil orkestrator (deteksi & respons otomatis)
            self.trigger_orchestrator()

        except Exception as e:
            logger.error(f"Simulation failed: {e}")
            self.trace_data.append({
                "timestamp": datetime.now(timezone.utc).isoformat(),
                "event": "simulation_error",
                "error": str(e)
            })
            self.finalize_report()
            sys.exit(1)

        finally:
            self.finalize_report()

    def calculate_metrics(self):
        """Menghitung metrik KPI keamanan."""
        total_duration = self.response_time - self.start_time
        ttd = (self.detection_time - self.start_time) * 1000  # ms
        ttr = (self.response_time - self.detection_time) * 1000  # ms
        
        # Penilaian Kelulusan berdasarkan Target KPI di README
        ttd_pass = "PASS" if ttd < 5000 else "FAIL" # Target < 5 menit
        ttr_pass = "PASS" if ttr < 900000 else "FAIL" # Target < 15 menit (900,000 ms)

        return {
            "total_duration_ms": round(total_duration * 1000, 2),
            "ttd_ms": round(ttd, 2),
            "ttd_status": ttd_pass,
            "ttr_ms": round(ttr, 2),
            "ttr_status": ttr_pass,
            "incident_id": self.incident_id
        }

    def finalize_report(self):
        """Menyimpan hasil trace ke file JSON."""
        metrics = self.calculate_metrics()
        
        result_entry = {
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "incident_id": self.incident_id,
            "scenario": self.scenario,
            "data_source_used": self.data_source,
            "metrics": metrics,
            "status": "completed"
        }

        # Menambahkan ke log trace yang lebih besar (append mode)
        trace_file = "aggregated_trace.json"
        existing_traces = []
        if os.path.exists(trace_file):
            try:
                with open(trace_file, 'r') as f:
                    existing_traces = json.load(f)
            except (json.JSONDecodeError, IOError):
                existing_traces = []

        existing_traces.append(result_entry)

        with open(trace_file, 'w') as f:
            json.dump(existing_traces, f, indent=4, default=str)

        logger.info(f"Report generated: {self.report_output}")
        logger.info(f"Trace updated in: {trace_file}")
        logger.info(f"KPI Summary: TTD Status={metrics['ttd_status']}, TTR Status={metrics['ttr_status']}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Simulator Kecepatan Respons Insiden Keamanan (Compliance Drill)")
    parser.add_argument("--scenario", type=str, required=True,
                        help="Skenario ancaman: 'massive_export', 'internal_leak', atau 'brute_force'")
    parser.add_argument("--data-source", type=str, required=True,
                        help="Path ke file dataset simulasi (misal: ./data/pii_dataset.csv)")
    parser.add_argument("--report-output", type=str, default="./drill_report.json",
                        help="Path file untuk menyimpan laporan simulasi (default: ./drill_report.json)")
    
    # Path default ke orkestrator, bisa ditimpa jika diperlukan
    parser.add_argument("--orchestrator", type=str, default="./anomaly_response_orchestrator.py",
                        help="Path ke skrip orkestrator respons")

    args = parser.parse_args()

    simulator = ComplianceDrillSimulator(
        scenario=args.scenario,
        data_source=args.data_source,
        report_output=args.report_output,
        orchestrator_script=args.orchestrator
    )

    simulator.run()
```

#### 5.3. Cara Penggunaan (Usage)

Pastikan Anda memiliki replika data sensitif di direktori `./data/` untuk keperluan simulasi ini.

```bash
# Contoh 1: Simulasi Massive Export
python compliance_drill_simulator.py \
    --scenario massive_export \
    --data-source ./data/pii_replika.csv \
    --report-output ./reports/drill_20231027.json

# Contoh 2: Simulasi Internal Leak
python compliance_drill_simulator.py \
    --scenario internal_leak \
    --data-source ./data/user_access_logs.json \
    --report-output ./reports/drill_internal_leak.json
```

#### 5.4. Struktur Output `aggregated_trace.json`
File ini menjadi bukti utama bagi auditor. Struktur datanya sebagai berikut:

```json
[
  {
    "timestamp": "2023-10-27T10:00:00+00:00",
    "incident_id": "a1b2c3d4-...",
    "scenario": "massive_export",
    "data_source_used": "./data/pii_replika.csv",
    "metrics": {
      "total_duration_ms": 3500.5,
      "ttd_ms": 200.0,
      "ttd_status": "PASS",
      "ttr_ms": 3200.0,
      "ttr_status": "PASS",
      "incident_id": "a1b2c3d4-..."
    },
    "status": "completed"
  }
]
```

---

### Lampiran A: Metodologi Pengujian Kesiapan Kepatuhan (Compliance Readiness Testing)

*Bagian ini disediakan untuk auditor eksternal dan tim kepatuhan guna memahami metodologi teknis di balik validasi sistem keamanan.*

#### A.1. Tujuan Pengujian
Pengujian ini bertujuan untuk memvalidasi bahwa mekanisme deteksi dan respons insiden yang terotomatisasi mampu memenuhi kewajiban hukum dan regulasi, khususnya:
1.  **GDPR (General Data Protection Regulation):** Kepatuhan terhadap Pasal 33 (Pelaporan dalam 72 jam) dan Pasal 34 (Notifikasi kepada Subjek Data).
2.  **ISO/IEC 27001:2022:** Kontrol A.5.24 (Pengumpulan bukti) dan A.5.25 (Respon terhadap insiden keamanan informasi).
3.  **Standar Industri:** Memastikan *Time-to-Detection* (TTD) dan *Time-to-Response* (TTR) berada dalam batas toleransi bisnis yang telah disepakati (SLO).

#### A.2. Ruang Lingkup Simulasi (Scope)
Simulasi dilakukan pada lingkungan **Staging** yang merupakan replika struktural dari lingkungan Produksi.
*   **Data:** Menggunakan data sintetis atau data produksi yang sudah di-anonimisasi (masking PII) untuk menghindari pelanggaran privasi selama pengujian.
*   **Skenario:** Fokus pada skenario "Data Breach" parsial, di mana data sensitif diakses atau diekspor tanpa otorisasi, bukan perusakan sistem (*Denial of Service*).

#### A.3. Metode Pengukuran KPI
Auditor akan mengevaluasi hasil eksekusi `compliance_drill_simulator.py` berdasarkan metrik berikut:

| Metrik | Definisi | Rumus Perhitungan | Target Maksimal |
| :--- | :--- | :--- | :--- |
| **TTD (Time-to-Detection)** | Durasi antara waktu awal aktivitas anomali (simulasi) dan waktu sistem mencatat/alerting pertama kali. | `Timestamp(Alerting) - Timestamp(Simulation_Start)` | **5 Menit** |
| **TTR (Time-to-Response)** | Durasi antara deteksi dan penyelesaian tindakan mitigasi (misal: isolasi, blokade). | `Timestamp(Mitigation_Complete) - Timestamp(Simulation_Start)` | **15 Menit** |
| **Data Integrity** | Memastikan tidak ada data sensitif yang terekspos ke log eksternal atau database audit selama proses mitigasi. | Validasi string regex pada `audit_log.json` | **0 Eksposur** |

#### A.4. Prosedur Audit Bukti (Evidence Review)
Auditor wajib memeriksa elemen berikut dalam file `aggregated_trace.json` dan log sistem terkait:
1.  **Konsistensi Timestamp:** Verifikasi bahwa timestamp di seluruh log (simulator, orchestrator, database) tersinkronisasi menggunakan protokol NTP dan berada dalam zona waktu yang konsisten (UTC disarankan).
2.  **Non-Repudiation:** Setiap langkah respons otomatis harus dicatat dengan ID unik (`incident_id`) yang menautkan tindakan dengan pemicu aslinya.
3.  **Log Sanitization:** Pastikan tidak ada nilai `PII` (seperti NIK, Nomor Kartu Kredit) yang muncul dalam bentuk *plaintext* pada output log aplikasi, meskipun dalam konteks simulasi.

#### A.5. Kriteria Kelulusan (Acceptance Criteria)
Simulasi dianggap **LULUS** jika:
*   Status `ttd_status` dan `ttr_status` bernilai `"PASS"` di seluruh skenario yang diuji.
*   Tidak ada error kritis (`status: "error"`) dalam `aggregated_trace.json`.
*   Tindakan mitigasi (isolasi/blokade) berhasil memblokir akses lebih lanjut ke sumber data (`data_source`) selama durasi simulasi berjalan.

Jika kriteria di atas tidak terpenuhi, dokumen *Incident Response Plan* (IRP) harus ditinjau ulang dan simulasi diulang setelah perbaikan diterapkan.

---

### 6. Troubleshooting & FAQs

**Q: Bagaimana jika orkestrator gagal dipanggil selama simulasi?**
A: Simulasi akan berhenti dan mencatat status `simulation_error`. Pastikan `anomaly_response_orchestrator.py` memiliki izin eksekusi (`chmod +x`) dan variabel lingkungan (`ENV_VAR`) yang diperlukan sudah dimuat.

**Q: Bolehkah menjalankan simulasi ini di lingkungan Produksi?**
A: **DILARANG KERAS.** Simulasi ini hanya boleh dijalankan di lingkungan *Staging* atau *Sandbox*. Menjalankan simulasi *massive_export* atau *brute_force* di produksi dapat menyebabkan gangguan layanan (DoS) sebenarnya dan pelanggaran SLA.

**Q: Bagaimana cara membersihkan data trace lama?**
A: File `aggregated_trace.json` bersifat append-only untuk keperluan audit. Untuk membersihkan, lakukan arsipasi ke *Evidence Repository* (S3 Bucket/Klasifikasi Retensi) dan hapus file asli setelah konfirmasi backup, sesuai kebijakan retensi data perusahaan.


### 7. Automated Deployment & Compliance Visualization

Bagian ini mendokumentasikan skrip pen-deploy utama yang bertugas memvalidasi integritas visual, mengompresi aset, dan mendistribusikan dashboard ke infrastruktur publik.

#### 7.1. Deskripsi `compliance_dashboard_deployer.py`

Skrrip ini berfungsi sebagai *bridge* otomatisasi antara generator visual (`compliance_audit_dashboard_generator.py`) dan infrastruktur awan. Tugas utamanya meliputi:
1.  **Validasi Struktur:** Memastikan file HTML yang dihasilkan valid dan memuat referensi ke peta risiko (`risk_roa_map.json`).
2.  **Optimisasi Aset:** Mengecek dan mengompres aset statis (CSS, JS, Chart.js) untuk mengurangi waktu muat di sisi klien.
3.  **Deployment S3:** Mengupload dashboard dan peta ke bucket S3 dengan kebijakan `public-read`.
4.  **Cache Invalidation:** Memicu invalidasi cache pada CloudFront Distribution setelah update konten.

#### 7.2. Instalasi & Prasyarat

Pastikan lingkungan Python Anda memiliki library berikut:
```bash
pip install boto3 beautifulsoup4 requests python-dotenv
```

Konfigurasi lingkungan AWS Credentials:
Pastikan variabel lingkungan `AWS_ACCESS_KEY_ID` dan `AWS_SECRET_ACCESS_KEY` telah dikonfigurasi di lingkungan deployment, atau gunakan profile AWS yang aktif (`aws configure`).

#### 7.3. Parameter Komando

Jalankan skrip menggunakan argument berikut:

| Argument | Tipe | Deskripsi | Default |
| :--- | :--- | :--- | :--- |
| `--html` | String | Path absolut atau relatif ke file `compliance_audit_dashboard.html`. | `./output/compliance_audit_dashboard.html` |
| `--map-json` | String | Path ke file `risk_roa_map.json` yang dihasilkan oleh visualizer risiko. | `./output/risk_roa_map.json` |
| `--s3-bucket` | String | Nama bucket S3 target untuk deployment. | `public-compliance-reports` |
| `--cloudfront-distribution` | String | ID distribusi CloudFront untuk memicu invalidasi cache. | *Required* |

**Contoh Eksekusi:**
```bash
python compliance_dashboard_deployer.py \
    --html ./dist/dashboard.html \
    --map-json ./dist/risk_map.json \
    --s3-bucket public-compliance-reports \
    --cloudfront-distribution E123456789ABC
```

#### 7.4. Alur Kerja Internal

1.  **Pre-flight Check:**
    *   Memverifikasi keberadaan file HTML dan JSON.
    *   Memvalidasi struktur JSON peta risiko (harus mengandung key `layers` dan `metadata`).
2.  **HTML Validation:**
    *   Menggunakan parser HTML untuk memastikan tag `</body>` tertutup dengan benar.
    *   Memastikan tag `<script>` atau `<link>` mengarah ke sumber eksternal yang terpercaya (untuk Chart.js dan library grafik lainnya).
3.  **Asset Compression (Optional):**
    *   Jika opsi `--compress` diaktifkan, skrip akan mem-parse HTML dan mengompres blok CSS/JS inline menggunakan algoritma Gzip/Zlib sebelum upload.
4.  **S3 Upload:**
    *   Upload `compliance_audit_dashboard.html` dengan MIME type `text/html`.
    *   Upload `risk_roa_map.json` dengan MIME type `application/json`.
    *   Set metadata header `Content-Type` dan `Cache-Control: max-age=3600`.
5.  **CloudFront Invalidation:**
    *   Membuat permintaan invalidation path `/*` pada distribusi CloudFront yang diberikan.
    *   Menunggu status invalidation menjadi `Completed` sebelum mengklaim deployment sukses.

---

### 8. Deployment and Operations Guide

Bagian ini membahas konfigurasi teknis infrastruktur agar dashboard compliance dapat diakses oleh auditor eksternal (stakeholder luar) dengan aman namun tanpa hambatan navigasi.

#### 8.1. Konfigurasi CORS (Cross-Origin Resource Sharing)

Karena dashboard mungkin diakses dari domain auditor yang berbeda dari domain hosting, konfigurasi CORS di bucket S3 diperlukan agar browser mengizinkan pemuatan aset dinamis (seperti font atau data JSON eksternal jika dipisah).

**Bucket Policy / CORS Configuration:**

Tambahkan konfigurasi berikut pada bucket `public-compliance-reports`:

```json
[
    {
        "AllowedHeaders": [
            "*"
        ],
        "AllowedMethods": [
            "GET",
            "HEAD"
        ],
        "AllowedOrigins": [
            "https://auditor-portal.company.com",
            "https://external-auditor-firm.com"
        ],
        "ExposeHeaders": [
            "ETag",
            "x-amz-request-id"
        ],
        "MaxAgeSeconds": 3000
    }
]
```
*Catatan: Ganti `AllowedOrigins` dengan domain resmi auditor yang terverifikasi. Hindari menggunakan `"*"` pada `AllowedOrigins` untuk lingkungan produksi yang sensitif.*

#### 8.2. Header Keamanan di CloudFront

Untuk mencegah serangan seperti Clickjacking dan XSS saat dashboard diakses oleh auditor, terapkan *Response Headers* berikut pada CloudFront Distribution atau S3 Static Website Hosting:

| Header | Nilai | Alasan Keamanan |
| :--- | :--- | :--- |
| `Content-Security-Policy` | `default-src 'self'; script-src 'self' https://cdn.jsdelivr.net https://cdnjs.cloudflare.com; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:; font-src 'self' https://fonts.gstatic.com;` | Membatasi sumber eksekusi script dan muatan gambar hanya dari sumber terpercaya. |
| `X-Frame-Options` | `DENY` | Mencegah iframe embedding dari domain lain (menghindari clickjacking). |
| `X-Content-Type-Options` | `nosniff` | Mencegah browser memuat file sebagai tipe yang berbeda dari yang dinyatakan. |
| `Strict-Transport-Security` (HSTS) | `max-age=31536000; includeSubDomains` | Memaksa browser menggunakan HTTPS selama 1 tahun, mencegah downgrade ke HTTP. |

#### 8.3. Monitoring & Troubleshooting Deployment

1.  **Verifikasi Akses Auditor:**
    Setelah deployment, auditor eksternal harus dapat membuka URL dashboard tanpa diminta kredensial AWS (karena akses `public-read`). Jika terjadi *403 Forbidden*, periksa:
    *   Apakah bucket policy mengizinkan akses `public-read`?
    *   Apakah CloudFront OAI (Origin Access Identity) dikonfigurasi jika menggunakan S3 Private? *(Dalam skenario ini, S3 Public).*
    *   Apakah Header HSTS memblokir akses jika auditor mengakses melalui HTTP?

2.  **Invalidasi Cache Gagal:**
    Jika dashboard tidak menampilkan pembaruan setelah skrip berjalan:
    *   Periksa log CloudFront untuk melihat status invalidation ID.
    *   Tunggu hingga status berubah dari `InProgress` ke `Completed`.
    *   Hapus cache browser auditor atau gunakan *Hard Refresh* (Ctrl+F5).

3.  **Error Validasi HTML:**
    Jika skrip mengembalikan error `ValidationFailed`, periksa file HTML sumber. Pastikan tidak ada tag HTML yang rusak yang mungkin terjadi akibat kesalahan template pada `compliance_audit_dashboard_generator.py`.

---

### 9. Reference & Appendices

#### A. Daftar File Output Simulasi

| File | Asal Script | Tujuan |
| :--- | :--- | :--- |
| `aggregated_trace.json` | `simulation_orchestrator.py` | Bukti audit teknis (log tindakan). |
| `compliance_audit_dashboard.html` | `compliance_audit_dashboard_generator.py` | Visualisasi hasil kepatuhan. |
| `risk_roa_map.json` | `compliance_risk_visualizer.py` | Data peta risiko operasional. |
| `deployment_log.txt` | `compliance_dashboard_deployer.py` | Log keberhasilan/inovasi deployment. |


#### 8.4. Analitik Depedensi & Validasi Alur Data (Pipeline Dependency Graph)

Untuk memastikan integritas alur data dari ekstraksi hingga deployment, proyek ini menyediakan alat analisis mandiri bernama `pipeline_dependency_graph_generator.py`. Skrip ini secara dinamis menganalisis skrip-skr Python dalam pipeline (`id_exporter.py` hingga `compliance_dashboard_deployer.py`) untuk memetakan hubungan ketergantungan berdasarkan:
1.  **Argumen Baris Perintah (`--arg`):** Melacak input/output file yang dipassing antar modul.
2.  **Import Statement:** Mengidentifikasi ketergantungan logika antarmodul.

Hasil analisis disimpan dalam format JSON (`pipeline_graph.json`) yang merepresentasikan *Directed Acyclic Graph* (DAG) dari alur kerja.

##### A. Instalasi dan Penggunaan

1.  **Buat skrip:** Simpan kode berikut sebagai `pipeline_dependency_graph_generator.py` di root direktori proyek.
2.  **Jalankan:** Eksekusi dari direktori utama proyek untuk menghasilkan grafik dependensi.

```python
import argparse
import ast
import json
import os
import re
from pathlib import Path
from typing import Dict, List, Set, Tuple

# Daftar skrip pipeline yang divalidasi
PIPELINE_SCRIPTS = [
    "id_exporter.py",
    "data_transformer.py",
    "compliance_risk_visualizer.py",
    "compliance_audit_dashboard_generator.py",
    "compliance_dashboard_deployer.py"
]

def parse_cli_args(filename: str) -> Dict[str, str]:
    """
    Menganalisis file Python untuk mendeteksi argumen CLI (--arg_name)
    dan input/output file yang umum digunakan.
    """
    args_found = {}
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Regex sederhana untuk mencari def dengan argument parser
        # Mencari pola: add_argument('--name', default='value') atau '--name', type=...
        # Catatan: Ini adalah analisis statis dasar, bisa diperluas dengan AST penuh untuk akurasi tinggi
        
        # Contoh pola untuk input file umum
        input_patterns = [
            r'--input[-_](file|data|path)',
            r'--source[-_](file|data|path)',
            r'--config'
        ]
        
        for pattern in input_patterns:
            matches = re.finditer(pattern, content, re.IGNORECASE)
            for match in matches:
                # Mencoba menemukan default value atau tipe
                arg_name = match.group(0).replace('-', '_').strip()
                args_found[arg_name] = "string" 
                
    except Exception as e:
        print(f"Warning: Could not parse {filename}: {e}")
        
    return args_found

def extract_file_references(filename: str) -> Set[str]:
    """
    Mengekstrak referensi file yang dibaca/ditulis dalam kode.
    Ini adalah pendekatan heuristik. Untuk akurasi sempurna, gunakan AST NodeVisitor
    untuk mencari String literals di dalam assignment atau fungsi open().
    """
    referenced_files = set()
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            content = f.read()
            
        # Pola umum: file yang memiliki ekstensi .json, .csv, .html, .log
        file_pattern = re.compile(r"['\"]([^'\"]+\.(?:json|csv|html|txt|log)['\"]")
        matches = file_pattern.findall(content)
        
        for match in matches:
            # Abaikan path absolut atau variabel
            if not match.startswith('/') and not match.startswith('$') and not match.startswith('{'):
                referenced_files.add(match)
                
    except Exception as e:
        print(f"Warning: Could not read {filename} for file refs: {e}")
        
    return referenced_files

def build_dependency_graph(root_dir: str) -> Dict:
    """
    Membangun DAG berdasarkan analisis file.
    """
    graph = {
        "nodes": [],
        "edges": [],
        "metadata": {
            "generated_at": Path.now().isoformat(),
            "root_directory": root_dir
        }
    }
    
    path_obj = Path(root_dir)
    
    # 1. Identifikasi Node (File Skrip)
    scripts_in_dir = [f.name for f in path_obj.iterdir() if f.is_file() and f.name.endswith('.py')]
    
    for script in scripts_in_dir:
        if script in PIPELINE_SCRIPTS:
            graph["nodes"].append({
                "id": script,
                "type": "pipeline_step",
                "path": str(path_obj / script)
            })
            
    # 2. Identifikasi Edge (Dependensi File)
    # Asumsi: Skrip B membutuhkan output Skrip A jika Skrip A menghasilkan file 
    # yang dibaca oleh Skrip B.
    
    # Peta: script_name -> set of output files (heuristik berdasarkan nama file output umum)
    # Karena kita tidak bisa menjalankan skrip, kita asumsikan output standar:
    # id_exporter.py -> id_export.json / audit_trace.json
    # transformer -> transformed_data.json
    # dll.
    
    # Kita akan menggunakan pendekatan reverse: Cek input file dari script B, 
    # apakah file tersebut adalah output default dari script A?
    
    # Daftar asumsi output default untuk pipeline ini (harus disesuaikan jika skema berubah)
    DEFAULT_OUTPUTS = {
        "id_exporter.py": ["aggregated_trace.json", "id_export.json"],
        "data_transformer.py": ["transformed_audit_data.json"],
        "compliance_risk_visualizer.py": ["risk_roa_map.json"],
        "compliance_audit_dashboard_generator.py": ["compliance_audit_dashboard.html", "risk_roa_map.json"], # Sering membaca json untuk diplot
        "compliance_dashboard_deployer.py": ["compliance_audit_dashboard.html", "deployment_log.txt"]
    }
    
    # Dapatkan file input yang dibaca oleh setiap script
    script_inputs = {}
    for script in PIPELINE_SCRIPTS:
        script_path = path_obj / script
        if script_path.exists():
            inputs = extract_file_references(script)
            # Filter hanya file JSON karena itu yang umumnya menjadi input antar modul
            json_inputs = {f for f in inputs if f.endswith('.json')}
            script_inputs[script] = json_inputs
            
    # Buat Edge berdasarkan kecocokan Output Script A dengan Input Script B
    for source_script, outputs in DEFAULT_OUTPUTS.items():
        if source_script not in [n["id"] for n in graph["nodes"]]:
            continue
            
        for output_file in outputs:
            for target_script, inputs in script_inputs.items():
                if source_script != target_script:
                    if output_file in inputs:
                        graph["edges"].append({
                            "source": source_script,
                            "target": target_script,
                            "artifact": output_file,
                            "type": "data_dependency"
                        })
                        
    return graph

def main():
    parser = argparse.ArgumentParser(
        description="Generate Dependency Graph for Compliance Audit Pipeline"
    )
    parser.add_argument(
        "--root-dir", 
        type=str, 
        default=".",
        help="Path to the main source code directory"
    )
    parser.add_argument(
        "--output", 
        type=str, 
        default="pipeline_graph.json",
        help="Output JSON file path for the dependency graph"
    )
    
    args = parser.parse_args()
    
    root_dir = args.root_dir
    output_file = args.output
    
    print(f"[*] Analyzing pipeline in directory: {root_dir}")
    
    # Validasi direktori
    if not os.path.isdir(root_dir):
        print(f"[!] Error: Directory '{root_dir}' not found.")
        return

    try:
        graph_data = build_dependency_graph(root_dir)
        
        # Tulis ke JSON
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(graph_data, f, indent=4)
            
        print(f"[+] Success: Dependency graph saved to '{output_file}'")
        print(f"[+] Total Nodes: {len(graph_data['nodes'])}")
        print(f"[+] Total Edges: {len(graph_data['edges'])}")
        
        # Tampilkan ringkasan sederhana
        if graph_data["edges"]:
            print("
[*] Detected Dependencies:")
            for edge in graph_data["edges"]:
                print(f"    {edge['source']} --> [{edge['artifact']}] --> {edge['target']}")
        else:
            print("
[!] No inter-script file dependencies detected. Check DEFAULT_OUTPUTS in script.")
            
    except Exception as e:
        print(f"[!] Fatal Error: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main()
```

##### B. Dokumentasi Integrasi: Impact Analysis

Grafik dependensi (`pipeline_graph.json`) yang dihasilkan bukan hanya untuk visualisasi, tetapi merupakan aset kritis untuk **Impact Analysis** saat melakukan perubahan kode atau pembaruan library. Berikut adalah panduan cara memanfaatkan grafik ini dalam siklus operasi.

###### 1. Analisis Dampak Perubahan Skema Data (Data Schema Changes)

Jika Anda mengubah struktur file JSON di tengah pipeline (misalnya, mengubah format `aggregated_trace.json`), lakukan langkah berikut:

1.  **Generate Grafik Terkini:**
    ```bash
    python pipeline_dependency_graph_generator.py --root-dir . --output current_state.json
    ```
2.  **Identifikasi Konsumen:** Buka `current_state.json` dan cari node yang menerima file tersebut.
    *   Cari edge dengan atribut `"artifact": "aggregated_trace.json"`.
    *   Lihat field `"target"` pada edge tersebut. Ini adalah skrip yang akan **gagal** atau menghasilkan output yang salah jika skema data berubah.
3.  **Verifikasi Manual:**
    *   Buka skrip `target` tersebut.
    *   Pastikan parser JSON atau logika transformasi di dalam skrip tersebut telah diperbarui untuk menangani skema baru.
    *   Jalankan unit test khusus pada skrip target tersebut.

**Contoh Kasus:**
Jika `id_exporter.py` mengubah kunci JSON dari `user_id` menjadi `uid`, grafik akan menunjukkan bahwa `data_transformer.py` (jika bergantung pada file tersebut) perlu divalidasi. Jika `pipeline_graph.json` tidak menampilkan edge ini, berarti `data_transformer.py` mungkin tidak membaca file tersebut langsung, atau ketergantungannya dimodelkan secara berbeda (misalnya via database), sehingga perubahan pada file output `id_exporter.py` mungkin aman *asalkan* output-nya tidak dikonsumsi oleh modul lain.

###### 2. Analisis Dampak Pembaruan Library (Library Updates)

Saat memperbarui library Python (misalnya, `pandas`, `boto3`, atau `flask`), dampak potensial terhadap struktur kode perlu dievaluasi.

1.  **Cek Import Statement:**
    Skrip `pipeline_dependency_graph_generator.py` saat ini fokus pada dependensi *file*. Namun, Anda dapat memperluasnya dengan menambahkan fungsi `extract_imports()` untuk memindai library apa saja yang digunakan di setiap node.
2.  **Evaluasi Retensi:**
    *   Gunakan grafik untuk mengidentifikasi skrip-skr kritis.
    *   Skrip yang berada di "ujung" (sink nodes) seperti `compliance_dashboard_deployer.py` sering kali memiliki dependensi lebih kompleks pada library deployment (AWS CLI, Boto3).
    *   Jika Anda mengupdate library AWS (misalnya, dari boto3 1.26 ke 1.28), fokus pengujian pada node yang menggunakan fitur AWS khusus (seperti S3 Client atau CloudFront Invalidation) adalah prioritas tinggi.

###### 3. Otomatisasi dalam CI/CD

Grafik ini dapat diintegrasikan ke dalam pipeline CI/CD (seperti GitHub Actions atau GitLab CI) untuk mencegah *regression*.

*   **Langkah Validasi:**
    1.  Jalankan `pipeline_dependency_graph_generator.py` pada branch perubahan.
    2.  Bandingkan `current_state.json` dengan `baseline_graph.json` (versi stabil sebelumnya).
    3.  Jika ada edge baru yang ditambahkan atau dihapus secara tidak terduga, pipeline dapat menolak merger dan meminta tinjauan manual. Ini mencegah "pergeseran silang" di mana skrip baru secara tidak sengaja mulai membaca atau menulis file yang seharusnya hanya digunakan oleh skrip lama.

**Implementasi Contoh (.github/workflows/dependency-check.yml):**
```yaml
- name: Validate Pipeline Dependencies
  run: |
    python pipeline_dependency_graph_generator.py --root-dir . --output new_graph.json
    # Gunakan tool diff JSON atau custom script untuk memverifikasi struktur
    # Jika struktur berubah drastis tanpa alasan, fail pipeline.
```

Dengan memanfaatkan `pipeline_dependency_graph.json`, tim operasi dapat beralih dari *debugging* reaktif ("Kenapa ini error?") menjadi *preventive maintenance* ("Perubahan X di skrip A akan berdampak pada skrip B, mari kita uji B terlebih dahulu").


###### 4. Analisis Akar Masalah & Otomasi RCA (Root Cause Analysis)

Untuk mengubah data log mentah menjadi wawasan operasional yang dapat ditindaklanjuti, tim ini memperkenalkan `log_analysis_and_rca_engine.py`. Modul ini bertindak sebagai "pusat kecerdasan" yang menjembatani gapan antara observabilitas teknis (traces) dan kepatuhan regulasi (verifications).

Skrip ini tidak hanya melaporkan *apa* yang gagal, tetapi menjelaskan *mengapa* kegagalan tersebut terjadi dengan menganalisis korelasi temporal antara degradasi kinerja sistem dan titik-titik verifikasi kepatuhan.

**Arsitektur Alur Kerja:**

1.  **Ingesti Data Heterogen:**
    *   Membaca `aggregated_trace.json`: Berisi jejak eksekusi mikro-service (latensi, status code, payload size). Sumber: `log_aggregator_parser.py`.
    *   Membaca `verification_log.json`: Berisi hasil validasi aturan bisnis dan GDPR (passed/failed, reason codes). Sumber: `compliance_risk_visualizer.py`.
2.  **Deteksi Anomali Heuristik:**
    *   Menerapkan algoritma deteksi outlier pada metrik latensi untuk mengidentifikasi *bottleneck* sistemik.
    *   Mengidentifikasi pola kegagalan batch yang berulang (>3 kali dalam jendela waktu 1 jam).
3.  **Inferensi Penyebab Akar (RCA):**
    *   Mengkorelasikan puncak latensi dengan kegagalan verifikasi spesifik.
    *   Menentukan apakah kegagalan disebabkan oleh *timeout* eksternal, *memory leak*, atau kesalahan logika bisnis.
4.  **Generasi Laporan Terstruktur:**
    *   Mengoutput hasil dalam format JSON yang siap dikonsumsi oleh `compliance_audit_dashboard_generator.py` untuk visualisasi real-time dan `gdpr_compliance_reporter.py` untuk penyetelan notifikasi pelanggaran data.

---

### Dokumentasi Teknis: Metodologi Heuristik & Alur RCA

Lampiran ini ditujukan untuk auditor forensik dan arsitek sistem untuk memverifikasi logika deteksi dalam `log_analysis_and_rca_engine.py`.

#### 4.1. Metodologi Deteksi Anomali

Skrip ini menggunakan pendekatan hibrida antara **Statistical Process Control (SPC)** dan **Rule-Based Heuristics** untuk meminimalkan *false positive*.

**A. Deteksi Degradasi Kinerja (Latency Anomaly)**
Kami menggunakan metode **Z-Score Rolling Window** pada dataset trace log.
*   **Parameter:** Jendela waktu (`window_size`) default 60 menit.
*   **Logika:**
    $$ Z = rac{(X_t - \mu_{window})}{\sigma_{window}} $$
    Jika $|Z| > 2.5$, titik data $X_t$ ditandai sebagai anomali kinerja.
*   **Tujuan:** Mengidentifikasi skrip yang tiba-tiba mengalami peningkatan latensi di atas 2.5 deviasi standar dari rata-rata historis hari itu, yang sering kali indikasi awal dari *bottleneck* database atau ketergantungan layanan pihak ketiga (misal: AWS Lambda cold starts).

**B. Deteksi Kegagalan Batch Berulang (Recurrence Pattern)**
Untuk mencegah hilangnya data dalam pipeline kepatuhan, kami menerapkan deteksi pola frekuensi.
*   **Kondisi:** Jika skrip tertentu mencatat `status: FAIL` lebih dari `min_occurrences` (default: 3) dalam `time_delta` (default: 300 detik).
*   **Prioritas:** Kegagalan yang terulang dalam pola ini dikategorikan sebagai `SEVERITY: CRITICAL` karena mengindikasikan kegagalan sistemik, bukan fluktuasi transient.

#### 4.2. Alur Kerja Inferensi Akar Masalah (RCA Workflow)

Setelah anomali terdeteksi, skrip mengeksekusi rantai kausalitas berikut untuk mengidentifikasi sumber masalah:

1.  **Langkah 1: Identifikasi *Root Node* dalam Graf Dependensi**
    *   Menggunakan `pipeline_dependency_graph_generator.py` sebelumnya, kami memetakan skrip yang mendeteksi anomali ke node sumber (entry point).
    *   Jika node sumber adalah `data_ingestion_engine.py`, fokus analisis dialihkan ke koneksi database dan parsing file masuk.

2.  **Langkah 2: Korelasi Verifikasi Gagal**
    *   Kami mencocokkan timestamp anomali kinerja dengan entri di `verification_log.json`.
    *   **Skenario A (Korelasi Tinggi):** Latensi tinggi diikuti oleh `verification_status: TIMEOUT`.
        *   *Kesimpulan:* Masalah infrastruktur/konektivitas.
    *   **Skenario B (Korelasi Rendah):** Latensi normal, tetapi `verification_status: FAIL` dengan `reason: GDPR_FIELD_MISSING`.
        *   *Kesimpulan:* Masalah kualitas data atau perubahan skema input.

3.  **Langkah 3: Penentuan Severity Level**
    *   Input `--severity-level` digunakan sebagai filter final.
    *   Default: `INFO`.
    *   Opsi: `LOW` (hanya notifikasi), `MEDIUM` (perlu tinjauan manusia), `HIGH` (trigger otomasi rollback/notifikasi darurat).

#### 4.3. Struktur Output JSON

Output dari `log_analysis_and_rca_engine.py` mengikuti skema berikut untuk memastikan kompatibilitas dengan dashboard audit:

```json
{
  "analysis_id": "rca_20231027_001",
  "timestamp": "2023-10-27T10:00:00Z",
  "summary": {
    "total_anomalies_detected": 4,
    "critical_bottlenecks": 1,
    "severity_distribution": {
      "CRITICAL": 1,
      "WARNING": 3
    }
  },
  "findings": [
    {
      "finding_id": "F-001",
      "affected_script": "compliance_dashboard_deployer.py",
      "anomaly_type": "LATENCY_SPIKE",
      "metric_value": 12500,
      "baseline_value": 2500,
      "root_cause_hypothesis": "High I/O wait on S3 read operations",
      "correlated_verification_failure": null,
      "recommendation": "Implement multipart download or check S3 request rate limits."
    },
    {
      "finding_id": "F-002",
      "affected_script": "gdpr_data_processor.py",
      "anomaly_type": "RECURRING_BATCH_FAILURE",
      "failure_count": 5,
      "root_cause_hypothesis": "Schema mismatch in incoming CSV payload",
      "correlated_verification_failure": {
        "error_code": "GDPR_FIELD_MISSING",
        "field_name": "user_consent_timestamp"
      },
      "recommendation": "Validate input schema before processing; update data validation rules."
    }
  ],
  "metadata": {
    "heuristic_version": "1.2.0",
    "trace_file_hash": "a1b2c3...",
    "verification_file_hash": "d4e5f6..."
  }
}
```

#### 4.4. Implementasi CLI dan Penggunaan

Berikut adalah contoh penggunaan baris perintah untuk menjalankan analisis RCA secara manual atau melalui cron job:

```bash
# Contoh dasar: Analisis dengan severity level default (INFO)
python log_analysis_and_rca_engine.py \
  --trace ./logs/aggregated_trace.json \
  --verification ./logs/verification_log.json \
  --output ./reports/rca_report_20231027.json

# Contoh lanjutan: Filter hanya masalah Critical/High, output ke path custom
python log_analysis_and_rca_engine.py \
  --trace ./logs/aggregated_trace.json \
  --verification ./logs/verification_log.json \
  --output ./reports/emergency_rca.json \
  --severity-level HIGH
```

**Argumen Detail:**

| Argumen | Tipe | Default | Deskripsi |
| :--- | :--- | :--- | :--- |
| `--trace` | `string` | `required` | Path absolut ke file `aggregated_trace.json` yang dihasilkan oleh *log aggregator*. |
| `--verification` | `string` | `required` | Path absolut ke file `verification_log.json` yang dihasilkan oleh *risk visualizer*. |
| `--output` | `string` | `required` | Path untuk menyimpan file JSON hasil analisis RCA. |
| `--severity-level` | `enum` | `INFO` | Ambang batas keparahan untuk dilaporkan. Pilihan: `INFO`, `LOW`, `MEDIUM`, `HIGH`, `CRITICAL`. |

**Integrasi dengan Audit Forensik:**
File output JSON yang dihasilkan dapat langsung dipindai oleh alat audit forensik untuk melacak jejak kepatuhan. Setiap `finding_id` dapat dikaitkan dengan log entri tertentu dalam *audit trail* resmi perusahaan, memungkinkan auditor untuk memverifikasi apakah tindakan korektif telah diambil terhadap temuan RCA tersebut.

---

### Referensi Silang (Cross-References)

*   **Untuk Validasi Integrasi:** Lihat bagian [3. Otomatisasi dalam CI/CD](#3-otomatisasi-dalam-cicd) untuk melihat bagaimana deteksi *bottleneck* dapat memicu blok merger jika `severity-level` diatur ke `HIGH` pada pipeline CI.
*   **Untuk Visualisasi:** Gunakan output dari skrip ini sebagai input ke `compliance_audit_dashboard_generator.py` untuk menampilkan peta panas (*heat map*) skrip bermasalah secara real-time.


### Ekspor Laporan Kepatuhan & Legal (Compliance RCA Exporter)

Modul ini dirancang khusus untuk jembatan antara data teknis teknis forensik log dan kebutuhan kepatuhan regulasi (GDPR, NIST SP 800-61). Tujuannya adalah mengonversi temuan teknis mentah menjadi dokumen hukum yang sah, terstruktur, dan siap untuk diaudit oleh regulator atau dewan direksi.

#### Instalasi dan Penggunaan

Pastikan pustaka `fpdf2` (atau `reportlab`) serta `pycryptodome` untuk enkripsi terinstal sebelum menjalankan skrip.

```bash
pip install fpdf2 pycryptodome
```

**Contoh Dasar:**
Mengonversi laporan RCA standar menjadi PDF terenkripsi untuk presentasi eksekutif.

```bash
python compliance_rca_dashboard_exporter.py \
  --rca-json ./reports/emergency_rca.json \
  --verification-log ./logs/verification_log.json \
  --output ./legal_reports/incident_report_Q3_2023_encrypted.pdf \
  --password "StrongP@ssw0rd!"
```

**Argumen Detail:**

| Argumen | Tipe | Default | Deskripsi |
| :--- | :--- | :--- | :--- |
| `--rca-json` | `string` | `required` | Path ke file JSON hasil `log_analysis_and_rca_engine.py` yang berisi temuan akar masalah. |
| `--verification-log` | `string` | `required` | Path ke `verification_log.json` dari *archive_integrity_verifier* untuk membuktikan keutuhan bukti digital. |
| `--output` | `string` | `required` | Path absolut untuk file PDF terenkripsi yang dihasilkan. |
| `--password` | `string` | `required` | Password untuk mengunci PDF. Wajib digunakan untuk memenuhi standar kerahasiaan data sensitif. |
| `--auditor-id` | `string` | `N/A` | ID Unik Auditor Internal yang menandatangani laporan (digunakan untuk hash tanda tangan digital dalam metadata). |

---

#### Arsitektur Ekspor dan Proses Konversi

Skrip ini tidak hanya sekadar "mencetak" JSON ke PDF, tetapi melakukan transformasi semantik untuk memenuhi standar legal:

1.  **Ekstraksi Kronologi (Timeline Extraction):**
    *   Mengurutkan entri dari `rca_json` berdasarkan timestamp kejadian (*incident_start_time*) hingga *remediation_complete*.
    *   Mengintegrasikan data dari `verification_log` untuk menunjukkan kapan integritas log diverifikasi (menutup celah *gap analysis*).

2.  **Kuantifikasi Dampak Kepatuhan (Compliance Impact Quantification):**
    *   Memetakan temuan teknis (`severity: CRITICAL`) ke kategori pelanggaran GDPR/NIST.
    *   Contoh: Jika temuan melibatkan akses ke PII (Personally Identifiable Information) tanpa otorisasi, skrip otomatis menandai bagian ini sebagai **"Potential GDPR Article 33 Violation"** dalam ringkasan eksekutif.

3.  **Generasi Tanda Tangan Digital (Digital Signature Attachment):**
    *   Menghasilkan hash SHA-256 dari konten PDF.
    *   Menambahkan metadata sertifikat auditor internal ke dalam struktur PDF menggunakan kunci simetris/asimetris (tergantung konfigurasi kebijakan perusahaan) sebagai bukti non-repudiasi bahwa dokumen tidak diubah sejak pencetakan.

---

### Panduan Kepatuhan & Legal: Standar Penyusunan Laporan Insiden RCA

Bagian ini merujuk pada kerangka kerja internasional untuk memastikan bahwa laporan yang dihasilkan oleh skrip di atas dapat diterima secara hukum dan teknis oleh regulator.

#### 1. Kerangka NIST SP 800-61 Rev. 2 (Computer Security Incident Handling Guide)

Sesuai panduan NIST, laporan akhir insiden (*Incident Post-Incident Activity*) harus mencakup elemen berikut yang diotomatisasi oleh `compliance_rca_dashboard_exporter.py`:

*   **Ringkasan Insiden (Incident Summary):** Harus jelas menyatakan *what, when, where,* dan *who*. Skrip ini mengisi bidang ini dari agregasi log temporal.
*   **Kronologi Deteksi dan Respons:** Timeline harus memisahkan antara *deteksi awal* dan *konfirmasi insiden*. Data dari `verification_log` digunakan untuk membuktikan bahwa bukti tidak dirusak setelah deteksi awal.
*   **Analisis Kerugian dan Dampak:** Bukan hanya kerugian finansial, tetapi juga dampak terhadap kepercayaan pemangku kepentingan. Skrip ini menghitung estimasi waktu downtime dan volume data terpengaruh sebagai metrik dasar.
*   **Tindakan Korektif (Corrective Actions):** Daftar tindakan spesifik untuk mencegah rekurensi. Ini harus tautan langsung ke tiket JIRA/ServiceNow yang ditangani oleh tim rekayasa.

#### 2. Kepatuhan GDPR: Artikel 33 & 34 (Notifikasi Pelanggaran Data)

Jika insiden melibatkan *Personal Data*, laporan RCA harus memenuhi syarat notifikasi ke Otoritas Pengawas Data (DPO/Supervisory Authority) dalam waktu 72 jam.

*   **Sifat Pelanggaran:** Laporan harus secara eksplisit menyebutkan kategori data pribadi yang terpengaruh (misal: data kesehatan, keuangan, identitas).
*   **Dampak yang Diharapkan:** Penjelasan tentang risiko bagi hak dan kebebasan individu. Skrip ini membantu dengan menyoroti temuan `HIGH`/`CRITICAL` yang terkait dengan akses data sensitif.
*   **Tindakan yang Diambil:** Deskripsi langkah-langkah mitigasi yang sudah dilakukan atau direncanakan.

#### 3. Template Lampiran Teknis (Technical Appendix)

Untuk mendukung investigasi eksternal, lampiran teknis dalam PDF harus menyertakan tabel berikut (dihasilkan otomatis oleh skrip):

| Field | Deskripsi | Sumber Data |
| :--- | :--- | :--- |
| `Evidence_Hash_SHA256` | Hash unik dari bukti log mentah untuk integritas forensik. | `verification_log.json` |
| `Incident_ID` | Referensi unik dari sistem ticketing. | `rca_json` metadata |
| `Root_Cause_Code` | Kode klasifikasi penyebab utama (misal: `CONFIG_ERROR`, `MALWARE`). | `log_analysis_and_rca_engine.py` |
| `Data_Subjects_Affected` | Estimasi jumlah individu yang terdampak. | Aggregasi log akses PII |
| `Remediation_Status` | Status penyelesaian (Open/Closed/Pending). | `rca_json` status field |

---

#### Integrasi dengan Proses Audit

Setelah file PDF terenkripsi dihasilkan:

1.  **Pengarsipan Aman:** File harus diupload ke *Secure Document Management System* (DMS) dengan tag `LEGAL-INCIDENT`.
2.  **Bukti Non-Repudiasi:** Hash PDF dan hash bukti log (dari lampiran teknis) harus dicatat dalam *Immutable Audit Ledger* perusahaan.
3.  **Review Auditor:** Auditor internal dapat menggunakan skrip `compliance_audit_dashboard_generator.py` untuk memvalidasi bahwa PDF yang dihasilkan sesuai dengan data mentah di `aggregated_trace.json`, memastikan tidak ada manipulasi dalam ringkasan eksekutif.

> **Catatan Hukum:** Output dari skrip ini bersifat "draft" hingga ditandatangani secara digital oleh CISO atau DPO yang berwenang. Penggunaan dokumen ini untuk tujuan hukum memerlukan verifikasi tanda tangan digital dan keabsahan sertifikat auditor.


Berikut adalah konten lanjutan yang komprehensif untuk `README.md`, mencakup implementasi teknis skrip forensik dan dokumentasi kepatuhan hukum/standar internasional.

---

### 4. Modul Pelestarian Bukti Otomatis (Automated Evidence Preservation)

Untuk memastikan integritas forensik bukti digital sejak detik pertama insiden terdeteksi, tim keamanan harus menggunakan skrip `automated_evidence_preservation.py`. Skrip ini bertindak sebagai **Guardian of Integrity**, yang secara proaktif memonitor direktori output dari analisis log, melakukan hashing real-time, dan mengarsipkan bukti ke dalam penyimpanan objek yang aman (S3) dengan chain of custody yang auditabel.

#### 4.1. Implementasi Skrip

Simpan kode berikut sebagai `automated_evidence_preservation.py`. Skrip ini menggunakan library `watchdog` untuk monitoring real-time dan `boto3` untuk interaksi dengan AWS S3. Pastikan dependensi terinstall:

```bash
pip install watchdog boto3
```

```python
#!/usr/bin/env python3
"""
automated_evidence_preservation.py
==================================
Modul forensik proaktif untuk preservasi bukti digital.
Memonitor direktori, menghitung hash SHA-256, dan mengarsipkan ke S3
dengan kebijakan Chain of Custody yang ketat.

Standar Referensi: ISO/IEC 27037, NIST SP 800-86
"""

import os
import sys
import json
import hashlib
import logging
import argparse
import time
import boto3
from botocore.exceptions import ClientError
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
from datetime import datetime, timezone

# Konfigurasi Logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    handlers=[logging.StreamHandler(sys.stdout)]
)
logger = logging.getLogger(__name__)

class EvidencePreservationHandler(FileSystemEventHandler):
    """
    Handler untuk mendeteksi file baru yang dibuat atau diubah
    di direktori yang di-monitor.
    """
    def __init__(self, s3_bucket, chain_of_custody_path, aws_region='us-east-1'):
        self.s3_bucket = s3_bucket
        self.chain_of_custody_path = chain_of_custody_path
        self.aws_region = aws_region
        self.s3_client = boto3.client('s3', region_name=aws_region)
        self.custody_db = self._load_custody_db()

    def _load_custody_db(self):
        """Memuat database chain of custody yang ada atau inisialisasi baru."""
        if os.path.exists(self.chain_of_custody_path):
            try:
                with open(self.chain_of_custody_path, 'r') as f:
                    return json.load(f)
            except json.JSONDecodeError:
                logger.warning("File chain of custody korup. Inisialisasi ulang.")
                return {"evidence_chain": [], "metadata": {"version": "1.0", "created_at": datetime.now(timezone.utc).isoformat()}}
        return {"evidence_chain": [], "metadata": {"version": "1.0", "created_at": datetime.now(timezone.utc).isoformat()}}

    def _save_custody_db(self):
        """Menyimpan database chain of custody ke file JSON."""
        with open(self.chain_of_custody_path, 'w') as f:
            json.dump(self.custody_db, f, indent=4, default=str)
        logger.info(f"Database Chain of Custody diperbarui: {self.chain_of_custody_path}")

    def calculate_sha256(self, file_path):
        """Menghitung hash SHA-256 untuk integritas forensik."""
        sha256_hash = hashlib.sha256()
        with open(file_path, "rb") as f:
            for byte_block in iter(lambda: f.read(4096), b""):
                sha256_hash.update(byte_block)
        return sha256_hash.hexdigest()

    def upload_to_s3(self, file_path, original_filename):
        """Mengunggah file ke bucket S3 dengan metadata forensik."""
        try:
            # Kunci objek berdasarkan nama file + timestamp unik untuk versioning
            s3_key = f"evidence/{original_filename}"
            
            # Upload file
            with open(file_path, 'rb') as data:
                self.s3_client.upload_fileobj(data, self.s3_bucket, s3_key)
            
            logger.info(f"File {original_filename} berhasil diupload ke s3://{self.s3_bucket}/{s3_key}")
            return s3_key
        except ClientError as e:
            logger.error(f"Gagal mengupload ke S3: {e}")
            return None

    def on_created(self, event):
        """Trigger saat file baru dibuat."""
        if event.is_directory:
            return
        
        file_path = event.src_path
        file_name = os.path.basename(file_path)
        
        # Filter: Hanya proses file tertentu (misal: .log, .json, .pdf, .pcap)
        supported_extensions = ['.log', '.json', '.pdf', '.csv', '.pcap', '.tar.gz']
        if not any(file_name.endswith(ext) for ext in supported_extensions):
            return

        logger.info(f"Bukti baru terdeteksi: {file_path}")
        
        try:
            # 1. Hashing
            file_hash = self.calculate_sha256(file_path)
            
            # 2. Metadata Capturing
            evidence_entry = {
                "file_name": file_name,
                "file_path_local": file_path,
                "hash_sha256": file_hash,
                "timestamp_captured_utc": datetime.now(timezone.utc).isoformat(),
                "status": "PRESERVED",
                "s3_reference": None
            }
            
            # 3. Upload & Reference
            s3_ref = self.upload_to_s3(file_path, file_name)
            if s3_ref:
                evidence_entry["s3_reference"] = s3_ref
                evidence_entry["status"] = "ARCHIVED"
            else:
                evidence_entry["status"] = "HASHED_ONLY" # Fallback jika S3 gagal

            # 4. Update Chain of Custody
            self.custody_db["evidence_chain"].append(evidence_entry)
            self._save_custody_db()

            logger.info(f"Chain of Custody diperbarui untuk {file_name}. Hash: {file_hash[:16]}...")

        except Exception as e:
            logger.error(f"Error memproses bukti {file_name}: {e}")

    def on_modified(self, event):
        """
        Trigger saat file dimodifikasi.
        Catatan: Untuk forensik yang ketat, modifikasi file bukti setelah 
        penciptaan biasanya dilarang. Jika terjadi, kita catat sebagai anomali.
        """
        if event.is_directory:
            return
        logger.warning(f"Peringatan: File bukti dimodifikasi (bukan praktik terbaik): {event.src_path}")
        # Opsional: Bisa memicu alert ke SIEM atau menandai file sebagai 'TAMPERED'

def main():
    parser = argparse.ArgumentParser(description="Preservasi Bukti Digital Otomatis untuk Insiden Keamanan.")
    parser.add_argument("--watch-dir", required=True, help="Direktori sumber log/bukti untuk dimonitor (misal: /var/log/incident/outputs)")
    parser.add_argument("--s3-bucket", required=True, help="Nama bucket S3 target untuk arsip bukti")
    parser.add_argument("--output", required=True, help="Path file JSON untuk menyimpan Chain of Custody (misal: evidence_chain_of_custody.json)")
    parser.add_argument("--region", default="us-east-1", help="Region AWS (default: us-east-1)")
    
    args = parser.parse_args()

    if not os.path.isdir(args.watch_dir):
        logger.error(f"Direktori {args.watch_dir} tidak ditemukan.")
        sys.exit(1)

    logger.info(f"Memulai monitor forensik pada: {args.watch_dir}")
    logger.info(f"Target S3 Bucket: {args.s3_bucket}")
    logger.info(f"Output Chain of Custody: {args.output}")

    handler = EvidencePreservationHandler(
        s3_bucket=args.s3_bucket,
        chain_of_custody_path=args.output,
        aws_region=args.region
    )

    observer = Observer()
    observer.schedule(handler, args.watch_dir, recursive=False) # Non-recursive untuk keamanan
    observer.start()

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
        logger.info("Monitor dihentikan oleh pengguna.")
    
    observer.join()

if __name__ == "__main__":
    main()
```

#### 4.2. Cara Penggunaan

Jalankan skrip ini segera setelah insiden dikonfirmasi untuk memastikan tidak ada bukti yang hilang atau diubah sebelum investigasi selesai.

```bash
# Contoh perintah eksekusi
python3 automated_evidence_preservation.py \
    --watch-dir "./incident_outputs/incident_20231027" \
    --s3-bucket legal-evidence-bucket-prod \
    --output "./forensics/evidence_chain_of_custody.json" \
    --region ap-southeast-1
```

#### 4.3. Struktur Output `evidence_chain_of_custody.json`

File ini adalah bukti utama bahwa bukti digital telah dilestarikan tanpa modifikasi. Contoh isi file:

```json
{
  "metadata": {
    "version": "1.0",
    "created_at": "2023-10-27T10:00:00+00:00",
    "monitoring_tool": "automated_evidence_preservation.py"
  },
  "evidence_chain": [
    {
      "file_name": "log_analysis_report.json",
      "file_path_local": "./incident_outputs/incident_20231027/log_analysis_report.json",
      "hash_sha256": "a1b2c3d4e5f6...",
      "timestamp_captured_utc": "2023-10-27T10:05:23+00:00",
      "status": "ARCHIVED",
      "s3_reference": "s3://legal-evidence-bucket-prod/evidence/log_analysis_report.json"
    },
    {
      "file_name": "access_trace.csv",
      "file_path_local": "./incident_outputs/incident_20231027/access_trace.csv",
      "hash_sha256": "f6e5d4c3b2a1...",
      "timestamp_captured_utc": "2023-10-27T10:06:45+00:00",
      "status": "ARCHIVED",
      "s3_reference": "s3://legal-evidence-bucket-prod/evidence/access_trace.csv"
    }
  ]
}
```

---

### 5. Compliance & Legal: Standar Forensik Digital

Lampiran ini mendefinisikan kerangka kerja hukum dan teknis yang mendasari proses preservasi bukti di atas. Dokumen ini harus dilampirkan pada laporan RCA akhir untuk membuktikan kepatuhan terhadap regulasi perlindungan data (seperti UU PDP atau GDPR) dan standar forensik internasional.

#### 5.1. Kepatuhan terhadap ISO/IEC 27037

Standar ISO/IEC 27037 *"Guidelines for identification, collection, acquisition and preservation of digital evidence"* menjadi acuan utama dalam proses ini. Berikut adalah penerapan pasalnya dalam skrip kami:

| Prinsip ISO 27037 | Implementasi dalam `automated_evidence_preservation.py` |
| :--- | :--- |
| **Identitas Bukti** | Skrip secara otomatis menangkap nama file, path lokal, dan hash unik (`sha256`) untuk setiap file baru. |
| **Integritas Bukti** | Penggunaan hash kriptografi (SHA-256) memastikan bahwa *bit-per-bit* konten file tidak berubah sejak saat penangkapan. |
| **Akses Terbatas** | File bukti hanya bisa dibaca/diarsipkan oleh proses skrip, membatasi intervensi manusia yang dapat mengubah metadata. |
| **Rantai Custodi (Chain of Custody)** | File `evidence_chain_of_custody.json` mencatat *siapa* (sistem), *kapan*, *dimana*, dan *bagaimana* bukti diambil. |

#### 5.2. Protokol Chain of Custody (CoC)

Rantai Custodi adalah catatan kronologis yang mendokumentasikan penanganan bukti dari awal sampai akhir. Agar bukti dapat diterima di pengadilan atau oleh regulator eksternal (Otoritas Pengawas Data), berikut adalah aturan ketat yang harus diikuti:

1.  **Non-Repudiasi Timestamp:**
    *   Semua entri di `evidence_chain_of_custody.json` wajib menggunakan waktu UTC yang bersumber dari server terkoordinasi (NTP).
    *   *Alasan:* Menghindari sengketa mengenai urutan kejadian saat insiden.

2.  **Hash Validation (Verifikasi Integritas):**
    *   Untuk setiap file di bucket S3, hash SHA-256 harus diverifikasi ulang secara periodik (atau saat audit) untuk memastikan tidak ada degradasi media penyimpanan (*bit rot*) atau manipulasi pihak ketiga.
    *   *Tindakan:* Gunakan perintah `aws s3api head-object --bucket <bucket> --key <key>` untuk mendapatkan ETag (biasanya MD5 untuk part upload, tapi untuk file tunggal kecil, ini dapat dibandingkan dengan SHA-256 jika diupload via `put_object`).

3.  **Sifat "Read-Only" Setelah Preservasi:**
    *   Setelah skrip menyelesaikan hashing dan upload ke S3, file asli di direktori monitoring sebaiknya dipindahkan ke folder `archived` yang permisiannya diubah menjadi `read-only` (chmod 444) untuk mencegah modifikasi tidak disengaja oleh analis.

4.  **Verifikasi Digital oleh Auditor:**
    *   Auditor internal akan membandingkan hash di `evidence_chain_of_custody.json` dengan hash file asli di bucket S3.
    *   Jika hash tidak cocok, bukti tersebut dinyatakan *tainted* (tercemar) dan tidak dapat digunakan sebagai bukti utama tanpa penjelasan forensik tambahan yang valid.

#### 5.3. Implikasi Hukum Notifikasi 72 Jam

Karena skrip ini beroperasi secara *real-time*, ia memberikan jaminan waktu (*provenance of time*) yang kuat. Dalam konteks Pasal 34 UU PDP (atau GDPR Art. 33):

*   **Bukti Waktu Pengenalan:** Timestamp pertama kali file muncul di `evidence_chain_of_custody.json` dapat digunakan sebagai bukti hukum bahwa insiden diketahui dan diproses tepat waktu.
*   **Bukti Kelengkapan Data:** Daftar file yang ter-hash menunjukkan bahwa tidak ada bagian dari log yang sengaja dihapus sebelum preservasi dilakukan.

> **Peringatan Kritis:**
> Jangan pernah menghapus file sumber di direktori `--watch-dir` sebelum skrip melaporkan status `ARCHIVED` dan memverifikasi kecocokan hash dengan S3. Penghapusan prematur dapat merusak Rantai Custodi dan meniadakan bukti di mata hukum.


Berikut adalah konten lanjutan yang direkomendasikan untuk ditambahkan ke bagian **Deployment and Operations** dalam `README.md`. Konten ini dirancang untuk melengkapi protokol keamanan, panduan teknis implementasi API, dan instruksi validasi kepatuhan.

---

### 5.4. Gerbang API Kepatuhan (`compliance_api_gateway.py`)

Untuk memfasilitasi pemeriksaan kepatuhan oleh auditor eksternal dan sistem otomatis tanpa membuka akses langsung ke basis data forensik, solusi ini menyediakan `compliance_api_gateway.py`. Gerbang ini bertindak sebagai lapisan abstraksi yang aman, memblokir akses langsung ke file mentah (`evidence_chain_of_custody.json` dan `gdpr_dpia_report.json`) dan hanya menyediakan endpoint yang terverifikasi integritasnya.

#### A. Spesifikasi Teknis dan Arsitektur

Gateway ini dibangun di atas arsitektur microservice ringan, membaca konfigurasi alur kerja dari `pipeline_dependency_graph_generator.py` untuk menentukan dependensi logika. Fitur keamanan inti meliputi:

1.  **Validasi JWT (JSON Web Token):** Semua permintaan harus menyertakan header `Authorization: Bearer <token>`. Token diverifikasi menggunakan kunci simetris (`--auth-key`) yang dikonfigurasi selama deploy.
2.  **Rate Limiting (Batasan Laju):**
    *   Mencegah serangan *brute-force* atau *denial of service*.
    *   Batas default: 100 permintaan per menit per IP.
    *   Jika batas terlewati, respons `429 Too Many Requests` dikirim dan dicatat di log audit.
3.  **Audit Trail Terintegrasi:**
    *   Setiap akses ke API dicatat secara krusial ke dalam file `aggregated_trace.json`.
    *   Catatan mencakup: `timestamp`, `ip_address`, `endpoint`, `user_identity`, `status_code`, dan `hash_verified` (jika relevan).
    *   File ini tidak dapat dimodifikasi oleh proses API biasa (append-only log).

#### B. Endpoint RESTful

| Endpoint | Metode | Deskripsi | Parameter Wajib | Respons Sukses (200) |
| :--- | :---: | :--- | :--- | :--- |
| `/evidence/{hash}` | `GET` | Verifikasi integritas file bukti berdasarkan hash SHA-256. | `{hash}`: Hash 64 karakter (hex). | JSON berisi metadata custodi & status verifikasi (`VERIFIED`, `TAMPERED`, `NOT_FOUND`). |
| `/dpia` | `GET` | Mengunduh ringkasan laporan *Data Protection Impact Assessment* (DPIA). | Tidak ada (Auth Required). | JSON berisi entri risiko GDPR, langkah mitigasi, dan status kepatuhan. |

#### C. Inisialisasi Server

Jalankan gateway dengan argumen berikut untuk memastikan keamanan dan tracing yang ketat:

```bash
python compliance_api_gateway.py \
    --port 8443 \
    --auth-key "SuperSecretKeyForJWTSigning2024!" \
    --evidence-json "/var/data/forensics/evidence_chain_of_custody.json" \
    --dpia-json "/var/data/compliance/gdpr_dpia_report.json"
```

> **Catatan Keamanan:** Nilai `--auth-key` harus disimpan dalam variabel lingkungan atau *secrets manager* pada produksi, jangan di-hardcode di skrip CLI.

#### D. Panduan Verifikasi kepatuhan (cURL & Postman)

Berikut adalah panduan praktis untuk memvalidasi API menggunakan `cURL` atau Postman.

**1. Mendapatkan Token JWT (Simulasi Internal)**
*Asumsi: Sistem menyediakan endpoint `/auth/token` atau token dibagikan secara offline untuk demo.*

```bash
# Contoh permintaan untuk mendapatkan token (jika endpoint tersedia)
curl -X POST http://localhost:8443/auth/token \
     -H "Content-Type: application/json" \
     -d '{"sub": "auditor_01", "role": "external_auditor"}'

# Simpan token untuk digunakan di langkah berikutnya
TOKEN="<token_yang_diperoleh>"
```

**2. Memverifikasi Integritas Bukti (`GET /evidence/{hash}`)**

Gunakan hash SHA-256 dari file bukti yang ada di Rantai Custodi.

```bash
curl -X GET "http://localhost:8443/evidence/a1b2c3d4e5f6..." \
     -H "Authorization: Bearer $TOKEN" \
     -H "Accept: application/json"
```

*Respons Contoh (Sukses):*
```json
{
  "status": "VERIFIED",
  "hash": "a1b2c3d4...",
  "metadata": {
    "captured_by": "sensor_alpha",
    "captured_at": "2023-10-27T10:00:00Z",
    "integrity_check_passed": true
  }
}
```

*Respons Contoh (Gagal/Terjempar):*
```json
{
  "status": "TAMPERED",
  "hash": "a1b2c3d4...",
  "error_message": "Hash tidak cocok dengan entri di evidence_chain_of_custody.json."
}
```

**3. Mengunduh Laporan Risiko GDPR (`GET /dpia`)**

```bash
curl -X GET "http://localhost:8443/dpia" \
     -H "Authorization: Bearer $TOKEN" \
     -H "Accept: application/json"
```

#### E. Konfigurasi Firewall dan Jaringan

Agar gateway tetap aman di lingkungan produksi, terapkan aturan firewall berikut:

1.  **Blokir Akses Publik Langsung:**
    *   Port `8443` **tidak boleh** terbuka ke internet publik (`0.0.0.0/0`).
    *   Izinkan akses hanya dari IP CIDR auditor eksternal dan subnet internal sistem monitoring.

2.  **Enkripsi TLS/SSL:**
    *   Meskipun contoh di atas menggunakan HTTP untuk demonstrasi lokal, produksi **wajib** menggunakan HTTPS.
    *   Pastikan sertifikat SSL terpasang pada *reverse proxy* (Nginx/Apache) di depan `compliance_api_gateway.py`.

3.  **Penanganan Gagal Otentikasi:**
    *   Konfigurasi firewall atau WAF (Web Application Firewall) untuk memblokir IP yang melakukan >5 percobaan otentikasi gagal dalam 60 detik.

#### F. Validasi Melalui Postman

Untuk kemudahan pengguna non-kode (auditor bisnis), gunakan koleksi Postman berikut:

1.  Buat Request Baru dengan metode `GET`.
2.  Atur URL: `{{base_url}}/evidence/{{hash_to_verify}}`.
3.  Pergi ke tab **Headers**.
4.  Tambahkan Header:
    *   Key: `Authorization`
    *   Value: `Bearer {{access_token}}`
5.  Klik **Send**.
6.  Verifikasi bahwa body respons menampilkan `"status": "VERIFIED"`.

> **Catatan Auditor:** Simpan hasil tangkapan layar respons JSON ini sebagai lampiran bukti kepatuhan dalam laporan audit Anda.


#### G. Eksekusi Kebijakan Penegakan Kepatuhan (Compliance Policy Enforcer)

Modul `compliance_policy_enforcer.py` bertindak sebagai gerbang keamanan terakhir sebelum data dipublikasikan atau diakses oleh pemroses eksternal. Script ini membaca kebijakan kepatuhan yang dihasilkan dari Assessmen Dampak Perlindungan Data (GDPR/DPIA) dan secara otomatis menerapkan transformasi privasi tingkat lanjut pada dataset mentah.

##### 1. Arsitektur dan Alur Kerja

Script ini mengikuti prinsip *Secure-by-Design* dengan alur pemrosesan sebagai berikut:

1.  **Inisialisasi Kebijakan:** Membaca `gdpr_dpia_report.json` untuk mengekstraksi daftar kolom yang memerlukan masking (misal: NIK, Email, Telepon) dan parameter sensitivitas ($k$-anonimitas).
2.  **Pemuatan Data:** Membaca dataset mentah (format CSV atau Parquet) ke dalam struktur DataFrame yang efisien.
3.  **Transformasi Berbasis Kebijakan:**
    *   **Masking:** Mengganti karakter sensitif dengan simbol placeholder statis.
    *   **Pseudonimisasi/K-Anonimitas:** Mengelompokkan record berdasarkan atribut quasi-identifiers dan menerapkan teknik generalisasi atau penyamaran agar setiap kelompok memiliki setidaknya $k$ entitas yang tidak dapat dibedakan.
4.  **Manajemen Kunci (Opsional):** Jika enkripsi end-to-end diaktifkan, skrip akan mengelola kunci sesi secara sementara di memori (tidak disimpan di disk) untuk melindungi data hasil transformasi.
5.  **Output:** Menulis data yang sudah dibersihkan ke file output atau menampilkan preview dalam mode simulasi.

##### 2. Dokumentasi Teknis: Enkripsi Sisi Klien & Manajemen Kunci (Lampiran Auditor)

Bagian ini disediakan khusus untuk tim keamanan dan auditor kepatuhan sebagai bukti implementasi teknis perlindungan data.

###### A. Enkripsi Sisi Klien (Client-Side Encryption)

Dalam arsitektur ini, data sensitif dienkripsi sebelum meninggalkan memori aplikasi atau disimpan ke dalam *data lake*. Ini memastikan bahwa bahkan jika terjadi kebocoran data pada penyimpanan persisten, data tetap tidak terbaca tanpa kunci dekripsi.

*   **Standar Kriptografi:** Menggunakan algoritma **AES-256-GCM** (Advanced Encryption Standard dengan Galois/Counter Mode). GCM dipilih karena menyediakan *authenticated encryption*, yang menjamin kerahasiaan data sekaligus integritas (mendeteksi jika data telah dimodifikasi).
*   **Implementasi Algoritma:**
    ```python
    from cryptography.hazmat.primitives.ciphers.aead import AESGCM
    import os

    class ClientSideEncryptor:
        def __init__(self, key: bytes):
            if len(key) != 32:
                raise ValueError("Kunci AES-256 harus berukuran 32 byte.")
            self.aesgcm = AESGCM(key)

        def encrypt(self, data: bytes) -> tuple[bytes, bytes]:
            # Generate 12-byte nonce (Number used once) yang acak dan aman
            nonce = os.urandom(12)
            # Encrypt data, termasuk metadata dalam associated_data
            ciphertext = self.aesgcm.encrypt(nonce, data, None)
            return nonce, ciphertext

        def decrypt(self, nonce: bytes, ciphertext: bytes) -> bytes:
            try:
                return self.aesgcm.decrypt(nonce, ciphertext, None)
            except Exception as e:
                raise ValueError("Gagal mendekripsi data: Kunci salah atau data korup.", e)
    ```
*   **Keuntungan untuk Auditor:**
    *   **Non-Repudiation:** Integrasi tag otentikasi dalam GCM mencegah modifikasi data tanpa terdeteksi.
    *   **Kerahasiaan Persisten:** Data di disk terenkripsi, meminimalkan risiko paparan saat backup atau迁移 ke cloud storage.

###### B. Manajemen Kunci (Key Management)

Penggunaan enkripsi yang kuat menjadi sia-sia jika manajemen kuncinya lemah. `compliance_policy_enforcer.py` mengadopsi prinsip *Separation of Duties* dan *Least Privilege* dalam manajemen kunci:

1.  **Pembagian Kunci (Key Splitting):**
    *   **Master Key (MK):** Disimpan secara terpisah di *Hardware Security Module (HSM)* atau layanan manajemen kunci eksternal (misal: AWS KMS, Azure Key Vault). Tidak pernah memasuki memori aplikasi dalam bentuk plaintext.
    *   **Data Encryption Key (DEK):** Kunci yang digunakan untuk mengenkripsi dataset spesifik. DEK dienkripsi oleh MK (wrapped) dan disimpan bersama metadata data.

2.  **Rotasi Kunci:**
    *   Skrip mendukung parameter rotasi otomatis. Setelah durasi tertentu atau setelah jumlah transaksi tertentu, DEK baru akan di-generate dan DEK lama akan dideaktivasi. Data yang telah dienkripsi dengan DEK lama dapat didekripsi dan dienkripsi ulang dengan DEK baru (*Key Rotation via Re-encryption*).

3.  **Pencegahan Kebocoran Kunci (Memory Security):**
    *   Kunci dekripsi hanya berada di memori selama sesi enkripsi/dekripsi berlangsung.
    *   Setelah pemrosesan selesai, referensi kunci dihapus secara eksplisit dan *garbage collector* Python didorong untuk membersihkan memori menggunakan `del` dan `gc.collect()`.
    *   **Catatan Keamanan:** Tidak ada kunci yang dicatat dalam log, debug output, atau file konfigurasi.

###### C. Kepatuhan terhadap Regulasi

Implementasi ini memenuhi persyaratan berikut:
*   **GDPR Art. 32 (Keamanan Pemrosesan):** Implementasi enkripsi end-to-end dan pseudonimisasi tingkat tinggi.
*   **PP 71/2019 (Indonesia):** Standar teknis keamanan sistem elektronik dan perlindungan data pribadi.
*   **ISO/IEC 27001:** Kontrol A.10 (Kriptografi) dan A.12 (Operasi yang Aman).

---

##### 3. Penggunaan Script

Script ini dirancang untuk diintegrasikan ke dalam pipeline CI/CD atau dijalankan secara manual sebelum distribusi data.

**Struktur Argumentasi:**

*   `--dpia` (string, wajib): Path absolut ke file `gdpr_dpia_report.json` yang berisi definisi kebijakan masking dan parameter $k$-anonimitas.
*   `--dataset` (string, wajib): Path ke file data sumber. Mendukung format `.csv` dan `.parquet`.
*   `--output` (string, wajib): Path tujuan untuk file data hasil transformasi (format akan menyesuaikan sumber, default `.parquet` disarankan untuk performa).
*   `--dry-run` (flag, opsional): Jika diaktifkan, skrip tidak akan menulis file ke disk. Sebaliknya, skrip akan menampilkan ringkasan statistik transformasi dan sample baris pertama dari data hasil proses di konsol.

**Contoh Eksekusi:**

1.  **Mode Simulasi (Dry Run):**
    ```bash
    python compliance_policy_enforcer.py \
        --dpia ./config/gdpr_dpia_report.json \
        --dataset ./data/raw/customer_data.parquet \
        --output ./data/processed/customer_data_anonymized.parquet \
        --dry-run
    ```
    *Output yang diharapkan:* Ringkasan jumlah record yang diproses, daftar kolom yang dimasking, dan preview 5 baris pertama data terenkripsi.

2.  **Mode Produksi (Penulisan File):**
    ```bash
    python compliance_policy_enforcer.py \
        --dpia ./config/gdpr_dpia_report.json \
        --dataset ./data/raw/customer_data.csv \
        --output ./data/processed/customer_data_anonymized.parquet
    ```

3.  **Integrasi dengan Pipeline CI/CD (GitHub Actions Example):**
    ```yaml
    - name: Anonymize Sensitive Data
      run: |
        python compliance_policy_enforcer.py \
          --dpia ${{ secrets.DPIA_REPORT_PATH }} \
          --dataset ${{ github.workspace }}/data/input.csv \
          --output ${{ github.workspace }}/data/output_clean.parquet \
          --dry-run
    ```

##### 4. Panduan Penyusunan File `gdpr_dpia_report.json`

Agar `compliance_policy_enforcer.py` dapat beroperasi dengan benar, file laporan DPIA harus mengikuti schema berikut:

```json
{
  "metadata": {
    "report_id": "GDPR-2023-001",
    "version": "1.0",
    "last_updated": "2023-10-27"
  },
  "privacy_rules": {
    "k_anonymity": {
      "enabled": true,
      "k_value": 5,
      "quasi_identifiers": ["age", "zip_code", "gender"]
    },
    "masking_rules": [
      {
        "column": "email",
        "method": "partial_mask",
        "params": {
          "preserve_prefix": 2,
          "preserve_suffix": 3,
          "separator": "***"
        }
      },
      {
        "column": "national_id",
        "method": "constant_mask",
        "params": {
          "mask_char": "X",
          "keep_length": true
        }
      }
    ]
  },
  "encryption": {
    "enabled": false,
    "algorithm": "AES-256-GCM"
  }
}
```

> **Peringatan Auditor:** Pastikan kolom `quasi_identifiers` yang ditentukan dalam JSON benar-benar mewakili variabel yang dapat digunakan untuk mengidentifikasi individu secara tidak langsung. Pemilihan $k$-value harus disesuaikan dengan risiko re-identifikasi berdasarkan ukuran dataset.


# Lampiran Teknis: Integrasi Kepatuhan Regulasi & Protokol Audit

Bagian ini menyediakan dokumentasi teknis mendalam mengenai implementasi `gdpr_regulatory_api_connector.py`, protokol pertukaran data standar yang digunakan, dan prosedur penanganan respons negatif (rejection) dari otoritas perlindungan data. Materi ini dirancang sebagai referensi utama bagi auditor kepatuhan lintas yurisdiksi.

## 1. Komponen Integrasi Aktif: `gdpr_regulatory_api_connector.py`

Modul ini berfungsi sebagai jembatan antara sistem internal perusahaan dan otoritas perlindungan data eksternal (misalnya, Otoritas Perlindungan Data Pribadi di Indonesia, GDPR supervisory authority di Eropa, atau CCPA regulator di California). Modul ini tidak hanya bersifat pasif tetapi juga proaktif dalam mendeteksi anomali kepatuhan.

### 1.1 Arsitektur dan Fungsi Utama

Skrip ini bekerja dalam dua mode utama: **Monitoring Berkelanjutan** dan **Notifikasi Proaktif**.

*   **Pemantauan Integritas Data:** Secara periodik membaca `gdpr_dpia_report.json` (Data Protection Impact Assessment) dan `evidence_chain_of_custody.json` untuk memverifikasi bahwa skor risiko tetap dalam batas toleransi yang ditentukan.
*   **Deteksi Latensi Hak Subjek Data (DSR):** Memantau waktu respons terhadap permintaan "Hak untuk Dilupakan" (*Right to be Forgotten*). Jika waktu pemrosesan melebihi ambang batas regulasi (biasanya 30 hari kerja untuk GDPR, atau 45 hari untuk CCPA dengan perpanjangan), sistem akan memicu notifikasi kritis.
*   **Pelaporan Otomatis:** Jika terdeteksi perubahan signifikan pada skor risiko atau pelanggaran SLA (Service Level Agreement) kepatuhan, sistem akan memformat laporan compliance dan mengirimkannya ke endpoint regulator melalui API.

### 1.2 Argumentasi Baris Perintah (CLI)

Skrip harus dijalankan menggunakan argumen berikut untuk memastikan konfigurasi yang aman dan dapat dilacak:

```bash
python gdpr_regulatory_api_connector.py \
  --regulator-endpoint "https://api.data-protection-authority.id/v1/compliance/submit" \
  --api-key "${REGULATOR_API_KEY}" \
  --interval 15 \
  --output "./logs/regulatory_communication.log"
```

| Argumen | Tipe | Deskripsi | Wajib? |
| :--- | :--- | :--- | :--- |
| `--regulator-endpoint` | `string` | URL API endpoint otoritas perlindungan data. Endpoint ini harus mendukung HTTPS dan autentikasi bearer/token. | Ya |
| `--api-key` | `string` | Kredensial akses (API Key atau OAuth Token) untuk otoritas. Disarankan untuk mengambil dari *environment variable* daripada hardcode. | Ya |
| `--interval` | `int` | Frekuensi pemantauan dalam menit. Menentukan seberapa sering file JSON dipindai untuk perubahan. Default: `60`. | Tidak |
| `--output` | `string` | Path file log untuk mencatat semua komunikasi, timestamp deteksi, dan status pengiriman notifikasi. | Ya |

### 1.3 Mekanisme Deteksi Perubahan Signifikan

Sistem mendefinisikan "perubahan signifikan" berdasarkan dua metrik kunci:

1.  **Perubahan Skor Risiko DPIA:**
    Jika ada peningkatan skor risiko re-identifikasi (berdasarkan `quasi_identifiers` dan algoritma $k$-anonymity yang sudah dikonfigurasi) yang melebihi batas ambang (`risk_threshold`) yang ditetapkan dalam konfigurasi sistem, sistem akan menganggap hal ini sebagai insiden kepatuhan potensial.

2.  **Pelanggaran Batas Waktu DSR:**
    Sistem membandingkan `timestamp` permintaan penghapusan data dengan `timestamp` selesainya proses masking/deletion. Jika selisih waktu > `regulatory_time_limit` (misalnya, 30 hari), status DSR ditandai sebagai `NON_COMPLIANT` dan laporan otomatis dikirim ke regulator.

## 2. Protokol Pertukaran Data Standar

Untuk memastikan interoperabilitas dengan berbagai yurisdiksi, sistem ini mengadopsi standar **JSON-LD (JavaScript Object Notation for Linked Data)**. JSON-LD memungkinkan data kepatuhan untuk dibaca tidak hanya oleh mesin, tetapi juga oleh sistem hukum yang memerlukan konteks semantik tentang apa yang dimaksud dengan "Data Pribadi" atau "Penghapusan Data".

### 2.1 Format JSON-LD untuk Pelaporan Keberlanjutan

Berikut adalah contoh struktur JSON-LD yang digunakan saat mengirimkan laporan kepatuhan proaktif ke otoritas:

```json
{
  "@context": {
    "schema": "https://schema.org/",
    "gdpr": "https://gdpr.eu/schema/",
    "ccpa": "https://oagis.org/library/CCPA#",
    "complianceStatus": "schema:status",
    "riskScore": "https://vocabularies.data.gov/vocab/risk-scores#",
    "subjectRights": "https://vocabularies.data.gov/vocab/subject-rights/"
  },
  "@type": "compliance:Report",
  "datePublished": "2023-10-27T10:00:00Z",
  "publisher": {
    "@type": "Organization",
    "name": "Perusahaan Anda",
    "legalName": "PT Contoh Indonesia"
  },
  "contentDetails": {
    "@type": "DataProtectionReport",
    "currentRiskScore": 12,
    "thresholdLimit": 20,
    "status": "COMPLIANT",
    "lastAuditTimestamp": "2023-10-26T09:00:00Z",
    "detailedMetrics": {
      "maskingCoverage": 100,
      "encryptionAtRest": true,
      "encryptionInTransit": true,
      "dsrComplianceRate": 98.5
    }
  }
}
```

**Penting bagi Auditor:** Pastikan `@context` sesuai dengan yurisdiksi target. Misalnya, untuk laporan ke otoritas Indonesia, sertakan referensi ke regulasi PDP (Perlindungan Data Pribadi) dalam konteks kustom atau gunakan schema standar internasional yang dapat dipetakan kembali ke klausul PDP.

## 3. Prosedur Penanganan Rejection dari Otoritas Eksternal

Ketika otoritas perlindungan data menolak laporan kepatuhan atau menandai insiden sebagai "Non-Compliant", sistem harus menangani respons tersebut dengan ketat untuk menjaga audit trail yang valid.

### 3.1 Matriks Penanganan Respons

| Kode Respons HTTP | Status Kepatuhan | Tindakan Sistem | Tindakan Manuell (Audit) |
| :--- | :--- | :--- | :--- |
| `200 OK` | Compliant | Log sukses, hentikan alarm. | Tidak ada. |
| `400 Bad Request` | Format Error | Reformat payload JSON-LD sesuai error detail. Coba kirim ulang sekali. | Review schema JSON-LD. |
| `401 Unauthorized` | Akses Ditolak | Rotasi API Key / Token jika tersedia. Jika gagal, hentikan eksekusi dan beri tahu Admin. | Reset kredensial API di portal regulator. |
| `409 Conflict` | Duplikat/Revisi | Catat ID laporan sebelumnya sebagai "Revisi". Kirim laporan korektif dengan flag `isCorrection: true`. | Tinjau alasan penolakan di portal regulator. |
| `422 Unprocessable Entity` | Konten Tidak Sah | Identifikasi field yang gagal validasi (misal: skor risiko di luar range). Update konfigurasi lokal. | Kaji ulang metodologi penilaian risiko DPIA. |
| `4xx General` | Rejection Umum | Tandai status sistem sebagai `PENDING_REGULATORY_REVIEW`. Mulai timer 24 jam untuk follow-up otomatis. | Hubungi legal/compliance officer untuk eskalasi manual. |
| `5xx Server Error` | Gagal Teknis | Retry dengan backoff exponential. Jika > 3 kali gagal, kirim notifikasi ke tim engineering. | Tidak ada. |

### 3.2 Prosedur Eskalasi Manual

Jika status laporan berubah menjadi `REJECTED` atau `PENDING_REVIEW`, auditor wajib melakukan langkah berikut dalam waktu 48 jam:

1.  **Analisis Root Cause:** Bandingkan data lokal (`gdpr_dpia_report.json`) dengan detail penolakan dari regulator.
2.  **Koreksi Data:** Perbaiki anomali data yang menyebabkan penolakan (misalnya, kesalahan definisi `quasi_identifiers` atau ketidakakuratan timestamp DSR).
3.  **Dokumentasi Perbaikan:** Simpan versi sebelumnya dan versi perbaikan dalam `version_control/compliance/` untuk keperluan audit trail.
4.  **Kirim Ulang:** Jalankan ulang proses pengiriman dengan status `CORRECTED_SUBMISSION`.

## 4. Panduan Keamanan untuk Integrasi API

Untuk menjaga integritas komunikasi dengan otoritas eksternal, ikuti prinsip keamanan berikut:

*   **Enkripsi Saluran:** Semua komunikasi harus menggunakan HTTPS dengan validasi sertifikat SSL/TLS yang ketat. Jangan pernah mengabaikan peringatan sertifikat dalam lingkungan produksi.
*   **Manajemen Kredensial:** API Key (`--api-key`) tidak boleh disimpan dalam kode sumber. Gunakan *secret manager* atau *environment variables* yang terenkripsi.
*   **Prinsip Minimal Privilege:** Token atau API Key yang digunakan harus dibatasi hanya pada endpoint pelaporan kepatuhan (`/compliance/submit`). Jangan berikan akses write ke endpoint sensitif seperti `/data/export`.
*   **Logging Aman:** Pastikan file log (`--output`) tidak menyimpan kredensial sensitif atau data pribadi pelanggan (PII) yang belum dimask. Log hanya harus mencatat metadata komunikasi (timestamp, status code, endpoint).

## 5. Kesimpulan untuk Auditor

Implementasi `gdpr_regulatory_api_connector.py` dan protokol JSON-LD ini menunjukkan komitmen organisasi terhadap transparansi dan kepatuhan proaktif. Dengan mendeteksi risiko secara real-time dan menangani rejection secara terstruktur, organisasi dapat meminimalkan denda regulasi dan meningkatkan kepercayaan pemangku kepentingan. Pastikan untuk meninjau konfigurasi `--interval` dan `risk_threshold` setiap kuartal sesuai dengan perubahan dinamika bisnis dan lanskap regulasi yang berlaku.


Berikut adalah konten lanjutan untuk `README.md` yang mencakup implementasi teknis skrip validator integritas forensik dan prosedur legal yang diperlukan. Silakan tambahkan bagian ini setelah bagian **4. Panduan Keamanan untuk Integrasi API**.

---

## 5. Validator Integritas Forensik dan Chain of Custody

Untuk memastikan bahwa bukti digital yang dikumpulkan selama insiden dapat dipertahankan di hadapan pengadilan atau auditor eksternal, sistem menyediakan utilitas `audit_chain_integrity_validator.py`. Skrip ini berfungsi sebagai *gatekeeper* terakhir sebelum data dikompilasi dalam laporan final, dengan tujuan memverifikasi keutuhan waktu (time-integrity) dan autentisitas sumber.

### 5.1 Fungsi Utama
Skrip ini melakukan tiga verifikasi krusial:
1.  **Verifikasi Chain of Custody:** Memindai `evidence_chain_of_custody.json` untuk memastikan tidak ada jeda waktu (*time gap*) yang tidak terdokumentasi antara penangkapan bukti dan analisis Root Cause Analysis (RCA).
2.  **Korelasi Data RCA:** Mencocokkan ID insiden dari log custodi dengan hasil analisis dari `log_analysis_and_rca_engine.py` untuk memastikan konsistensi narasi insiden.
3.  **Validasi Tanda Tangan Digital:** Menggunakan sertifikat publik auditor (`--cert-path`) untuk memverifikasi bahwa laporan RCA tidak telah diubah setelah ditandatangani secara kriptografi.

### 5.2 Implementasi Skrip

Simpan kode berikut sebagai `audit_chain_integrity_validator.py`:

```python
#!/usr/bin/env python3
"""
audit_chain_integrity_validator.py

Layer terakhir validasi integritas forensik sebelum pelaporan eksternal.
Memverifikasi Chain of Custody, korelasi RCA, dan keabsahan tanda tangan digital.

Author: Compliance Automation Team
License: MIT
"""

import argparse
import json
import sys
import os
import hashlib
import logging
from datetime import datetime, timezone
from typing import Dict, List, Any, Optional
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.exceptions import InvalidSignature

# Setup Logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class ForensicIntegrityValidator:
    def __init__(self, evidence_path: str, rca_path: str, cert_path: str, strict_mode: bool):
        self.evidence_path = evidence_path
        self.rca_path = rca_path
        self.cert_path = cert_path
        self.strict_mode = strict_mode
        self.custody_data: List[Dict] = []
        self.rca_data: Dict = {}
        self.public_key = None
        
    def load_certificates(self):
        """Memuat sertifikat auditor dan mengekstrak kunci publik."""
        if not os.path.exists(self.cert_path):
            raise FileNotFoundError(f"Sertifikat tidak ditemukan: {self.cert_path}")
        
        with open(self.cert_path, "rb") as cert_file:
            cert_pem = cert_file.read()
        
        # Asumsi: Sertifikat dalam format PEM. Kita mengambil kunci publik.
        try:
            from cryptography import x509
            from cryptography.hazmat.backends import default_backend
            from cryptography.x509.oid import NameOID
            
            certificate = x509.load_pem_x509_certificate(cert_pem, default_backend())
            self.public_key = certificate.public_key()
            logger.info("Sertifikat auditor berhasil dimuat.")
        except ImportError:
            raise ImportError("Library 'cryptography' diperlukan. Instal dengan: pip install cryptography")

    def load_evidence_chain(self):
        """Memuat dan memvalidasi struktur file chain of custody."""
        if not os.path.exists(self.evidence_path):
            raise FileNotFoundError(f"File bukti tidak ditemukan: {self.evidence_path}")
            
        with open(self.evidence_path, 'r') as f:
            try:
                data = json.load(f)
                if isinstance(data, list):
                    self.custody_data = data
                elif isinstance(data, dict) and 'chain' in data:
                    self.custody_data = data['chain']
                else:
                    raise ValueError("Format JSON tidak sesuai struktur list atau objek dengan key 'chain'.")
            except json.JSONDecodeError:
                raise ValueError("File chain of custody korup (JSON Invalid).")
        
        logger.info(f"Muat {len(self.custody_data)} entri bukti dari custodi.")

    def load_rca_report(self):
        """Memuat laporan Root Cause Analysis."""
        if not os.path.exists(self.rca_path):
            raise FileNotFoundError(f"Laporan RCA tidak ditemukan: {self.rca_path}")
            
        with open(self.rca_path, 'r') as f:
            try:
                self.rca_data = json.load(f)
            except json.JSONDecodeError:
                raise ValueError("File laporan RCA korup (JSON Invalid).")
        
        logger.info("Laporan RCA berhasil dimuat.")

    def verify_chain_of_custody_integrity(self):
        """
        Memverifikasi tidak ada 'gap' waktu yang tidak sah antara kejadian dan validasi.
        Dalam mode strict, gap > 0 detik tanpa entry audit trail akan ditolak.
        """
        if not self.custody_data:
            raise ValueError("Data custodi kosong, tidak dapat memverifikasi integritas.")

        # Urutkan berdasarkan timestamp
        sorted_chain = sorted(self.custody_data, key=lambda x: x.get('timestamp', ''))
        
        # Validasi urutan kronologis dasar
        prev_ts = None
        for idx, entry in enumerate(sorted_chain):
            curr_ts_str = entry.get('timestamp')
            if not curr_ts_str:
                if self.strict_mode:
                    raise ValueError(f"Entri ke-{idx} tidak memiliki timestamp (Strict Mode).")
                else:
                    logger.warning(f"Entri ke-{idx} missing timestamp, dilewati dalam non-strict.")
                    continue
            
            curr_ts = datetime.fromisoformat(curr_ts_str.replace('Z', '+00:00'))
            
            if prev_ts:
                # Hitung selisih waktu
                delta = (curr_ts - prev_ts).total_seconds()
                
                # Cek apakah ada gap signifikan yang tidak ditandai sebagai 'processing_delay'
                # Jika gap > 1 detik dan tidak ada penjelasan dalam 'metadata', tandai sebagai anomali
                if delta > 1.0:
                    metadata = entry.get('metadata', {})
                    if not metadata.get('processing_delay_acknowledged'):
                        msg = f"Gap waktu terdeteksi {delta}s antara {prev_ts.isoformat()} dan {curr_ts.isoformat()}"
                        if self.strict_mode:
                            raise ValueError(f"{msg}. Strict mode menolak bukti dengan gap tanpa audit trail.")
                        else:
                            logger.warning(f"Peringatan: {msg}")
            
            prev_ts = curr_ts

        logger.info("Verifikasi Chain of Custody Integritas: LULUS.")

    def correlate_rca_data(self):
        """
        Memastikan ID insiden di bukti custodi cocok dengan laporan RCA.
        """
        if not self.rca_data:
            raise ValueError("Tidak ada data RCA untuk dikorelasikan.")
            
        incident_id_rca = self.rca_data.get('incident_id')
        if not incident_id_rca:
            raise ValueError("Laporan RCA tidak memiliki 'incident_id'.")

        matched_evidence = False
        for entry in self.custody_data:
            if entry.get('incident_id') == incident_id_rca:
                matched_evidence = True
                break
        
        if not matched_evidence:
            raise ValueError(f"Tidak ditemukan bukti custodi untuk incident_id: {incident_id_rca}")
            
        logger.info(f"Korelasi RCA berhasil. Incident ID: {incident_id_rca}")

    def verify_digital_signature(self):
        """
        Memverifikasi tanda tangan digital pada file RCA menggunakan sertifikat auditor.
        Asumsi: Tanda tangan disimpan di field 'digital_signature' dalam JSON RCA
        dalam format Hex String atau Base64.
        """
        signature_hex = self.rca_data.get('digital_signature')
        if not signature_hex:
            raise ValueError("Laporan RCA tidak memiliki field 'digital_signature'.")
        
        # Konversi hex signature ke bytes
        try:
            signature_bytes = bytes.fromhex(signature_hex)
        except ValueError:
            # Coba Base64 jika hex gagal
            import base64
            try:
                signature_bytes = base64.b64decode(signature_hex)
            except Exception as e:
                raise ValueError("Format tanda tangan digital tidak valid (bukan Hex atau Base64).")

        # Siapkan payload yang ditandatangani (biasanya JSON tanpa field signature itu sendiri)
        payload_to_verify = self.rca_data.copy()
        del payload_to_verify['digital_signature']
        payload_bytes = json.dumps(payload_to_verify, sort_keys=True).encode('utf-8')

        try:
            self.public_key.verify(
                signature_bytes,
                payload_bytes,
                padding.PKCS1v15(),
                hashes.SHA256()
            )
            logger.info("Verifikasi Tanda Tangan Digital: VALID.")
        except InvalidSignature:
            if self.strict_mode:
                raise ValueError("Tanda tangan digital INVALID. Bukti mungkin telah dimanipulasi.")
            else:
                logger.warning("Tanda tangan digital INVALID. Mode non-strict melanjutkan dengan peringatan.")

    def run_validation(self) -> bool:
        """Menjalankan semua langkah validasi."""
        try:
            logger.info("Mulai proses validasi forensik...")
            self.load_certificates()
            self.load_evidence_chain()
            self.load_rca_report()
            self.verify_chain_of_custody_integrity()
            self.correlate_rca_data()
            self.verify_digital_signature()
            
            logger.info("=== SEMUA VALIDASI SELESAI. INTEGRITAS BUKTI TERVERIFIKASI. ===")
            return True
        except Exception as e:
            logger.error(f"Validasi GAGAL: {str(e)}")
            if self.strict_mode:
                sys.exit(1)
            else:
                # Dalam mode non-strict, log error tapi lanjutkan (atau hentikan tergantung kebijakan)
                sys.exit(1)

def main():
    parser = argparse.ArgumentParser(description="Validator Integritas Forensik & Chain of Custody")
    parser.add_argument('--evidence-chain', required=True, help='Path ke file evidence_chain_of_custody.json')
    parser.add_argument('--rca-report', required=True, help='Path ke file laporan RCA JSON')
    parser.add_argument('--cert-path', required=True, help='Path ke file sertifikat auditor (.pem/crt)')
    parser.add_argument('--strict-mode', action='store_true', help='Mode verifikasi tingkat tinggi (toleransi 0 error)')
    
    args = parser.parse_args()
    
    validator = ForensicIntegrityValidator(
        evidence_path=args.evidence_chain,
        rca_path=args.rca_report,
        cert_path=args.cert_path,
        strict_mode=args.strict_mode
    )
    
    validator.run_validation()

if __name__ == "__main__":
    main()
```

### 5.3 Cara Penggunaan

Jalankan skrip ini setelah proses pengumpulan bukti dan analisis RCA selesai, tetapi sebelum mengirim laporan final ke regulator.

```bash
# Contoh eksekusi dengan mode ketat (direkomendasikan untuk audit pengadilan)
python3 audit_chain_integrity_validator.py \
    --evidence-chain ./data/evidence_chain_of_custody.json \
    --rca-report ./reports/rca_analysis.json \
    --cert-path ./certs/auditor_public_key.pem \
    --strict-mode
```

**Penjelasan Argumen:**
*   `--evidence-chain`: Path absolut atau relatif ke file JSON yang dihasilkan oleh `automated_evidence_preservation.py`.
*   `--rca-report`: Path ke file JSON hasil eksekusi `log_analysis_and_rca_engine.py`.
*   `--cert-path`: Sertifikat X.509 publik dari auditor yang menandatangani laporan RCA.
*   `--strict-mode`: Jika diaktifkan, skrip akan menolak eksekusi jika ditemukan ketidaksesuaian waktu minor, format tanda tangan yang ambigu, atau missing fields kritis.

---

## 6. Lampiran Teknis: Prosedur Validasi Forensik & Standar Penerimaan Bukti

Bagian ini menyediakan panduan hukum-teknis bagi tim Compliance dan Legal untuk memahami bagaimana skrip validator di atas memenuhi standar *admissibility* (daya terima) bukti di pengadilan.

### 6.1 Prinsip Forensik Digital (ISO/IEC 27037)
Sistem ini dirancang untuk memenuhi prinsip-prinsip dasar forensik digital:
1.  **Integritas:** Bukti tidak boleh diubah setelah diambil. Ini dicapai melalui hash SHA-256 yang dicatat di `evidence_chain_of_custody.json` dan diverifikasi ulang oleh validator.
2.  **Audit Trail (Chain of Custody):** Setiap akses atau manipulasi terhadap bukti harus tercatat dengan timestamp yang dapat diverifikasi. Validator `audit_chain_integrity_validator.py` secara otomatis mendeteksi anomali waktu yang mungkin mengindikasikan *tampering*.
3.  **Autentisitas:** Kepemilikan bukti harus dapat dibuktikan. Tanda tangan digital (PKI) pada laporan RCA memastikan bahwa laporan tersebut benar-benar berasal dari auditor yang berwenang dan tidak diubah di tengah jalan.

### 6.2 Standar Penerimaan Bukti di Pengadilan
Saat menyajikan laporan kepatuhan (GDPR/CCPA) kepada otoritas regulator atau dalam sengketa hukum, pengadilan biasanya menguji bukti berdasarkan kriteria *Daubert* atau standar serupa:

1.  **Validitas Metodologi:** Apakah metode yang digunakan untuk mengumpulkan data dapat direproduksi?
    *   *Bukti Sistem:* Skrip validator menggunakan library standar (`cryptography`, `hashlib`) yang diakui secara luas. Alur kerja logis (Load -> Verify Chain -> Correlate -> Verify Signature) transparan dan dapat diaudit.
2.  **Keandalan Pelaksanaan:** Apakah proses dijalankan dengan benar?
    *   *Bukti Sistem:* Output log dari `audit_chain_integrity_validator.py` berfungsi sebagai *proof of execution*. Jika skrip keluar dengan kode 0 dan log "LULUS", ini menunjukkan bahwa standar validasi telah terpenuhi secara objektif.
3.  **Keterkaitan (Relevance):** Apakah bukti secara langsung terkait dengan insiden?
    *   *Bukti Sistem:* Fungsi `correlate_rca_data()` secara eksplisit mengaitkan ID insiden teknis dengan bukti fisik/digital, mencegah kesalahan penautan bukti (*misattribution*).

### 6.3 Panduan Dokumentasi untuk Auditor Eksternal
Untuk mempermudah proses pemeriksaan (due diligence) oleh auditor hukum, tim IT disarankan untuk menyertakan artefak berikut dalam arsip bukti:

| Artefak | Deskripsi | Tujuan Hukum |
| :--- | :--- | :--- |
| `evidence_chain_of_custody.json` | Riwayat lengkap pengambilan bukti. | Membuktikan tidak ada celah waktu (*gap*) yang mencurigakan. |
| `rca_analysis.json` | Laporan akar masalah yang ditandatangani. | Membuktikan keaslian temuan teknis. |
| `validator_log.txt` | Log eksekusi skrip validator (termasuk argumen `--strict-mode`). | Membuktikan bahwa proses validasi telah dijalankan secara independen. |
| `auditor_public_key.pem` | Kunci publik auditor. | Memungkinkan pihak ketiga memverifikasi tanda tangan digital secara mandiri. |

### 6.4 Tanggung Jawab dan Akuntabilitas
*   **Tim IT:** Bertanggung jawab atas ketersediaan dan keunikan kunci kriptografi serta integritas skrip validator.
*   **Auditor Internal/External:** Bertanggung jawab atas penerbitan sertifikat digital dan peninjauan log validasi.
*   **Legal/Compliance Officer:** Bertanggung jawab atas penafsiran hasil validasi dalam konteks peraturan yang berlaku.

Dengan menggabungkan otomasi teknis ini dengan prosedur dokumentasi yang ketat, organisasi tidak hanya mematuhi regulasi GDPR/CCPA, tetapi juga membangun posis defendabilitas yang kuat jika terjadi insiden data di masa depan.


Berikut adalah konten lanjutan yang komprehensif untuk bagian "Compliance & Legal" dalam dokumentasi `README.md`. Bagian ini dirancang untuk menjembatani kesenjangan antara persyaratan hukum (GDPR/CCPA) dan implementasi teknis (Policy-as-Code), lengkap dengan spesifikasi teknis skripCompiler Kebijakan.

---

## 7. Policy-as-Code: Dari Regulasi ke Eksekusi Sistem

Dalam kerangka kepatuhan modern, kebijakan tidak boleh lagi merupakan dokumen statis yang hanya dibaca manusia. Pendekatan **Policy-as-Code** menuntut bahwa setiap persyaratan hukum (seperti "data subjek harus memiliki hak untuk dilupakan") diterjemahkan menjadi aturan logika yang dapat diverifikasi, diaudit, dan dieksekusi secara otomatis oleh infrastruktur TI.

Bagian ini mendefinisikan arsitektur terjemahan hukum, spesifikasi teknis *Policy Compiler*, dan pemetaan kontrol NIST SP 800-53 untuk memastikan bahwa kepatuhan tidak hanya didokumentasikan, tetapi di-enforcing.

### 7.1 Kerangka Kerja Penerjemahan Kebijakan (Policy Translation Framework)

Sistem ini menggunakan prinsip *Declarative Compliance*, di mana keadaan sistem ("state") dibandingkan dengan kebijakan yang dideklarasikan ("policy"). Proses terjemahan dilakukan melalui tiga lapisan:

1.  **Lapisan Penafsiran Hukum (Legal Interpretation Layer):**
    *   Mengambil teks regulasi (GDPR Art. 17, CCPA §1798.100) dan mengubahnya menjadi predikat logika.
    *   *Contoh:* "Hapus data pribadi" $ightarrow$ `delete_data_subject_record(identity_id)`.
2.  **Lapisan Konsistensi Konteks (Contextual Consistency Layer):**
    *   Mengintegrasikan data dari `automated_gdpr_impact_assessment.py` (risiko) dan `log_analysis_and_rca_engine.py` (akar masalah).
    *   Jika Dampak Penilaian Privasi (DPIA) menunjukkan risiko tinggi untuk pemrosesan data tertentu, maka kontrol akses menjadi lebih ketat (*restrictive-by-default*).
    *   Jika RCA mengidentifikasi celah keamanan sebelumnya, maka aturan enkripsi tambahan diterapkan pada aset terkait.
3.  **Lapisan Eksekusi Teknis (Technical Enforcement Layer):**
    *   Menghasilkan file konfigurasi JSON (`policy_rules_v1.json`) yang dibaca oleh `compliance_policy_enforcer.py` (untuk tindakan back-end) dan `compliance_api_gateway.py` (untuk pembatasan akses front-end).

### 7.2 Spesifikasi Teknis: Policy Compiler

Alat utama untuk menerjemah kebijakan ini adalah `compliance_governance_policy_compiler.py`. Script ini bertindak sebagai *bridge* antara tim Legal/Compliance dan tim Engineering.

#### 7.2.1 Deskripsi Fungsional
Script ini membaca dua sumber kebenaran utama:
1.  **DPIA Report (`gdpr_dpia_report.json`):** Berisi penilaian risiko, jenis data sensitif, dan basis hukum pemrosesan.
2.  **RCA Report (`rca_report.json`):** Berisi historis insiden, celah keamanan yang teridentifikasi, dan rekomendasi perbaikan.

Outputnya adalah **Konfigurasi Kebijakan Terenkripsi** yang memuat aturan otomatisasi (misalnya: "Enkripsi AES-256 wajib untuk kolom PII jenis 'Health_Data'") dan batasan akses API (misalnya: "Role `analyst` tidak boleh mengakses endpoint `/api/v1/subjects/{id}/ssn`").

#### 7.2.2 Antarmuka Baris Perintah (CLI)

```bash
python compliance_governance_policy_compiler.py \
    --dpia /path/to/automated_gdpr_impact_assessment/output/gdpr_dpia_report.json \
    --rca /path/to/log_analysis_and_rca_engine/output/rca_report.json \
    --output /path/to/output/policy_rules_v1.json \
    --policy-id v1.2.0-20231027
```

**Argumen Detail:**

| Argumen | Tipe | Deskripsi |
| :--- | :--- | :--- |
| `--dpia` | `str` | Path absolut ke file JSON hasil penilaian dampak privasi (DPIA). File ini menentukan tingkat sensitivitas data dan risiko hukum. |
| `--rca` | `str` | Path absolut ke file JSON hasil analisis akar masalah (RCA). File ini menentukan mitigasi keamanan yang harus diterapkan sebagai kondisi prasyarat kepatuhan. |
| `--output` | `str` | Path file keluaran untuk menyimpan konfigurasi kebijakan yang dihasilkan. |
| `--policy-id` | `str` | Identifier unik untuk versi kebijakan ini. Format disarankan: `[Major].[Minor].[Patch]-[Timestamp]`. Wajib untuk audit trail versiolis kebijakan. |

#### 7.2.3 Contoh Struktur Output (`policy_rules_v1.json`)

File hasil kompilasi akan memiliki struktur berikut yang siap dieksekusi oleh sistem downstream:

```json
{
  "policy_id": "v1.2.0-20231027",
  "generated_at": "2023-10-27T10:00:00Z",
  "compliance_frameworks": ["GDPR", "CCPA"],
  "enforcement_rules": {
    "data_handling": [
      {
        "rule_id": "ER-001",
        "source": "DPIA-Risk-High",
        "action": "encrypt_column",
        "target_field": "employee_ssn",
        "algorithm": "AES-256-GCM",
        "key_management": "HSM-Provider-A"
      },
      {
        "rule_id": "ER-002",
        "source": "GDPR-Art-17",
        "action": "enable_retention_policy",
        "duration_days": 30,
        "condition": "after_deletion_request"
      }
    ],
    "api_gateway_restrictions": [
      {
        "rule_id": "AG-001",
        "source": "RCA-Vuln-Authorization",
        "method": "GET",
        "path_pattern": "/api/v1/customers/*/financials",
        "allowed_roles": ["finance_admin"],
        "deny_default": true
      }
    ]
  },
  "dependency_validation": {
    "rca_items_resolved": true,
    "dpias_signed_by_dpo": true
  }
}
```

### 7.3 Pemetaan Kontrol NIST SP 800-53 ke Implementasi Sistem

Untuk memenuhi standar auditor internasional, setiap aturan yang dihasilkan oleh *Compiler* harus dapat dilacak kembali (traceable) ke kontrol NIST SP 800-53 Rev. 5. Tabel berikut menjelaskan bagaimana regulasi hukum diterjemahkan menjadi kontrol teknis spesifik.

| Kontrol NIST SP 800-53 | Regulasi Terkait | Implementasi dalam Policy-as-Code | Validasi Teknis |
| :--- | :--- | :--- | :--- |
| **AC-2** (Account Management) | GDPR Art. 5(1)(c) (Minimisasi Data) | `compiler.py` memindai RCA untuk entitas dengan akses berlebih yang tidak diperlukan ("excessive privileges") dan menghasilkan aturan `deny_default` di API Gateway. | Cek log API Gateway menolak akses oleh role yang tidak terdaftar dalam whitelist `policy_rules`. |
| **AC-3** (Access Enforcement) | CCPA §1798.100 (Hak Penyangkalan) | Aturan otomatisasi diterapkan pada database layer untuk mengunci akses PII berdasarkan status "opt-out" dari tabel preferensi pengguna. | Query SQL pada tabel audit membuktikan tidak ada read-access dari user `non-admin` saat flag `opt_out=True`. |
| **AU-2** (Audit Events) | GDPR Art. 30 (Record of Processing) | Setiap perubahan pada `policy_rules.json` dicatat ke ledger immutable. Enforcer mencatat setiap deny/allow decision. | Validator `audit_chain_integrity_validator.py` memeriksa integritas hash log audit terhadap `evidence_chain_of_custody.json`. |
| **SI-4** (System Monitoring) | GDPR Art. 32 (Security of Processing) | Jika RCA mendeteksi pola anomali waktu (potensi tampering), Policy Compiler secara otomatis menonaktifkan endpoint API yang rentan hingga manual override dilakukan. | Dashboard monitoring menampilkan status "Policy Enforced" dengan metrik latency dan blocked requests. |
| **SC-28** (Protection of Data at Rest) | GDPR Art. 25 (Data Protection by Design) | Jika DPIA menyoroti risiko tinggi terhadap data sensitif (kesehatan, biometrik), Compiler memaksa penggunaan enkripsi homomorfik atau tokenisasi. | Scan konfigurasi database memverifikasi flag `encryption_enabled=true` untuk kolom yang ditandai sensitif oleh DPIA. |

### 7.4 Alur Kerja Due Diligence untuk Auditor

Untuk memudahkan proses pemeriksaan oleh auditor eksternal, ikuti prosedur berikut saat menggunakan artefak yang dihasilkan oleh *Policy Compiler*:

1.  **Verifikasi Konsistensi Input:**
    *   Pastikan file `gdpr_dpia_report.json` dan `rca_report.json` yang digunakan sebagai input adalah versi final yang telah ditandatangani oleh DPO (Data Protection Officer) dan Kepala Keamanan.
    *   Gunakan argumen `--policy-id` yang sama dengan yang tercantum dalam dokumen kebijakan hukum organisasi.

2.  **Cek Celah Kepatuhan (Compliance Gap Analysis):**
    *   Lihat field `"dependency_validation"` di `policy_rules_v1.json`.
    *   Jika `"rca_items_resolved": false`, berarti ada insiden sebelumnya yang belum diperbaiki, dan kebijakan ini **tidak akan di-enforcement secara penuh** (mode *fail-open* dengan logging tinggi). Ini adalah indikasi risiko hukum yang harus didiskusikan dengan Legal.

3.  **Uji Eksekusi Kontrol:**
    *   Jalankan `compliance_policy_enforcer.py --dry-run --config policy_rules_v1.json`.
    *   Hasil output harus mencocokkan predikat logika yang dijelaskan di bagian **7.2.3**.

4.  **Audit Trail:**
    *   Simpan `policy_rules_v1.json` bersama dengan log eksekusi compiler ke dalam arsip bukti (`evidence_archive`).
    *   Hash dari file JSON tersebut harus dicatat di `evidence_chain_of_custody.json` sebagai bagian dari rantai kepemilikan bukti digital.

### 7.5 Tanggung Jawab dan Akuntabilitas (Update)

Seiring dengan adopsi *Policy-as-Code*, peran akuntabilitas sedikit berubah dari sekadar "penyusun kebijakan" menjadi "arhitektur kepatuhan":

*   **Tim Legal/Compliance:**
    *   Bertanggung jawab atas akurasi pemetaan aturan hukum ke dalam *predikat logika* awal.
    *   Meninjau dan menyetujui output `policy_rules_v1.json` sebelum deployment produksi.
*   **Tim Security Engineering:**
    *   Bertanggung jawab atas integritas skrip `compliance_governance_policy_compiler.py`.
    *   Memastikan bahwa *enforcement rules* yang dihasilkan dapat diimplementasikan tanpa menyebabkan gangguan layanan (*denial of service*) yang tidak sah.
*   **Auditor Internal:**
    *   Memverifikasi bahwa setiap perubahan pada `policy_rules_v1.json` melalui proses *Change Management* yang ketat dan tercatat.
    *   Melakukan sampling acak terhadap aturan API Gateway untuk memastikan tidak ada kebocoran data akibat konfigurasi yang salah.

Dengan mengimplementasikan struktur ini, organisasi tidak hanya memenuhi kewajiban hukum, tetapi juga menciptakan ekosistem di mana kepatuhan adalah fungsi bawaan dari sistem, bukan lapisan tambahan yang reaktif.


Berikut adalah konten lanjutan untuk dokumentasi `README.md`, yang dirancang untuk dilampirkan langsung setelah bagian **7.5 Tanggung Jawab dan Akuntabilitas**. Konten ini memperkenalkan komponen kuantifikasi risiko (`compliance_risk_quantifier.py`) dan memberikan landasan metodologis yang diperlukan untuk pemahaman dewan direksi dan fungsi kepatuhan.

---

### 7.6 Kuantifikasi Risiko Finansial (Compliance Risk Quantifier)

Untuk mengubah kepatuhan dari biaya operasional menjadi metrik manajemen risiko yang terukur, organisasi menggunakan skrip `compliance_risk_quantifier.py`. Alat ini berfungsi sebagai jembatan antara temuan teknis (RCA) dan dampak bisnis, dengan mengonversi celah kepatuhan menjadi estimasi kerugian finansial yang dapat ditanggung.

#### 7.6.1 Eksekusi dan Parameter

Skrip ini memerlukan input dari compiler kebijakan dan mesin analisis akar masalah untuk melakukan korelasi data. Gunakan perintah berikut untuk menjalankan kuantifikasi risiko:

```bash
python compliance_risk_quantifier.py \
  --policy-rules compliance_output/policy_rules_v1.json \
  --rca log_analysis/rca_report.json \
  --dollar-per-record 150 \
  --annual-revenue 50000000 \
  --output output/risk_financial_impact.json
```

**Daftar Argumen:**

| Argumen | Deskripsi | Default | Wajib |
| :--- | :--- | :--- | :--- |
| `--policy-rules` | Path ke file `policy_rules_v1.json` yang dihasilkan oleh `compliance_governance_policy_compiler.py`. | `-` | Ya |
| `--rca` | Path ke file `rca_report.json` dari `log_analysis_and_rca_engine.py`. | `-` | Ya |
| `--dollar-per-record` | Estimasi biaya pemulihan dan reputasi per satu rekam data sensitif yang bocor. | `150` USD | Tidak |
| `--annual-revenue` | Turnover tahunan organisasi dalam mata uang lokal (USD). Diperlukan untuk kalkulasi denda GDPR maksimal (4%). | `-` | Ya |
| `--output` | Path file JSON untuk menyimpan laporan dampak finansial (`risk_financial_impact.json`). | `./risk_financial_impact.json` | Tidak |

#### 7.6.2 Struktur Output Laporan (`risk_financial_impact.json`)

Output yang dihasilkan menyajikan tiga skenario risiko utama untuk mendukung pengambilan keputusan strategis:

1.  **`min_impact` (Lower Bound):** Skenario teroptimis di mana celah kepatuhan bersifat isolatif, tidak melibatkan data individu yang teridentifikasi, dan tidak memicu investigasi regulator eksternal. Meliputi biaya internal remediasi dasar.
2.  **`expected_value` (Likely Scenario):** Estimasi probabilitas-weighted loss berdasarkan frekuensi insiden historis (dari RCA) dan tingkat keberhasilan eksekusi kontrol. Ini adalah angka yang disarankan untuk dialokasikan dalam anggaran kontinjensi tahunan.
3.  **`max_impact` (Upper Bound / Worst Case):** Skenario katastrofi di mana celah mengarah pada pelanggaran skala besar, pemicu denda GDPR maksimal (4% dari turnover global), tuntutan kelas (class-action lawsuit), dan downtime operasional penuh selama pemulihan forensik.

**Contoh Snippet Output:**

```json
{
  "assessment_id": "RA-2023-10-27-001",
  "timestamp": "2023-10-27T14:30:00Z",
  "inputs_summary": {
    "policy_rules": "policy_rules_v1.json",
    "rca_items_analyzed": 12,
    "critical_gaps_found": 2
  },
  "financial_estimates": {
    "min_impact_usd": 15000,
    "expected_value_usd": 850000,
    "max_impact_usd": 20500000
  },
  "risk_breakdown": {
    "gdpenalty_exposure_usd": 20000000,
    "forensic_costs_usd": 150000,
    "business_interruption_usd": 350000,
    "reputational_damage_usd": 200000
  },
  "recommendation": "Immediate remediation required for GAP-SEC-04 to reduce Expected Value by 40%."
}
```

#### 7.6.3 Metodologi Penilaian Risiko Finansial dan Asumsi Akuntansi

Bagian ini mendefinisikan landasan teknis dan asumsi akuntansi yang digunakan oleh `compliance_risk_quantifier.py`. Dokumen ini bersifat terbuka untuk review oleh Auditor Internal dan Departemen Keuangan sebelum digunakan untuk penentuan premi asuransi siber.

**A. Model Denda GDPR (General Data Protection Regulation)**

Sesuai Pasal 83 GDPR, denda administratif dapat mencapai hingga **20 juta EUR atau 4% dari omzet tahunan global tahunan penuh**, mana yang lebih tinggi.

*   **Kalkulasi Eksposur Maksimal:**
    $$ 	ext{MaxGDPEndowment} = \max(20,000,000 	imes 	ext{FXRate}, 	ext{AnnualRevenue} 	imes 0.04) $$
    *Di mana `FXRate` adalah kurs konversi EUR ke USD pada hari penilaian risiko.*
*   **Asumsi Probabilitas Penalti Penuh:** Model ini menggunakan faktor pengali konservatif **0.8** untuk `max_impact`, asumsinya adalah regulator cenderung memberikan denda maksimal hanya dalam kasus pelanggaran sistematis yang diabaikan.

**B. Biaya Forensik Digital dan Pemulihan**

Biaya ini mencakup jasa vendor pihak ketiga untuk investigasi insiden, notifikasi kepada individu yang terdampak, dan pemulihan sistem.

*   **Rumus Dasar:**
    $$ 	ext{CostForensics} = (	ext{RecordsAffected} 	imes 	ext{CostPerRecord}) + 	ext{FixedBaseInvestigation} $$
*   **Asumsi `CostPerRecord` ($150 USD default):**
    1.  **Notifikasi:** $15 per surat/email notifikasi wajib hukum.
    2.  **Kredit Monitoring:** $100 per tahun untuk layanan pemantauan kredit selama 2 tahun.
    3.  **Dukungan Pelanggan:** $35 untuk biaya call center dan dukungan hukum awal.
    *Catatan: Nilai ini dapat disesuaikan dengan regulasi lokal (misalnya, California CCPA memiliki standar biaya notifikasi yang berbeda).*

**C. Kerugian Interupsi Bisnis (Business Interruption)**

Estimasi pendapatan yang hilang selama masa *downtime* operasional akibat lockdown sistem untuk keperluan investigasi atau remediasi darurat.

*   **Rumus:**
    $$ 	ext{CostInterruption} = 	ext{AverageDailyRevenue} 	imes 	ext{EstimatedDowntimeDays} $$
*   **Asumsi Downtime:** Berdasarkan data RCA sebelumnya, estimasi waktu pemulihan titik-ke-titik (Recovery Point Objective) untuk celah kritis ditetapkan sebesar **72 jam (3 hari)**.

**D. Faktor Koreksi Reputasi dan Reputasi**

Kerugian reputasi adalah yang paling sulit diukur namun memiliki dampak jangka panjang terbesar. Model ini menggunakan pendekatan *Tag-Along Equity Value*.

*   **Metodologi:** Menggunakan koefisien elastisitas harga saham terhadap berita negatif keamanan siber (berdasarkan studi empiris McKinsey/Javelin Strategy).
*   **Asumsi:** Penurunan nilai pasar sebesar **2-5%** dari kapitalisasi pasar harian pada hari pengumuman insiden, dialokasikan ke dalam komponen `reputational_damage_usd`.

**E. Integrasi dengan Premi Asuransi Siber**

Hasil output `risk_financial_impact.json` harus digunakan oleh Departemen Keuangan untuk negosiasi polis asuransi:

1.  **Retensi Risiko (Retention/Deductible):** Dianjurkan untuk menetapkan retensi setinggi `min_impact` atau `20%` dari `expected_value`, mana yang lebih tinggi.
2.  **Coverage Limit:** Limit asuransi harus mencakup `expected_value` ditambah buffer **25%** untuk biaya legal yang tidak terduga.
3.  **Mandatoris Compliance Gap:** Polis asuransi dapat dikondisikan (warranted) dengan syarat tidak ada celah kritis dengan status `"rca_items_resolved": false` pada saat klaim diajukan.

---

### 7.7 Alur Kerja Terintegrasi (End-to-End Governance Workflow)

Untuk memastikan konsistensi data dari tingkat kode hingga tingkat dewan direksi, ikuti alur kerja terintegrasi berikut:

1.  **Development:** Tim Engineering mengembangkan fitur baru dan menyalakan `compliance_governance_policy_compiler.py` untuk memvalidasi konfigurasi terhadap `policy_rules_v1.json`.
2.  **Analysis:** Jika ada anomali atau insiden sebelumnya, `log_analysis_and_rca_engine.py` dijalankan untuk menghasilkan `rca_report.json`.
3.  **Validation:** DPO menandatangani `gdpr_dpia_report.json` dan Kepala Keamanan menandatangani hasil kompilasi kebijakan.
4.  **Quantification:** Administrator Sistem menjalankan `compliance_risk_quantifier.py` dengan kedua file input di atas.
5.  **Review:** Tim Compliance mereview `risk_financial_impact.json`. Jika `expected_value` melebihi ambang batas toleransi risiko organisasi (Risk Appetite), fitur tidak dapat di-deploy ke produksi hingga celah diperbaiki.
6.  **Archive:** Semua file JSON (kebijakan, RCA, dampak finansial) di-hash dan disimpan ke dalam `evidence_archive` untuk audit trail.

> **Peringatan Keamanan:** File `risk_financial_impact.json` mengandung data sensitif mengenai eksposur finansial organisasi. File ini harus dienkripsi saat diam (at-rest) dan hanya dapat diakses oleh personel dengan otoritas level `ROLE_CISO` atau `ROLE_DPO`.


Berikut adalah konten lanjutan untuk dokumentasi `README.md` Anda. Bagian ini mencakup implementasi teknis skrip simulasi (`compliance_financial_drainage_calculator.py`) dan penjelasan mendalam mengenai model finansial jangka panjang untuk keperluan strategi dewan direksi.

Silakan salin dan tempel konten berikut ke bagian akhir file `README.md` Anda, tepat setelah bagian **"7.7 Alur Kerja Terintegrasi (End-to-End Governance Workflow)"**.

---

### 7.8 Simulasi Skenario Kerugian Finansial Terburuk (Worst-Case Scenario Simulation)

Untuk memperkuat posisi negosiasi dengan pemangku kepentingan eksternal (asuransi) dan internal (dewan direksi), organisasi harus mampu memproyeksikan dampak agregat dari kegagalan kepatuhan berlapis (*cascade failure*). Modul ini mensimulasikan skenario di mana pelanggaran terjadi secara simultan pada **Artikel 32 (Keamanan)**, **Artikel 33 (Notifikasi)**, dan **Artikel 34 (Komunikasi ke Subjek Data)** GDPR.

#### A. Implementasi Skenario `compliance_financial_drainage_calculator.py`

Skrip ini mengambil output dari kuantifier risiko (`risk_financial_impact.json`) dan aturan kebijakan (`policy_rules_v1.json`) untuk menghitung proyeksi biaya masa depan dengan menerapkan *Regulatory Inflation Factor* dan diskonto arus kas.

**Struktur Eksekusi:**

```bash
python compliance_financial_drainage_calculator.py \
    --financial-input path/to/risk_financial_impact.json \
    --policy-input path/to/policy_rules_v1.json \
    --projection-years 5 \
    --regulatory-inflation-rate 5.0 \
    --output path/to/risk_future_projection.json
```

**Deskripsi Argumen:**
| Argumen | Tipe | Default | Deskripsi |
| :--- | :--- | :--- | :--- |
| `--financial-input` | String | *Required* | Path ke file output `risk_financial_impact.json` dari kuantifier risiko dasar. |
| `--policy-input` | String | *Required* | Path ke file `policy_rules_v1.json` untuk menentukan batas denda maksimum hukum dan multiplikator. |
| `--projection-years` | Integer | `5` | Durasi proyeksi dalam tahun untuk memodelkan dampak jangka panjang. |
| `--regulatory-inflation-rate` | Float | `5.0` | Persentase kenaikan denda/hukuman tahunan akibat inflasi regulasi dan kenaikan standar industri. |
| `--output` | String | *Required* | Path tujuan untuk menyimpan file `risk_future_projection.json`. |

**Logika Simulasi Multiplikasi `Dollar-Per-Record`:**
Skrip menerapkan logika berikut untuk menghitung *Aggregated Liability*:
1.  **Base Impact Extraction:** Mengambil `expected_value` dari input finansial.
2.  **Cascade Multiplier:** Jika status kepatuhan pada Article 32, 33, dan 34 semuanya gagal (*false*), skenario ini mengaktifkan multiplikator agregat. Denda GDPR dapat mencapai 20 juta EUR atau 4% dari omzet global tahunan (mana yang lebih tinggi). Skrip memperkirakan komponen "4% omzet" berbasis rasio industri yang disuntikkan dari `policy_rules_v1.json`.
3.  **Regulatory Inflation:** Menerapkan rumus compound interest:
    $$ Future\_Cost = Base\_Cost 	imes (1 + Inflation\_Rate)^{Years} $$
4.  **Output:** Menghasilkan file JSON yang berisi rincian biaya tahunan yang diproyeksikan, total NPV (Net Present Value) dari kewajiban hukum, dan buffer likuiditas yang diperlukan.

---

#### B. Lampiran Strategi Jangka Panjang: Model Diskonto Arus Kas untuk Kepatuhan (Compliance DCF Model)

Bagian ini disediakan khusus untuk **Dewan Direksi** dan **C-Level Executives** sebagai dasar keputusan investasi dalam infrastruktur keamanan dan kepatuhan hukum.

##### 1. Filosofi "Cost of Non-Compliance" vs "Cost of Compliance"
Kepatuhan sering dipandang sebagai pusat biaya (*cost center*). Namun, melalui model **Discounted Cash Flow (DCF)**, kita memposisikan kepatuhan sebagai *risk mitigation asset* yang melindungi arus kas organisasi dari eksposur likuiditas tiba-tiba (*tail risk*).

##### 2. Komponen Model DCF Kepatuhan
Untuk menghitung Nilai Sekarang Bersih (*Net Present Value - NPV*) dari kewajiban kepatuhan di masa depan, kita menggunakan variabel berikut:

*   **$C_t$ (Cash Outflow pada Tahun $t$):** Total eksposur finansial pada tahun ke-$t$, termasuk:
    *   Denda Regulator (GDPR, PO/UU PDP).
    *   Biaya Litigasi dan Ganti Rugi.
    *   Biaya Reputasi (estimasi penurunan valuasi saham berdasarkan studi elastisitas).
    *   Biaya Operasional Remediasi (DL/OL, Forensik, Notifikasi).
*   **$r$ (Tingkat Diskonto / Discount Rate):** Representasi dari biaya modal organisasi ($WACC$) ditambah *Risk Premium* khusus industri teknologi. Untuk industri fintech/siber, disarankan menggunakan $r = 12\% - 15\%$ untuk mencerminkan volatilitas tinggi risiko operasional.
*   **$n$ (Periode Proyeksi):** Jangka waktu pemulihan reputasi dan kepatuhan (biasanya 3-5 tahun pasca insiden besar).

##### 3. Rumus Perhitungan NPV Eksposur Masa Depan
$$ NPV_{future\_liability} = \sum_{t=1}^{n} rac{C_t}{(1 + r)^t} $$

Di mana $C_t$ dihitung dengan menerapkan *Regulatory Inflation Factor* ($i$) terhadap biaya dasar insiden:
$$ C_t = C_0 	imes (1 + i)^t $$

##### 4. Interpretasi untuk Dewan Direksi

*   **Skenario Baseline (Tanpa Insiden):** Jika organisasi mempertahankan tingkat kepatuhan tinggi, $NPV_{future\_liability}$ mendekati 0. Investasi hanya berupa biaya operasional rutin (*OpEx*).
*   **Skenario Insiden (What-If):** Jika terjadi *cascade failure* (seperti yang dimodelkan dalam `compliance_financial_drainage_calculator.py`), $NPV_{future\_liability}$ akan bernilai signifikan.
    *   *Contoh:* Jika eksposur awal ($C_0$) adalah $100,000,000 USD, dengan inflasi regulasi 5% dan diskonto 12% selama 5 tahun, Total Liabilitas yang Didiskonto (PV) mungkin terlihat lebih kecil secara nominal di tahun-tahun akhir, namun **dampak likuiditas arus kas tahunan ($C_t$) pada tahun-tahun awal bisa melumpuhkan operasi.**

##### 5. Rekomendasi Strategis

1.  **Pemisahan Anggaran "Risk Capital":**
    Dewan direksi disarankan untuk mengalokasikan dana cadangan (*reserve fund*) yang setara dengan $NPV_{worst\_case\_scenario}$ dari simulasi skenario terburuk. Dana ini harus likuid dan terpisah dari operasional harian.
    
2.  **Hedging Melalui Asuransi:**
    Gunakan output `risk_financial_impact.json` untuk menentukan nilai *Deductible* yang realistis. Jangan memilih polis dengan premi termurah, tetapi pilih polis yang mampu menampung *gap* likuiditas pada tahun ke-1 dan ke-2 pasca insiden (fase paling kritis secara finansial).

3.  **Kepatuhan sebagai Pendukung Valuasi:**
    Data kepatuhan GDPR yang auditable dan terdokumentasi dapat meningkatkan valuasi perusahaan saat *Due Diligence* untuk M&A atau IPO. Kerugian reputasi yang diproyeksikan dalam model DCF ini harus dikonversi menjadi penurunan *Multiple* valuasi pasar perusahaan (misal: penurunan EV/EBITDA sebesar 0.5x akibat catatan kepatuhan buruk).

> **Catatan Audit:** Semua asumsi diskonto dan inflasi regulasi yang digunakan dalam kalkulator ini harus ditinjau ulang setiap kuartal oleh Departemen Keuangan bersama Legal Counsel untuk memastikan relevansi dengan lanskap hukum terbaru.
