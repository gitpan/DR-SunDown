#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "markdown.h"
#include "html.h"
#include "buffer.h"

#define OUTPUT_UNIT	1024

MODULE = DR::SunDown PACKAGE = DR::SunDown
PROTOTYPES: ENABLE

SV * markdown2html(mdata)
    SV * mdata

    PREINIT:
	struct buf *ob;
	STRLEN len;
	char *ptr;
	struct sd_callbacks callbacks;
	struct html_renderopt options;
	struct sd_markdown *markdown;


    CODE:
	if (!SvOK(mdata)) {
		RETVAL = mdata;
		return;
	}

	ptr = SvPV(mdata, len);
	ob = bufnew(OUTPUT_UNIT);

	sdhtml_renderer(&callbacks, &options, 0);
	markdown = sd_markdown_new(0, 16, &callbacks, &options);
	sd_markdown_render(ob, ptr, len, markdown);
	sd_markdown_free(markdown);

	if (!ob->size) {
		RETVAL = newSVpvn("", 0);
	} else {
		RETVAL = newSVpvn(ob->data, ob->size);
	}
	bufrelease(ob);

    OUTPUT:
        RETVAL


