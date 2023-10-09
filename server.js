const oneDay = 1000 * 60 * 60 * 24;
const cookieParser = require("cookie-parser");
const sessions = require('express-session');
const express = require('express');
const mysql = require('mysql2');
const app = express();
const cors = require('cors');

app.use(cors()); // Habilita o CORS para permitir solicitações de diferentes origens
app.use(express.static('css')); // Serve arquivos estáticos da pasta 'css'
app.use(express.static('assets')); // Serve arquivos estáticos da pasta 'assets'
app.use(express.static('html')); // Serve arquivos estáticos da pasta 'html'
app.use(express.static('js')); // Serve arquivos estáticos da pasta 'js'

app.use(sessions({
  secret: "thisismysecrctekeyfhrgfgrfrty84fwir767", // Chave secreta usada para assinar as sessões
  saveUninitialized: true,
  cookie: { maxAge: oneDay }, // Configura o tempo de vida do cookie da sessão para um dia
  resave: false
}));

app.use(cookieParser()); // Analisa cookies recebidos nas requisições
app.use(express.json()); // Analisa o corpo da requisição como JSON
app.use(express.urlencoded({ extended: true })); // Analisa o corpo da requisição codificado em URL

app.use((req, res, next) => {
  // Qual site tem permissão de realizar a conexão, no exemplo abaixo está o "*" indicando que qualquer site pode fazer a conexão
  res.header("Access-Control-Allow-Origin", "*");
  // Quais são os métodos que a conexão pode realizar na API
  res.header("Access-Control-Allow-Methods", 'GET,PUT,POST,DELETE');
  next();
});

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  // user: 'adm',
  // password: 'adm',
  database: 'sabombeiro'
});

connection.connect(function (err) {
  console.log("Conexão com o Banco realizada com sucesso!!!")
});

// login
app.post('/login', (req, res) => {
  const { cpf, password } = req.body;
  connection.query(`SELECT * FROM login WHERE cpf = '${cpf}' AND senha = '${password}'`, function (err, rows) {
    if (err) {
      console.error(err);
      res.status(500).send('Internal Server Error');
      return;
    }
    if (rows.length > 0) {
      session = req.session;
      req.session.loggedin = true;
      req.session.cpf = cpf;
      res.redirect('/menu.html');
    } else {
      res.redirect('/login.html?invalid');
    }
  });
});

// Send firefighter name to client-side script
app.get('/menu', (req, res) => {
  connection.query(`SELECT nome FROM login WHERE cpf = '${req.session.cpf}'`, function (err, rows) {
    if (err) {
      console.error(err);
      res.status(500).send('Internal Server Error');
      return;
    }
    res.status(200).json({ name: rows[0].nome });
  });
});

app.listen(3700, () => {
  console.log('Servidor rodando na porta 3700!');
  console.log('Para reiniciar o servidor, digite "rs" e tecle "Enter"!');
});