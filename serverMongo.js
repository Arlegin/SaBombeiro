const oneDay = 1000 * 60 * 60 * 24;
const cookieParser = require("cookie-parser");
const sessions = require('express-session');
const express = require('express');
const mongoose = require('mongoose');
const app = express();
const cors = require('cors');

app.use(cors());
app.use(express.static('css'));
app.use(express.static('assets'));
app.use(express.static('html'));
app.use(express.static('js'));
app.use(sessions({
  secret: "thisismysecrctekeyfhrgfgrfrty84fwir767",
  saveUninitialized: true,
  cookie: { maxAge: oneDay },
  resave: false
}));
app.use(cookieParser());
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ limit: '50mb', extended: true }));
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", 'GET,PUT,POST,DELETE');
  next();
});

DB_URL = 'mongodb://127.0.0.1:27017/bombeiroMongo';

mongoose.set('debug', true);

mongoose.connect(DB_URL);
const conn = mongoose.connection;

conn.once('open', () => {
  console.log('Conexão estabelecida com o MongoDB!');
}
);

conn.on('error', (error) => {
  console.log('Erro de conexão: ' + error);
  process.exit();
}
);

const User = mongoose.model('usuarios', new mongoose.Schema({
  cpf: String,
  nome: String,
  senha: String,
  administrador: Boolean
}));

const Ocorrencia = mongoose.model('ocorrencias', new mongoose.Schema({}, { strict: false }));

app.get('/checkLogin', (req, res) => {
  res.json({ loggedin: req.session.loggedin });
});

app.post('/login', (req, res) => {
  const { cpf, password } = req.body;
  User.findOne({ cpf: cpf }).then(user => {
    if (user && user.senha === password) {
      req.session.loggedin = true;
      req.session.cpf = cpf;
      req.session.name = user.nome;
      if (user.administrador) {
        res.redirect('/menuAdmin.html');
      } else {
        res.redirect('/menu.html');
      }
    } else {
      res.redirect('/login.html?invalid');
    }
  }).catch(err => {
    console.error(err);
    res.status(500).send('Internal Server Error');
  });
});

app.get('/logout', (req, res) => {
  req.session.destroy();
  res.redirect('/login.html');
});

app.get('/menu', (req, res) => {
  if (req.session.loggedin) {
    User.findOne({ cpf: req.session.cpf }).then(user => {
      const result = {
        name: user.nome,
        admin: user.administrador,
        loggedin: true
      };
      res.json(result);
    }).catch(err => {
      console.error(err);
      res.json({ loggedin: false });
    });
  } else {
    res.json({ loggedin: false });
  }
});

app.post('/register', (req, res) => {
  const { cpf, name, password } = req.body;
  const newUser = new User({ cpf: cpf, nome: name, senha: password, administrador: false });
  newUser.save().then(() => {
    res.redirect('/register.html?success');
  }).catch(err => {
    console.error(err);
    res.redirect('/register.html?error:' + err);
  });
});

let dailyId = 0;
let currentDay = new Date().getDate();

app.post('/form', (req, res) => {
  // Verifique se o dia atual mudou
  const today = new Date().getDate();
  if (today !== currentDay) {
    // Se o dia mudou, reinicie o dailyId e atualize o currentDay
    dailyId = 0;
    currentDay = today;
  }

  // Incremente o dailyId
  dailyId++;

  // Os dados serão enviados no corpo da requisição
  const data = req.body;

  // Adicione o dailyId ao JSON
  data.dailyId = dailyId;

  // Adicione o cpf e nome do usuário ao JSON
  data.cpfUser = req.session.cpf;
  data.nomeUser = req.session.name;

  // Crie uma nova ocorrência com os dados recebidos
  const newOcorrencia = new Ocorrencia(data);

  // Salve a nova ocorrência no banco de dados
  newOcorrencia.save().then(() => {
    res.status(200).send('Ocorrência criada com sucesso!');
  }).catch(err => {
    console.error(err);
    res.status(500).send('Erro ao criar a ocorrência');
  });
});

// Criar uma rota para /api/usuarios
app.get('/api/usuarios', (req, res) => {
  // Buscar o usuário no banco de dados pelo cpf
  User.findOne({ cpf: req.session.cpf }).then(user => {
    // Criar um objeto com o nome do usuário
    let usuario = {
      name: user.nome
    };
    // Enviar o objeto como resposta em formato JSON
    res.json(usuario);
  }).catch(err => {
    // Tratar o erro
    console.error(err);
    res.status(500).send('Erro ao buscar o usuário');
  });
});

app.get('/occurrenceHistory', async (req, res) => {
  try {
    const ocorrencias = await Ocorrencia.find({}, '_id dailyId info_paciente.dateInput');
    res.json(ocorrencias);
    console.log(ocorrencias);
  } catch (err) {
    res.status(500).send(err);
  }
});

// Get all occurrence data and send to occurrence.html
app.get('/occurrence', async (req, res) => {
  try {
    const ocorrencias = await Ocorrencia.find({}, '-_id');
    console.log(ocorrencias);
    res.json(ocorrencias);
  } catch (err) {
    res.status(500).send(err);
  }
});

app.listen(3700, () => {
  console.log('Serivor rodando na porta 3700!');
});







