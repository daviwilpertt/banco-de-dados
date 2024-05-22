import mysql from 'mysql2'
const conexao = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'senai',
    database: 'teste_sa'
})

conexao.connect()

export default conexao