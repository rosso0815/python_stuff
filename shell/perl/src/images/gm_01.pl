#! /usr/local/bin/perl -w

# install graphicsmagick
# ./configure --prefix=/usr/local/gm --with-perl=/usr/local/bin/perl --enable-shared
#

use strict;
use warnings;
use 5.010;

use Data::Dumper;
use File::Find;
use Data::Dumper;
use Graphics::Magick;
use Image::ExifTool ':Public';

use Log::Log4perl qw(:easy);
Log::Log4perl->easy_init($INFO);

my $DEBUG = 1;

my $logger = Log::Log4perl->get_logger('pfistera.my_imagefix');
$logger->info("start");

find( \&iterateFiles, "." );

$logger->info("done");

exit 0;

# iterate and move jpg files
sub iterateFiles {
	my $dir  = $File::Find::dir;
	my $file = $_;

	# avoid eaDir
	if ( $dir =~ /eaDir/i ){
		$logger->debug( "skip this dir" ) if $DEBUG;
		return;

	} elsif ( $file =~ /.*\.jpg/i ) {
		$logger->debug( "[DEBUG] found jpg to modify" ) if $DEBUG;
		modifyFileJPG( $dir , $file );
	}
}

sub modifyFileJPG{
	my $baseDir = shift;
	my $filename = shift;
	my $image ;
	my $status;
	my $dateTimeOriginal; # exif date_time_original , sometimes we have no exif data !
	my $dateModified;
	my $new_filename;
	my $f_width;
	my $heigth;
	my $model; # exif model
	my $writeFile=0; # if 1 we will write the file , file can be unchanged 

	# here we do some read / write of metadata
	my $exiftool = new Image::ExifTool;
	$exiftool->Options('FixBase' => ''); 
	my $info = $exiftool->ImageInfo($filename);

	# show all tags
	if ($DEBUG){
		foreach (keys %$info) {
			print "$_ : $info->{$_}\n";
		}
	}

	$logger->info( "==> filename = $filename");
	$logger->info( "DateTimeOriginal = ",$info->{'DateTimeOriginal'}) if ( defined($info->{'DateTimeOriginal'}));
	$logger->info( "DateCreated      = ",$info->{'DateCreated'}) if ( defined($info->{'DateCreated'} ));
	$logger->info( "FileModifyDate   = ",$info->{'FileModifyDate'});
	$logger->info( "Model            = ",$info->{'Model'}," len=",length($info->{'Model'})) if ( defined($info->{'Model'}));
	$logger->info( "ImageWidth       = ",$info->{'ImageWidth'});
	$logger->info( "ImageHeight      = ",$info->{'ImageHeight'});
	$logger->info( "length DateTimeOriginal = ",length($info->{'DateTimeOriginal'})) if defined($info->{'DateTimeOriginal'}); 

	# extract width , heigth
	$f_width=$info->{'ImageWidth'};
	if ( ! defined ($f_width)){
		die "undef width";
	}
	$heigth=$info->{'ImageHeight'};
	if (! defined($heigth)){
		die "undef height";
	}

	# extract DateTimeOriginal if possible
	if ((defined ($info->{'DateTimeOriginal'})) && ($info->{'DateTimeOriginal'} =~ /\d+/ )){
		$dateTimeOriginal= $info->{'DateTimeOriginal'};
	}else{
		$writeFile=1;
		$exiftool->SetNewValue('DateTimeOriginal', $info->{'FileModifyDate'});
		$dateTimeOriginal="";
		$dateModified=$info->{'FileModifyDate'};
	}

	# extract model if possible
	if ((defined( $info->{'Model'})) && (length($info->{'Model'}) > 1)){
		$logger->info( "model defined $info->{'Model'}");
		$model=$info->{'Model'};
		$model =~ s/[^a-zA-Z0-9]//g;
	}else{
		$logger->info( "model undefined");
		$model="unknown";
	}

	# we modify the file if needed
	if ($writeFile){
		$exiftool->WriteInfo($filename);
		$writeFile=0
	}


	# close all exif related variables
	undef $exiftool;
	undef $info;

	# start the image work 
	$image = Graphics::Magick->new;

	# read image and extract some data
	$image->read( $filename);


	# get date
	if ( length( $dateTimeOriginal) > 1){
		my ( $year, $month, $date, $hour, $min, $sec )  = ( $dateTimeOriginal  =~ /(\d+):(\d+):(\d+) (\d+):(\d+):(\d+).*/i );
		$new_filename= $year . $month . $date . "_" . $hour . $min . $sec;
	} else {
		my ( $year, $month, $date, $hour, $min, $sec )  = ( $dateModified  =~ /(\d+):(\d+):(\d+) (\d+):(\d+):(\d+).*/i );
		$new_filename= $year . $month . $date . "_" . $hour . $min . $sec;
	}

	$new_filename=$new_filename."_".$model;
	if ( $filename  =~  /$new_filename/ ){
		$logger->info( "filename has not changed");
	}else{
		$logger->info( "filename has changed");
		$writeFile=1;
	}

	# resize to 1920
	if ( $f_width > 1920 ){
		$logger->info( "will resize image $f_width x $heigth");
		$status = $image->Resize(geometry=>'1920x1080',filter => 'Lanczos', blur => 2.1 );
		warn "$status" if "$status";
		$writeFile=1;
	}

	# save the file
	if ( ! $writeFile){
		$logger->info( "File not modified then return");
		$new_filename=$filename;
	}else{

		# check for existing files and adapt new_filename
		my $i=0;
		if (! -f $new_filename.'.jpg' ){
			$new_filename=$new_filename.'.jpg';
			$logger->info("save filename $new_filename");

		}else{
			do{
				$i++;
				$logger->info("found already file ${new_filename}_${i}.jpg");
			} while ( -f $new_filename.'_'.$i.'.jpg' );
			$new_filename=$new_filename.'_'.$i.'.jpg';
			$logger->info("save filename $new_filename");
		}   

		$logger->info("modify file");
		$status = $image->Write($new_filename);
		warn "$status" if "$status";

	}

	# delete old unused file
	if ( $filename ne $new_filename){
		$logger->info( "will delete unused file $filename because of $new_filename");
		unlink $filename;
	}

	# generate thumbnails
	my $sDir='@eaDir';
	
	return;

	# create the necessary directories
	if (! -d $sDir ){
		mkdir $sDir
			or die "die on mkdir $sDir";
	}

	if (! -d $sDir.'/'.$new_filename ){
		mkdir $sDir.'/'.$new_filename
			or die "[ERROR] cannot create dir $sDir/$new_filename";
	}

	return  0;


	# generate the thumbnails ...
	$status=$image->Thumbnail(width=>1280, height=>1280);
	warn "$status" if "$status";
	$status=$image->Write($sDir.'/'.$new_filename.'/SYNOPHOTO:THUMB_XL.jpg');
	warn "$status" if "$status";

	$status=$image->Thumbnail(width=>800, height=>800);
	warn "$status" if "$status";
	$status=$image->Write($sDir.'/'.$new_filename.'/SYNOPHOTO:THUMB_L.jpg');
	warn "$status" if "$status";

	$status=$image->Thumbnail(width=>640, height=>640);
	warn "$status" if "$status";
	$status=$image->Write($sDir.'/'.$new_filename.'/SYNOPHOTO:THUMB_B.jpg');
	warn "$status" if "$status";

	$status=$image->Thumbnail(width=>320, height=>320);
	warn "$status" if "$status";
	$status=$image->Write($sDir.'/'.$new_filename.'/SYNOPHOTO:THUMB_M.jpg');
	warn "$status" if "$status";

	$status=$image->Thumbnail(width=>160, height=>160);
	warn "$status" if "$status";
	$status=$image->Write($sDir.'/'.$new_filename.'/SYNOPHOTO:THUMB_S.jpg');
	warn "$status" if "$status";

	undef $image;

}

#------------------------------------------------------------------------------
