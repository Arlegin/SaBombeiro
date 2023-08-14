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
  database: ''
});

connection.connect(function (err) {
  console.log("Conexão com o Banco realizada com sucesso!!!")
});


// app.post('/register', (req, res) => {
//     let email = req.body.email;
//     let password = req.body.password;
//     let name = req.body.name;
  
//     connection.query('INSERT INTO `kp_user` (`id_user`, `name`, `email`, `password`, `cpf`, `phone`) VALUES (NULL, ?, ?, ?, NULL, NULL)', [name, email, password], function (err, rows, fields) {
//       if (!err) {
//         req.session.id_user = email; // ID do usuário inserido no banco de dados
//         res.redirect('/personalInfo.html'); // Redireciona para a página 'personalInfo.html' após o registro
//       } else {
//         console.log("Erro: Consulta não realizada", err);
//       }
//     });
// });

app.listen(3700, () => {
    console.log('Servidor rodando na porta 3700!');
    console.log('Para reiniciar o servidor, digite "rs" e tecle "Enter"!');
  });