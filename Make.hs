import Moduling
import Show

m = make_Html "head"

main = let tmp = eval_r m in
       putStr tmp