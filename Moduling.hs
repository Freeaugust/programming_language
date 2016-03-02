
module Moduling (
	Url(Url),
	Level(Level),
	Inp(Inp),
	Attribute(Empty_a, Alt, Disable, Href, Id, Src, Style, Cmb_a),
	Elem(A, P, Div, Empty_e, Img, H, Cmb_e),
	Basc(Title, Body, Empty_b, Cmb_b),
	Head(Head),
	Root(Html),
	make_Html,
	make_Basc,
	make_Elem,
	make_level_h,
	make_level,
	cmb_Elem,
	div_Elem,
	add_Elem,
	add_Basc
  )where

data Url = Url String deriving(Show, Read, Eq)
data Level = Level Int deriving(Show, Read, Eq)
data Inp = Inp String deriving(Show, Read, Eq)
data Attribute = Empty_a
			   | Alt String
			   | Disable Inp
			   | Href Url
			   | Id String
			   | Src Url
			   | Style String
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

make_Html :: String->Root
make_Html name = Html (Head name) Empty_b

make_Basc :: String->String->Basc
make_Basc type_name content = if type_name=="title" then Title content 
							  else if type_name=="body" then Body content Empty_e
							  else Empty_b

make_Elem :: String->Attribute->String->Elem
make_Elem type_name att content = if type_name=="a" then A att content
								  else if type_name=="p" then P content
								  else if type_name=="img" then Img att
								  else Empty_e

make_level_h :: Level->String->Elem
make_level_h level title = H level title

make_level :: Int->Int
make_level x = if x>6 then 6
			   else if x<1 then 1
			   else x

cmb_Elem :: String->Elem->Elem->Elem
cmb_Elem op_name x y = op_name=="cmb" then Cmb_e x y

div_Elem :: Attribute->Elem->Elem
div_Elem x y z = Div x y z

add_Elem :: Basc->Elem->Basc
add_Elem (Body content e1) e2 = Body content (cmb_Elem "cmb" e1 e2)

add_Basc :: Head->Basc->Root
add_Basc h b = Html h b












