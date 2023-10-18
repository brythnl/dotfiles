require('dashboard').setup {
  theme = 'doom',
  config = {
    header = {
      '',
      '',
      '',
      '',
      '                                ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆                                   ',
      '                                  ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦                                ',
      '                                        ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄                              ',
      '                                        ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄                              ',
      '                                       ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀                             ',
      '                                ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄                            ',
      '                               ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄                             ',
      '                              ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄                            ',
      '                              ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄                           ',
      '                                   ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆                               ',
      '                                    ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃                               ',
      '                                     ⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟                                 ',
      '                                                                                          ',
      '                                                                                          ',
      '                                                                                          ',
      -- [[                                                ]],
      -- [[                                          _.oo. ]],
      -- [[                  _.u[[/;:,.         .odMMMMMM' ]],
      -- [[               .o888UU[[[/;:-.  .o@P^    MMM^   ]],
      -- [[              oN88888UU[[[/;::-.        dP^     ]],
      -- [[             dNMMNN888UU[[[/;:--.   .o@P^       ]],
      -- [[            ,MMMMMMN888UU[[/;::-. o@^           ]],
      -- [[            NNMMMNN888UU[[[/~.o@P^              ]],
      -- [[            888888888UU[[[/o@^-..               ]],
      -- [[           oI8888UU[[[/o@P^:--..                ]],
      -- [[        .@^  YUU[[[/o@^;::---..                 ]],
      -- [[      oMP     ^/o@P^;:::---..                   ]],
      -- [[   .dMMM    .o@^ ^;::---...                     ]],
      -- [[  dMMMMMMM@^`       `^^^^                       ]],
      -- [[ YMMMUP^                                        ]],
      -- [[  ^^                                            ]],
      -- [[                                                ]],
      -- '',
      -- '',
      -- '  ⢸⣦⡈⠻⣿⣿⣿⣶⣄',
      -- '    ⢸⣿⣿⣦⡈⠻⣿⣿⣿⣷⣄',
      -- '⣀⣀⣀⣀⣀⣀⣼⣿⣿⣿⣿ ⠈⠻⣿⣿⣿⣷⣄',
      -- '  ⠈⠻⣿⣿⣿⣿⣿⡿⠿⠛⠁   ⠈⠻⢿⣿⣿⣷⣄',
      -- '',
    },
    center = {
      { icon = '  ', desc = 'New file                       ', action = 'enew' },
      { icon = '  ', key = 'space f', desc = 'Find file                 ', action = 'Telescope find_files' },
      { icon = '  ', key = 'space h', desc = 'Recent files              ', action = 'Telescope oldfiles' },
      { icon = '  ', key = 'space g', desc = 'Find Word                 ', action = 'Telescope live_grep' },
    },
    footer = {
      ''
    }
  }
}

vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#6272a4' })
vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#f8f8f2' })
vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#bd93f9' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })
