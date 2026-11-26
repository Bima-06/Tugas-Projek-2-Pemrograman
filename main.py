from controllers.sistem_peminjaman import SistemPeminjaman
from ui.menu_ui import MenuUI

def main() -> None:
    try:
        sistem = SistemPeminjaman()
        ui = MenuUI(sistem)
        ui.jalankan()
    except ConnectionError as e:
        print(f"\n[Error Koneksi] {e}")

if __name__ == "__main__":
    main()