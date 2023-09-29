from fastapi import FastAPI
from services.player_services import PlayerServices


app = FastAPI()
player_services_instance = PlayerServices()

@app.get('/api/v1/{number}')
def get_player(number:int):
    return player_services_instance.get_player(number)