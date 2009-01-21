" my filetype file
if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.ctp  setfiletype html
  au! BufRead,BufNewFile *.tpl  setfiletype html
augroup END
