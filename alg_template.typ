
#let template_func(
  title: none,
  version : none,
  document_id : none,
  doc,
) = {
  //set text(font: "Allura")
  set text(font: "Open Sans")
  set page(
    header:[
      #set align(center)
      #grid(
      columns: (2fr, 4fr, 0.8fr, 1.4fr), gutter: 1pt,
  [ #figure(image("ultrasight_logo.png", width: 100%), kind: "misc", supplement: none )],
  [ 
   #set par(leading: 0.6em)
   #set text(spacing: 100%)
  #text(title) \ Document #text(document_id) ],
  [],
  [  #set par(leading: 0.6em)
   #set text(spacing: 100%)
  Page #context {
  counter(page).display()} of 
  #context {
  counter(page).final().at(0)}\ 
  Version #text(version)
  ]
)
  #v(-10pt)
  #line(length: 100% ,stroke : rgb(0, 255, 151))
  
 
],
  footer : [
    #set par(leading: 0.5em)
    #text(spacing: 100%, gray.darken(20%),align(center,  [UltraSight confidential\
\*\*\* Printed copies are uncontrolled unless otherwise verified \*\*\*\
Before using this document, please verify this is the latest revision and release]))
    
  ]
  


)
  set par(justify: true)
  
  v(0pt)
  
  set align(center)
  text(20pt, [ #strong(title)])
  v(0pt)
  text(15pt, [October 28, 2024])
  
  
  set heading(numbering: "1.")

  show heading: it => {
    [ #set text(spacing: 100%)
    #v(0.3em)
    #it
  #v(1.2em)]
}

set par(justify: false, first-line-indent: 0em, leading: 0.7em)
set text(size: 11pt, spacing: 150%)
//set block(spacing: 1.5em)
  //show par: {set text(size: 3pt, spacing: 0.65em)}

set align(left)


show outline.entry.where(
  level: 1
): it => {
  v(25pt, weak: true)
  text(strong(it), fill: black)
} 
show outline.entry.where(
  level: 2
): it => {
  v(15pt, weak: true)
  h(25pt)
  text(it)
}





outline(depth:2, title: none)

pagebreak()

set list(marker: ([•], [\u{25E6}], [\u{2023}]), indent: 20pt, body-indent:10pt)
set enum(indent: 20pt, body-indent:10pt)

show figure.caption: it => text(size: 10pt, style: "oblique", it)




  doc
}


#let mlm = text([_MLM_])
#let PL = text([Philips Lumify])
#let ML = text([machine learning])
#let ur = text([_universal representation_])
#let Ur = text([Universal representation])
#let fk = text([510(K)]) 
#let eg = text([_e.g.,_])
#let ie = text([_i.e.,_])
#let etc = text([_etc.,_])


#let imp = text([Impella#super[\u{00AE}]])
#let imp-cp = text([Impella-cp#super[\u{00AE}]])
#let tmi = text([mechanical circulatory support device]) 
#let Tmi = text([Mechanical circulatory support device]) 
#let tmis = text([mechanical circulatory support devices]) 
#let Tmis = text([Mechanical circulatory support devices]) 
#let useg = text([UltraSight Impella AI])

#let js(comment_text) = box(baseline: 30%, rect(stroke: black, fill: red.lighten(30%), str("Jonathan: ") + comment_text))
#let ad(comment_text) = box(baseline: 30%, rect(stroke: black, fill: green.lighten(30%), str("Adam: ") + comment_text))
#let na(comment_text) = box(baseline: 30%, rect(stroke: black, fill: blue.lighten(50%), str("Noa: ") + comment_text))
#let ik(comment_text) = box(baseline: 30%, rect(stroke: black, fill: rgb("#8B60A6").lighten(20%), str("Itay: ") + comment_text))
#let rg(comment_text) = box(baseline: 30%, rect(stroke: black, fill: aqua.darken(30%), str("Raanan: ") + comment_text))
#let ta(comment_text) = box(baseline: 30%, rect(stroke: black, fill: orange, str("Talia: ") + comment_text))
#let sm(comment_text) = box(baseline: 30%, rect(stroke: black, fill: navy.lighten(50%), str("Sarah: ") + comment_text))
#let iw(comment_text) = box(baseline: 30%, rect(stroke: black, fill: green.lighten(50%), str("Issahar: ") + comment_text))

#let todo(todo_text) = box(baseline: 30%, rect(stroke: yellow, fill: aqua, str("To Do: ") + todo_text))
#let task(todo_text) = box(baseline: 30%, rect(stroke: black, fill: blue.lighten(50%), todo_text))


#let appendices(body) = {
  counter(heading).update(0)
  counter("appendices").update(1)

  set heading(
    numbering: (..nums) => {
      let vals = nums.pos()
      let value = "ABCDEFGHIJ".at(vals.at(0) - 1)
      if vals.len() == 1 {
        return "Appendix " + value
      }
      else {
        return value + "." + nums.pos().slice(1).map(str).join(".")
      }
    }  
  );
  [#body]

  
}


#let linebreaklist() = {
  [#linebreak()
  #linebreak()]  
}