from os import path


path

import mysql.connector

conexao = mysql.connector.connect(
    host='localhost',
    user='root',
    password='senai',
    database='livraria'
)

cursor = conexao.cursor()

nome = input("nome cliente: ")
cpf = int(input("cpf cliente: "))
rua = input("rua cliente: ")
bairro = input("bairro cliente: ")
cidade = input("cidade cliente: ")
estado = input("estado cliente: ")

comando_sql = f'INSERT INTO cliente 
(nome_cliente, CPF_cliente, rua_cliente, bairro_cliente, cidade_cliente, estado_cliente) 
VALUES 
("{nome}", "{cpf}", "{rua}", "{bairro}", "{cidade}", "{estado}");'
cursor.execute(comando_sql)

conexao.commit()


