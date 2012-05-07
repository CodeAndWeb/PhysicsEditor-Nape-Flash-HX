def:

haxe:
	haxe -cp . -main Main -swf Main.swf -swf-lib haxe_release_nape.swf \
		-swf-version 10 -swf-header 580:400:60:333333
	fp Main.swf

as3:
	mxmlc Main.as --include-libraries release_nape.swc -optimize -strict \
		-target-player 10 -static-link-runtime-shared-libraries
	fp Main.swf
