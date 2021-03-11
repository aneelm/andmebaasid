# andmebaasid

  - Tulenevalt kasutusjuhtude mudelist on vaja lisada olemitüüp Klient, sest klient peab saama süsteemi sisse logida. Kliendi all mõeldakse eraklienti. Kliendi üldistus on Isik. Klient ja Töötaja on Isiku rollid, st modelleerige Klient samamoodi nagu töövihikus on modelleeritud Töötaja. Näidake, et vastavad üldistusseosed moodustavad ühise üldistuste hulga (generalization set) ning täpsustage selle kitsendused. Näidake neid kitsendusi diagrammil. 
 - Lisage registrivaatesse pakett Klientide register ja paigutage olemitüüpi Klient esitav klass sellesse paketti. 
    - Leidke CASE projektist diagramm Äriarhitektuuri fragment (detailse projekti skoop) ning väljendage sellel, et X funktsionaalne allsüsteem vajab tööks Klientide registrit.
 - Tulenevalt kasutusjuhust Tuvasta kasutaja peab iga kliendi korral saama registreerida tema hetkeseisundi. Kui klient on ebasobivas seisundis, siis ta sisse logida ei saa. Kasutage selle olemi-suhte diagrammil kujutamiseks sama mustrit, mida rakendatakse isikute, töötajate ja X-de hetkeseisundi registreerimiseks.
    - Olemitüüp Kliendi_seisundi_liik tuleb paigutada paketti Klassifikaatorite register ning see tuleb esitada Klassifikaatorite registri olemi-suhte diagrammil. Üldistusseose modelleerimisel ärge unustage lisada seda olemitüübiga Klassifikaator seotud üldistuste hulka (generalization set).
 - 
