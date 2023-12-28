#let inset_size = 10pt
#let radius_size = 10pt

#let button_size = 10pt
#let button_spacing = 10pt

#let button_red_color = rgb("FF605C")
#let button_orange_color = rgb("FFBD44")
#let button_green_color = rgb("00CA4E")
#let toolbar_bg_color = rgb("282C34")
#let stroke_color = rgb("21252B")
#let main_bg_color = rgb("323842")
#let text_color = rgb("D4D8DF")

#let button(color: none) = {
  return box(
    width: button_size,
    height: button_size,
    radius: button_size,
    fill: color
  )
}

#let title(titletext) = {
  return text(
    fill: text_color,
    weight: "bold",
    size: 1.2em,
    baseline: 0.1em
  )[#titletext]
}

#let toolbar(titletext) = {
  return block(
    width: 100%,
    inset: inset_size,
    radius: (top: radius_size),
    fill: toolbar_bg_color,
    stroke: stroke_color,
    stack(
      dir: ltr,
      spacing: button_spacing,
      button(color: button_red_color),
      button(color: button_orange_color),
      button(color: button_green_color),
      align(center, move(dx: -20pt, title(titletext)))
    )
  )
}

#let main(ps1: [], input: [], output: []) = {
  return block(
    width: 100%,
    inset: inset_size,
    radius: (bottom: radius_size),
    fill: main_bg_color,
    stroke: stroke_color,
    [
      #text(fill: rgb("56B6C2"), ps1)
      #text(fill: rgb("E5C07B"), input) \
      #text(fill: text_color, output)
    ]
  )
}

#let term(ps1: "", input: "", title: "", output: []) = {
  return align(left, 
    box(
      width: auto,
      stack(
        dir: ttb,
        align(left, toolbar(title)),
        main(
          ps1: ps1,
          input: input,
          output: output.text
        )
      )
    )
  )
}