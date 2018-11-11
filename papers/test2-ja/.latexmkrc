#!/usr/bin/env perl

### Paper settings ###
$paper_lang = 'ja'; # 'en' or 'ja'
$kanji = 'utf8'; # used if $paper_lang == 'ja'
$max_repeat = 5;
$pdf_mode = 3; # generates pdf via $dvipdf command

### Latexmk settings ###
if ($paper_lang eq 'ja') {
  $latex = "platex -kanji=${kanji} -synctex=1 -halt-on-error";
  $bibtex = 'pbibtex %O %B';
  $dvipdf = 'dvipdfmx %O -o %D %S';
} elsif ($paper_lang eq 'en') {
  $latex = 'latex -synctex=1 -halt-on-error';
  $bibtex = 'bibtex %O %B'; # default
  $dvipdf = 'dvipdfmx %O -o %D %S';
}
$latex_silent_switch = '-interaction=batchmode'; # default
$makeindex = 'mendex %O -o %D %S'; # default

### Previewer settings ###

if ($^O eq 'MSWin32') {
  if (-f "C:/Program Files/SumatraPDF/SumatraPDF.exe") {
    $pdf_previewer = '"C:/Program Files/SumatraPDF/SumatraPDF.exe" -reuse-instance %O %S';
  }
} elsif ($^O eq 'darwin') {
  if (-f "/Applications/Skim.app") {
    # pvc_view_file_via_temporary [1]:
    #   Prevent latexmk from removing PDF after typeset when invoked with -pvc.
    #   This enables Skim to chase the update in PDF automatically.
    $pvc_view_file_via_temporary = 0;
    $pdf_previewer = "open -ga /Applications/Skim.app";
  } else {
    # pdf_update_method [1 under UNIX, 3 under MS-Windows]:
    #   0 => update is automatic,
    #   1 => manual update by user, which may only mean a mouse click on the
    #        viewer's window or may mean a more serious action.
    #   2 => Send the signal, whose number is in the variable
    #        $dvi_update_signal. The default value under UNIX is suitable for
    #        xdvi.
    #   3 => Viewer cannot do an update, because it locks the file. (As with
    #        acroread under MS-Windows.)
    #   4 => run a command to do the update.  The command is specified by the
    #        variable $dvi_update_command.
    $pdf_update_method = 4;
    $pdf_perviewer = "open -ga Preview %S";
  }
}

# print '$^O = ';
# print $^O;
# print "\n";
# print '$pdf_previewer = ';
# print $pdf_previewer;
# print "\n";
