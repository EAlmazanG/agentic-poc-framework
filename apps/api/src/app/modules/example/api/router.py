from fastapi import APIRouter

from app.modules.example.api.schemas import ExampleTemplateResponse
from app.modules.example.application.service import ExampleTemplateService

router = APIRouter(prefix="/examples", tags=["examples"])
service = ExampleTemplateService()


@router.get("/template", response_model=ExampleTemplateResponse)
def get_example_template() -> ExampleTemplateResponse:
    item = service.get_template_item()
    return ExampleTemplateResponse(name=item.name, purpose=item.purpose)
