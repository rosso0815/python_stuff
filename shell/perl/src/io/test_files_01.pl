use Env;
use GD;

print "\n Wir testen dateien";

# create a new image
$im = new GD::Image(100,100);
# allocate some colors
$white = $im->colorAllocate(255,255,255);
$black = $im->colorAllocate(0,0,0);       
$red = $im->colorAllocate(255,0,0);      
$blue = $im->colorAllocate(0,0,255);
# make the background transparent and interlaced
$im->transparent($white);
$im->interlaced('true');
# Put a black frame around the picture
$im->rectangle(0,0,99,99,$black);
# Draw a blue oval
$im->arc(50,50,95,75,0,360,$blue);
# And fill it with red
$im->fill(50,50,$red);

# make sure we are writing to a binary stream
$datei='test.png';
open ( datei, ">test.png") or
	die print "error bei ausgabe";
binmode datei;
# Convert the image to PNG and print it on standard output
print datei $im->png;
print "\nFINITO";