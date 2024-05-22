import express from 'express'
import conexao from '../infra/conexao.js'

const app = express()
app.use(express.json())

app.get('/clientes', (req, res) => {
    const sql = 'SELECT * FROM dados'
    conexao.query(sql, (erro, resultado) => {

        if (erro) {
            console.log(erro)
        }
        else {
            res.json(resultado)
        }
    })
})

app.get('/clientes/:id', (req, res) => {
    const id = req.params.id
    const sql = 'SELECT * FROM dados WHERE id_dados = ?'
    conexao.query(sql, id, (erro, resultado) => {
        if (erro) {
            console.log(erro)
        }
        else {
            res.json(resultado)
        }
    })
})

app.post('/clientes', (req, res) => {
    const nome = req.body
    const sql = 'INSERT INTO dados SET ?'
    conexao.query(sql, nome, (erro, resultado) => {
        if (erro) {
            console.log(erro)
        }
        else {
            res.json(resultado)
        }
    })
})

export default app