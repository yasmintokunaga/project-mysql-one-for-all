-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `nome_plano` VARCHAR(15) NOT NULL,
  `valor_plano` DECIMAL(5,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`nome_plano`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`pessoas_usuarias` (
  `pessoa_usuaria_id` INT NOT NULL AUTO_INCREMENT,
  `nome_pessoa_usuaria` VARCHAR(45) NOT NULL,
  `idade` INT UNSIGNED NOT NULL,
  `plano` VARCHAR(15) NULL,
  `data_assinatura` DATE NULL,
  `ativo` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`pessoa_usuaria_id`),
  INDEX `fk_plano_idx` (`plano` ASC) VISIBLE,
  CONSTRAINT `fk_plano`
    FOREIGN KEY (`plano`)
    REFERENCES `SpotifyClone`.`plano` (`nome_plano`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(155) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  INDEX `fk_artist_id_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_artist_id`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`artista_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `cancoes_id` INT NOT NULL AUTO_INCREMENT,
  `cancoes` VARCHAR(255) NOT NULL,
  `album_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  `duracao_segundos` INT UNSIGNED NOT NULL,
  `ano_lancamento` YEAR(4) NOT NULL,
  PRIMARY KEY (`cancoes_id`),
  INDEX `fk_artista_id_idx` (`artista_id` ASC) VISIBLE,
  INDEX `fk_album_id_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_album_id`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`album` (`album_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_artista_id`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico_de_reproducoes` (
  `pessoa_usuaria_id` INT NOT NULL,
  `data_reproducao` DATETIME NOT NULL,
  `cancoes_id` INT NOT NULL,
  PRIMARY KEY (`pessoa_usuaria_id`, `data_reproducao`),
  INDEX `fk_cancoes_id_idx` (`cancoes_id` ASC) VISIBLE,
  CONSTRAINT `fk_pessoa_usuaria_id`
    FOREIGN KEY (`pessoa_usuaria_id`)
    REFERENCES `SpotifyClone`.`pessoas_usuarias` (`pessoa_usuaria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cancoes_id`
    FOREIGN KEY (`cancoes_id`)
    REFERENCES `SpotifyClone`.`cancoes` (`cancoes_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguindo_artistas` (
  `pessoa_usuaria_id` INT NOT NULL,
  `artistas_id` INT NOT NULL,
  PRIMARY KEY (`pessoa_usuaria_id`, `artistas_id`),
  INDEX `fk_artistas_id_idx` (`artistas_id` ASC) VISIBLE,
  CONSTRAINT `fk_pessoa_usuaria_id_seguindo_artista`
    FOREIGN KEY (`pessoa_usuaria_id`)
    REFERENCES `SpotifyClone`.`pessoas_usuarias` (`pessoa_usuaria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artistas_id`
    FOREIGN KEY (`artistas_id`)
    REFERENCES `SpotifyClone`.`artista` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.plano (nome_plano, valor_plano) VALUES
	('gratuito', '0'),
	('familiar', '7.99'),
	('universitário', '5.99'),
	('pessoal', '6.99');

INSERT INTO SpotifyClone.pessoas_usuarias (nome_pessoa_usuaria, idade, plano, data_assinatura, ativo) VALUES
	('Barbara Liskov', '82', 'gratuito', '2019-10-20', '1'),
	('Robert Cecil Martin', '58', 'gratuito', '2017-01-06', '1'),
	('Ada Lovelace', '37', 'familiar', '2017-12-30', '1'),
	('Martin Fowler', '46', 'familiar', '2017-01-17', '1'),
	('Sandi Metz', '58', 'familiar', '2018-04-29', '1'),
	('Paulo Freire', '19', 'universitário', '2018-02-14', '1'),
	('Bell Hooks', '26', 'universitário', '2018-01-05', '1'),
	('Christopher Alexander', '85', 'pessoal', '2019-06-05', '1'),
	('Judith Butler', '45', 'pessoal', '2020-05-13', '1'),
	('Jorge Amado', '58', 'pessoal', '2017-02-17', '1');

INSERT INTO SpotifyClone.artista (artista) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

INSERT INTO SpotifyClone.album (album, artista_id) VALUES
	('Renaissance', '1'),
	('Jazz', '2'),
	('Hot Space', '2'),
	('Falso Brilhante', '3'),
	('Vento de Maio', '3'),
	('QVVJFA?', '4'),
	('Somewhere Far Beyond', '5'),
	('I Put A Spell On You', '6');

INSERT INTO SpotifyClone.cancoes (cancoes, album_id, artista_id, duracao_segundos, ano_lancamento) VALUES
	('Break My Soul', '1', '1', '279', '2022'),
	('Virgo\'S Groove', '1', '1', '369', '2022'),
	('Alien Superstar', '1', '1', '116', '2022'),
	('Don\'T Stop Me Now', '2', '2', '203', '1978'),
	('Under Pressure', '3', '2', '152', '1982'),
	('Como Nossos Pais', '4', '3', '105', '1998'),
	('O Medo De Amar É O Medo De Ser Livre', '5', '3', '207', '2001'),
	('Samba Em Paris', '6', '4', '267', '2003'),
	('The Bard\'S Song', '7', '5', '244', '2007'),
	('Feeling Good', '8', '6', '100', '2012');

INSERT INTO SpotifyClone.historico_de_reproducoes (pessoa_usuaria_id, data_reproducao, cancoes_id) VALUES
	('1', '2022-02-28 10:45:55', '8'),
	('1', '2020-05-02 05:30:35', '2'),
	('1', '2020-03-06 11:22:33', '10'),
	('2', '2022-08-05 08:05:17', '10'),
	('2', '2020-01-02 07:40:33', '7'),
	('3', '2020-11-13 16:55:13', '10'),
	('3', '2020-12-05 18:38:30', '2'),
	('4', '2021-08-15 17:10:10', '8'),
	('5', '2022-01-09 01:44:33', '8'),
	('5', '2020-08-06 15:23:43', '5'),
	('6', '2017-01-24 00:31:17', '7'),
	('6', '2017-10-12 12:35:20', '1'),
	('7', '2011-12-15 22:30:49', '4'),
	('8', '2012-03-17 14:56:41', '4'),
	('9', '2022-02-24 21:14:22', '9'),
	('10', '2015-12-13 08:30:22', '3');

INSERT INTO SpotifyClone.seguindo_artistas (pessoa_usuaria_id, artistas_id) VALUES
  ('1', '1'),
  ('1', '2'),
  ('1', '3'),
  ('2', '1'),
  ('2', '3'),
  ('3', '2'),
  ('4', '4'),
  ('5', '5'),
  ('5', '6'),
  ('6', '6'),
  ('6', '1'),
  ('7', '6'),
  ('9', '3'),
  ('10', '2');
