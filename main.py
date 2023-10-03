from fastapi import Depends, FastAPI, HTTPException, Request, Response
from sqlalchemy.orm import Session

from src.database import SessionLocal, engine
from src.services import player_services, team_services
from src import models, schemas


models.Base.metadata.create_all(bind=engine)

app = FastAPI()

@app.middleware("http")
async def db_session_middleware(request: Request, call_next):
    response = Response("Internal server error", status_code=500)
    try:
        request.state.db = SessionLocal()
        response = await call_next(request)
    finally:
        request.state.db.close()
    return response

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@app.get('/api/player/{player_id}', response_model=schemas.Player)
def get_player(player_id: int, db: Session = Depends(get_db)):
    db_player = player_services.get_player(db, player_id)
    if db_player is None:
        raise HTTPException(status_code=404, detail="Player not found")
    return db_player


@app.post('/api/player/', response_model=schemas.Player)
def post_player(new_player: schemas.NewPlayer, db: Session = Depends(get_db)):
    db_player = player_services.post_player(db, new_player)
    if db_player is None:
        raise HTTPException(status_code=404, detail="Players not found")
    return db_player


@app.get('/api/players/tshirt/{player_tshirt}', response_model=list[schemas.Player])
def get_players_tshirt(player_tshirt: int, db: Session = Depends(get_db)):
    db_players = player_services.get_players_tshirt(db, player_tshirt)
    if db_players is None:
        raise HTTPException(status_code=406, detail="Tshirt no accepted")
    return db_players


@app.get('/api/team/{team_id}', response_model=schemas.TeamPlayers)
def get_team_players(team_id: int, db: Session = Depends(get_db)):
    db_team_players = team_services.get_team_players(db, team_id)
    if db_team_players is None:
        raise HTTPException(status_code=404, detail="Players not found")
    return db_team_players

# Mod 
@app.get('/api/players/position/{player_position}', response_model=list[schemas.Player])
def get_players_position(player_position: int, db: Session = Depends(get_db)):
    db_players = player_services.get_players_position(db, player_position)
    if db_players is None:
        raise HTTPException(status_code=406, detail="Position no accepted")
    return db_players

# Mod 2
@app.delete('/api/player/{player_id}', response_model=schemas.Player)
def delete_player(player_id: int, db: Session = Depends(get_db)):
    db_delplayer = player_services.del_player(db, player_id)
    if db_delplayer is None:
        raise HTTPException(status_code=404, detail="Player not found")
    return db_delplayer

# Mod 3
@app.put("/api/player/{player_id}")
def update_player(updated_player: schemas.Player, db: Session = Depends(get_db)):

    db_player = player_services.update_player(db, updated_player)
    
    if db_player is None:
        raise HTTPException(status_code=404, detail="Player not found")
    
    return db_player