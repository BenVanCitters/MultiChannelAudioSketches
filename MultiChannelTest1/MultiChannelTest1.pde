//details from here http://processing.org/discourse/beta/num_1159133376.html
import ddf.minim.*;
import javax.sound.*;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Mixer.Info;
import javax.sound.sampled.Mixer.Info;
Minim minim;
AudioInput in;

void setup()
{
  size(512, 200, P3D);

  Info[] mixerInfos = AudioSystem.getMixerInfo();
  println("getMixerInfo" +mixerInfos + " length: " + mixerInfos.length);
  for(int i = 0; i < mixerInfos.length; i++)
  {
    println("mixerInfos[" + i + "] " + mixerInfos[i]);
  }
  
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw()
{
  background(0);
  stroke(255);
  
  // draw the waveforms so we can see what we are monitoring
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line( i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50 );
    line( i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50 );
  }
}

void keyPressed()
{
  if ( key == ' ' )
  {
    println("you pressed space!");
  }
}
