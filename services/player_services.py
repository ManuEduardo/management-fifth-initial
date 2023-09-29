import constants

class PlayerServices:
    def __init__(self):
        self.players = constants.EQUIPO
        pass

    def get_player(self, number: int) -> constants.JugadorNBA:
        for player in self.players:
            print(player)
            if number == player.numero_camiseta:
                return player
