import psycopg2

class Auth:
    def __init__(self, dbname, user, password):
        self.conn = psycopg2.connect(
            dbname=dbname,
            user=user,
            password=password
        )
        self.cursor = self.conn.cursor()

    def execute_query(self, query):
        self.cursor.execute(query)
        self.conn.commit()

    def execute_select_query(self, query, f_all=True):
        self.cursor.execute(query)
        if f_all:
            data = self.cursor.fetchall()
        else:
            data = self.cursor.fetchone()
        return data

    def __del__(self):
        self.conn.close()
