// parsing.dats
// Implements ELF and Mach-O binary structure parsing and validation

staload "share/atspre_staload.hats"

// Minimal ELF Header structure definition
struct ELF_HEADER {
  e_ident: array1byte (16),
  e_type: uint16,      // ET_EXEC, etc.
  e_machine: uint16,   // EM_X86_64, etc.
  e_entry: u64,        // Entry point
  e_phoff: u64,        // Program header offset
  e_shoff: u64,        // Section header offset
  e_flags: uint32,
  e_ehsize: uint16,
  e_phentsize: uint16,
  e_phnum: uint16,
  e_shentsize: uint16,
  e_shnum: uint16,
  e_shstrndx: uint16
}

// Section Header definition
struct SECTION_HEADER {
  sh_name: uint32,
  sh_type: uint32,
  sh_flags: u64,
  sh_addr: u64,
  sh_offset: u64,
  sh_size: u64,
  sh_link: uint32,
  sh_info: uint32,
  sh_addralign: u64,
  sh_entsize: u64
}

extern "C" fn fopen (path: &str, mode: &str): ptr<void)
extern "C" fn fread (ptr: ptr<void>, sz: size_t, nmemb: size_t, fp: ptr<void>): size_t
extern "C" fn fseek (fp: ptr<void>, offset: int, whence: int): int

// Reads and validates an ELF header
fun read_elf_header (fp: ptr<void>, hdr: ELF_HEADER): bool =
  var ident_read: size_t
  ident_read := fread (ptr cast (&hdr.e_ident), sizeof (array1byte (16)), 1, fp)
  if ident_read <> 1 then false else
  begin
    // Validate magic number (0x7f, 'E', 'L', 'F')
    hdr.e_ident[0] = 0x7f && hdr.e_ident[1] = 0x45 && hdr.e_ident[2] = 0x4c && hdr.e_ident[3] = 0x46
  end

// Validates structural integrity of the parsed header
fun validate_elf_structure (hdr: ELF_HEADER): bool =
  hdr.e_type = 2 && // ET_EXEC
  hdr.e_phentsize > 0 &&
  hdr.e_shentsize > 0 &&
  hdr.e_shnum > 0 &&
  hdr.e_phnum > 0

extern "C" fn parse_binary_integrity_report (path: &str): bool =
  var fp := fopen (path, "rb")
  if fp = 0 then false else
  begin
    var hdr: ELF_HEADER
    if read_elf_header (fp, hdr) && validate_elf_structure (hdr) then
    begin
      fclose (fp)
      true
    end
    else
    begin
      fclose (fp)
      false
    end
  end
