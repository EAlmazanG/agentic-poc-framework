from pydantic import BaseModel


class ExampleTemplateResponse(BaseModel):
    name: str
    purpose: str
