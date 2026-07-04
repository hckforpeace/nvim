return {                                                                                                                                          
    "lervag/vimtex",
    lazy = false,
    init = function()                                                                                                                        
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"                                                                                               
      vim.g.vimtex_compiler_latexmk = {                                                                                                      
        options = {                                                                                                                          
          "-lualatex",                                                                                                                       
          "-synctex=1",                                                                                                                      
          "-interaction=nonstopmode",
          "-file-line-error",
        },                                                                                                                                   
      }
    end,                                                                                                                                     
  }
