import 'dart:io';
import 'params.dart';

/* https://matheplanet.com/default3.html?call=article.php?sid=1358 */

void bode(
		var exp, {
		var laplace='s',
		var format='png',
		var labels=Labels.defaultLabels(),
		var frm=0.01,
		var to=100000.0,
		var showGrid=false,
		var out="bode",
		var width=640,
		var height=480,
		var scale=1
	})
{
	exp = exp.replaceAll(laplace, '{0,1}*$laplace');
	
	var str = "" +
	"set terminal $format size ${width*scale},${height*scale};" +
	"set output '$out.$format';"+
	
	"A($laplace) = $exp;"+
	"set dummy $laplace;"+
	
	"set multiplot layout 2,1;"+
	"unset xlabel;"+ 
	"set grid x;"+
	"set logscale x;"+
	"set xrange [$frm : $to];"+
	"set ytics nomirror;"+
	"set autoscale y;"+
	"set xzeroaxis;"+
	"set format x '';"+
	
	"set tmargin at screen 0.95;"+
	"set bmargin at screen 0.51;"+
	
	"set ylabel \"${labels.ylabel}\";"+
	"set title \" ${labels.title }\";"+	
	
	"plot 20*log10(abs(A($laplace)));"+
	
	"set format x '10^{%L}';"+
	"set tmargin at screen 0.49;"+
	"set bmargin at screen 0.05;"+
	"set xlabel \"${labels.xlabel}\";"+
	"set ylabel \"${labels.xlabel}\";"+
	"plot 180/pi*arg(A($laplace));"+

	"unset multiplot;"+
	"set output;";
		
	
	Process.start('gnuplot', ["-e", str]);
}

String fromCoefs(
	var num,
	var den) 
{
	var str = "(";
	for ( var i = 0; i<num.length-1; i++)
		str+="${num[i]}*s**${num.length-1-i}+";
	str+=(num[num.length-1]==0?'0':'1');
	str += ")/(";
	for ( var i = 0; i<den.length-1; i++)
		str+="${den[i]}*s**${den.length-1-i}+";
	str+=(den[den.length-1]==0?'0':'1');
	str += ")";
	
	return str;
}

