import Moduling
import Show

url_1 = make_Url "http://www.ucsc.edu"
input_1 = make_Inp "text"
detail_1 = make_Detail "/User/Desktop/school"
detail_2 = make_Detail "This is my test"
detail_3 = make_Detail "this is picture of school"
detail_4 = make_Detail "background-color:lightgrey;"
detail_5 = make_Detail "/User/Desktop/school_2"
l_1 = make_Level 1
l_2 = make_Level 2
l_3 = make_Level 3
l_4 = make_Level 4
l_5 = make_Level 5
l_6 = make_Level 6
alt_1 = make_Att "alt" detail_1
alt_2 = make_Att "alt" detail_5
disable_1 = make_Att "disable" input_1
href_1 = make_Att "href" url_1
id_1 = make_Att "id" detail_2
src_1 = make_Att "src" detail_3
style_1 = make_Att "style" detail_4

aa_1 = cmb_Att src_1 alt_1
aa_2 = cmb_Att src_1 alt_2

e_a_1 = make_Elem "a" style_1 "this should be within a tage"
e_p_1 = make_Elem "p" id_1 "this is p"

e_i_1 = make_Elem "img" aa_1 "this is image"
e_i_2 = make_Elem "img" aa_1 "this is another image"

e_d_1 = div_Elem style_1 e_i_1 e_i_2
e_d_2 = div_Elem style_1 e_i_2 e_i_1
e_d_3 = div_Elem style_1 e_d_1 e_d_2
e_d_4 = div_Elem style_1 e_d_2 e_d_3
e_d_5 = div_Elem style_1 e_d_3 e_d_4
e_d_6 = div_Elem style_1 e_d_4 e_d_5
e_d_7 = div_Elem style_1 e_d_5 e_d_6
e_d_8 = div_Elem style_1 e_d_6 e_d_7
e_d_9 = div_Elem style_1 e_d_7 e_d_8

body_1 = make_Basc "body" "this is the third test of body_1" e_d_9
title = make_Head "this is third test"
root = make_Html title body_1

main = putStr (eval_r root)