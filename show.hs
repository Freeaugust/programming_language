import Moduling

eval_a :: Attribute->String
eval_a Empty_a = ""
eval_a (Alt x) = x
eval_a (Disable (Inp x)) = x
eval_a (Href (Url link)) = "href=\""++link
eval_a (Id x) = x
eval_a (Src (Url link)) = link
eval_a (Style x) = x
eval_a (Cmb_a att1 att2) = let first = eval_a att1 in
						   let second = eval_a att2 in
						   first++"  "++second

eval_e :: Elem->String
eval_e (A x y) = "<a"++(eval_a x)++">"++y++"</a>"
eval_e (P x) = "<p>"++x++"</p>"
eval_e (Div x y z) = let first = eval_e y in
				     let second = eval_e z in 
				     let att = eval_a x in
				     "</div"++att+">"++first++second++"</div>"
eval_e Empty_e = ""
eval_e (Img att) = "<img"++(eval_a att)++">"
eval_e (H level content) = let num = (show level)
						   "<h"++num++">"++content++"</"++num++"h>"
eval_e (Cmb_e e1 e2) = let first = (eval_e e1) in
					   let second = (eval_e e2) in
					   first++"\n"++second

eval_b :: Basc->String
eval_b (Title x) = "<title>"+x+"</title>"
eval_b (Body x e) = let next = eval_e e in
					"<body>"++next++"</body>"
eval_b Empty_b = ""
eval_b Cmb_b b1 b2 = let first = eval_b b1 in
					 let second = eval_b b2 in
					 first+"/n"++second

eval_h :: Head->String
eval_h (Head x) = "<head>"++x

eval_r ::Root->String
eval_r html head basc = "<html>"++(eval_h head)++(eval_b basc)
























main = print "123"