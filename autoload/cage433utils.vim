function! cage433utils#find(list, predicate)
  for _ in a:list
    if eval(a:predicate)
      return [_]
    endif
  endfor
  return []
endfunction

function! cage433utils#list_contains(list, term)
  for l in a:list
    if l == a:term
      return 1
    endif
  endfor
  return 0
endfunction

function! cage433utils#index_of(list, predicate, ...)
  let fwd = a:0 > 0 ? a:1 : 1
  let list_ = fwd ? a:list : reverse(copy(a:list))
  let idx = 0
  for _ in list_
    if eval(a:predicate)
      return fwd ? idx : len(list_) - 1 - idx
    else
      let idx += 1
    endif
  endfor
  return -1
endfunction

function! cage433utils#lines_in_current_buffer()
  return getbufline(bufnr('%'), 1, "$")
endfunction

function! cage433utils#jump_to_buffer_window(bufname)
  let window_no = bufwinnr(a:bufname)
  if window_no == -1
    throw "No window for buffer ".bufname
  endif
  exec ":normal ".window_no."\<C-w>w"
endfunction


function! cage433utils#sum(list)
  let sum = 0
  for l in a:list
    let sum += l
  endfor
  return sum
endfunction

function! cage433utils#left_justify(text, width)
  let space = repeat(" ", a:width - strlen(a:text))
  return a:text.space
endfunction

function! cage433utils#right_justify(text, width)
  let space = repeat(" ", a:width - strlen(a:text))
  return space.a:text
endfunction

function! cage433utils#list_to_set(list)
  let set = {}
  for l in a:list
    let set[l] = 1
  endfor
  return set
endfunction

function! cage433utils#get_or_update(dict, key, default)
  if ! has_key(a:dict, a:key)
    let a:dict[a:key] = a:default
  endif
  return a:dict[a:key]
endfunction
