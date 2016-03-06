--this file only defines some simple php rules

data Php = P_Int Int
		 | P_String String
		 | P_Float Float
		 | P_Bool Bool
		 | P_Error

data Php_Rule = Add  Php
			  | Subs Php
			  | Mul  Php
			  | Divi Php
			  | Smal Php
			  | Big  Php
			  | Equ  Php

data Php_Function = Only Php
				  | Recv Php_Rule Php_Function

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
eval_Php_Function (Recv (Add x) y) = eval_Php_Rule (Add x) (eval_Php_Function y)


main = print "123"