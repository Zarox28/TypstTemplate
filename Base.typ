// ----- PACKAGES IMPORT -----
#import "@preview/gentle-clues:0.4.0": *
#import "@preview/outrageous:0.1.0"
#import "@preview/sourcerer:0.2.1": code
#import "@preview/splash:0.3.0": xcolor
#import "Term.typ": term

// ----- MAIN CONFIGURATION -----
#let conf(body) = {
  // Numbering
  set page(numbering: "1", number-align: center)

  // Font
  set text(font: "Linux Libertine", lang: "fr")

  // Table Of Contents
  set outline(title: none, depth: 3, indent: 0.6em)
  show outline.entry: outrageous.show-entry
  show outline: it => {
    align(center)[
      #underline(
        stroke: 1.2pt + red,
        offset: 4pt,
        text(weight: 700, 1.65em)[Table des matières]
      )
    ]
    it
  }

  // Code
  set raw(tab-size: 2)
  show raw.where(block: true): it => (
    code(
      lang: upper(it.lang.first()) + it.lang.slice(1),
      it
    )
  )
  show raw.where(block: false): (
    box.with(
      fill: luma(240),
      inset: (x: 3pt, y: 0pt),
      outset: (y: 3pt),
      radius: 2pt
    )
  )

  // List
  set list(marker: ([•], [◦], [•]))
  show list: it => move(dx: 5%, it)
  show enum: it => move(dx: 5%, it)

  // Table
  set table(align: center)

  // Page Content
  body
}

// ----- CLASS CONFIGURATION -----
#let class(theme: "", theme_num: 1, chapter: "", chapter_num: 1, body) = {
  // Heading
  set heading(numbering: "I/A.1 - ")
  show heading: it => {
    if (it.level < 4) {
      if (it.level == 1) {
        if (it.outlined) {
          counter(heading).display("I/ ")
        }
        
      } else {
        counter(heading).display()
      }
      
      underline(stroke: 1.2pt + red, offset: 4pt, it.body)
      
    } else {
      underline(stroke: 1.2pt + blue, offset: 4pt, it.body)
    }
    
    linebreak()
  }

  // Theme Displaying
  text(weight: 700, 1.65em)[
    #align(left)[#underline(stroke: 1.2pt + red, offset: 4pt)[Thème #theme_num : ]]
    #text(hyphenate: false, theme)
  ]

  // Chapter Displaying
  text(weight: 600, 1.58em)[
    #align(left)[#underline(stroke: 1.2pt + blue, offset: 4pt)[Chapitre #chapter_num : ]]
    #text(hyphenate: false, chapter)
  ]

  // Seperator
  align(center)[#line(length: 80%)]

  // Table Of Contents
  outline()

  // Seperator
  align(center)[#line(length: 80%)]

  // Page Content
  body
}

// ----- NOTE-TAKING CONFIGURATION -----
#let note(title: "", name: "", date: false, body) = {
  // Heading
  show heading: it => {
    if (it.level < 4) {
      underline(stroke: 1.2pt + red, offset: 4pt, it.body)
    
    } else {
      underline(stroke: 1.2pt + blue, offset: 4pt, it.body)
    }
  }

  // Name Displaying
  text(1.3em)[
      #align(left)[#underline(stroke: 1pt + black, offset: 4pt)[#name]]
  ]

  // Today Date Displaying
  if date {
    text(1.3em)[
      #align(left)[#underline(stroke: 1pt + black, offset: 4pt)[#datetime.today().display()]]
    ]
  }

  // Title Displaying
  text(weight: 700, 1.58em)[
    #align(center)[#underline(stroke: 1.2pt + red, offset: 4pt)[#title]]
  ]

  // Seperator
  line(length: 100%)

  // Page Content
  body
}

// ----- TAB FUNCTION -----
#let tab(size: 1, body) = {
  move(dx: 5% * size, body)
}

// ----- UNDERLINE FUNCTION -----
#let under(color: red, body) = {
  underline(stroke: 1.2pt + color, offset: 4pt)[#body]
}

// ----- CALLOUT FUNCTION -----
#let call(size: 1, body) = {
  tab(size: size)[
    #box(
      width: 85%,
      stack(
        dir: ltr,
        move(dy: -0.24%, emoji.arrow.filled),
        move(dx: 1%, body)
      )
    )
  ]
}

// ----- WORD DEFINITION FUNCTION -----
#let def(word: "", ..args) = clue(
  title: "Définition : " + word,
  _color: yellow,
  icon: emoji.book,
  ..args
)