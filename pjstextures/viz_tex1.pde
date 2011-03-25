PFont font; 
int x_step;
int x_width;
int bar_height;
int width = 128;
int height = 128;

void setup() {
  size(128, 128);
  frameRate(24);

  font = loadFont("Arial");
  textFont(font, 32);
	noLoop();
}

void draw() {
	
	background(clearClr[0]*50, clearClr[1]*50, clearClr[2]*50, 255); 

  noStroke();
  
	fill(clearClr[0]*100, clearClr[1]*100, clearClr[2]*100,255);

  if ( bd.beat_counter % 4 == 0 ) {
    rect(0, 0, 64, 64);
  } else if ( bd.beat_counter % 4 == 1 ) {
    rect(0, 64, 64, 64);
  } else if ( bd.beat_counter % 4 == 2 ) {
    rect(64, 64, 64, 64);
  } else if ( bd.beat_counter % 4 == 3 ) {
    rect(64, 0, 64, 64);
  }

  strokeWeight(0.0);

	if (vu.vu_levels.length)
	{
		int x_step = (width/(bd.config.BD_DETECTION_RANGES/4));
		int x_width = (width/(bd.config.BD_DETECTION_RANGES/4))-2;

		for (int i = 0; i < bd.config.BD_DETECTION_RANGES/4; i++)
		{
				int v_i = i;

				fill(4.0*vu.vu_levels[v_i]*clearClr[0]*255,4.0*vu.vu_levels[v_i]*clearClr[1]*255,4.0*vu.vu_levels[v_i]*clearClr[2]*255,255);
				
				int sz;
				sz = 64*vu.vu_levels[v_i];
				if (sz>64) sz = 64;
				
				rect(i*x_step,128-sz,2,sz);
		}
	}

	fill(255,255,255,255);
  strokeWeight(2);

	stroke(clearClr[0]*300,clearClr[1]*300,clearClr[2]*300,255);

  for ( int i = 0; i < 128; i++) {
		float mi = Math.abs(signal[4*i]);
    line(i, 32 - signal[4*i] * 32, i + 1, 32 - signal[4*(i+1)] * 32);
  }

}