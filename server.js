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
      console.log(rows[0]);
    } else {
      res.redirect('/login.html?invalid');
    }
  });
});

app.get('/logout', (req, res) => {
  req.session.destroy();
  res.redirect('/login.html');
});

// Send firefighter name to client-side script
app.get('/menu', (req, res) => {
  if (req.session.loggedin) {
    connection.query(`SELECT nome FROM login WHERE cpf = '${req.session.cpf}'`, function (err, rows) {
      if (err) {
        console.error(err);
        res.json({ loggedin: false });
        return;
      }
      res.json({ name: rows[0].nome, loggedin: true });
    });
  } else {
    res.json({ loggedin: false });
  }
});

app.get('/menuAdmin', (req, res) => {
  if (req.session.loggedin) {
    connection.query(`SELECT * FROM login WHERE cpf = '${req.session.cpf}'`, function (err, rows) {
      if (err) {
        console.error(err);
        res.json({ loggedin: false });
        return;
      }
      const result = {
        name: rows[0].nome,
        admin: rows[0].administrador,
        loggedin: true
      };
      res.json(result);
    });
  } else {
    res.json({ loggedin: false });
  }
});

// Register new firefighter
app.post('/register', (req, res) => {
  const { cpf, name, password } = req.body;
  connection.query(`INSERT INTO login (cpf, nome, senha) VALUES ('${cpf}', '${name}', '${password}')`, function (err, rows) {
    if (err) {
      console.error(err);
      // Show a popup error message on the register page
      res.redirect('/register.html?error');
      return;
    }
    // Show a popup success message on the register page
    res.redirect('/register.html?success');
  });
});

// Receive form from occurrenceType.html and print it on the console
app.post('/occurrence', function(req, res) {
  console.log(req.body);
  res.send('Received the data.');
});

app.post('/saveData', (req, res) => {
  // Supondo que 'data' é o objeto JSON que você deseja armazenar
  const { data } = req.body;

  // Converta o objeto JSON em uma string
  const jsonData = JSON.stringify(data);

  // Insira a string JSON no banco de dados
  connection.query(`INSERT INTO ferimentos (trauma) VALUES ('${jsonData}')`, function (err, rows) {
    if (err) {
      console.error(err);
      res.status(500).send('Internal Server Error');
      return;
    }
    res.send('Dados salvos com sucesso!');
  });
});

app.listen(3700, () => {
  console.log('Servidor rodando na porta 3700!');
  console.log('Para reiniciar o servidor, digite "rs" e tecle "Enter"!');
});