include "alldifferent.mzn";
var 1..5: Anglais;
var 1..5: Ukrainien;
var 1..5: Espagnol;
var 1..5: Japonais;
var 1..5: Norvegien;
var 1..5: Rouge;
var 1..5: Vert;
var 1..5: Bleu;
var 1..5: Blanc;
var 1..5: Jaune;
var 1..5: The;
var 1..5: Cafe;
var 1..5: Lait;
var 1..5: JusdOrange;
var 1..5: Eau;
var 1..5: Acrobate;
var 1..5: Sculpteur;
var 1..5: Diplomate;
var 1..5: Medecin;
var 1..5: Violoniste;
var 1..5: Chien;
var 1..5: Zebre;
var 1..5: Escargot;
var 1..5: Renard;
var 1..5: Cheval;
array[int] of var 1..5: Nationalites = [Anglais, Ukrainien, Espagnol, Japonais, Norvegien];
array[int] of var 1..5: Couleurs = [Rouge, Vert, Bleu, Blanc, Jaune];
array[int] of var 1..5: Boissons = [The, Cafe, Lait, JusdOrange, Eau];
array[int] of var 1..5: Metiers = [Acrobate, Sculpteur, Diplomate, Medecin, Violoniste];
array[int] of var 1..5: Animaux = [Chien, Zebre, Renard, Cheval, Escargot];
constraint alldifferent(Nationalites);
constraint alldifferent(Couleurs);
constraint alldifferent(Boissons);
constraint alldifferent(Metiers);
constraint alldifferent(Animaux);
% Affirmation 1
constraint Anglais = Rouge;
% Affirmation 2
constraint Espagnol = Chien;
% Affirmation 3
constraint Vert = Cafe;
% Affirmation 4
constraint Ukrainien = The;
% Affirmation 5
constraint Vert = Blanc +1;
% Affirmation 6
constraint Sculpteur = Escargot;
% Affirmation 7
constraint Diplomate = Jaune;
% Affirmation 8
constraint Lait = 3;
% Affirmation 9
constraint Norvegien = 1;
% Affirmation 10
constraint abs(Medecin-Renard) = 1;
% Affirmation 11
constraint abs(Diplomate-Cheval) = 1;
% Affirmation 12
constraint Violoniste = JusdOrange;
% Affirmation 13
constraint Japonais = Acrobate;
% Affirmation 14
constraint abs(Norvegien-Bleu) = 1;
solve satisfy;
%output ["La personne qui boit de l'eau est :", Nationalite]
output ["Position des maisons: [Anglais, Ukrainien, Espagnol, Japonais, Norvegien]\n", show(Nationalites),"\n", "Le buveur d'eau habite a la ", show(Eau), "e maison en partant de la gauche. \n", "Le proprietaire du zebre habite a la ", show(Zebre), "e maison en partant de la gauche."];