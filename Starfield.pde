Particle[] particles;

void setup() {
  size(500, 500);
	particles = new Particle[250];
  for (int i = 0; i < particles.length; i++) {
    if (Math.random() > 0.5) {
      particles[i] = new Particle(random(TWO_PI), random(3, 10));
    } else {
      particles[i] = new OddballParticle(random(TWO_PI), random(3, 10));
    }
  }
}

void draw() {
  background(0);
	for (int i = 0; i < particles.length; i++) {
    particles[i].update();
    particles[i].show();
    if (particles[i].out()) {
      if (Math.random() > 0.5) {
        particles[i] = new Particle(random(TWO_PI), random(3, 10));
      } else {
        particles[i] = new OddballParticle(random(TWO_PI), random(3, 10));
      }
    }
  }
}

class Particle {
	protected float x, y, angle, speed;
  Particle(float angle, float speed) {
    x = width / 2;
    y = height / 2;

    this.angle = angle;
    this.speed = speed;
  }

  void show() {
    stroke(0, 255, 0);
    fill(0, 255, 0);
    text("0", x, y);
  }
  
  void update() {
    x += Math.cos(angle) * speed;
    y += Math.sin(angle) * speed;
  }
  
  boolean out() {
    return x > width || x < 0 || y > height || y < 0;
  }
}

class OddballParticle extends Particle {
  OddballParticle(float angle, float speed) {
    super(angle, speed);
  }
  
	void show() {
    stroke(0, 255, 0);
    fill(0, 255, 0);
    text("1", x, y);
  }
}
