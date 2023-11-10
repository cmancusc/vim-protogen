if exists("b:current_syntax")
  finish
endif

syn case match

"  TODO: aggiungere altri tag per il @protocolTodo
syn keyword protocolTodo contained TODO FIXME XXX
syn cluster protocolCommentGrp contains=protocolTodo

syn keyword protocolTag global flags queue_size
syn keyword protocolOperator use_reader use_struct uifwd uiexport noblock
syn keyword protocolFunction message
syn keyword protocolTypeDef enum vararray blob
syn keyword protocolTypeDecl union struct table struct_bi
syn keyword protocolFieldType int8_t uint8_t
syn keyword protocolFieldType int16_t uint16_t
syn keyword protocolFieldType int32_t uint32_t
syn keyword protocolFieldType int64_t uint64_t
syn keyword protocolFieldType float double
syn keyword protocolFieldType string str32
syn keyword protocolBool true false

syn region protocolComment start="//" skip="\\$" end="$" keepend contains=@protocolCommentGrp
syn region protocolComment start="/\*" end="\*/" keepend contains=@protocolCommentGrp

syn match protocolInt /-\?\<\d\+\>/
syn match protocolInt /\<0[xX]\x+\>/
syn match protocolFloat /\<-\?\d*\(\.\d*\)\?/
syn match protocolQueueSize /\s\?\d\+[MK]/

syn region protocolString start=/"/ skip=/\\./ end=/"/

if version >= 508 || !exists("did_proto_syn_inits")
  if version < 508
    let did_proto_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink protocolTodo Todo
  HiLink protocolTag Tag
  HiLink protocolOperator Operator
  HiLink protocolFunction Function
  HiLink protocolTypeDecl Structure
  HiLink protocolFieldType Type
  HiLink protocolTypeDef Typedef
  HiLink protocolBool Boolean

  HiLink protocolInt Number
  HiLink protocolQueueSize Number
  HiLink protocolFloat Float
  HiLink protocolComment Comment
  HiLink protocolString String

  delcommand HiLink
endif

let b:current_syntax = "protogen"
