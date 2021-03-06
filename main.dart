import 'plot.dart';
import 'bode.dart';
import 'multiplot.dart';
import 'plot3d.dart';
import 'params.dart';

main() {

}

void ex2D() => plot(
		'x*cos(x)',
		labels: new Labels(
			xlabel: 'time'
		),
		style:Styles.impulses,
		showZeroY:false,
		scale:1.5
	);
	
void ex2DMulti() => multiplot(
		[
			new Plot(
				'x*x',
				showGrid:true,
				style:Styles.points,
				nbPoints:2000
			), 
			new Plot(
				'1/x',
				style:Styles.impulses
			)
		],
		scale:2,
		out:'multi2d'
	);

void ex3D() => 	plot3d(
		'3*x-exp(y)',
		out:"3d_from_exp",
		palette:Palettes.rainbow,
		width:1024,
		height:768
	);
	
void ex3DFile() => plot3d(
		'plt.dat',
		file:true ,
		out:"3d_from_file"
	);
	
void exBode() => bode(
		'(1/(1+s/10)) * (1/(1+s/10000))',
		scale:1.5
	);
void exBodeFromCoef() => bode(
		fromCoefs(
			[2.008, 0, 0, 0, 0],
			[1, 1.307, 4.854, 4.249, 7.768, 4.249, 4.854, 1.307, 1]
		),
		frm:1e-4,
		to:1e4
	);
