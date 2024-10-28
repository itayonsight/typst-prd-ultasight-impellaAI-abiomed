#import "@preview/fletcher:0.3.0" as fletcher: node, edge
#import "@preview/cetz:0.1.2"

#show text: it => text(size: 8pt, style: "oblique", it)

#let draw_context_fig_1 = () => {
  
  fletcher.diagram(
   node-stroke: 1pt,
   edge-thickness: 1pt,
 node-inset: 1pt,
 node-outset: 5pt,
 node-defocus: 0.5,
 spacing: 2em,
    debug: 0,


let node_func_circle(pos, title, n_color, stroke_color, stroke_size) = {
  node(pos,rect(height: 30pt ,align(center,align(horizon,text(title, size: 8pt, style: "oblique"))), stroke: none)
      , shape: "circle",
                fill: n_color,
              stroke: stroke_color + stroke_size)
},

let node_func(pos, title, n_color) = {
  node(pos,rect(height: 50pt ,align(center,align(horizon,text(title, size: 8pt, style: "oblique"))))
      , shape: "rect",
                fill: n_color)
},


let (height_l, height_n) = (1, -1),
let (l_data, l_transform, l_useg, performance, l_title) = ((0,height_l), (1,height_l), (2,height_l),(3,height_l), (1.5,height_l+0.7)), 
// let (l_success, l_fail)
let (n_data, n_transform, n_useg, n_performance, n_title) = ((0,height_n), (1,height_n), (2,height_n),(3,height_n), (1.5,height_n + 0.7)),
let qustion_mark = (1, -0.5),
let calibration_color = yellow.darken(30%),
let test_color = blue,
let useg_color = green,
let base_color = gray,



    node_func(l_data,[Lumify Test\ Dataset], base_color.lighten(70%)),

    node_func(l_transform,[Transformation to a\ Universal Image\
    Representation], base_color.lighten(70%)),

    node_func(l_useg,[Ultrasight\ AI Guidance], useg_color.lighten(70%)),


    node_func(performance,[Performance\ Testing], test_color.lighten(70%)),
   
   
    node_func(n_data,[Different\ Ultrasound\ System], base_color.lighten(70%)),

    node_func(n_transform,[Transformation to a\ Universal Image\
    Representation], base_color.lighten(70%)),


    node_func(n_useg,[Ultrasight\ AI Guidance], useg_color.lighten(70%)),


    node_func(n_performance,[Calibration\ Performance\ Test], test_color.lighten(70%)),



 node(l_title,rect(align(center,align(horizon,[*New 510(K) Submission*])), stroke: none),
                fill: none, stroke: none),


 node(n_title,rect(align(center,align(horizon,[*Proposed PCCP*])), stroke: none),
                fill: none, stroke: none),
                

                
      edge(l_data, l_transform,"->"),
      edge(l_transform, l_useg,"->"),
      edge(l_useg, performance,"..>", paint: test_color),
      edge(n_data, n_transform,"->"),
      edge(n_transform, n_useg,"->"),
      edge(n_useg, n_performance,"..>", paint: test_color),
      
      edge(performance, (3.6,height_l),"..", paint: test_color),
      edge((3.6,height_l), (4.5,height_l - 0.5), text([Fail], size:8pt), "..|>", corner: right, paint: test_color, label-pos: 1),
      edge((3.6,height_l), (4.5,height_l + 0.5), text([Pass], size:8pt), "..|>", corner: left, paint: test_color, label-pos: 1),

       node((4.5,height_l + 0.5),rect(align(center,align(horizon,text([_Ultrasight\ AI Guidance\ Approved_], size:8pt))), stroke: none),
                fill: none, stroke: none),
       node((4.5,height_l - 0.5),rect(align(center,align(horizon,text([_Ultrasight\ AI Guidance  Not\ Approved_], size:8pt))), stroke: none),
          fill: none, stroke: none),


      edge(n_performance, (3.6,height_n),"..", paint: test_color),
      edge((3.6,height_n), (4.5,height_n - 0.5), text([Fail], size:8pt), "..|>", corner: right, paint: test_color, label-pos: 1),
      edge((3.6,height_n), (4.55,height_n + 0.5), text([Pass], size:8pt), "..|>", corner: left, paint: test_color, label-pos: 1),

       node((4.55,height_n + 0.5),rect(align(center,align(horizon,text([_New Device and\ Lumify Equivalent\ for NN_], size:8pt))), stroke: none),
                fill: none, stroke: none, inset:-15pt),
       node((4.5,height_n - 0.5),rect(align(center,align(horizon,text([_Calibration\ Failed_], size:8pt))), stroke: none),
          fill: none, stroke: none),
                
render: (grid, nodes, edges, options) => {
    // cetz is also exported as fletcher.cetz
    fletcher.cetz.canvas({
      // this is the default code to render the diagram
      fletcher.draw-diagram(grid, nodes, edges, options)

      let n1 = fletcher.find-node-at(nodes, l_useg)
      let n2 = fletcher.find-node-at(nodes, l_data)

      let p1 = fletcher.get-node-anchor(n1, 45deg)
      
      let p2 = fletcher.get-node-anchor(n2, 225deg)
      
      
      fletcher.cetz.draw.rect(p1, p2, stroke: (dash: "dashed"))


      let n1 = fletcher.find-node-at(nodes, n_useg)
      let n2 = fletcher.find-node-at(nodes, n_data)

      let p1 = fletcher.get-node-anchor(n1, 45deg)
      
      let p2 = fletcher.get-node-anchor(n2, 225deg)

      fletcher.cetz.draw.rect(p1, p2, stroke: (dash: "dashed"))
         
    })
  }
)}



#let draw_calibration_process_diag = () => {
  fletcher.diagram(
   node-stroke: 1pt,
   edge-thickness: 1pt,
 node-inset: 1pt,
 node-outset: 5pt,
 node-defocus: 0.5,
 spacing: 3em,
    debug: 0,

    
let node_func_circle(pos, title, n_color, stroke_color, stroke_size, h) = {
  node(pos,rect(height: h ,align(center,align(horizon,text(title, size: 8pt, style: "oblique"))), stroke: none)
      , shape: "circle",
                fill: n_color,
              stroke: stroke_color + stroke_size)
},

let node_func(pos, title, n_color, h) = {
  node(pos,rect(height: h ,align(center,align(horizon,text(title, size: 8pt, style: "oblique"))))
      , shape: "rect",
      fill: n_color)
},

  
let top_row = 2.6,
let bottom_row = 0,


   node_func((1,top_row),[Phantom\ Images\ Lumify], green.lighten(80%), 70pt),
   node_func_circle((2,top_row),[Transformation\ to universal\ representation\ Lumify], red.lighten(70%), green, 2pt, 35pt),
   node_func((3,top_row),[Universal\ representation\ of Phantom\ Images\ Lumify], green.lighten(80%), 70pt),
  node_func((4,top_row),[QA Parameters\ Lumify], green.lighten(80%), 70pt),

   
   // node_func((1,0.5),[New Device], blue.lighten(80%)),
   node_func((1,bottom_row),[Phantom\ Images\ New Device], blue.lighten(80%), 70pt),
   node_func_circle((2,bottom_row),[Transformation\ to universal\ representation\ New Device], red.lighten(70%), blue, 2pt, 35pt),
   node_func((3,bottom_row),[Universal\ representation\ of Phantom\ Images\ New Device], blue.lighten(80%), 70pt),

   node_func_circle((2,1.3), [Calibration], yellow.lighten(60%), black, 1pt, 10pt),

   node_func((4,bottom_row),[QA Parameters\ New Device], blue.lighten(80%), 70pt),

  
   edge((1,top_row),(2,top_row),"->"),
   edge((2,top_row),(3,top_row),"->"),

   // edge((1,0.5),(1,bottom_row),"->"),
   edge((1,bottom_row),(2,bottom_row),"->"),

  // edge((3,top_row),(2,1),"-->"),
  // edge((1,bottom_row),(2,1),"-->"),
  edge((2,1.3),(2,bottom_row),"-->"),
  edge((2,bottom_row),(3,bottom_row),"->"),   

  edge((3,top_row),(4,top_row),"->"),
  edge((3,bottom_row),(4,bottom_row),"->"),  



  node((5.5,bottom_row - 0.5),rect(align(center,align(horizon,[])), stroke: none),
            fill: none, stroke: none),
  node((0.5,bottom_row - 0.5),rect(align(center,align(horizon,[])), stroke: none),
            fill: none, stroke: none),
  node((3.3,top_row + 0.5),rect(align(center,align(horizon,[])), stroke: none),
            fill: none, stroke: none),
  node((3.7, top_row + 0.5),rect(align(center,align(horizon,[])), stroke: none),
          fill: none, stroke: none),


    
)}


#let draw_modification_diag = () => {




cetz.canvas(debug: false,
  {
  import cetz.draw: *


  let stream_height = 4
  let prediction_stream_height = 0
  
  circle((0,-1), radius: 0.1, fill: white, stroke : (white))
  circle((0,4), radius: 0.1, fill: white, stroke : (white))

  
  content((10,stream_height -0.5), [Time])
  content((-2,stream_height), align(center,[Ultrasound Image\ Stream]))

  content((-2,prediction_stream_height), align(center,[Prediction\ Stream]))
  
  line((0,stream_height),(10,stream_height),mark: (end: ">"))
  line((0,prediction_stream_height),(10,prediction_stream_height),mark: (end: ">"))
  
  rect((-0.1,stream_height -0.3),(4.2,stream_height +0.3),stroke: (dash: "solid"), fill: rgb(30, 30, 30, 40) )


  
  line((4, stream_height -0.3),(4.1,prediction_stream_height +0.2),stroke: (dash: "solid"),  mark: (end: ">", size: 0.6))



rect((3.5,(prediction_stream_height+stream_height)/2-0.8),(4.6,(prediction_stream_height+stream_height)/2+0.2), fill: orange.lighten(30%), stroke : (black))

content((4.03,(prediction_stream_height+stream_height)/2-0.25), align(center,text(size: 6pt, [Neural\ Network])))



rect((2.7,(prediction_stream_height+stream_height)/2+0.4),(5.3,(prediction_stream_height+stream_height)/2+1.0), fill: blue.lighten(80%), stroke : (black))

content((4.01,(prediction_stream_height+stream_height)/2+0.72), align(center,text(size: 6pt, [Transformation to\ _Universal Representation_])))
  
  
for i in range(1,10){
  circle((i,stream_height), radius: 0.1, fill: red)

  if i > 3 and calc.rem(i,2) ==0 and i!= 6{
      circle((i+0.1,prediction_stream_height), radius: 0.1, fill: green)
  }
  
}

})
}


#let draw_parameter_scan_diag = () => {

cetz.canvas(debug: false,

  {
  import cetz.draw: *

  //   let points = (
  //    (5.5, 7),
  // )

  
    grid((5,5), (10,10), help-lines: true, stroke: gray.lighten(80%))
    line((5.5, 5), (5.5, 10), stroke: gray.lighten(80%))
    line((5.25, 5), (5.25, 10), stroke: gray.lighten(80%))
    line((5, 5.25), (10, 5.25), stroke: gray.lighten(80%))
    line((5, 5.5), (10, 5.5), stroke: gray.lighten(80%))

    
    // for point in points{
    //  let x = point.at(0)
    //  let y = point.at(1)
      
      
    //   rect((x,y),(x+1.5, y+2), fill: rgb(150,150,0,30), stroke: none)
      
    // }

    let region_points = (
      (6,7), (5.5,8), (7,8), (6,9)
    )

  // line( (5.5,8), (6,7), (7,8), (6,9), stroke: (dash: "dashed"), close: true, fill: green.lighten(80%))
    
    for point in region_points{
     let x = point.at(0)
     let y = point.at(1)
      
      circle((x,y),radius: 0.1, fill: green)
      
    }

  
    
  line((3.5, 5), (10, 5), mark: (end: ">"))
    line((5, 4), (5, 10), mark: (end: ">"))

    circle((5.5,6),radius: 0.2, fill: blue)
    content((5.7,6.5),align(center,[_Lumify_]),  anchor: "center")


        circle((6,8),radius: 0.2, fill: yellow)
    content((9,9,3),align(center,[_New\ Ultrasound\ System_]))
    line(((8.1,8.6)),(6.2,8.1),  mark: (end: ">", size: 0.3))
    // edge((8.2,8.8), (6.8), )

 content((11.5,5.6),align(center,[_Lateral\ Resolution \[mm\]_]))

  content((5,11),align(center,[_Axial\ Resolution \[mm\]_]))

  content((5.25,4.8),align(center,text([$1/4$], fill:gray, size:8pt)))
  content((5.5,4.8),align(center,text([$1/2$], fill:gray, size:8pt)))
  content((6,4.8),align(center,text([1], fill:gray, size:8pt)))
  content((7,4.8),align(center,text([2], fill: gray, size:8pt)))
  content((8,4.8),align(center,text([3], fill: gray, size:8pt)))
  content((9,4.8),align(center,text([4], fill: gray, size:8pt)))
  content((4.645,5.25),align(center,text([0.25], fill: gray, size:7pt)))
  content((4.71,5.5),align(right,text([0.5], fill: gray, size:7pt)))
  content((4.8,6),align(center,text([1], fill: gray, size:8pt)))
  content((4.8,7),align(center,text([2], fill: gray, size:8pt)))
  content((4.8,8),align(center,text([3], fill: gray, size:8pt)))
  content((4.8,9),align(center,text([4], fill: gray, size:8pt)))
  
})

}


#let draw_perf_distribution = () => {
    import cetz.plot: *

  fletcher.diagram(
   node-stroke: 1pt,
   edge-thickness: 1pt,
 node-inset: 1pt,
 node-outset: 5pt,
 node-defocus: 0.5,
    debug: 0,


let ugly_ci(x, y, n_color, w,line_w) = {
  
  node((x,y),rect(height: 3pt, width:3pt ,align(center,align(horizon,[])), stroke: none)
      , shape: "circle",
                fill: n_color,
              stroke: none)
  node((x - (0.1 * w),y),rect(height: 10pt, width: 1pt,align(center,align(horizon,[])), stroke: none)
      , shape: "rect",
                fill: n_color,
              stroke: none)

  node((x + (0.1 * w),y),rect(height: 10pt, width: 1pt,align(center,align(horizon,[])), stroke: none)
    , shape: "rect",
              fill: n_color,
            stroke: none)

  node((x,y),rect(height: 1pt, width: line_w,align(center,align(horizon,[])), stroke: none)
  , shape: "rect",
            fill: n_color,
          stroke: none)
          
},

let node_func_circle(pos, title, n_color, stroke_color, stroke_size) = {
  node(pos,rect(height: 30pt ,align(center,align(horizon,text(title, size: 8pt, style: "oblique"))), stroke: none)
      , shape: "circle",
                fill: n_color,
              stroke: stroke_color + stroke_size)
},

  ugly_ci(0.49,0,blue,1.5, 30pt),
  ugly_ci(0.52,0.4,green,1.3, 26pt),


     // edge((3,2), (4,1.3),"-->", bend:30deg),
     // edge((3,0), (4,0.8),"-->", bend:-30deg),
    edge((0,-0.5), (1.3,-0.5),"-->"),
 node((0.6,-0.75),rect(align(center,align(horizon,[*Performance Metric Distribution*])), stroke: none),
                fill: none, stroke: none),

// cetz.plot.add-boxwhisker((x: 1, // Location on x-axis
// outliers: (7, 65, 69),
// min: 15, max: 60,
// q1: 25,
// q2: 35,
// q3: 50))
                
)}


#let draw_threshold_determining = () => {

  show text: it => text(size: 8pt, style: "oblique", it)
  
  
  fletcher.diagram(
   node-stroke: 1pt,
   edge-thickness: 1pt,
 node-inset: 1pt,
 node-outset: 5pt,
 node-defocus: 0.5,
 spacing: 2.5em,
      debug: 0,


let ugly_ci(x, y, n_color, w,line_w) = {
  
  node((x,y),rect(height: 3pt, width:3pt ,align(center,align(horizon,[])), stroke: none)
      , shape: "circle",
                fill: n_color,
              stroke: none)
  node((x - (0.1 * w),y),rect(height: 10pt, width: 1pt,align(center,align(horizon,[])), stroke: none)
      , shape: "rect",
                fill: n_color,
              stroke: none)

  node((x + (0.1 * w),y),rect(height: 10pt, width: 1pt,align(center,align(horizon,[])), stroke: none)
    , shape: "rect",
              fill: n_color,
            stroke: none)

  node((x,y),rect(height: 1pt, width: line_w,align(center,align(horizon,[])), stroke: none)
  , shape: "rect",
            fill: n_color,
          stroke: none)
          
},

let node_func_circle(pos, title, n_color, stroke_color, stroke_size) = {
  node(pos,rect(height: 30pt ,align(center,align(horizon,title)), stroke: none)
      , shape: "circle",
                fill: n_color,
              stroke: stroke_color + stroke_size)
},

let node_func(pos, title, n_color) = {
  node(pos,rect(height: 70pt ,align(center,align(horizon,title)))
      , shape: "rect",
                fill: n_color)
},
let node_func_large_rect(pos, title, n_color) = {
  node(pos,rect(height: 70pt, width: 150pt ,align(center,align(horizon,title)))
      , shape: "rect",
                fill: n_color)
},


   node_func_large_rect((0,2),[Undeformed Dataset#grid(
  columns: (1fr, 1fr, 1fr),
   gutter: 5pt,
  [#image("../figures/original_0.jpeg")],[#image("../figures/original_1.jpeg")],[#image("../figures/original_2.jpeg")])] , green.lighten(70%)),

   node_func_large_rect((0,0),[Enhanced Contrast Adjusted Dataset#grid(
  columns: (1fr, 1fr, 1fr),
   gutter: 5pt,
  [#image("../figures/contrast_0.jpeg")],[#image("../figures/contrast_1.jpeg")],[#image("../figures/contrast_2.jpeg")])] , blue.lighten(70%)),

  node_func((0,1), [Contrast\ Enhancement\ Deformation], yellow.lighten(70%)),

  node_func((1,2), [UltraSight\ AI\ Guidance], green.lighten(70%)),
  node_func((1,0), [UltraSight\ AI\ Guidance], blue.lighten(70%)),

  node_func((2,2), [Performance\ Testing], green.lighten(70%)),
  node_func((2,0), [Performance\ Testing], blue.lighten(70%)),

  node_func((3,2), [Baseline\ Undeformed\ Performance\ Metrics with\ 95% CI], green.lighten(70%)),
  node_func((3,0), [Deformed\ Performance\ Metrics with\ 95% CI], blue.lighten(70%)),
  
   edge((0,2), (0,1),"->"),
   edge((0,1), (0,0),"->"),

   for j in (0,2) {
     for i in (0,1,2) {
      edge((i,j), (i+1,j), "->")
     }
  },

  node((3.7,1), draw_perf_distribution(), stroke: none, fill: red.lighten(80%), inset:10pt, shape: "rect"),
     edge((3,2), (3.6,1.4),"-->", bend:30deg),
     edge((3,0), (3.6,0.6),"-->", bend:-30deg),
 
                
// render: (grid, nodes, edges, options) => {
//     // cetz is also exported as fletcher.cetz
//     fletcher.cetz.canvas({
//       // this is the default code to render the diagram
//       fletcher.draw-diagram(grid, nodes, edges, options)

//       let n1 = fletcher.find-node-at(nodes, (2,0))
//       let p1 = fletcher.get-node-anchor(n1, 90deg)
//       fletcher.cetz.draw.circle(p1, stroke: none, fill: blue)
      
//       // let n1 = fletcher.find-node-at(nodes, (1,0))
//       // let n2 = fletcher.find-node-at(nodes, (2,0))

//       // let p1 = fletcher.get-node-anchor(n1, 45deg)
      
//       // let p2 = fletcher.get-node-anchor(n2, 225deg)
      
      
//       // fletcher.cetz.draw.rect(p1, p2, stroke: (dash: "dashed"))


//       //  let n1 = fletcher.find-node-at(nodes, (0.5,-1.5))
//       // let n2 = fletcher.find-node-at(nodes, (-1.5,-1.5))

//       // let p1 = fletcher.get-node-anchor(n1, 45deg)
      
//       // let p2 = fletcher.get-node-anchor(n2, 225deg)

//       // fletcher.cetz.draw.rect(p1, p2, stroke: (dash: "dashed"))

//       // let n1 = fletcher.find-node-at(nodes, (0.5,1.5))
//       // let n2 = fletcher.find-node-at(nodes, (-1.5,1.5))

//       // let p1 = fletcher.get-node-anchor(n1, 45deg)
      
//       // let p2 = fletcher.get-node-anchor(n2, 225deg)

//       // fletcher.cetz.draw.rect(p1, p2, stroke: (dash: "dashed"))
      
//       // fletcher.cetz.draw.circle((0,5.5), stroke: none)


//       //  fletcher.cetz.draw.circle((0,0.2), stroke: none)


//        //   let n1 = fletcher.find-node-at(nodes, (0,0))
//        //  let p1 = fletcher.get-node-anchor(n1, 90deg)

        
//        //   fletcher.cetz.draw.content(p1,
//        //   text([510K Ultrasight AI Guidance], size: 20pt)
//        // )
                
         
//     })
//   }


)}



#let draw_timeline_diag = () => {




cetz.canvas(debug: false,
  {
  import cetz.draw: *


  let stream_height = 3
  let prediction_stream_height = 0
  
  circle((0,-1), radius: 0.1, fill: white, stroke : (white))
  circle((0,4), radius: 0.1, fill: white, stroke : (white))

  
  content((10,stream_height -0.5), [Time])
  content((-2,stream_height), align(center,[Ultrasound Image\ Stream]))

  content((-2,prediction_stream_height), align(center,[Prediction\ Stream]))
  
  line((0,stream_height),(10,stream_height),mark: (end: ">"))
  line((0,prediction_stream_height),(10,prediction_stream_height),mark: (end: ">"))
  
  rect((-0.1,stream_height -0.3),(4.2,stream_height +0.3),stroke: (dash: "solid"), fill: rgb(30, 30, 30, 40) )


  
  line((4, stream_height -0.3),(4.1,prediction_stream_height +0.2),stroke: (dash: "solid"),  mark: (end: ">", size: 0.6))



  content((2.0,stream_height+1), text(8pt,align(center,[Single Prediction\ Context])))

  line((-0.1,stream_height+0.5),(4.2,stream_height+0.5),  mark: (start: ">", end: ">", size: 0.2))


  content((6.0,prediction_stream_height+1), text(8pt,align(center,[Time Between\ Prediction Updates])))

  line((4.1,prediction_stream_height+0.2),(8.1,prediction_stream_height+0.2),  mark: (start: ">", end: ">", size: 0.2))


  content((1.5,stream_height -1.0), text(8pt,align(center,[Time Between\ Stream Image Capture])))

  line((2.0,stream_height -0.5),(1.0,stream_height -0.5),  mark: (start: ">", end: ">", size: 0.2))
  
rect((3.5,(prediction_stream_height+stream_height)/2-0.2),(4.6,(prediction_stream_height+stream_height)/2+0.8), fill: orange.lighten(30%), stroke : (black))

content((4.03,(prediction_stream_height+stream_height)/2+0.3), align(center,text(size: 6pt, [_Machine\ Learning\ Model_])))




  let offset = 4
  let offset_y = stream_height -0.1
  rect((offset -0.2, offset_y -0.3),(offset+4.2, offset_y+0.3),stroke: (dash: "dashed"), fill:rgb(30, 30, 30, 20))
  line((offset+4, offset_y -0.3),(offset+4.1,prediction_stream_height+0.2),stroke: (dash: "dashed"),  mark: (end: ">", size: 0.6))
  
  
for i in range(1,10){
  circle((i,stream_height), radius: 0.1, fill: red)

  if i > 3 and calc.rem(i,2) ==0 and i!= 6{
      circle((i+0.1,prediction_stream_height), radius: 0.1, fill: green)
  }


  rect((7.5,(prediction_stream_height+stream_height)/2-0.2),(8.6,(prediction_stream_height+stream_height)/2+0.8), fill: orange.lighten(30%), stroke : (dash: "dashed"))

  
}

})
}


#let draw_timeline_diag_with_transformation = () => {




cetz.canvas(debug: false,
  {
  import cetz.draw: *


  let stream_height = 5
  let prediction_stream_height = 0
  
  circle((0,-1), radius: 0.1, fill: white, stroke : (white))
  circle((0,4), radius: 0.1, fill: white, stroke : (white))

  
  content((10,stream_height -0.5), [Time])
  content((-2,stream_height), align(center,[Ultrasound Image\ Stream]))

  content((-2,prediction_stream_height), align(center,[Prediction\ Stream]))
  
  line((0,stream_height),(10,stream_height),mark: (end: ">"))
  line((0,prediction_stream_height),(10,prediction_stream_height),mark: (end: ">"))
  
  rect((-0.1,stream_height -0.3),(4.2,stream_height +0.3),stroke: (dash: "solid"), fill: rgb(30, 30, 30, 40) )


  
  line((4, stream_height -0.3),(4.1,prediction_stream_height +0.2),stroke: (dash: "solid"),  mark: (end: ">", size: 0.6))



  content((2.0,stream_height+1), text(8pt,align(center,[Single Prediction\ Context])))

  line((-0.1,stream_height+0.5),(4.2,stream_height+0.5),  mark: (start: ">", end: ">", size: 0.2))


  content((6.0,prediction_stream_height+1), text(8pt,align(center,[Time Between\ Prediction Updates])))

  line((4.1,prediction_stream_height+0.2),(8.1,prediction_stream_height+0.2),  mark: (start: ">", end: ">", size: 0.2))


  content((1.5,stream_height -1.2), text(8pt,align(center,[Time Between\ Stream Image\ Capture])))

  line((2.0,stream_height -0.5),(1.0,stream_height -0.5),  mark: (start: ">", end: ">", size: 0.2))
  
rect((3.5,(prediction_stream_height+stream_height)/3-0.5),(4.6,(prediction_stream_height+stream_height)/3+0.5), fill: orange.lighten(30%), stroke : (black))

content((4.03,(prediction_stream_height+stream_height)/3), align(center,text(size: 6pt, [_Machine\ Learning\ Model_])))

rect((2.7,2 * ( prediction_stream_height+stream_height)/3-0.5),(5.3,2*(prediction_stream_height+stream_height)/3+0.5), fill: blue.lighten(80%), stroke : (black))

content((4.01,2 * (prediction_stream_height+stream_height)/3), align(center,text(size: 6pt, [Transformation to\ _Universal Representation_])))



  let offset = 4
  let offset_y = stream_height -0.1
  rect((offset -0.2, offset_y -0.3),(offset+4.2, offset_y+0.3),stroke: (dash: "dashed"), fill:rgb(30, 30, 30, 20))
  line((offset+4, offset_y -0.3),(offset+4.1,prediction_stream_height+0.2),stroke: (dash: "dashed"),  mark: (end: ">", size: 0.6))
  
  
for i in range(1,10){
  circle((i,stream_height), radius: 0.1, fill: red)

  if i > 3 and calc.rem(i,2) ==0 and i!= 6{
      circle((i+0.1,prediction_stream_height), radius: 0.1, fill: green)
  }


  rect((7.5,(prediction_stream_height+stream_height)/3-0.5),(8.6,(prediction_stream_height+stream_height)/3+0.5), fill: orange.lighten(30%), stroke : (dash: "dashed"))

  rect((6.7,2 * ( prediction_stream_height+stream_height)/3-0.5),(9.3,2*(prediction_stream_height+stream_height)/3+0.5), fill: blue.lighten(80%), stroke : (black))
  
  content((8.01,2 * (prediction_stream_height+stream_height)/3), align(center,text(size: 6pt, [Transformation to\ _Universal Representation_])))

content((8.03,(prediction_stream_height+stream_height)/3), align(center,text(size: 6pt, [_Machine\ Learning\ Model_])))

  
}

})
}