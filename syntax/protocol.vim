if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword protogenTodo contained TODO FIXME XXX
syn cluster protogenCommentGrp contains=protogenTodo

syn keyword protogenSyntax include namespace attribute root_type
syn keyword protogenTypeDef enum
syn keyword protogenTypeDecl union struct table
syn keyword protogenFieldType int8_t uint8_t
syn keyword protogenFieldType int16_t uint16_t
syn keyword protogenFieldType int int32_t uint uint32_t
syn keyword protogenFieldType int64_t uint64_t
syn keyword protogenFieldType float float32 double float64
syn keyword protogenFieldType string
syn keyword protogenBool true false

syn region protogenComment start="//" skip="\\$" end="$" keepend contains=@protogenCommentGrp

syn match protogenInt /-\?\<\d\+\>/
syn match protogenInt /\<0[xX]\x+\>/
syn match protogenFloat /\<-\?\d*\(\.\d*\)\?/

syn region protogenString start=/"/ skip=/\\./ end=/"/

if version >= 508 || !exists("did_proto_syn_inits")
  if version < 508
    let did_proto_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink protogenTodo Todo
  HiLink protogenSyntax Include
  HiLink protogenTypeDecl Structure
  HiLink protogenFieldType Type
  HiLink protogenTypeDef Typedef
  HiLink protogenBool Boolean

  HiLink protogenInt Number
  HiLink protogenFloat Float
  HiLink protogenComment Comment
  HiLink protogenString String

  delcommand HiLink
endif

let b:current_syntax = "protogen"
