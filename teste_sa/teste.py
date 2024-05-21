import mysql.connector
conexao = mysql.connector.connect(
    host='localhost',
    user='root',
    password='senai',
    database='teste_sa'
)

cursor = conexao.cursor()
nome = input('digite o nome: ')
codigo = input('digite o código: ')
comando_sql = f'INSERT INTO dados (nome, codigo) VALUES("{nome}", "{codigo}")'
cursor.execute(comando_sql)
conexao.commit()
cursor.close()

cursor = conexao.cursor()
codigo = input('digite o código para deletar: ')
comando_sql = f'DELETE FROM dados WHERE codigo= {codigo};'
cursor.execute(comando_sql)
conexao.commit()
cursor.close()
...