from wagtail.wagtailcore.models import Page
from django.db import models
from wagtail.wagtailadmin.edit_handlers import FieldPanel

class CorePage(Page):
    core_field = models.CharField(max_length=1024, blank=True)

    content_panels = Page.content_panels + [
        FieldPanel('core_field'),
    ]
