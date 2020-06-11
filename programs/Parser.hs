{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import DataType
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t6 t7 t8 t9 t10 t11 t12 t13 t14
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,144) ([16384,68,0,3,4368,32768,136,21504,4,8736,0,256,0,1,17728,0,546,0,16,4096,0,0,0,1,0,0,256,16384,69,0,0,8192,32768,1536,0,6,32800,1,4,63488,8,0,0,1024,4096,192,4096,0,1148,0,0,4352,1,24584,0,16,512,24,0,0,0,0,0,0,0,273,34816,8,4096,0,0,0,4,0,0,12292,0,0,512,0,2280,32768,0,36864,0,1088,0,1,29696,4,8736,0,0,34816,8,64,3,0,4096,17,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParseExp","%start_happyParseEnv","%start_happyParseTerm","Start","exps","exp","types","type","env","decl","terms","term","'('","')'","'.'","','","'\65422\65403'","':'","'->'","'Empty'","ID","NUM","INT","BOOL","%eof"]
        bit_start = st * 27
        bit_end = (st + 1) * 27
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..26]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (15) = happyShift action_5
action_0 (19) = happyShift action_6
action_0 (23) = happyShift action_7
action_0 (8) = happyGoto action_16
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (22) = happyShift action_14
action_1 (23) = happyShift action_15
action_1 (11) = happyGoto action_12
action_1 (12) = happyGoto action_13
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (15) = happyShift action_9
action_2 (19) = happyShift action_10
action_2 (23) = happyShift action_11
action_2 (14) = happyGoto action_8
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (15) = happyShift action_5
action_3 (19) = happyShift action_6
action_3 (23) = happyShift action_7
action_3 (8) = happyGoto action_4
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (15) = happyShift action_5
action_4 (17) = happyShift action_18
action_4 (19) = happyShift action_6
action_4 (23) = happyShift action_7
action_4 (8) = happyGoto action_17
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (15) = happyShift action_5
action_5 (19) = happyShift action_6
action_5 (23) = happyShift action_7
action_5 (8) = happyGoto action_28
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (23) = happyShift action_27
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (20) = happyShift action_26
action_7 _ = happyReduce_8

action_8 (15) = happyShift action_9
action_8 (17) = happyShift action_25
action_8 (19) = happyShift action_10
action_8 (23) = happyShift action_11
action_8 (27) = happyAccept
action_8 (14) = happyGoto action_24
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (15) = happyShift action_9
action_9 (19) = happyShift action_10
action_9 (23) = happyShift action_11
action_9 (14) = happyGoto action_23
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (23) = happyShift action_22
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (20) = happyShift action_21
action_11 _ = happyReduce_27

action_12 (27) = happyAccept
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (18) = happyShift action_20
action_13 _ = happyReduce_19

action_14 _ = happyReduce_21

action_15 (20) = happyShift action_19
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (15) = happyShift action_5
action_16 (17) = happyShift action_18
action_16 (19) = happyShift action_6
action_16 (23) = happyShift action_7
action_16 (27) = happyAccept
action_16 (8) = happyGoto action_17
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (17) = happyShift action_18
action_17 (19) = happyShift action_6
action_17 (8) = happyGoto action_17
action_17 _ = happyReduce_12

action_18 (24) = happyShift action_43
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (15) = happyShift action_33
action_19 (25) = happyShift action_34
action_19 (26) = happyShift action_35
action_19 (10) = happyGoto action_42
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (22) = happyShift action_14
action_20 (23) = happyShift action_15
action_20 (11) = happyGoto action_41
action_20 (12) = happyGoto action_13
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (15) = happyShift action_33
action_21 (25) = happyShift action_34
action_21 (26) = happyShift action_35
action_21 (10) = happyGoto action_40
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (17) = happyShift action_39
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (15) = happyShift action_9
action_23 (16) = happyShift action_37
action_23 (17) = happyShift action_25
action_23 (18) = happyShift action_38
action_23 (19) = happyShift action_10
action_23 (23) = happyShift action_11
action_23 (14) = happyGoto action_24
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (17) = happyShift action_25
action_24 (19) = happyShift action_10
action_24 (14) = happyGoto action_24
action_24 _ = happyReduce_31

action_25 (24) = happyShift action_36
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (15) = happyShift action_33
action_26 (25) = happyShift action_34
action_26 (26) = happyShift action_35
action_26 (10) = happyGoto action_32
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (20) = happyShift action_31
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (15) = happyShift action_5
action_28 (16) = happyShift action_29
action_28 (17) = happyShift action_18
action_28 (18) = happyShift action_30
action_28 (19) = happyShift action_6
action_28 (23) = happyShift action_7
action_28 (8) = happyGoto action_17
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_6

action_30 (15) = happyShift action_5
action_30 (19) = happyShift action_6
action_30 (23) = happyShift action_7
action_30 (7) = happyGoto action_51
action_30 (8) = happyGoto action_52
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (15) = happyShift action_33
action_31 (25) = happyShift action_34
action_31 (26) = happyShift action_35
action_31 (10) = happyGoto action_50
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (21) = happyShift action_44
action_32 _ = happyReduce_7

action_33 (15) = happyShift action_33
action_33 (25) = happyShift action_34
action_33 (26) = happyShift action_35
action_33 (9) = happyGoto action_48
action_33 (10) = happyGoto action_49
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_15

action_35 _ = happyReduce_16

action_36 _ = happyReduce_30

action_37 _ = happyReduce_25

action_38 (15) = happyShift action_9
action_38 (19) = happyShift action_10
action_38 (23) = happyShift action_11
action_38 (13) = happyGoto action_46
action_38 (14) = happyGoto action_47
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (15) = happyShift action_9
action_39 (19) = happyShift action_10
action_39 (23) = happyShift action_11
action_39 (14) = happyGoto action_45
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (21) = happyShift action_44
action_40 _ = happyReduce_26

action_41 _ = happyReduce_20

action_42 (21) = happyShift action_44
action_42 _ = happyReduce_22

action_43 _ = happyReduce_11

action_44 (15) = happyShift action_33
action_44 (25) = happyShift action_34
action_44 (26) = happyShift action_35
action_44 (10) = happyGoto action_60
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (15) = happyShift action_9
action_45 (17) = happyShift action_25
action_45 (19) = happyShift action_10
action_45 (23) = happyShift action_11
action_45 (14) = happyGoto action_24
action_45 _ = happyReduce_28

action_46 (16) = happyShift action_59
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (15) = happyShift action_9
action_47 (17) = happyShift action_25
action_47 (18) = happyShift action_58
action_47 (19) = happyShift action_10
action_47 (23) = happyShift action_11
action_47 (14) = happyGoto action_24
action_47 _ = happyReduce_23

action_48 (16) = happyShift action_57
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (18) = happyShift action_56
action_49 (21) = happyShift action_44
action_49 _ = happyReduce_13

action_50 (17) = happyShift action_55
action_50 (21) = happyShift action_44
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (16) = happyShift action_54
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (15) = happyShift action_5
action_52 (17) = happyShift action_18
action_52 (18) = happyShift action_53
action_52 (19) = happyShift action_6
action_52 (23) = happyShift action_7
action_52 (8) = happyGoto action_17
action_52 _ = happyReduce_4

action_53 (15) = happyShift action_5
action_53 (19) = happyShift action_6
action_53 (23) = happyShift action_7
action_53 (7) = happyGoto action_64
action_53 (8) = happyGoto action_52
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_10

action_55 (15) = happyShift action_5
action_55 (19) = happyShift action_6
action_55 (23) = happyShift action_7
action_55 (8) = happyGoto action_63
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (15) = happyShift action_33
action_56 (25) = happyShift action_34
action_56 (26) = happyShift action_35
action_56 (9) = happyGoto action_62
action_56 (10) = happyGoto action_49
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_18

action_58 (15) = happyShift action_9
action_58 (19) = happyShift action_10
action_58 (23) = happyShift action_11
action_58 (13) = happyGoto action_61
action_58 (14) = happyGoto action_47
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_29

action_60 (21) = happyShift action_44
action_60 _ = happyReduce_17

action_61 _ = happyReduce_24

action_62 _ = happyReduce_14

action_63 (15) = happyShift action_5
action_63 (17) = happyShift action_18
action_63 (19) = happyShift action_6
action_63 (23) = happyShift action_7
action_63 (8) = happyGoto action_17
action_63 _ = happyReduce_9

action_64 _ = happyReduce_5

happyReduce_3 = happySpecReduce_1  6 happyReduction_3
happyReduction_3 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  7 happyReduction_4
happyReduction_4 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  7 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  8 happyReduction_6
happyReduction_6 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  8 happyReduction_7
happyReduction_7 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn8
		 (C happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  8 happyReduction_8
happyReduction_8 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn8
		 (V happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happyReduce 6 8 happyReduction_9
happyReduction_9 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (L happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 5 8 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (T (happy_var_2 : happy_var_4)
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_3  8 happyReduction_11
happyReduction_11 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (P happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  8 happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (A happy_var_1 happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  9 happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  10 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn10
		 (INT
	)

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn10
		 (BOOL
	)

happyReduce_17 = happySpecReduce_3  10 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1 :=> happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  10 happyReduction_18
happyReduction_18 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Prod happy_var_2
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  11 happyReduction_19
happyReduction_19 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  11 happyReduction_20
happyReduction_20 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1 : happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn11
		 ([]
	)

happyReduce_22 = happySpecReduce_3  12 happyReduction_22
happyReduction_22 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn12
		 ((happy_var_1,happy_var_3)
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  13 happyReduction_23
happyReduction_23 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  13 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  14 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  14 happyReduction_26
happyReduction_26 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn14
		 (C happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  14 happyReduction_27
happyReduction_27 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn14
		 (V happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happyReduce 4 14 happyReduction_28
happyReduction_28 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (L happy_var_2 INT happy_var_4
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 5 14 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (T (happy_var_2 : happy_var_4)
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (P happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  14 happyReduction_31
happyReduction_31 (HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (A happy_var_1 happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 27 27 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	LPar -> cont 15;
	RPar -> cont 16;
	TDot -> cont 17;
	TCom -> cont 18;
	TLam -> cont 19;
	TCol -> cont 20;
	TArrow -> cont 21;
	Empty -> cont 22;
	ID happy_dollar_dollar -> cont 23;
	Num happy_dollar_dollar -> cont 24;
	TINT -> cont 25;
	TBOOL -> cont 26;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 27 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
happyParseExp tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn8 z -> happyReturn z; _other -> notHappyAtAll })

happyParseEnv tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn11 z -> happyReturn z; _other -> notHappyAtAll })

happyParseTerm tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn14 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error "Parse error at EOF"
parseError (t:ts) = error $ "Parse error: " ++ show t

parseExp     = happyParseExp . alexScanTokens
parseEnv     = happyParseEnv . alexScanTokens
parseTerm    = happyParseTerm . alexScanTokens
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "D:/GitHub/haskell-platform/build/ghc-bindist/local/lib/include/ghcversion.h" #-}















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "F:/Users/randy/AppData/Local/Temp/ghc1900_0/ghc_2.h" #-}


























































































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates\\\\GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 75 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 84 "templates\\\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 147 "templates\\\\GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates\\\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates\\\\GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
