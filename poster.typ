#import "@preview/tiaoma:0.3.0"

#set page(
    // paper: "presentation-16-9",
    paper: "a4",
    flipped: true,
    fill: gradient.linear(
        rgb("2bb2c5"), rgb("#2bc370"),
        dir: ttb
    ),
    margin: (top: 6em, x: 2em, bottom: 2em),
    header: text(fill: white, size: 3em, weight: "bold")[school.gpul.org]
)
#set align(center + horizon)
#set text(font: "Roboto")

#show heading.where(level: 1): text.with(size: 2.4em)
#show heading.where(level: 2): text.with(size: 1.65em)
#show heading.where(level: 3): text.with(size: 1.4em)

#let data = json(bytes(sys.inputs.at("data", default: ```{
    "date" : "13/12/2023", 
    "start": "16:00",
    "end" : "17:30",
    "room" : "2.12",
    "name" : "Software libre que y datos abiertos en la administración pública",
    "desc" : "En esta charla veremos qué pasa cuando no se utilizan estándares de datos o se utilizan incorrectamente y cómo descubrir y utilizar los datos públicos de la administración cuando no hay una API documentada. También veremos ejemplos reales de malas prácticas en webs y aplicaciones públicas.",
    "logo" : "logo_bevy.svg",
    "url" : "https://gpul.org/eventos/"
  }```.text
)))

#{
  // Parsing the date
  let (day, month, year) = data.date.split("/")
  data.date = datetime(
      day: int(day),
      month: int(month),
      year: int(year)
  ).display("[weekday] [day] [month repr:long]")
}

#let (date, start, end, room, name, desc, logo, url) = data

#set grid.cell(stroke: 1pt + red)
#set box(stroke: 1pt + black)

#block(
    fill: white,
    spacing: 1em,
    inset: 2em,
    radius: 7%,
)[
    #grid(
        rows: (1.5fr, 1fr, 2fr, 90pt),
        grid(columns: (15%, 1fr, 15%),
            image(logo),
            heading(level: 1)[#name],
            image("logo_gpul.svg")
        ),
        [ === #date, de #start a #end \ aula #room - facultade de informática],
        [ == #desc ],
        stack(dir: ltr, spacing: 1fr,
            [],
            [ === Síguenos en redes sociales: #strong("@gpul_") ],
            tiaoma.qrcode(url, width: 90pt),
            [],
        )
    )
]
