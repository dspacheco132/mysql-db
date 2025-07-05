import os
import mysql.connector
from datetime import datetime
import random

POSTO_ID = int(os.environ.get("POSTO_ID", 1))
DB_CONFIG = {
    'host': os.environ.get("MYSQL_HOST", "mysql"),
    'user': os.environ.get("MYSQL_USER", "latomais_user"),
    'password': os.environ.get("MYSQL_PASSWORD", "securepassword"),
    'database': os.environ.get("MYSQL_DATABASE", "latomais_db")
}

def conectar():
    return mysql.connector.connect(**DB_CONFIG)

def simular_deposito(lavrador_id, quantidade):
    classificacao = random.choice(['A', 'B', 'C', 'D'])
    agora = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    conn = conectar()
    cursor = conn.cursor()

    sql = """
    INSERT INTO DepositoLeite (lavrador_id, posto_id, data_hora, quantidade_litros, classificacao)
    VALUES (%s, %s, %s, %s, %s)
    """
    dados = (lavrador_id, POSTO_ID, agora, quantidade, classificacao)
    cursor.execute(sql, dados)

    conn.commit()
    cursor.close()
    conn.close()

    print(f"✅ Depósito registado: Lavrador {lavrador_id}, {quantidade}L, Classificação {classificacao}, Posto {POSTO_ID}")

if __name__ == "__main__":
    lavrador_id = int(input("ID do lavrador: "))
    quantidade = float(input("Quantidade de leite (litros): "))
    simular_deposito(lavrador_id, quantidade)
