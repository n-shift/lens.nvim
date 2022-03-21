(local i vim.api)
(local s (require :lens.splits))
(local storage {})

(fn open []
  (local nrs (s.left 15 true))
  (vim.cmd (.. "vertical sbuffer " nrs.bufnr))
  (tset storage :bufnr nrs.bufnr)
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
