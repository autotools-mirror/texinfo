EXTRA_DIST = \
 block_EOL.texi \
 math_not_closed.texi \
 tex.texi tex_accents.texi tex_complex.texi \
 tex_encode_latin1.texi \
 tex_eqalign.texi \
 tex_gdef.texi \
 tex_in_copying.texi \
 tex_not_closed.texi \
 list-of-tests res_parser

DISTCLEANFILES = tests.log tests.out

distclean-local:
	rm -rf out_perl raw_out_perl out_native raw_out_native \
              diffs test_log

dist-hook:
	rm -rf `find $(distdir)/res_parser -name .git`
