(local i vim.api)
(local storage {})
(fn create []
  (i.nvim_create_buf false true))

(fn open []
  (local bufnr (create))
  (vim.cmd (.. "vertical sbuffer "bufnr))
  (tset storage :bufnr bufnr)
)

(fn close []
  (i.nvim_buf_delete storage.bufnr {:force true})
)

(fn get []
  (i.nvim_buf_get_lines storage.bufnr 0 -1 true))

(fn strip_newline [lines]
  (var out [])
  (each [_ line (pairs lines)]
    (if (not (= "" line)) (table.insert out line)))
  out
)

(fn build [lines]
  (var out [:git :commit])
  (each [_ line (pairs lines)]
    (do
      (table.insert out :-m)
      (table.insert out line)
    )
  )
  out
)

(fn process []
  (-> (get)
    (strip_newline)
    (build)
    (vim.fn.system)
  )
  (close)
)

{
  :open open
  :process process
}
