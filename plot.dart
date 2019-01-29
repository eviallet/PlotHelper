import 'dart:io';
import 'params.dart';

void plot(
		var exp, {
		var format='png',
		var labels=Labels.defaultLabels(),
		var frm=-10.0,
		var to=10.0,
		var nbPoints=100,
		var color='blue',
		var style=Styles.lines,
		var lineWidth=1,
		var showZeroX=true,
		var showZeroY=true,
		var showGrid=false,
		var out="out2d",
		var width=640,
		var height=480,
		var scale=1
	})
{
	exp = exp.replaceAll('^','**');
	var str = "" +
	"set terminal $format size ${width*scale},${height*scale};" +
	"set output '$out.$format';"+

	"set samples $nbPoints;"+
	"set isosamples $nbPoints;"+
	
	(showZeroX?"set xzeroaxis;":"")+
	(showZeroY?"set yzeroaxis;":"")+
	(showGrid?"set grid;":"")+
	
	"set xlabel \"${labels.xlabel}\";"+
	"set ylabel \"${labels.ylabel}\";"+
	"set title \" ${labels.title }\";"+	
	
	"plot [$frm:$to] $exp with $style lt rgb \"$color\" lw $lineWidth;"+
	"set output;";
	
	
	Process.start('gnuplot', ["-e", str]);
}

