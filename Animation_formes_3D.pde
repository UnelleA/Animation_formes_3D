float angleCube = 0;
float angleSphere = 0;
float scaleFactor = 1;
boolean isGrowing = true;

void setup() {
  size(800, 600, P3D);  // Fenêtre 3D
  noStroke();  // Pas de contours pour les formes
}

void draw() {
  background(20);  // Couleur de fond
  lights();  // Ajoute des lumières pour un effet 3D
  
  // Cube tournant
  pushMatrix();
  translate(width * 0.25, height * 0.5, 0);  // Positionnement du cube
  rotateY(angleCube);  // Rotation autour de l'axe Y
  fill(150, 100, 250);  // Couleur du cube
  box(100);  // Dessin du cube
  popMatrix();
  
  // Sphère grandissante/rétrécissante
  pushMatrix();
  translate(width * 0.75, height * 0.5, 0);  // Positionnement de la sphère
  scale(scaleFactor);  // Échelle de la sphère
  fill(250, 150, 100);  // Couleur de la sphère
  sphere(50);  // Dessin de la sphère
  popMatrix();
  
  // Ellipse en translation et rotation
  pushMatrix();
  float moveX = map(sin(angleSphere), -1, 1, -200, 200);  // Mouvement sinusoïdal en X
  translate(width * 0.5 + moveX, height * 0.3, 0);  // Positionnement dynamique
  rotateZ(angleSphere * 0.5);  // Rotation autour de l'axe Z
  fill(100, 200, 150);  // Couleur de l'ellipse
  ellipse(0, 0, 100, 50);  // Dessin de l'ellipse
  popMatrix();
  
  // Mise à jour des angles et du facteur d'échelle
  angleCube += 0.02;
  angleSphere += 0.03;
  
  // Gestion de l'animation d'échelle pour la sphère
  if (isGrowing) {
    scaleFactor += 0.01;
    if (scaleFactor >= 1.5) isGrowing = false;
  } else {
    scaleFactor -= 0.01;
    if (scaleFactor <= 0.5) isGrowing = true;
  }
}
