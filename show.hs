import Moduling

eval_a :: Attribute->String
eval_a Empty_a = ""
eval_a (Alt x) = x
eval_a (Disable (Inp x)) = x
eval_a (Href (Url link)) = "href=\""++link
eval_a (Id x) = x
eval_a (Src (Url link)) = link
eval_a (Style x) = x

eval_e :: Elem->String
eval_e (A x y) = "<a"++(eval_a x)++">"++y++"</a>"
eval_e (P x) = "<p>"++x++"</p>"
eval_e (Div x y z) = let first = eval_e y in
				     let second = eval_e z in 
				     let att = eval_a x in
				     "</div"++att+">"++first++second++"</div>"
























main = print "123"