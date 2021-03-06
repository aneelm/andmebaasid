DROP TABLE [Tootaja]
;

DROP TABLE [Laua_kategooria_omamine]
;

DROP TABLE [Laud]
;

DROP TABLE [Klient]
;

DROP TABLE [Isik]
;

DROP TABLE [Amet]
;

DROP TABLE [Isiku_seisundi_liik]
;

DROP TABLE [Kliendi_seisundi_liik]
;

DROP TABLE [Laua_kategooria]
;

DROP TABLE [Laua_kategooria_tyyp]
;

DROP TABLE [Laua_seisundi_liik]
;

DROP TABLE [Laua_varvus]
;

DROP TABLE [Riik]
;

DROP TABLE [Tootaja_seisundi_liik]
;

CREATE TABLE [Tootaja]
(
	[isik_id] Short NOT NULL,
	[amet_kood] Text(50) NOT NULL,
	[mentor_id] Short,
	[tootaja_seisundi_liik_kood] Short NOT NULL DEFAULT 1
)
;

CREATE TABLE [Laua_kategooria_omamine]
(
	[laua_kood] Short NOT NULL,
	[laua_kategooria_kood] Text(50) NOT NULL
)
;

CREATE TABLE [Laud]
(
	[laua_kood] Short NOT NULL,
	[isik_id] Short NOT NULL,
	[laua_seisundi_liik_kood] Short NOT NULL DEFAULT 1,
	[laua_v�rvus_kood] Text(50) NOT NULL,
	[kommentaar] Text(50) NOT NULL,
	[reg_aeg] timestamp NOT NULL DEFAULT Now(),
	[suurus] Short NOT NULL
)
;

CREATE TABLE [Klient]
(
	[isik_id] Short NOT NULL,
	[kliendi_seisundi_liik_kood] Short NOT NULL DEFAULT 1,
	[on_nous_tylitamisega] YesNo NOT NULL DEFAULT No
)
;

CREATE TABLE [Isik]
(
	[isik_id] Short NOT NULL,
	[isikukoodi_riik] Text(3) NOT NULL,
	[isiku_seisundi_liik_kood] Short NOT NULL DEFAULT 1,
	[e_meil] Text(254) NOT NULL,
	[eesnimi] Text(254),
	[elukoht] Text(254),
	[isikukood] Text(50) NOT NULL,
	[parool] Text(254) NOT NULL,
	[perenimi] Text(254),
	[reg_aeg] date NOT NULL DEFAULT Now(),
	[synni_kp] date NOT NULL
)
;

CREATE TABLE [Amet]
(
	[kood] Text(50) NOT NULL,
	[kirjeldus] Text(50),
	[nimetus] Text(50) NOT NULL
)
;

CREATE TABLE [Isiku_seisundi_liik]
(
	[kood] Short NOT NULL,
	[nimetus] Text(50) NOT NULL
)
;

CREATE TABLE [Kliendi_seisundi_liik]
(
	[kood] Short NOT NULL,
	[nimetus] Text(50) NOT NULL
)
;

CREATE TABLE [Laua_kategooria]
(
	[laua_kategooria_kood] Text(50) NOT NULL,
	[laua_kategooria_tyyp_kood] Text(50) NOT NULL,
	[nimetus] Text(50) NOT NULL
)
;

CREATE TABLE [Laua_kategooria_tyyp]
(
	[laua_kategooria_tyyp_kood] Text(50) NOT NULL,
	[nimetus] Text(50) NOT NULL
)
;

CREATE TABLE [Laua_seisundi_liik]
(
	[kood] Short NOT NULL,
	[nimetus] Text(50) NOT NULL
)
;

CREATE TABLE [Laua_varvus]
(
	[kood] Text(50) NOT NULL,
	[nimetus] Text(50) NOT NULL
)
;

CREATE TABLE [Riik]
(
	[kood] Text(3) NOT NULL,
	[nimetus] Text(50) NOT NULL
)
;

CREATE TABLE [Tootaja_seisundi_liik]
(
	[kood] Short NOT NULL,
	[nimetus] Text(50) NOT NULL
)
;

CREATE INDEX [IXFK_Mentor] ON [Tootaja] ([mentor_id] ASC)
;

CREATE INDEX [IXFK_Tootaja_Amet] ON [Tootaja] ([tootaja_seisundi_liik_kood] ASC)
;

CREATE INDEX [IXFK_Tootaja_Isik] ON [Tootaja] ([isik_id] ASC)
;

ALTER TABLE [Tootaja] ADD CONSTRAINT [PK_Tootaja]
	PRIMARY KEY ([isik_id])
;

CREATE INDEX [IXFK_Laua_kategooria_omamine_Laua_kategooria] ON [Laua_kategooria_omamine] ([laua_kategooria_kood] ASC)
;

CREATE INDEX [IXFK_Laua_kategooria_omamine_Laud] ON [Laua_kategooria_omamine] ([laua_kood] ASC)
;

ALTER TABLE [Laua_kategooria_omamine] ADD CONSTRAINT [PK_Laua_kategooria_omamine]
	PRIMARY KEY ([laua_kood],[laua_kategooria_kood])
;

CREATE INDEX [IXFK_Laud_Laua_seisundi_liik] ON [Laud] ([laua_seisundi_liik_kood] ASC)
;

CREATE INDEX [IXFK_Laud_Laua_varvus] ON [Laud] ([laua_v�rvus_kood] ASC)
;

CREATE INDEX [IXFK_Laud_Tootaja] ON [Laud] ([isik_id] ASC)
;

ALTER TABLE [Laud] ADD CONSTRAINT [PK_Laud]
	PRIMARY KEY ([laua_kood])
;

CREATE INDEX [IXFK_Klient_Isik] ON [Klient] ([isik_id] ASC)
;

CREATE INDEX [IXFK_Klient_Kliendi_seisundi_liik] ON [Klient] ([kliendi_seisundi_liik_kood] ASC)
;

ALTER TABLE [Klient] ADD CONSTRAINT [PK_Klient]
	PRIMARY KEY ([isik_id])
;

CREATE INDEX [IXFK_Isik_Isiku_seisundi_liik] ON [Isik] ([isiku_seisundi_liik_kood] ASC)
;

CREATE INDEX [IXFK_Isik_Riik] ON [Isik] ([isikukoodi_riik] ASC)
;

ALTER TABLE [Isik] ADD CONSTRAINT [PK_Isik]
	PRIMARY KEY ([isik_id])
;

ALTER TABLE [Isik] ADD CONSTRAINT [AK_Isik_e_meil] UNIQUE ([e_meil])
;

ALTER TABLE [Isik] ADD CONSTRAINT [AK_Isik_isikukood] UNIQUE ([isikukood])
;

ALTER TABLE [Amet] ADD CONSTRAINT [PK_Amet]
	PRIMARY KEY ([kood])
;

ALTER TABLE [Isiku_seisundi_liik] ADD CONSTRAINT [PK_Isiku_seisundi_liik]
	PRIMARY KEY ([kood])
;

ALTER TABLE [Kliendi_seisundi_liik] ADD CONSTRAINT [PK_Kliendi_seisundi_liik]
	PRIMARY KEY ([kood])
;

CREATE INDEX [IXFK_Laua_kategooria_Laua_kategooria_tyyp] ON [Laua_kategooria] ([laua_kategooria_tyyp_kood] ASC)
;

ALTER TABLE [Laua_kategooria] ADD CONSTRAINT [PK_Laua_kategooria]
	PRIMARY KEY ([laua_kategooria_kood])
;

ALTER TABLE [Laua_kategooria_tyyp] ADD CONSTRAINT [PK_Laua_kategooria_tyyp]
	PRIMARY KEY ([laua_kategooria_tyyp_kood])
;

ALTER TABLE [Laua_seisundi_liik] ADD CONSTRAINT [PK_Laua_seisundi_liik]
	PRIMARY KEY ([kood])
;

ALTER TABLE [Laua_varvus] ADD CONSTRAINT [PK_Laua_varvus]
	PRIMARY KEY ([kood])
;

ALTER TABLE [Riik] ADD CONSTRAINT [PK_Riik]
	PRIMARY KEY ([kood])
;

ALTER TABLE [Tootaja_seisundi_liik] ADD CONSTRAINT [PK_Tootaja_seisundi_liik]
	PRIMARY KEY ([kood])
;

ALTER TABLE [Tootaja] ADD CONSTRAINT [FK_Tootaja_Isik]
	FOREIGN KEY ([isik_id]) REFERENCES [Isik] ([isik_id]) ON DELETE Cascade ON UPDATE Cascade
;

ALTER TABLE [Tootaja] ADD CONSTRAINT [FK_Tootaja_Amet]
	FOREIGN KEY ([amet_kood]) REFERENCES [Amet] ([kood]) ON UPDATE Cascade
;

ALTER TABLE [Tootaja] ADD CONSTRAINT [FK_Tootaja_Tootaja_seisundi_liik]
	FOREIGN KEY ([tootaja_seisundi_liik_kood]) REFERENCES [Tootaja_seisundi_liik] ([kood]) ON UPDATE Cascade
;

ALTER TABLE [Tootaja] ADD CONSTRAINT [FK_Mentor]
	FOREIGN KEY ([mentor_id]) REFERENCES [Tootaja] ([isik_id]) ON UPDATE Cascade
;

ALTER TABLE [Laua_kategooria_omamine] ADD CONSTRAINT [FK_Laua_kategooria_omamine_Laud]
	FOREIGN KEY ([laua_kood]) REFERENCES [Laud] ([laua_kood]) ON UPDATE Cascade
;

ALTER TABLE [Laua_kategooria_omamine] ADD CONSTRAINT [FK_Laua_kategooria_omamine_Laua_kategooria]
	FOREIGN KEY ([laua_kategooria_kood]) REFERENCES [Laua_kategooria] ([laua_kategooria_kood]) ON UPDATE Cascade
;

ALTER TABLE [Laud] ADD CONSTRAINT [FK_Laud_Laua_varvus]
	FOREIGN KEY ([laua_v�rvus_kood]) REFERENCES [Laua_varvus] ([kood]) ON DELETE Cascade ON UPDATE Cascade
;

ALTER TABLE [Laud] ADD CONSTRAINT [FK_Laud_Tootaja]
	FOREIGN KEY ([isik_id]) REFERENCES [Tootaja] ([isik_id]) ON DELETE Cascade ON UPDATE Cascade
;

ALTER TABLE [Laud] ADD CONSTRAINT [FK_Laud_Laua_seisundi_liik]
	FOREIGN KEY ([laua_seisundi_liik_kood]) REFERENCES [Laua_seisundi_liik] ([kood]) ON UPDATE Cascade
;

ALTER TABLE [Klient] ADD CONSTRAINT [FK_Klient_Isik]
	FOREIGN KEY ([isik_id]) REFERENCES [Isik] ([isik_id]) ON DELETE Cascade ON UPDATE Cascade
;

ALTER TABLE [Klient] ADD CONSTRAINT [FK_Klient_Kliendi_seisundi_liik]
	FOREIGN KEY ([kliendi_seisundi_liik_kood]) REFERENCES [Kliendi_seisundi_liik] ([kood]) ON UPDATE Cascade
;

ALTER TABLE [Isik] ADD CONSTRAINT [FK_Isik_Isiku_seisundi_liik]
	FOREIGN KEY ([isiku_seisundi_liik_kood]) REFERENCES [Isiku_seisundi_liik] ([kood]) ON DELETE Cascade ON UPDATE Cascade
;

ALTER TABLE [Isik] ADD CONSTRAINT [FK_Isik_Riik]
	FOREIGN KEY ([isikukoodi_riik]) REFERENCES [Riik] ([kood]) ON DELETE Cascade ON UPDATE Cascade
;

ALTER TABLE [Laua_kategooria] ADD CONSTRAINT [FK_Laua_kategooria_Laua_kategooria_tyyp]
	FOREIGN KEY ([laua_kategooria_tyyp_kood]) REFERENCES [Laua_kategooria_tyyp] ([laua_kategooria_tyyp_kood]) ON UPDATE Cascade
;
