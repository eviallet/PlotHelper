import 'dart:io';
import 'params.dart';

void plot3d(
		var exp, {
		var format='png',
		var labels=Labels.defaultLabels(),
		var palette=Palettes.rgb,
		var frm=-10.0,
		var to=10.0,
		var nbPoints=100,
		var out='out3d',
		var file=false,
		var width=640,
		var height=480
	})
{	
	if(file) exp = "\'$exp\'";
	else exp = exp.replaceAll('^','**');
	var str = "" +
	"set terminal $format size $width,$height;" +
	"set output '$out.$format';"+
	
	"set samples $nbPoints;"+
	"set isosamples $nbPoints;"+
	
	"set xlabel \"${labels.xlabel}\";"+
	"set ylabel \"${labels.ylabel}\";"+
	"set zlabel \"${labels.zlabel}\";"+
	"set title \" ${labels.title }\";"+	
	
	"set palette rgbformulae $palette;"+
	"splot [$frm:$to] $exp with pm3d;";
	
	"set output;";
	
	Process.start('gnuplot', ["-e", str]);
}
	