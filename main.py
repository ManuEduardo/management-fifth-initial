from fastapi import Depends, FastAPI, HTTPException, Request, Response
from sqlalchemy.orm import Session

from src.database import SessionLocal, engine
from src.services import player_services, team_services
from src import models
from src import schemas


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


@app.get('/api/players/tshirt/{player_tshirt}', response_model=list[schemas.Player])
def get_players_tshirt(player_tshirt: int, db: Session = Depends(get_db)):
    db_players = player_services.get_players_tshirt(db, player_tshirt)
    if db_players is None:
        raise HTTPException(status_code=404, detail="Players not found")
    return db_players


@app.get('/api/team/{team_id}', response_model=schemas.TeamPlayers)
def get_team_players(team_id: int, db: Session = Depends(get_db)):
    db_team_players = team_services.get_team_players(db, team_id)
    if db_team_players is None:
        raise HTTPException(status_code=404, detail="Players not found")
    return db_team_players
