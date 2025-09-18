import mysql.connector
import random
import string

DB_HOST = "217.16.16.6"   
DB_USER = "Leskina_user"             
DB_PASSWORD = "---"     #пароль для пользователя БД    
DB_NAME = "leskina_test_database"   

NUM_TABLES = 200
NUM_COLUMNS = 50
ROWS_PER_TABLE = 10 

def random_string(min_len=4, max_len=8):
    length = random.randint(min_len, max_len)
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

conn = mysql.connector.connect(
    host=DB_HOST,
    user=DB_USER,
    password=DB_PASSWORD,
    database=DB_NAME
)
cursor = conn.cursor()

for t in range(1, NUM_TABLES + 1):
    table_name = f"table_{t}"
   
    cols = ", ".join([f"col_{c} VARCHAR(8)" for c in range(1, NUM_COLUMNS + 1)])
    create_sql = f"CREATE TABLE IF NOT EXISTS {table_name} (id INT AUTO_INCREMENT PRIMARY KEY, {cols})"
    cursor.execute(create_sql)
    print(f"Создана таблица №{table_name}")

    for _ in range(ROWS_PER_TABLE):
        values = ", ".join(["%s"] * NUM_COLUMNS)
        insert_sql = f"INSERT INTO {table_name} ({', '.join([f'col_{c}' for c in range(1, NUM_COLUMNS+1)])}) VALUES ({values})"
        data = [random_string() for _ in range(NUM_COLUMNS)]
        cursor.execute(insert_sql, data)
    conn.commit()
    print(f"Заполнена  №{table_name}")

cursor.close()
conn.close()
print("Все таблицы созданы и заполнены!")
