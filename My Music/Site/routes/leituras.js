// não mexa nestas 3 linhas!
var express = require('express');
var router = express.Router();
var banco = require('../app-banco');
// não mexa nessas 3 linhas!

router.get('/ultimas', function (req, res, next) {
  console.log(banco.conexao);
  banco.conectar().then(() => {
    var limite_linhas = 16;
    return banco.sql.query(`select top ${limite_linhas} 
                            *
                            from musica order by idMusica desc`);
  }).then(consulta => {

    console.log(`Resultado da consulta: ${JSON.stringify(consulta.recordset)}`);
    res.send(consulta.recordset);

  }).catch(err => {

    var erro = `Erro na leitura dos últimos registros: ${err}`;
    console.error(erro);
    res.status(500).send(erro);

  }).finally(() => {
    banco.sql.close();
  });

});

router.post('/cadastrar', function (req, res, next) {

  banco.conectar().then(() => {
    console.log(`Chegou p/ login: ${JSON.stringify(req.body)}`);
    var titulo = req.body.titulo; 
    var artista= req.body.artista; 
    var genero = req.body.genero; 
    var album= req.body.album; 
    var ano = req.body.ano; 

    console.log(titulo, artista, genero, album, ano)

    return banco.sql.query(`
                        insert into musica values 
                        ('${titulo}', '${artista}', '${genero}', '${album}', '${ano}');
    `);
  }).then(consulta => {

      res.sendStatus(201);

  }).catch(err => {

    console.error(err);
    res.status(500).send(erro);

  }).finally(() => {
    banco.sql.close();
  });

});

// não mexa nesta linha!
module.exports = router;
