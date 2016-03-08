
module Moduling (
	Level(Level),
	In_att(Url, Inp, Detail),
	Attribute(Empty_a, Alt, Disable, Href, Id, Src, Style, Php_att, Attrs),
	Elem(A, P, Div, Empty_e, Img, H, Php_ele, Elems),
	Basc(Title, Body, Empty_b, Php_basc, Bascs),
	Head(Head),
	Root(Html),
	make_Att,
	make_Html,
	make_Head,
	make_Basc,
	make_Elem,
	make_Url,
	make_Inp,
	make_Detail,
	make_Level_h,
	make_Level,
	cmb_Att,
	cmb_Elem,
	div_Elem,
	add_Elem,
	add_Basc,
	add_php_att,
	add_php_ele,
	add_php_basc
  )where

import Php_moduling

data Level = Level Int deriving(Show, Read, Eq)
data In_att = Url String
			| Inp String
			| Detail String
			deriving(Show, Read, Eq)
data Attribute = Empty_a
			   | Alt In_att
			   | Disable In_att
			   | Href In_att
			   | Id In_att
			   | Src In_att
			   | Style In_att
			   | Php_att Php_Function
			   | Attrs [Attribute]
			   deriving(Show, Read, Eq)
data Elem = A Attribute String
		  | P String
		  | Div Attribute Elem Elem
		  | Empty_e
		  | Img Attribute
		  | H Level String
		  | Php_ele Php_Function
		  | Elems [Elem]
		  deriving(Show, Read, Eq)
data Basc = Title String
		  | Body String Elem
		  | Empty_b
		  | Php_basc Php_Function
		  | Bascs [Basc]
		  deriving(Show, Read, Eq)
data Head = Head String deriving(Show, Read, Eq)
data Root = Html Head Basc deriving(Show, Read, Eq)

make_Att :: String->In_att->Attribute
make_Att type_name s = if type_name=="alt" then Alt s
					   else if type_name=="disable" then Disable s
					   else if type_name=="href" then Href s
					   else if type_name=="id" then Id s
					   else if type_name=="src" then Src s
					   else if type_name=="style" then Style s
					   else Empty_a

make_Html :: Head->Basc->Root
make_Html head content = Html head content

make_Head :: String->Head
make_Head title = Head title

make_Basc :: String->String->Elem->Basc
make_Basc type_name content elem = if type_name=="title" then Title content
							  else if type_name=="body" then Body content elem
							  else Empty_b

make_Elem :: String->Attribute->String->Elem
make_Elem type_name att content = if type_name=="a" then A att content
								  else if type_name=="p" then P content
								  else if type_name=="img" then Img att
								  else Empty_e

make_Url :: String->In_att
make_Url http = Url http

make_Inp :: String->In_att
make_Inp s = Inp s

make_Detail :: String->In_att
make_Detail detail = Detail detail

make_Level_h :: Level->String->Elem
make_Level_h level title = H level title

make_Level :: Int->Int
make_Level x = if x>6 then 6
			   else if x<1 then 1
			   else x

cmb_Att :: Attribute->Attribute->Attribute
cmb_Att (Attrs att_1) (Attrs att_2 )= Attrs (att_1 ++ att_2)
cmb_Att (Attrs att_1) x = Attrs (att_1 ++ [x])
cmb_Att x (Attrs att_2) = Attrs (x : att_2)
cmb_Att x_1 x_2 = Attrs [x_1,x_2]

cmb_Elem :: Elem->Elem->Elem
cmb_Elem (Elems att_1) (Elems att_2 )= Elems (att_1 ++ att_2)
cmb_Elem (Elems att_1) x = Elems (att_1 ++ [x])
cmb_Elem x (Elems att_2) = Elems (x : att_2)
cmb_Elem x_1 x_2 = Elems [x_1,x_2]

cmb_Basc :: Basc->Basc->Basc
cmb_Basc (Bascs att_1) (Bascs att_2 )= Bascs (att_1 ++ att_2)
cmb_Basc (Bascs att_1) x = Bascs (att_1 ++ [x])
cmb_Basc x (Bascs att_2) = Bascs (x : att_2)
cmb_Basc x_1 x_2 = Bascs [x_1,x_2]

div_Elem :: Attribute->Elem->Elem->Elem
div_Elem x y z = Div x y z

add_Elem :: Basc->Elem->Basc
add_Elem (Body content e1) e2 = Body content (cmb_Elem e1 e2)

add_Basc :: Head->Basc->Root
add_Basc h b = Html h b

add_php_att :: Attribute->Attribute->Attribute
add_php_att att_1 (Php_att php) = cmb_Att att_1 (Php_att php)

add_php_ele :: Elem->Elem->Elem
add_php_ele ele_1 (Php_ele php) = cmb_Elem ele_1 (Php_ele php)

add_php_basc :: Basc->Basc->Basc
add_php_basc basc_1 (Php_basc php) = cmb_Basc basc_1 (Php_basc php)







