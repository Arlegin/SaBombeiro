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

app.post('/login', (req, res) => {
  const { cpf, password } = req.body;
  console.log(cpf, password);
  User.findOne({ cpf: cpf }).then(user => {
    if (user && user.senha === password) {
      req.session.loggedin = true;
      req.session.cpf = cpf;
      res.redirect('/menu.html');
      console.log(user);
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

app.get('/menuAdmin', (req, res) => {
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
  const newUser = new User({ cpf: cpf, nome: name, senha: password });
  newUser.save().then(() => {
    res.redirect('/register.html?success');
  }).catch(err => {
    console.error(err);
    res.redirect('/register.html?error');
  });
});

app.listen(3700, () => {
  console.log('Serivor rodando na porta 3700!');
});







