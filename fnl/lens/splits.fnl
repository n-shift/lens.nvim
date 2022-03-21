(fn left-split [width scratch]
  (local bufnr (vim.api.nvim_create_buf true (or scratch false)))
  (vim.cmd (.. "leftabove vertical sbuffer " bufnr))
  (local winnr (vim.api.nvim_get_current_win))
  (vim.api.nvim_win_set_width winnr width)
  { : bufnr : winnr }
)

(fn right-split [width scratch]
  (local bufnr (vim.api.nvim_create_buf true (or scratch false)))
  (vim.cmd (.. "belowright vertical sbuffer " bufnr))
  (local winnr (vim.api.nvim_get_current_win))
  (vim.api.nvim_win_set_width winnr width)
  { : bufnr : winnr }
)

(fn up-split [height scratch]
  (local bufnr (vim.api.nvim_create_buf true (or scratch false)))
  (vim.cmd (.. "leftabove sbuffer " bufnr))
  (local winnr (vim.api.nvim_get_current_win))
  (vim.api.nvim_win_set_height winnr height)
  { : bufnr : winnr }
)

(fn down-split [height scratch]
  (local bufnr (vim.api.nvim_create_buf true (or scratch false)))
  (vim.cmd (.. "belowright sbuffer " bufnr))
  (local winnr (vim.api.nvim_get_current_win))
  (vim.api.nvim_win_set_height winnr height)
  { : bufnr : winnr }
)

{
  :left left-split
  :right right-split
  :above up-split
  :belove down-split
}
