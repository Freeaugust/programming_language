module Show(
	eval_ia,
	eval_a,
	eval_e,
	eval_b,
	eval_h,
	eval_r
  )where

import Moduling

eval_ia :: In_att->String
eval_ia (Url link) = link
eval_ia (Inp inp) = "input type="++inp
eval_ia (Detail detail) = detail

eval_a :: Attribute->String
eval_a Empty_a = ""
eval_a (Alt x) = "alt=\""++(eval_ia x)++"\""
eval_a (Disable x) = (eval_ia x)++"disable"
eval_a (Href link) = " href=\""++(eval_ia link)
eval_a (Id x) = " id "++(eval_ia x)
eval_a (Src link) = " src=\""++(eval_ia link)++"\""
eval_a (Style x) = " style=\""++(eval_ia x)++"\""
eval_a (Cmb_a att1 att2) = let first = eval_a att1 in
						   let second = eval_a att2 in
						   first++"  "++second

eval_e :: Elem->String
eval_e (A x y) = "<a"++(eval_a x)++">"++y++"</a>"
eval_e (P x) = "<p>"++x++"</p>"
eval_e (Div x y z) = let first = eval_e y in
				     let second = eval_e z in 
				     let att = eval_a x in
				     "<div"++att++">\n"++first++second++"</div>\n"
eval_e Empty_e = ""
eval_e (Img att) = "<img  "++(eval_a att)++"/>\n"
eval_e (H level content) = let num = show level in
						   "<h"++num++">\n"++content++"</"++num++"h>\n"
eval_e (Cmb_e e1 e2) = let first = eval_e e1 in
					   let second = eval_e e2 in
					   first++second
--eval_e (Link (Url x)) = x

eval_b :: Basc->String
eval_b (Title x) = "<title>\n"++x++"\n</title>\n"
eval_b (Body x e) = let next = eval_e e in
					"<body>\n"++next++"</body>\n"
eval_b Empty_b = ""
eval_b (Cmb_b b1 b2) = let first = eval_b b1 in
					 let second = eval_b b2 in
					 first++"\n"++second

eval_h :: Head->String
eval_h (Head x) = "<head>\n"++x++"\n</head>\n"

eval_r ::Root->String
eval_r (Html head basc) = "<html>\n"++(eval_h head)++(eval_b basc)++"\n</html>\n"

