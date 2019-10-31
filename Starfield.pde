/* @pjs font="Hack-Regular.ttf"; */

ArrayList<Particle> particles;

String[] code = "void setup() {\r\n  size(500, 500);\r\n\tparticles = new ArrayList<Particle>();\r\n  textFont(createFont(\"Hack-Regular.ttf\", 32));\r\n  for (int i = 0; i < 100; i++) {\r\n    if (Math.random() > 0.5) {\r\n      particles.add(new Particle(random(TWO_PI), random(3, 10), code[(int) (Math.random() * code.length)]));\r\n    } else {\r\n      particles.add(new OddballParticle(random(TWO_PI), random(3, 10)));\r\n    }\r\n  }\r\n}\r\n\r\nvoid draw() {\r\n  background(0);\r\n  if (mousePressed) {\r\n    if (Math.random() > 0.5) {\r\n      particles.add(new Particle(random(TWO_PI), random(3, 10), code[(int) (Math.random() * code.length)]));\r\n    } else {\r\n      particles.add(new OddballParticle(random(TWO_PI), random(3, 10)));\r\n    }\r\n  }\r\n\tfor (int i = 0; i < particles.size(); i++) {\r\n    particles.get(i).update();\r\n    particles.get(i).show();\r\n    if (particles.get(i).isOut()) {\r\n      particles.remove(particles.get(i));\r\n    }\r\n  }\r\n}\r\n\r\nclass Particle {\r\n\tprotected float x, y, angle, speed;\r\n  protected String word;\r\n  Particle(float angle, float speed, String word) {\r\n    if (mousePressed) {\r\n      x = mouseX;\r\n      y = mouseY;\r\n    } else {\r\n      x = width / 2;\r\n      y = height / 2;\r\n    }\r\n    this.angle = angle;\r\n    this.speed = speed;\r\n    this.word = word;\r\n  }\r\n  \r\n  void style() {\r\n    textSize(dist(x, y, width / 2, height / 2) / 10.0);\r\n    fill(0, 255, 0);\r\n  }\r\n\r\n  void show() {\r\n    style();\r\n    text(word, x, y);\r\n  }\r\n  \r\n  void update() {\r\n    x += Math.cos(angle) * speed;\r\n    y += Math.sin(angle) * speed;\r\n  }\r\n  \r\n  boolean isOut() {\r\n    return x > width || x < 0 || y > height || y < 0;\r\n  }\r\n}\r\n\r\nclass OddballParticle extends Particle {\r\n  OddballParticle(float angle, float speed) {\r\n    super(angle, speed, Math.random() > 0.5 ? \"0\" : \"1\");\r\n  }\r\n}".split("\\s+", 0);

void setup() {
  size(500, 500);
	particles = new ArrayList<Particle>();
  textFont(createFont("Hack-Regular.ttf", 32));
  for (int i = 0; i < 100; i++) {
    if (Math.random() > 0.5) {
      particles.add(new Particle(random(TWO_PI), random(3, 10), code[(int) (Math.random() * code.length)]));
    } else {
      particles.add(new OddballParticle(random(TWO_PI), random(3, 10)));
    }
  }
}

void draw() {
  background(0);
  if (mousePressed) {
    if (Math.random() > 0.5) {
      particles.add(new Particle(random(TWO_PI), random(3, 10), code[(int) (Math.random() * code.length)]));
    } else {
      particles.add(new OddballParticle(random(TWO_PI), random(3, 10)));
    }
  }
	for (int i = 0; i < particles.size(); i++) {
    particles.get(i).update();
    particles.get(i).show();
    if (particles.get(i).isOut()) {
      particles.remove(particles.get(i));
    }
  }
}

float[] center() {
  float x, y;
  if (mousePressed) {
    x = mouseX;
    y = mouseY;
  } else {
    x = width / 2;
    y = height / 2;
  }
  return new float[]{x, y};
}

class Particle {
	protected float x, y, angle, speed;
  protected String word;
  Particle(float angle, float speed, String word) {
    float[] coords = center();
    x = coords[0];
    y = coords[1];
    this.angle = angle;
    this.speed = speed;
    this.word = word;
  }
  
  void style() {
    float[] coords = center();
    textSize(dist(x, y, coords[0], coords[1]) / 10.0);
    fill(0, 255, 0);
  }

  void show() {
    style();
    text(word, x, y);
  }
  
  void update() {
    x += Math.cos(angle) * speed;
    y += Math.sin(angle) * speed;
  }
  
  boolean isOut() {
    return x > width || x < 0 || y > height || y < 0;
  }
}

class OddballParticle extends Particle {
  OddballParticle(float angle, float speed) {
    super(angle, speed, Math.random() > 0.5 ? "0" : "1");
  }
}
