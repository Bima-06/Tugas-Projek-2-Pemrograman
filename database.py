import pymysql


class Database:
    def __init__(self):
        self.config = {
            "host": "localhost",
            "port": 3306,
            "user": "root",
            "password": "",
            "database": "peminjaman_alat",
            "charset": "utf8mb4",
            "cursorclass": pymysql.cursors.DictCursor,
            "autocommit": False,
        }

    def connect(self):
        try:
            return pymysql.connect(**self.config)
        except pymysql.err.OperationalError as e:
            raise ConnectionError(
                "Gagal terhubung ke MySQL. Pastikan service MySQL di XAMPP sudah berjalan "
                "dan database 'peminjaman_alat' tersedia."
            ) from e