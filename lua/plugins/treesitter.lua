return(
-- TreeSitter
{ 
	"nvim-treesitter/nvim-treesitter", 
	build = ":TSUpdate",  -- This is more reliable than the current build function
}
)
