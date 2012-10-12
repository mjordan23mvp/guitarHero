import processing.opengl.*;

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;


float[] Channel = new float[10];

void setup()
{
  size(1000, 270, OPENGL);
  minim = new Minim(this);
  song = minim.loadFile("Eruption.mp3", 512);
  song.loop();
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(32, 1);
}
void draw()
{
  background(Channel[2]);

  fft.forward(song.mix);

  Channel[0] = map(fft.getAvg(0), 0, 69, 0, 255);
  Channel[1] = map(fft.getAvg(1), 0, 106, 0, 225);
  Channel[2] = map(fft.getAvg(2), 0, 119, 0, 255);
  Channel[3] = map(fft.getAvg(3), 0, 66, 0, 255);
  Channel[4] = map(fft.getAvg(4), 0, 29, 0, 255);
  //voice
  Channel[5] = map(fft.getAvg(5), 0, 16, 0, 255);
  Channel[6] = map(fft.getAvg(6), 0, 15, 0, 255);
  Channel[7] = map(fft.getAvg(7), 0, 7, 0, 255);
  // high
  Channel[8] = map(fft.getAvg(8), 0, 3, 0, 255);
  Channel[9] = map(fft.getAvg(9), 0, 0, 0, 255);



  noStroke();

  //if (Channel[9] > 20){
  //
  //fill(255,128,Channel[9]);
  //} else 
  //fill(100,128,255);
  //}
  //rect( 0, 30, width,10);



//if (Channel[4] > 10) {
//  fill(255,0,255);
//}
//if (Channel[4] > 20) {
//  fill(255, 255, 0);
//} else
//  fill(0, 255,255);

  fill(Channel[4], 0,Channel[4]);
  rect( 0, 65, width, 10);


  fill(0, Channel[5], Channel[5]);
  rect( 0, 95, width, 10);


  fill(Channel[6], 0, 0);
  rect( 0, 125, width, 10);

  fill(Channel[7], Channel[7], Channel[7]);
  rect( 0, 155, width, 10);

  fill(Channel[8], Channel[8], 0);
  rect( 0, 184, width, 10);
}






void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

