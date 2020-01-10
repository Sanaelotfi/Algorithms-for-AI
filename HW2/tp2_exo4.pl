% ________ questions pour deviner une personne ___________

ask(vivant,X):-
    format('~w est vivant(e) ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(femme,X):-
    format('~w est une femme ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.
    
ask(artiste,X):-
    format('~w est un(e) artiste ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(jeux_video,X):-
    format('~w cree(e) des jeux videos ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(pape,X):-
    format('~w est pape ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(chanteur,X):-
    format('~w est chanteur/chanteuse ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(gouverne,X):-
    format('~w gouverne un pays ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.
    
ask(gouverne_usa,X):-
    format('~w gouverne les USA ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(gouverne_egypte,X):-
    format('~w gouverne l egypte ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(gouverne_cinq_ans,X):-
    format('~w a-t-il gouverne plus que 5 ans ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(fictif,X):-
    format('~w est fictif ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(religion,X):-
    format('~w est une personnalite religieuse ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(ecrivain,X):-
    format('~w est un ecrivain ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(acteur,X):-
    format('~w est un(e) acteur/actrice ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.
    
ask(realisateur,X):-
    format('~w realise des films ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(personnage_jeux_video,X):-
    format('~w est-il un personnage de jeux videos ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(ressucite,X):-
    format('~w a-t-il ressucite ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

% ________ questions pour deviner une un objet ___________

ask(cuisine,X):-
    format('~w se trouve-t-il dans la cuisine ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(appareil_electromenager,X):-
    format('~w est un appareil electromenager ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.


ask(vaisselle,X):-
    format('~w fait partie de la vaisselle ? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(meuble,X):-
    format('~w est un meuble? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(nettoyant,X):-
    format('~w sert a nettoyer? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(branche,X):-
    format('~w doit-il etre branche pour fonctionner? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(portable,X):-
    format('~w est portable a l exterieur de la maison? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(instrument_musique,X):-
    format('~w est un instrument de musique? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(plante,X):-
    format('~w est une plante? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(cuisson_aliments,X):-
    format('~w peut etre utilise dans la cuisson aliments? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(preparer_cafe,X):-
    format('~w peut etre utilise pour preparer le cafe? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(couvert,X):-
    format('~w est-il un couvert de table? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(nettoyant_sol,X):-
    format('~w peut etre utilise pour nettoyer le sol? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(eclairage,X):-
    format('~w peut etre utilise pour eclairage? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(telephoner,X):-
    format('~w peut etre utilise pour telephoner? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(conteneur,X):-
    format('~w sert-il a contenir des objets? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(ouvrir_porte,X):-
    format('~w est utilise pour ouvrir la porte? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(table_cuisson,X):-
    format('~w comporte une table de cuisson? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(nettoyant_electrique,X):-
    format('~w est-il electrique? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(ranger_billets,X):-
    format('~w sert-il a ranger des billets? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

ask(couvercle,X):-
    format('~w possede-t-il un couvercle? ',[X]),
    read(Reponse),
    Reponse = 'oui'.

% ________construction de l arbre pour les personnes ____________

personne(X) :- etat(X).

etat(X) :-
    ask(vivant,X),
    vivant_tree(X),
    vivant(X).

etat(X) :-
    non_vivant_tree(X),                                
    \+ vivant(X).

vivant_tree(X) :-
    ask(femme,X),
    femme_tree(X),
    femme(X).

vivant_tree(X) :-
    ask(artiste, X),
    artiste_tree(X),
    artiste(X).
    
vivant_tree(X) :-
    ask(jeux_video, X),
    jeux_video(X).

vivant_tree(X) :-
    ask(gouverne, X),
    chef_etat_vivant(X).

vivant_tree(X) :-
    ask(pape, X),
    pape(X).

vivant_tree(X) :-
    pilote_vivant(X).

non_vivant_tree(X) :-
    ask(gouverne, X),
    gouverne_tree(X).

non_vivant_tree(X) :-
    ask(fictif, X),
    fictif_tree(X).

non_vivant_tree(X) :-
    ask(religion, X),
    religieux_tree(X).

non_vivant_tree(X) :-
    ask(chanteur, X),
    chanteur_record(X).

non_vivant_tree(X) :-
    ask(ecrivain, X),
    dramaturge(X).

non_vivant_tree(X) :-
    pilote_non_vivant(X).

femme_tree(X) :-
    ask(ecrivain, X),
    ecrivain_potter(X).

femme_tree(X) :-
    ask(chanteur, X),
    chanteur_star(X).

femme_tree(X) :-
    acteur_h_games(X).

artiste_tree(X) :-
    ask(acteur, X),
    acteur(X).

artiste_tree(X) :-
    ask(realisateur, X),
    realisateur(X).

artiste_tree(X) :-
    anonyme(X).
    
gouverne_tree(X) :-
    ask(gouverne_usa, X),
    gouverne_usa_tree(X).

gouverne_tree(X) :-
    ask(gouverne_egypte,X),
    gouverne_egypte(X).

gouverne_tree(X) :-
    gouverne_russie(X).

gouverne_usa_tree(X) :-
    ask(gouverne_cinq_ans, X),
    gouverne_usa_cinq_ans(X).

gouverne_usa_tree(X) :-
    richard_nixon(X).
    
fictif_tree(X) :-
    ask(personnage_jeux_video, X),
    perso_jeux_video_tree(X).

fictif_tree(X) :-
    espion(X).

perso_jeux_video_tree(X) :-
    ask(femme, X),
    perso_jeux_video(X).
    
perso_jeux_video_tree(X) :-
    plombier(X).
    
religieux_tree(X) :-
    ask(ressucite, X),
    ressucite(X).

religieux_tree(X) :-
    moise(X).

% ________construction de l arbre pour les objets ____________



objet(X) :- lieu(X).

lieu(X) :-
    ask(cuisine,X), 
    cuisine_tree(X),
    cuisine(X).

lieu(X) :-
    non_cuisine_tree(X),                                
    \+ cuisine(X).

cuisine_tree(X) :-
    ask(appareil_electromenager,X),
    appareil_electromenager_tree(X),
    appareil_electromenager(X).

cuisine_tree(X) :-
    ask(vaisselle,X),
    vaisselle_tree(X),
    vaisselle(X).

cuisine_tree(X) :-
    ask(meuble,X),
    meuble(X).

cuisine_tree(X) :-
    nettoyant_cuisine(X).

non_cuisine_tree(X) :-
    ask(nettoyant,X),
    nettoyant_tree(X),
    nettoyant(X).

non_cuisine_tree(X) :-
    ask(branche,X),
    branche_tree(X),
    branche(X).

non_cuisine_tree(X) :-
    ask(portable,X),
    portable_tree(X),
    portable(X).

non_cuisine_tree(X) :-
    ask(instrument_musique,X),
    instrument_musique(X).

non_cuisine_tree(X) :-
    ask(plante,X),
    plante(X).

non_cuisine_tree(X) :-
    dormir(X).

appareil_electromenager_tree(X) :-
    ask(cuisson_aliments,X),
    cuisson_aliments_tree(X),
    cuisson_aliments(X).

appareil_electromenager_tree(X) :-
    ask(preparer_cafe,X),
    preparer_cafe(X).

appareil_electromenager_tree(X) :-
    griller_pain(X).

vaisselle_tree(X) :-
    ask(couvert,X),
    couvert(X).

vaisselle_tree(X) :-
    ask(couvercle,X),
    casserole(X).

vaisselle_tree(X) :-
    assiette(X).

nettoyant_tree(X) :-
    ask(nettoyant_sol,X),
    nettoyant_sol_tree(X),
    nettoyant_sol(X).

nettoyant_tree(X) :-
    shamp(X).

branche_tree(X) :-
    ask(eclairage,X),
    eclairage(X).

branche_tree(X) :-
    ask(telephoner,X),
    telephoner(X).

branche_tree(X) :-
    ordi(X).

portable_tree(X) :-
    ask(conteneur,X),
    conteneur_tree(X),
    conteneur(X).

portable_tree(X) :-
    ask(ouvrir_porte,X),
    ouvrir_porte(X).

portable_tree(X) :-
    papier(X).

cuisson_aliments_tree(X) :-
    ask(table_cuisson,X),
    table_cuisson(X).

cuisson_aliments_tree(X) :-
    four(X).

nettoyant_sol_tree(X) :-
    ask(nettoyant_electrique,X),
    nettoyant_electrique(X).

nettoyant_sol_tree(X) :-
    balai(X).

conteneur_tree(X) :-
    ask(ranger_billets,X),
    ranger_billets(X).

conteneur_tree(X) :-
    sac_a_dos(X).

% _________ base de connaissances pour les personnes _________

% personnes vivantes, n inclut pas les fictifs

vivant(mikhail_gorbachev).
vivant(jennifer_lawrence).
vivant(hideo_kojima).
vivant(banksy).
vivant(j_k_rowling).
vivant(lady_gaga).
vivant(quentin_tarantino).
vivant(fernando_alonso).
vivant(pape_francois).
vivant(denzel_washington).

% lister les femmes, inclut lara croft

femme(lady_gaga).
femme(jennifer_lawrence).
femme(lara_croft).
femme(j_k_rowling).
femme(cleopatre).

% lister les hommes, inclut mario et banksy

homme(michael_jackson).
homme(mikhail_gorbachev).
homme(joseph_staline). 
homme(denzel_washington).
homme(hideo_kojima).
homme(banksy).
homme(mario).
homme(victor_hugo).
homme(quentin_tarantino).
homme(dwight_d_eisenhower).
homme(jesus).
homme(ayrton_senna).
homme(fernando_alonso).
homme(moise).
homme(pape_francois).
homme(james_bond).
homme(richard_nixon).

% lister les chanteurs

chanteur_record(michael_jackson).
chanteur_star(lady_gaga).

chanteur(michael_jackson).
chanteur(lady_gaga).

% lister les chefs d état/ gouverneurs

chef_etat_vivant(mikhail_gorbachev).

chef_etat(mikhail_gorbachev).
chef_etat(joseph_staline).
chef_etat(cleopatre).
chef_etat(richard_nixon).
chef_etat(dwight_d_eisenhower).

gouverne_egypte(cleopatre).
gouverne_usa_cinq_ans(dwight_d_eisenhower).
gouverne_russie(joseph_staline).
richard_nixon(richard_nixon).

% lister les acteurs/ actrices

acteur_h_games(jennifer_lawrence).

acteur(denzel_washington).
acteur(jennifer_lawrence).

% lister tarantino en tant que réalisateur

realisateur(quentin_tarantino).

% définir james_bond en tant qu espion

espion(james_bond).

% lister les écrivains

dramaturge(victor_hugo).
ecrivain_potter(j_k_rowling).

ecrivain(victor_hugo).
ecrivain(j_k_rowling).

% lister banksey en tant qu anonyme

anonyme(banksy).

% lister kojima en tant que créateur de jeux video

jeux_video(hideo_kojima).

% lister les personnages de jeux video

plombier(mario).

perso_jeux_video(lara_croft).
perso_jeux_video(mario).


% lister les pilotes

pilote_non_vivant(ayrton_senna).
pilote_vivant(fernando_alonso).
pilote(X) :- pilote_vivant(X); pilote_non_vivant(X).

% lister les personnalités religieures

ressucite(jesus).

moise(moise).

pape(pape_francois).

% définir les artistes comme suit

artiste(X) :- chanteur(X);ecrivain(X);anonyme(X);realisateur(X);acteur(X).

% _________ base de connaissances pour les objets _________

% lister les objets qui se trouvent à la cuisine

cuisine(fourchette).
cuisine(assiette).
cuisine(four).
cuisine(cuisiniere).
cuisine(cafetiere).
cuisine(grille_pain).
cuisine(table).
cuisine(casserole).
cuisine(detergent_a_vaisselle).
casserole(casserole).

% lister les appareils electromenagers

appareil_electromenager(four).
appareil_electromenager(cuisiniere).
appareil_electromenager(cafetiere).
appareil_electromenager(grille_pain).
appareil_electromenager(aspirateur).
table_cuisson(cuisiniere).
four(four).

% lister la vaisselle

vaisselle(fourchette).
vaisselle(casserole).
vaisselle(assiette).

% lister les meubles

meuble(table).
meuble(lit).
dormir(lit).

% citer les objets et produits qui servent en tant que nettoyants

nettoyant_cuisine(detergent_a_vaisselle).

nettoyant(aspirateur).
nettoyant(balai).
nettoyant(shampooing).
nettoyant(detergent_a_vaisselle).

nettoyant_electrique(aspirateur).
nettoyant_sol(aspirateur).
nettoyant_sol(balai).

shamp(shampooing).

balai(balai).

% lister les objets qui doivent être branchés pour fonctionner

branche(lampe).
branche(telephone).
branche(ordinateur).
ordi(ordinateur).

% lister les objets qu on peut emporter

portable(portefeuille).
portable(sac_a_dos).
portable(cle).
portable(papier).
papier(papier).

% lister les instruments de musique

instrument_musique(piano).

% lister les plantes

plante(cactus).

% lister les objets pour cuisson des aliments, cafetiere en fait partie

cuisson_aliments(cuisiniere).
cuisson_aliments(four).
cuisson_aliments(grille_pain).
cuisson_aliments(cafetiere).

% lister les objets pour préparer café

preparer_cafe(cafetiere).

% lister les objets pour griller pain

griller_pain(grille_pain).

% lister les couverts de table

couvert(fourchette).

% lister les assiettes

assiette(assiette).

% lister les objets qui servent à contenir d autres objets

ranger_billets(portefeuille).
conteneur(portefeuille).
conteneur(sac_a_dos).
sac_a_dos(sac_a_dos).

% lister les objets pour eclairage

eclairage(lampe).

% lister les objets pour téléphoner

telephoner(telephone).

% objets pour ouvrir la porte

ouvrir_porte(cle).
