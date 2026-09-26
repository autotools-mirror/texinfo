#! /bin/sh
# Run all Texinfo tests.
#
# Copyright 2010-2026 Free Software Foundation, Inc.
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.

check_need_recoded_file_names ()
{
   if echo "$remaining" | grep 'Need recoded file names' >/dev/null; then
     if [ "$no_recoded_file_names" = 'yes' ]; then
       echo "S: (no recoded file names) $current"
       return 1
     fi
   fi
   return 0
}

check_need_non_ascii_file_names ()
{
   if echo "$remaining" | grep 'Need non-ASCII file names' >/dev/null; then
     if [ "$no_non_ascii_file_names" = 'yes' ]; then
       echo "S: (no non-ASCII file names) $current"
       return 1
     fi
   fi
   return 0
}

check_unicode_collate_ok ()
{
  if echo "$remaining" | grep 'Need collation compatibility' >/dev/null; then
    if test "z$PERL_UNICODE_COLLATE_OK" = 'zno' ; then
      echo "S: (no compatible unicode collation) $current"
     return 1
    fi
  fi
  return 0
}

check_strxfrm_ok ()
{
  if echo "$remaining" | grep XS_STRXFRM_COLLATION_LOCALE >/dev/null; then
    if test "z$TEXINFO_XS" = 'zomit' ; then
      echo "S: (Need TEXINFO_XS set) $current"
     return 1
    fi
  fi
  return 0
}

check_latex2html_and_tex4ht ()
{
  use_latex2html=no
  use_tex4ht=no
  maybe_use_latex2html=no
  if echo "$remaining" | grep '[-]l2h' >/dev/null; then
    maybe_use_latex2html=yes
  fi
  if echo "$remaining" | grep 'HTML_MATH l2h' >/dev/null; then
    maybe_use_latex2html=yes
  fi
  if [ $maybe_use_latex2html = 'yes' ]; then
    if [ "$no_latex2html" = 'yes' ]; then
      echo "S: (no latex2html) $current"
      return 1
    fi
    use_latex2html=yes
  else
    maybe_use_tex4ht=no
    if echo "$remaining" | grep '[-]init tex4ht.pm' >/dev/null; then
      maybe_use_tex4ht=yes
    fi
    if echo "$remaining" | grep 'HTML_MATH t4h' >/dev/null; then
      maybe_use_tex4ht=yes
    fi
    if [ $maybe_use_tex4ht = 'yes' ]; then
      if test "$no_tex4ht" = 'yes' ; then
        echo "S: (no tex4ht) $current"
        return 1
      fi
      use_tex4ht=yes
    fi
  fi
  return 0
}

check_info_math2img ()
{
  use_info_math2img=no
  maybe_use_info_math2img=no
  if echo "$remaining" | grep 'INFO_MATH_IMAGES.1' >/dev/null; then
    maybe_use_info_math2img=yes
  fi
  if [ $maybe_use_info_math2img = 'yes' ]; then
    if [ "$no_dvipng" = 'yes' ]; then
      echo "S: (no dvipng) $current"
      return 1
    fi
    use_info_math2img=yes
  fi
  return 0
}

ref_dir_suffix='parser'

# process the output so we can get consistent output for the comparisons
post_process_output ()
{
  # With latex2html or tex4ht output is stored in raw_outdir, and files
  # are removed or modified from the output directory used for comparisons
  # NB there is similar code in many_input_files/tex_{l2h,t4ht}.sh.
  if test "$use_latex2html" = 'yes' || test "$use_tex4ht" = 'yes' \
          || test "$use_info_math2img" = 'yes'; then

    cp -pr ${outdir}$dir/ "${raw_outdir}"

    # remove files that are not reproducible
    rm -f "${outdir}$dir/$basename.1" ${outdir}$dir/*.png ${outdir}$dir/*.svg \
          ${outdir}$dir/*_l2h_images.log ${outdir}$dir/*_l2h_images.pdf ${outdir}$dir/*_tex4ht_*.log \
          ${outdir}$dir/*_tex4ht_*.idv ${outdir}$dir/*_tex4ht_*.dvi \
          ${outdir}$dir/*_l2h.html.*
          #${outdir}$dir/*_tex4ht_tex.html*
  else
    mkdir -p "${raw_outdir}$dir/"
    cp -p "${outdir}$dir/$basename.2" "${raw_outdir}$dir/"
  fi

  if test "$use_tex4ht" = 'yes' ; then
    # tex4ht may be customized to use dvipng or dvips, both being
    # verbose, so there can not be reproducible tests on stderr either
    # with tex4ht.
    rm "${outdir}$dir/$basename.2"
  else
    if test "$use_latex2html" = 'yes' ; then
      sed -e 's/^texexpand.*/texexpand /' \
          -e '/is no longer supported at.*line/d' \
          -e "s/${dir_suffix}/${ref_dir_suffix}/" \
          $raw_outdir$dir/$basename.2 > $outdir$dir/$basename.2
      # "*"_images.pl" files are not guaranteed to be present
      for file in "${raw_outdir}$dir/"*"_labels.pl"; do
       if test -f "$file" ; then
        filename=`basename "$file"`
        sed -e 's/^# LaTeX2HTML.*/# LaTeX2HTML/' "$file" > "$outdir$dir/$filename"
       fi
      done
      #for file in "${raw_outdir}$dir/"*.htm* "${raw_outdir}$dir/"*-l2h_cache.pm "${raw_outdir}$dir/"*_l2h_images.pl; do
      for file in "${raw_outdir}$dir/"*.htm* "${raw_outdir}$dir/"*-l2h_cache.pm; do
       if test -f "$file" ; then
       # width and height changed because of different rounding on
       # different computers.  Also remove version information.
        filename=`basename "$file"`
        sed -e 's/WIDTH="\([0-9]*\)\([0-9]\)"/WIDTH="100"/' \
            -e 's/HEIGHT="\([0-9]*\)\([0-9]\)"/HEIGHT="\10"/' \
            -e 's/CONTENT="LaTeX2HTML.*/CONTENT="LaTeX2HTML">/' \
            -e 's/^# LaTeX2HTML.*/# LaTeX2HTML/' \
            -e 's/with LaTeX2HTML.*/with LaTeX2HTML/' "$file" > "$outdir$dir/$filename"
       fi
      done
      # *_l2h_images.pl associate images original text with physical files
      # but entries are not sorted, so that the result is not reproducible
      # even with the normalizations above.
      rm -f ${outdir}$dir/*.aux ${outdir}$dir/*_images.out \
            ${outdir}$dir/*_l2h.css ${outdir}$dir/*_l2h_images.pl
    else
      sed -e "s/${dir_suffix}/${ref_dir_suffix}/" \
          $raw_outdir$dir/$basename.2 > $outdir$dir/$basename.2
      if test "$use_info_math2img" = 'yes' ; then
        rm -f ${outdir}$dir/*info_math2img.aux ${outdir}$dir/*info_math2img.log \
          ${outdir}$dir/*info_math2img.dvi
      fi
    fi
  fi
}

# ensure only ASCII filenames are used in output
escape_file_names ()
{
    utf8_argument=
    if test "z$1" = zutf8_output_file ; then
      utf8_argument=--utf8-argument
    fi
    find "${outdir}${dir}" | $PERL ${srcdir}/escape_file_names.pl $utf8_argument
}

LC_ALL=C; export LC_ALL
LANGUAGE=en; export LANGUAGE

prepended_command=
#prepended_command=time
# can also be put in ../defs to also affect tests in many_input_files
#prepended_command='valgrind -q'

default_command='perl/texi2any.pl'
#default_command='C/ctexi2any'
tested_command=$default_command

test_level=1

clean=no
copy=no
#mydir=

while [ z"$1" = 'z-clean' -o z"$1" = 'z-copy' -o z"$1" = 'z-native' ]; do
  if [ z"$1" = 'z-clean' ]; then
    clean=yes
    shift
  elif [ z"$1" = 'z-copy' ]; then
    copy=yes
    shift
  elif [ z"$1" = 'z-native' ]; then
    tested_command='C/ctexi2any'
    shift
  fi
done

testdir=$1
shift

if [ "z$testdir" = 'z' ]; then
  echo "Missing test directory" 1>&2
  exit 1
fi

if [ "z$srcdir" = 'z' ]; then
  srcdir=.
fi

. $testdir/../../defs || exit 1

if test z"$TESTS_MAIN_COMMAND" != z ; then
  tested_command=$TESTS_MAIN_COMMAND
fi

language_type=unknown
if test $tested_command = 'perl/texi2any.pl' ; then
  prepended_command="$prepended_command $PERL -w"
  language_type='perl'
elif test $tested_command = 'C/ctexi2any' ; then
  language_type='native'
fi

dir_suffix=$language_type

if test z"$DEFAULT_TEST_LEVEL" = z1 -o z"$DEFAULT_TEST_LEVEL" = z2 ; then
  test_level=$DEFAULT_TEST_LEVEL
fi

one_test_logs_dir=$testdir/test_log
logfile=$testdir/tests.log

res_dir=res_${ref_dir_suffix}
out_dir=out_${dir_suffix}
raw_out_dir=raw_out_${dir_suffix}
diffs_dir=diffs

no_latex2html=yes
if which latex2html > /dev/null 2>&1; then
  no_latex2html=no
fi

no_tex4ht=yes
if which httexi > /dev/null 2>&1; then
  no_tex4ht=no
fi

no_dvipng=yes
if which dvipng > /dev/null 2>&1; then
  no_dvipng=no
fi

no_recoded_file_names=yes
if sed 1q input_file_names_recoded_stamp.txt | grep 'OK' >/dev/null; then
  no_recoded_file_names=no
fi

# In Windows the recoding of file name is not reliable, as the file name may
# be stored as UTF-16 using the user codepage to determine which codepage
# the non-ASCII character comes from, and not the codepage that would have been
# expected from the Perl code when creating the file, in
# maintain/copy_change_file_name_encoding.pl and when determining the file name
# to read in the tests (Latin1 in the current case).  Note that if the user
# codepage is an encoding in which the character exists and is converted to and
# from UTF-16 as the byte expected in Latin1, some tests may succeed even if
# the characters shown and the locales used are not the ones expected.
# However, if the character does not exist in the encoding, for instance in
# case of multibyte encoding the character may not reliably be be converted to
# a file name and read, so we skip the tests.
if test "z$HOST_IS_WINDOWS_VARIABLE" = 'zyes' ; then
  no_recoded_file_names=yes
fi

no_non_ascii_file_names=yes
if sed 1q non_ascii_extracted_stamp.txt | grep 'OK' >/dev/null; then
  no_non_ascii_file_names=no
fi

one_test=no
if test -n "$1"; then
  one_test=yes
  the_test=$1
  test_name=$the_test
  test -d $one_test_logs_dir || mkdir $one_test_logs_dir
  logfile=$one_test_logs_dir/${language_type}_$test_name.log
fi

base_results_dir=$testdir/
test_file=list-of-tests
driving_file=$srcdir/$testdir/$test_file

echo "testdir: $testdir" >$logfile
echo "driving_file: $driving_file" >>$logfile

if test -f "$driving_file"; then
  :
else
  echo "$0: Cannot find test driver file $driving_file" 1>&2
  exit 1
fi

resdir=$srcdir/$testdir/${res_dir}/
test -d "$resdir" || mkdir "$resdir"
echo "made result dir: $resdir" >>$logfile

if [ "z$clean" = 'zyes' -o "z$copy" = 'zyes' ]; then
  while read line
  do
    if echo $line | grep '^ *#' >/dev/null 2>&1; then continue; fi
# there are better ways
    dir=`echo $line | awk '{print $1}'`
    file=`echo $line | awk '{print $2}'`
    #remaining=`echo $line | sed 's/[a-zA-Z0-9_./-]*  *[a-zA-Z0-9_./-]* *//'`
    remaining=`echo $line | sed 's/[a-zA-Z0-9_é./-]*  *[a-zA-Z0-9_é./-]* *//'`
    [ "z$dir" = 'z' -o "z$file" = 'z' ] && continue
    if [ "z$clean" = 'zyes' ]; then
      outdir="$testdir/${out_dir}/"
      raw_outdir="$testdir/${raw_out_dir}"
      [ -d "${outdir}$dir" ] && rm -rf "${outdir}$dir"
      [ -d "${raw_outdir}$dir" ] && rm -rf "${raw_outdir}$dir"
    else
      outdir="$testdir/${out_dir}/"
      resdir="$srcdir/$testdir/${res_dir}/"
      if [ -d "${outdir}$dir" ]; then
        mkdir -p "${resdir}$dir/"
        rm -rf "${resdir}$dir/"*
        cp -r "${outdir}$dir/"* "${resdir}$dir/"
      else
        echo "$0: No dir ${outdir}$dir" >&2
        exit 1
      fi
    fi
  done < "$driving_file"
  exit 0
fi

mkdir -p $testdir/$diffs_dir

outdir="$testdir/${out_dir}/"
mkdir -p "${outdir}"

return_code=0

# prepended to path to go back from the directory where the command tested is
# called to the directory the current script is called from.
# Corresponds to $testdir/${out_dir}/$dir or "${outdir}$dir", for example
# formatting/out_perl/test_name.
to_current=../../../

if test "z$t2a_srcdir" != 'z' ; then
  t2a_srcdir="${to_current}$t2a_srcdir"
  export t2a_srcdir
fi
if test "z$t2a_builddir" != 'z' ; then
  t2a_builddir="${to_current}$t2a_builddir"
  export t2a_builddir
fi

exec <"$driving_file"
while read line; do
  # skip comments.
  if echo $line | grep '^ *#' >/dev/null; then continue; fi

  current=`echo $line | awk '{print $1}'`
  file=`echo $line | awk '{print $2}'`
  #
  # skip empty lines.
  (test "z$current" = 'z' || test "z$file" = 'z') && continue
  #
  # if we're only doing one test, skip it unless this is the one.
  if test $one_test = 'yes' && test "z$current" != "z$the_test" ; then
    continue
  fi

  basename=`basename $file .texi`
  #remaining=`echo $line | sed 's/[a-zA-Z0-9_./-]*  *[a-zA-Z0-9_./-]* *//'`
  remaining=`echo $line | sed 's/[a-zA-Z0-9_é./-]*  *[a-zA-Z0-9_é./-]* *//'`

  case $file in
      built_input/*) src_file="$file" ;;
      *)             src_file="$srcdir/$testdir/$file" ;;
  esac

  command_run=
  for command_location_dir in "$srcdir/../" "$srcdir/../../" $testdir/../../; do
    if [ -f "$command_location_dir/$tested_command" ]; then
      command_run="$command_location_dir/$tested_command"
      break
    fi
  done
  if test -n "$command_run"; then
    # we're going to show the exact cmd below anyway, don't repeat here.
    echo >>$logfile
    echo "doing test $current, src_file $src_file" >>$logfile
  else
    echo "$0: Command $tested_command not found" >&2
    exit 1
  fi

  results_dir="$srcdir/$testdir/${res_dir}"
  one_test_done=yes

  skipped_test=no
  check_need_recoded_file_names || skipped_test=yes
  check_need_non_ascii_file_names || skipped_test=yes
  check_latex2html_and_tex4ht || skipped_test=yes
  check_info_math2img || skipped_test=yes
  check_unicode_collate_ok || skipped_test=yes
  check_strxfrm_ok || skipped_test=yes
  if [ "$skipped_test" = 'yes' ] ; then
    if test $one_test = 'yes' ; then
      return_code=77
    fi
    continue
  fi

  utf8_output_file=no
  if echo "$remaining" | grep 'OUTPUT_FILE_NAME_ENCODING=UTF-8' >/dev/null; then
    utf8_output_file=utf8_output_file
  fi

  dir=$current
  test -d "${outdir}$dir" && rm -rf "${outdir}$dir"
  mkdir "${outdir}$dir"

  srcdir_path="${to_current}$srcdir"

  l2h_flags=
  tmp_dir=
  if test z$use_latex2html = zyes ; then
    cd ${outdir}$dir || exit 1
    tmp_dir=`mktemp -d l2h_t2h_XXXXXXXX`
    if test z"$tmp_dir" = 'z'; then
      echo "$0: mktemp failed" 1>&2
      exit 1
    fi
    cd ${to_current} || exit 1
    l2h_flags="-c L2H_CLEAN=0 -c 'L2H_TMP $tmp_dir' -c L2H_FILE=$srcdir_path/../perl/t/init/l2h.init"
  fi

  #remaining_out_dir=`echo $remaining | sed 's,@OUT_DIR@,'"${outdir}$dir/"',g'`
  remaining_out_dir=`echo $remaining | sed 's,@OUT_DIR@,./,g'`
  src_file_path="${to_current}$src_file"
  testdir_path="../.."
  echo "$tested_command $dir -> ${outdir}$dir" >> $logfile
  #cmd="$prepended_command $command_run --force --conf-dir $srcdir/../perl/t/init/ --conf-dir $srcdir/../perl/init --conf-dir $srcdir/../perl/ext -I $srcdir/$testdir -I $testdir/ -I $srcdir/ -I . -I built_input -I built_input/non_ascii --error-limit=1000 -c TEST=$test_level $l2h_flags --output ${outdir}$dir/ $remaining_out_dir $src_file > ${outdir}$dir/$basename.1 2>${outdir}$dir/$basename.2"
  command_run_path="${to_current}$command_run"
  cmd="(cd "${outdir}$dir" && $prepended_command $command_run_path --force --conf-dir $srcdir_path/../perl/t/init/ --conf-dir $srcdir_path/../perl/init --conf-dir $srcdir_path/../perl/ext -I $srcdir_path/$testdir -I $testdir_path/ -I $srcdir_path/ -I ${to_current} -I ${to_current}built_input -I ${to_current}built_input/non_ascii --error-limit=1000 -c TEST=$test_level $l2h_flags $remaining_out_dir $src_file_path > $basename.1 2>$basename.2)"
  echo "$cmd" >>$logfile
  eval $cmd
  ret=$?
  #
  # ran test, check results.
  if test $ret = 0 ; then
    diff_base="${dir}_${dir_suffix}"
    results_dir_used=
    if [ -d "$results_dir/$dir" ]; then
      results_dir_used="$results_dir/$dir"
    fi
    # store raw output
    raw_outdir="$testdir/${raw_out_dir}/"
    mkdir -p "${raw_outdir}"
    rm -rf "${raw_outdir}$dir"

    post_process_output
    test -n "$tmp_dir" && rm -rf ${outdir}$dir/$tmp_dir
    escape_file_names $utf8_output_file

    if test "z$results_dir_used" != 'z' ; then
      diff $DIFF_OPTIONS -r "$results_dir_used" "${outdir}$dir" 2>>$logfile > "$testdir/$diffs_dir/$diff_base.diff"
      dif_ret=$?
      if [ $dif_ret != 0 ]; then
        echo "D: $testdir/$diffs_dir/$diff_base.diff (printed below)"
        cat "$testdir/$diffs_dir/$diff_base.diff"
        echo "D: $testdir/$diffs_dir/$diff_base.diff (printed above)"
        return_code=1
      else
        rm "$testdir/$diffs_dir/$diff_base.diff"
      fi
    else
      echo "no res: $dir"
    fi
  else
    echo "failed with status $ret" >>$logfile
    echo "F: ${outdir}$dir/$basename.2 (printed below)"
    cat "${outdir}$dir/$basename.2"
    echo "F: ${outdir}$dir/$basename.2 (printed above)"
    return_code=1
  fi
done

if test "$one_test" = 'yes' && test "z$one_test_done" != "zyes"; then
  echo "$0: test not found: $the_test (file: $the_file) " >&2
  return_code=2
fi

echo >>$logfile
echo "all done, exiting with status $return_code" >>$logfile

exit $return_code
