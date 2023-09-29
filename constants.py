from typing import List


class JugadorNBA:
    nombre = ""
    posicion = ""
    edad = 0 
    altura = 0 
    promedio_ppp = 0
    numero_camiseta = 0
    
    
    def __init__(self, nombre, posicion, edad, altura, promedio_ppp, numero_camiseta):
        self.nombre = nombre
        self.posicion = posicion
        self.edad = edad
        self.altura = altura
        self.promedio_ppp = promedio_ppp
        self.numero_camiseta = numero_camiseta

EQUIPO : List[JugadorNBA] = [
    JugadorNBA("LeBron James", "Alero", 36, "6'9''", 25.0, 23),
    JugadorNBA("Kevin Durant", "Alero", 32, "6'10''", 28.1, 7),
    JugadorNBA("Stephen Curry", "Base", 33, "6'2''", 27.8, 30),
    JugadorNBA("Giannis Antetokounmpo", "Alero", 26, "6'11''", 28.1, 34),
    JugadorNBA("Luka Dončić", "Base", 22, "6'7''", 27.0, 77),
    JugadorNBA("Joel Embiid", "Pívot", 27, "7'0''", 28.5, 21),
    JugadorNBA("Kawhi Leonard", "Alero", 30, "6'7''", 26.9, 2),
    JugadorNBA("Damian Lillard", "Base", 31, "6'2''", 28.8, 0),
    JugadorNBA("Anthony Davis", "Pívot", 28, "6'10''", 22.5, 3),
    JugadorNBA("Devin Booker", "Escolta", 24, "6'5''", 25.6, 1)
]