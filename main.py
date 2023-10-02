from fastapi import Depends, FastAPI, HTTPException, Request, Response
from sqlalchemy.orm import Session

from database import SessionLocal, engine
from services import player_services
import models
import schemas


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


@app.get('/api/players_by_tshirt/{player_tshirt}', response_model=list[schemas.Player])
def get_player(player_tshirt: int, db: Session = Depends(get_db)):
    db_player = player_services.get_players_tshirt(db, player_tshirt)
    if db_player is None:
        raise HTTPException(status_code=404, detail="Players not found")
    return db_player
