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
	
//	background(10,10,10, 255); 
	background(30,30,30, 255); 

  noStroke();


  strokeWeight(0.0);

	if (vu.vu_levels.length)
	{
		int x_step = (width/(bd.config.BD_DETECTION_RANGES/2));
		int x_width = (width/(bd.config.BD_DETECTION_RANGES/2))-2;

		for (int i = 0; i < bd.config.BD_DETECTION_RANGES/2; i++)
		{
				int v_i = Math.abs((i-32))%32;

				fill(4.0*vu.vu_levels[v_i]*clearClr[0]*255,4.0*vu.vu_levels[v_i]*clearClr[1]*255,4.0*vu.vu_levels[v_i]*clearClr[2]*255,255);
				
				int x = 128.0/8.0 * (i%8) + 128.0/16.0;
				int y = 128.0/8.0 * Math.floor(i/8) + 128.0/16.0;
				
				sz = 10;
				
				rect(x-5,y-5,sz,sz);
		}
	}


}