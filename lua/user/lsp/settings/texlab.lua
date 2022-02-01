return {
    cmd = { "texlab" },
    filetypes = { "tex", "bib" },
    settings = {
      texlab = {
        auxDirectory = ".",
        bibtexFormatter = "texlab",
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1","-pv", "%f" },
          executable = "latexmk",
          forwardSearchAfter = false,
          onSave = false,
        },
        chktex = {
          onEdit = false,
          onOpenAndSave = false
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        forwardSearch = {
          executable = "zathura",
          args = {"--synctex-forward", "%l:1:%f", "%p"}
        },
        latexFormatter = "latexindent",
        latexindent = {
          modifyLineBreaks = false
        }
      }
    },
    single_file_support = true
}
