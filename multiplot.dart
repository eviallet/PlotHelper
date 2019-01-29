import 'dart:io';
import 'params.dart';

void multiplot(
		var plots, {
		var rows=1,
		var cols=1,
		var format='png',
		var out="outMulti",
		var width=640,
		var height=480,
		var scale=1,
	})
{
	var sameGraph = rows==1&&cols==1;
	var str = "" +
	"set terminal $format size ${width*scale},${height*scale};" +
	"set output '$out.$format';";
	
	if(!sameGraph) {
		str += "set multiplot layout $rows,$cols;";
		
		for( var i=0; i<plots.length; i++)
			str += plots[i].toString();
			
		str += "unset multiplot;";
	} else {
		str +=
		"set samples ${plots[0].nbPoints};"+
		"set isosamples ${plots[0].nbPoints};"+
		
		(plots[0].showZeroX?"set xzeroaxis;":"")+
		(plots[0].showZeroY?"set yzeroaxis;":"")+
		(plots[0].showGrid?"set grid;":"")+
		
		"set xlabel \"${plots[0].labels.xlabel}\";"+
		"set ylabel \"${plots[0].labels.ylabel}\";"+
		"set title \" ${plots[0].labels.title }\";"+
		"plot [${plots[0].frm}:${plots[0].to}] ";
		for( var i=0; i<plots.length; i++)
			str += "${plots[i].exp} with ${plots[i].style} lt rgb '${plots[i].color}' lw ${plots[i].lineWidth}, ";
			
		str += ";";
	}
	str += "set output;";
	
	Process.start('gnuplot', ["-e", str]);
}

