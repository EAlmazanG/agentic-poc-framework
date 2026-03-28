from dataclasses import dataclass


@dataclass(frozen=True)
class ExampleTemplateItem:
    name: str
    purpose: str
