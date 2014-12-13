function! cage433utils#find(list, predicate)
  for _ in a:list
    if eval(a:predicate)
      return [_]
    endif
  endfor
  return []
endfunction

