import Moduling
import Php_moduling
import Show
import System.IO     
import Data.Char  

--test data
x = P_Float 10
y = P_Float 1
z = P_Float 1
true = P_Bool True
false = P_Bool False
test_if_1 = Php_att (If_Judge true (Only x) (Only y))
test_if_2 = Php_att (If_Judge false (Only x) (Only y))

test_add = Php_att (Apply (Add x) (Only y))
test_subs = Php_att (Apply (Subs x) (Only y))
test_mul = Php_att (Apply (Mul x) (Only y))
test_divi = Php_att (Apply (Divi x) (Only y))
test_smal = Php_att (Apply (Smal x) (Only y))
test_big = Php_att (Apply (Big x) (Only y))
test_equ = Php_att (Apply (Equ x) (Only y))

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
alt_3 = add_php_att alt_1 test_if_1
alt_4 = add_php_att alt_2 test_if_2
alt_5 = add_php_att alt_1 test_add
alt_6 = add_php_att alt_1 test_subs
alt_7 = add_php_att alt_1 test_mul
alt_8 = add_php_att alt_1 test_divi
alt_9 = add_php_att alt_1 test_smal
alt_10 = add_php_att alt_1 test_big
alt_11 = add_php_att alt_1 test_equ

disable_1 = make_Att "disable" input_1
href_1 = make_Att "href" url_1
id_1 = make_Att "id" detail_2
src_1 = make_Att "src" detail_3
style_1 = make_Att "style" detail_4


aa_1 = cmb_Att src_1 alt_1
aa_2 = cmb_Att src_1 alt_2
aa_3 = cmb_Att src_1 alt_3
aa_4 = cmb_Att src_1 alt_4
aa_5 = cmb_Att src_1 alt_5
aa_6 = cmb_Att src_1 alt_6
aa_7 = cmb_Att src_1 alt_7
aa_8 = cmb_Att src_1 alt_8
aa_9 = cmb_Att src_1 alt_9
aa_10 = cmb_Att src_1 alt_10
aa_11 = cmb_Att src_1 alt_11

e_a_1 = make_Elem "a" style_1 "this should be within a tage"
e_p_1 = make_Elem "p" id_1 "this is p"

e_i_1 = make_Elem "img" aa_1 "this is image"
e_i_2 = make_Elem "img" aa_2 "this is another image"
e_i_3 = make_Elem "img" aa_3 "this is image"
e_i_4 = make_Elem "img" aa_4 "this is image"
e_i_5 = make_Elem "img" aa_5 "this is image"
e_i_6 = make_Elem "img" aa_6 "this is image"
e_i_7 = make_Elem "img" aa_7 "this is image"
e_i_8 = make_Elem "img" aa_8 "this is image"
e_i_9 = make_Elem "img" aa_9 "this is image"
e_i_10 = make_Elem "img" aa_10 "this is image"
e_i_11 = make_Elem "img" aa_11 "this is image"

e_d_1 = div_Elem style_1 e_i_1 e_i_2
e_d_2 = div_Elem style_1 e_i_2 e_i_3
e_d_3 = div_Elem style_1 e_i_3 e_i_4
e_d_4 = div_Elem style_1 e_i_4 e_i_5
e_d_5 = div_Elem style_1 e_i_5 e_i_6
e_d_6 = div_Elem style_1 e_i_6 e_i_7
e_d_7 = div_Elem style_1 e_i_7 e_i_8
e_d_8 = div_Elem style_1 e_i_8 e_i_9
e_d_9 = div_Elem style_1 e_i_9 e_i_10
e_d_10 = div_Elem style_1 e_i_10 e_i_11

body_1 = make_Basc "body" "this is the first test of body_1" e_d_1
body_2 = make_Basc "body" "this is the second test of body_2" e_d_2
body_3 = make_Basc "body" "this is the third test of body_3" e_d_3
body_4 = make_Basc "body" "this is the fourth test of body_4" e_d_4
body_5 = make_Basc "body" "this is the fifth test of body_5" e_d_5
body_6 = make_Basc "body" "this is the sixth test of body_6" e_d_6
body_7 = make_Basc "body" "this is the seventh test of body_7" e_d_7
body_8 = make_Basc "body" "this is the eighth test of body_8" e_d_8
body_9 = make_Basc "body" "this is the ninth test of body_9" e_d_9
body_10 = make_Basc "body" "this is the tenth test of body_10" e_d_10

title = make_Head "this is the test"
root_1 = make_Html title body_1
root_2 = make_Html title body_2
root_3 = make_Html title body_3
root_4 = make_Html title body_4
root_5 = make_Html title body_5
root_6 = make_Html title body_6
root_7 = make_Html title body_7
root_8 = make_Html title body_8
root_9 = make_Html title body_9
root_10 = make_Html title body_10

main = do
	putStr (eval_r root_1)
	putStr (eval_r root_2)
	putStr (eval_r root_3)
	putStr (eval_r root_4)
	putStr (eval_r root_5)
	putStr (eval_r root_6)
	putStr (eval_r root_7)
	putStr (eval_r root_8)
	putStr (eval_r root_9)
	putStr (eval_r root_10)
	writeFile "test.html" (eval_r root_1)


