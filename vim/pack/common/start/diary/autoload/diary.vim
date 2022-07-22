vim9script

export def InsertHeader()
  append(0, "---")
  append(1, "title: " .. substitute(expand("%:t:r"), "^20[0-9]\\{6\\}\\(\\.[0-9]*\\)\\?_", "", ""))
  append(2, "date: " .. strftime("%Y-%m-%d %H:%M-"))
  append(3, "---")
  append(4, "")

  if exists("g:diary_headers")
    for k in keys(g:diary_headers)
      append(3, k .. ": " .. g:diary_headers[k])
    endfor
  endif
enddef
