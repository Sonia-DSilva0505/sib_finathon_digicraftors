from fastapi import FastAPI, Body
from pydantic import BaseModel
import uvicorn
from models import get_list_main, alter_user_list_main 

app = FastAPI()

class User(BaseModel):
  uid: str

@app.post("/get_tags_list") 
async def get_tags(user: User = Body(...)):
  llist = get_list_main(uid=user.uid)
  return {"tag_list" : llist}

# route for getting the clusters of users

@app.put("/post_answer")
async def post_answer(user_id: str, answer: int, feature: str):
  alter_user_list_main(cust_id=user_id, response=answer, feature=feature)
  return {"success": True}

if __name__ == "__main__":
  uvicorn.run(app, host="127.0.0.1", port=8000)


