/// En la estructura se crea una copia independiente a la original, en la cual si se hace modificaciones, no alteran al original

import UIKit

struct Persona {
    let nombre: String
    var edad: Int
}

let alumno = Persona(nombre: "Emiliano", edad: 4)
var alumno2 = Persona(nombre: "Eduardo", edad: 55)


print(alumno2)

var alumno3 = alumno2

alumno3.edad = 90
print(alumno2)
print(alumno3)


