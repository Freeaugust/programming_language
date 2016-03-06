
module Moduling (
	Level(Level),
	In_att(Url, Inp, Detail),
	Attribute(Empty_a, Alt, Disable, Href, Id, Src, Style, Cmb_a),
	Elem(A, P, Div, Empty_e, Img, H, Cmb_e),
	Basc(Title, Body, Empty_b, Cmb_b),
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
	add_Basc
  )where

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
			   | Cmb_a Attribute Attribute 
			   deriving(Show, Read, Eq)
data Elem = A Attribute String
		  | P String
		  | Div Attribute Elem Elem
		  | Empty_e
		  | Img Attribute
		  | H Level String
		  | Cmb_e Elem Elem
		  deriving(Show, Read, Eq)
data Basc = Title String
		  | Body String Elem
		  | Empty_b
		  | Cmb_b Basc Basc
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
cmb_Att att_1 att_2 = Cmb_a att_1 att_2

cmb_Elem :: Elem->Elem->Elem
cmb_Elem x y = Cmb_e x y

div_Elem :: Attribute->Elem->Elem->Elem
div_Elem x y z = Div x y z

add_Elem :: Basc->Elem->Basc
add_Elem (Body content e1) e2 = Body content (cmb_Elem e1 e2)

add_Basc :: Head->Basc->Root
add_Basc h b = Html h b












