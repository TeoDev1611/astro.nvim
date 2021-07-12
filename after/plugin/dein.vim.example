
"------------------------------------------------------------------------------"
"                                Dein Functions                                "
"------------------------------------------------------------------------------"

if dein#check_install()
  call dein#install()
endif

if !empty(dein#check_clean())
  call dein#recache_runtimepath()
  call map(dein#check_clean(), "delete(v:val, 'rf')")
endif
