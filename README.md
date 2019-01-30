# PlotHelper

|    <b>Dependencies</b>   |
|        ---------         |
|Gnuplot added to PATH     |
|Dart interpreter added to PATH |

* Usage

See examples below

* Options

Depending on the type of graph, optional parameters can be passed, like linewidth, labels, colors, output format...


________

# Examples

* Simplest graph

``` 
main() {
  plot('x^2');
}
```  
![x^2](examples/x^2.png)

Now with some options :
``` 
main() {
  plot('x^2',
    style:Styles.impulses,
    nbPoints:2000,
    color:'purple',
    showGrid:true
  );
}
```
![x^2_2](examples/x^2_2.png)

* Multiple plots

``` 
main() {
  multiplot(
    [
      new Plot(
        '1/x',
        style:Styles.steps,
        showGrid:true
      ), 
      new Plot(
        'log(x)',
        style:Styles.impulses,
        color:'red',
        frm:0,
        to:2
      )
    ],
    rows:2
  );
}
``` 
![outMulti](examples/outMulti.png)

* 3D plot

``` 
main() {
  plot3d(
      'cos(x)*sin(y)',
      palette:Palettes.ocean,
      labels:new Labels(
        xlabel: 'x axis',
        ylabel: 'y axis',
        zlabel: 'z axis',
        title: '3D plot!'
      )
    );
}
``` 
![out3d](examples/out3d.png)

* Plot from a file

``` 
main() {
  plot3d(
    'plt.dat',
    file:true 
  );
}
``` 

![file](examples/file.png)

* Bode plot

``` 
main() {
  bode('(1-s)/((1+s)*(1-2*s))');
}
``` 

![bode](examples/bode.png)

``` 
main() {
  bode(
    fromCoefs(
      [2.008, 0, 0, 0, 0],
      [1, 1.307, 4.854, 4.249, 7.768, 4.249, 4.854, 1.307, 1]
    ),
    frm:1e-4,
    to:1e4
  );
}
``` 

![bode_bandpass](examples/bode_bandpass.png)
