from app.modules.example.domain.models import ExampleTemplateItem


class ExampleTemplateService:
    def get_template_item(self) -> ExampleTemplateItem:
        return ExampleTemplateItem(
            name="example-module",
            purpose=(
                "Demonstrates where routers, services, domain models, "
                "and infrastructure code belong."
            ),
        )
