class Palettes {
	static const String rainbow = "33,13,10";
	static const String rgb = "22,13,-31";
	static const String ocean = "23,28,3";
	static const String hot = "21,22,23";
	static const String def = "7,5,15";
	static const String grp = "3,11,6";
}

class Styles {
	static const String lines = "lines";
	static const String dots = "dots";
	static const String points = "points";
	static const String linespoints = "lp";
	static const String impulses = "impulses";
	static const String steps = "steps";
	static const String boxes = "boxes";
	static const String yerrorbars = "yerrorbars";
	static const String xerrorbars = "xerrorbars";
	static const String xyerrorbars = "xyerrorbars";
	static const String vector = "vector";
}


class Labels {

	var xlabel;
	var ylabel;
	var zlabel;
	var title;
	
	Labels({
		this.xlabel = '',
		this.ylabel = '',
		this.zlabel = '',
		this.title  = ''
	}) {}
	
	static Labels defaultLabels() => new Labels();
}


class Plot {
	var exp;
	var labels;
	var frm;
	var to;
	var nbPoints;
	var style;
	var showZeroX;
	var showZeroY;
	var showGrid;
	
	Plot(
		this.exp, {
		this.labels=Labels.defaultLabels(),
		this.frm=-10.0,
		this.to=10.0,
		this.nbPoints=100,
		this.style=Styles.lines,
		this.showZeroX=true,
		this.showZeroY=true,
		this.showGrid=false
		}) {
			exp = exp.replaceAll('^','**');
		}
	
	String toString() =>
		"set samples $nbPoints;"+
		"set isosamples $nbPoints;"+
		
		(showZeroX?"set xzeroaxis;":"")+
		(showZeroY?"set yzeroaxis;":"")+
		(showGrid?"set grid;":"")+
		
		"set xlabel \"${labels.xlabel}\";"+
		"set ylabel \"${labels.ylabel}\";"+
		"set title \" ${labels.title }\";"+
		"plot [$frm:$to] $exp with $style;";
}
