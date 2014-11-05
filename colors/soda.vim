set background=light
highlight clear

if exists("syntax_on")
  syntax reset
endif

  let g:colors_name = "Espresso Soda"

  hi Cursor ctermfg=NONE ctermbg=59 cterm=NONE  

  hi Visual ctermfg=NONE ctermbg=153 cterm=NONE 
  
  hi CursorLine ctermfg=NONE ctermbg=254 cterm=NONE 

  hi CursorColumn ctermfg=NONE ctermbg=254 cterm=NONE 

  hi ColorColumn ctermfg=NONE ctermbg=254 cterm=NONE 

  hi LineNr ctermfg=250 ctermbg=254 cterm=NONE
  
  hi VertSplit ctermfg=255 ctermbg=254 cterm=NONE
 
  hi MatchParen ctermfg=161 ctermbg=NONE cterm=bold

  hi StatusLine ctermfg=0 ctermbg=249 cterm=bold

  hi StatusLineNC ctermfg=0 ctermbg=249 cterm=NONE

  hi Pmenu ctermfg=64 ctermbg=NONE cterm=NONE 
  
  hi PmenuSel ctermfg=NONE ctermbg=153 cterm=NONE
  
  hi IncSearch ctermfg=NONE ctermbg=153 cterm=NONE
  
  hi Search ctermfg=NONE ctermbg=153 cterm=NONE 
  
  hi Directory ctermfg=61 ctermbg=NONE cterm=NONE
  
  hi Folded ctermfg=248 ctermbg=15 cterm=NONE
  

  hi Normal ctermfg=240 ctermbg=NONE cterm=NONE
  
  hi Boolean ctermfg=97 ctermbg=NONE cterm=NONE
  
  hi Character ctermfg=130 ctermbg=NONE cterm=NONE

  hi Comment ctermfg=248 ctermbg=NONE cterm=NONE
  
  hi Conditional ctermfg=64 ctermbg=NONE cterm=NONE
   
  hi Constant ctermfg=97 ctermbg=NONE cterm=NONE
 
  hi Define ctermfg=161 ctermbg=NONE cterm=NONE
  
  hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE  
  
  hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE  
  
  hi Float ctermfg=97 ctermbg=NONE cterm=NONE
  
  hi Function ctermfg=64 ctermbg=NONE cterm=NONE
  
  hi Identifier ctermfg=235 ctermbg=NONE cterm=NONE

  hi Keyword ctermfg=64 ctermbg=NONE cterm=NONE
  
  hi Label ctermfg=161 ctermbg=NONE cterm=NONE 
  
  hi NonText ctermfg=254 ctermbg=255 cterm=NONE
  
  hi Number ctermfg=97 ctermbg=NONE cterm=NONE 
  
  hi Operator ctermfg=62 ctermbg=NONE cterm=NONE
  
  hi PreProc ctermfg=64 ctermbg=NONE cterm=NONE
  
  hi Special ctermfg=0 ctermbg=NONE cterm=NONE
  
  hi SpecialKey ctermfg=254 ctermbg=NONE cterm=NONE
   
  hi Statement ctermfg=64 ctermbg=NONE cterm=NONE 
  
  hi StorageClass ctermfg=235 ctermbg=NONE cterm=NONE
  hi String ctermfg=161 ctermbg=NONE cterm=NONE
  
  hi Tag ctermfg=25 ctermbg=NONE cterm=NONE
  
  hi Title ctermfg=0 ctermbg=NONE cterm=bold
  hi Todo ctermfg=248 ctermbg=NONE cterm=inverse,bold 
   
  hi Type ctermfg=53 ctermbg=NONE cterm=NONE  
  
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline 
     hi rubyClass ctermfg=64 ctermbg=NONE cterm=NONE  
  
  hi rubyFunction ctermfg=235 ctermbg=NONE cterm=NONE 
     hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE
    
  hi rubySymbol ctermfg=64 ctermbg=NONE cterm=bold  
    hi rubyConstant ctermfg=53 ctermbg=NONE cterm=NONE 
   
  hi rubyStringDelimiter ctermfg=130 ctermbg=NONE cterm=NONE 
  
  hi rubyBlockParameter ctermfg=68 ctermbg=NONE cterm=NONE 
   
  hi rubyInstanceVariable ctermfg=97 ctermbg=NONE cterm=NONE 
  
  hi rubyInclude ctermfg=64 ctermbg=NONE cterm=NONE 
   
  hi rubyGlobalVariable ctermfg=68 ctermbg=NONE cterm=NONE 
   
  hi rubyRegexp ctermfg=71 ctermbg=NONE cterm=NONE  
  
  hi rubyRegexpDelimiter ctermfg=71 ctermbg=NONE cterm=NONE 
   
  hi rubyEscape ctermfg=NONE ctermbg=229 cterm=bold 
  
  hi rubyControl ctermfg=64 ctermbg=NONE cterm=NONE 
   
  hi rubyClassVariable ctermfg=68 ctermbg=NONE cterm=NONE 
   
  hi rubyOperator ctermfg=62 ctermbg=NONE cterm=NONE 
   
  hi rubyException ctermfg=64 ctermbg=NONE cterm=NONE 
   
  hi rubyPseudoVariable ctermfg=97 ctermbg=NONE cterm=NONE 
  
  hi rubyRailsUserClass ctermfg=53 ctermbg=NONE cterm=NONE 
   
  hi rubyRailsARAssociationMethod ctermfg=64 ctermbg=NONE cterm=NONE
    
  hi rubyRailsARMethod ctermfg=64 ctermbg=NONE cterm=NONE 
   
  hi rubyRailsRenderMethod ctermfg=64 ctermbg=NONE cterm=NONE 
   
  hi rubyRailsMethod ctermfg=64 ctermbg=NONE cterm=NONE 
   
  hi erubyDelimiter ctermfg=0 ctermbg=NONE cterm=NONE 
   
  hi erubyComment ctermfg=248 ctermbg=NONE cterm=NONE 
   
  hi erubyRailsMethod ctermfg=64 ctermbg=NONE cterm=NONE 
   
  hi htmlTag ctermfg=64 ctermbg=NONE cterm=NONE  
  
  hi htmlEndTag ctermfg=64 ctermbg=NONE cterm=NONE  
  
  hi htmlTagName ctermfg=64 ctermbg=NONE cterm=NONE 
   
  hi htmlArg ctermfg=64 ctermbg=NONE cterm=NONE  
  
  hi htmlSpecialChar ctermfg=0 ctermbg=NONE cterm=NONE 
   
  hi javaScriptFunction ctermfg=235 ctermbg=NONE cterm=NONE 
     hi javaScriptRailsFunction ctermfg=64 ctermbg=NONE cterm=NONE
    
  hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE 
   
  hi yamlKey ctermfg=25 ctermbg=NONE cterm=NONE 
  
  hi yamlAnchor ctermfg=68 ctermbg=NONE cterm=NONE  
  hi yamlAlias ctermfg=68 ctermbg=NONE cterm=NONE  
  hi yamlDocumentHeader ctermfg=130 ctermbg=NONE cterm=NONE 
  hi cssURL ctermfg=68 ctermbg=NONE cterm=NONE  
  hi cssFunctionName ctermfg=64 ctermbg=NONE cterm=NONE 
  hi cssColor ctermfg=97 ctermbg=NONE cterm=NONE 
  hi cssPseudoClassId ctermfg=74 ctermbg=NONE cterm=NONE 
  hi cssClassName ctermfg=74 ctermbg=NONE cterm=NONE 
  hi cssValueLength ctermfg=97 ctermbg=NONE cterm=NONE 
  hi cssCommonAttr ctermfg=97 ctermbg=NONE cterm=NONE 
  hi cssBraces ctermfg=0 ctermbg=NONE cterm=NONE  
