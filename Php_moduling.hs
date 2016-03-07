--this file only defines some simple php rules
module Php_moduling(
	Php(P_Int, P_String, P_Float, P_Bool, P_Error),
	Php_Rule(Add, Subs, Mul, Divi, Smal, Big, Equ),
	Php_Function(Only, Apply, If_Judge),
	eval_Php_Rule,
	eval_Php_Function
  )where
data Php = P_Int Int
		 | P_String String
		 | P_Float Float
		 | P_Bool Bool
		 | P_Error
		 deriving(Show, Read, Eq)
data Php_Rule = Add  Php
			  | Subs Php
			  | Mul  Php
			  | Divi Php
			  | Smal Php
			  | Big  Php
			  | Equ  Php
			  deriving(Show, Read, Eq)
data Php_Function = Only Php
				  | Apply Php_Rule Php_Function
				  | If_Judge Php Php_Function Php_Function
				  deriving(Show, Read, Eq)

eval_Php_Rule :: Php_Rule->Php->Php
eval_Php_Rule (Add (P_Int x)) (P_Int y) = P_Int (x+y)
eval_Php_Rule (Add (P_Float x)) (P_Float y) = P_Float (x+y)
eval_Php_Rule (Add (P_Bool x)) (P_Bool y) = P_Bool (x||y)
eval_Php_Rule (Add (P_String x)) (P_String y) = P_String (x++y)
eval_Php_Rule (Add P_Error) P_Error = P_Error

eval_Php_Rule (Subs (P_Int x)) (P_Int y) = P_Int (x-y)
eval_Php_Rule (Subs (P_Float x)) (P_Float y) = P_Float (x-y)
eval_Php_Rule (Subs (P_Bool x)) (P_Bool y) = P_Bool (x&&y)
eval_Php_Rule (Subs (P_String x)) (P_String y) = P_Error
eval_Php_Rule (Subs P_Error) P_Error = P_Error

eval_Php_Rule (Mul (P_Int x)) (P_Int y) = P_Int (x*y)
eval_Php_Rule (Mul (P_Float x)) (P_Float y) = P_Float (x*y)
eval_Php_Rule (Mul (P_Bool x)) (P_Bool y) = P_Bool (x&&y)
eval_Php_Rule (Mul (P_String x)) (P_String y) = P_Error
eval_Php_Rule (Mul P_Error) P_Error = P_Error

--can not divide int to int, it should be float to float
eval_Php_Rule (Divi (P_Int x)) (P_Int y) = P_Error 
eval_Php_Rule (Divi (P_Float x)) (P_Float y) = P_Float (x/y)
eval_Php_Rule (Divi (P_Bool x)) (P_Bool y) = P_Error
eval_Php_Rule (Divi (P_String x)) (P_String y) = P_Error
eval_Php_Rule (Divi P_Error) P_Error = P_Error

eval_Php_Rule (Smal (P_Int x)) (P_Int y) = P_Bool (x<y)
eval_Php_Rule (Smal (P_Float x)) (P_Float y) = P_Bool (x<y)
eval_Php_Rule (Smal (P_Bool x)) (P_Bool y) = P_Bool (x<y)
eval_Php_Rule (Smal (P_String x)) (P_String y) = P_Bool ((length x) < (length y))
eval_Php_Rule (Smal P_Error) P_Error = P_Error

eval_Php_Rule (Big x) y = eval_Php_Rule (Smal y) x

eval_Php_Rule (Equ (P_Int x)) (P_Int y) = P_Bool (x==y)
eval_Php_Rule (Equ (P_Float x)) (P_Float y) = P_Bool (x==y)
eval_Php_Rule (Equ (P_Bool x)) (P_Bool y) = P_Bool (x==y)
eval_Php_Rule (Equ (P_String x)) (P_String y) = P_Bool (x==y)
eval_Php_Rule (Equ P_Error) P_Error = P_Error


eval_Php_Function :: Php_Function->Php
eval_Php_Function (Only x) = x
eval_Php_Function (Apply x y) = eval_Php_Rule x (eval_Php_Function y)
eval_Php_Function (If_Judge (P_Bool x) y z) = if x then eval_Php_Function y
											  else eval_Php_Function z

--test data
x = P_Int 10
y = P_Int 1
z = P_Int 1
true = P_Bool True
false = P_Bool False
test_if_1 = If_Judge true (Only x) (Only y)
test_if_2 = If_Judge false (Only x) (Only y)



main = do
	   let m = eval(Given y) x
	   print x
	   --do
	   --print "234"
	   --print "123"
	   --let m = eval_Php_Rule (Given x) y
	   --print m
	   --print x