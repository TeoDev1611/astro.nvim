local config = {}

function config.ctrlp()
  vim.cmd [[
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
    ]]
end

return config
