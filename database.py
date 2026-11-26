import pymysql


class Database:
    def __init__(self):
        self.config = {
            "host": "localhost",
            "port": 3306,
            "user": "root",
            "password": "",  # Kosong secara default di XAMPP
            "database": "peminjaman_alat",
            "charset": "utf8mb4",
            "cursorclass": pymysql.cursors.DictCursor,
            "autocommit": False,
        }

    def connect(self):
        return pymysql.connect(**self.config)