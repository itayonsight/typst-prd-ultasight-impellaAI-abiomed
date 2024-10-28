#import "@preview/fletcher:0.3.0" as fletcher: node, edge
#import "@preview/cetz:0.1.2"


#{
  
  fletcher.diagram(
   node-stroke: 1pt,
   edge-thickness: 1pt,
 node-inset: 1pt,
 node-outset: 5pt,
 node-defocus: 0.5,
 spacing: 2em,
    debug: 0,



let node_func(pos, title, n_color, h, style: "oblique") = {
  node(pos,rect(height: h ,align(center+horizon,text(title, size: 8pt, style: style)))
      , shape: "rect",
      fill: n_color)
    },
    
    node_func((0,-5),[Hello Itay], aqua.lighten(80%), 20pt),

      node_func((5,-5),[Testing 2], rgb(20,120,10).lighten(30%), 20pt),
    node((0,1),[2]),
    node((2,1),[3]),


    edge((0,-5),(2,1), "->"),
     edge((0,-5),(0,1), "->")

    
  )}