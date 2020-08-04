{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import DataType
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.11

data HappyAbsSyn t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16
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
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,178) ([0,16913,0,12288,0,4352,2,4096,1057,0,16917,0,8496,4,0,2,0,2,0,1,0,8528,0,4352,2,0,32,0,32,0,0,0,2048,0,0,0,0,32,0,8528,4,0,0,0,64,0,14337,0,12288,0,256,56,16384,0,0,543,0,0,0,0,4,0,16384,0,32768,0,32784,3,8192,0,61440,1057,0,0,0,0,0,4352,66,4096,896,0,64,0,32784,3,0,0,0,0,0,0,0,16384,0,4352,66,0,0,0,0,0,8464,0,4352,2,0,4,0,0,0,1024,0,0,0,4096,896,0,0,0,32,0,7424,2,0,0,0,0,0,0,32,512,0,8192,0,0,200,0,1088,0,512,0,0,0,0,16913,0,32784,3,256,56,0,0,0,0,0,8464,4,4352,66,4096,33,0,0,0,0,0,0,0,0,0,0,16917,1,0,0,49152,0,0,0,0,72,0,0,0,8192,0,4096,896,0,66,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParseExp","%start_happyParseEnv","%start_happyParseTerm","Start","exps","inj","exp","prod","sum","type","env","decl","terms","term","'('","')'","'.'","','","'\955'","':'","'->'","'+'","'Empty'","ID","NUM","INT","BOOL","UNIT","'case'","'<'","'>'","'='","'of'","%eof"]
        bit_start = st * 36
        bit_end = (st + 1) * 36
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..35]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (17) = happyShift action_5
action_0 (21) = happyShift action_6
action_0 (26) = happyShift action_7
action_0 (31) = happyShift action_8
action_0 (9) = happyGoto action_17
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (25) = happyShift action_15
action_1 (26) = happyShift action_16
action_1 (13) = happyGoto action_13
action_1 (14) = happyGoto action_14
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (17) = happyShift action_10
action_2 (21) = happyShift action_11
action_2 (26) = happyShift action_12
action_2 (16) = happyGoto action_9
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (17) = happyShift action_5
action_3 (21) = happyShift action_6
action_3 (26) = happyShift action_7
action_3 (31) = happyShift action_8
action_3 (9) = happyGoto action_4
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (17) = happyShift action_5
action_4 (19) = happyShift action_19
action_4 (21) = happyShift action_6
action_4 (26) = happyShift action_7
action_4 (31) = happyShift action_8
action_4 (9) = happyGoto action_18
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (17) = happyShift action_5
action_5 (18) = happyShift action_32
action_5 (21) = happyShift action_6
action_5 (26) = happyShift action_7
action_5 (31) = happyShift action_8
action_5 (9) = happyGoto action_31
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (26) = happyShift action_30
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (22) = happyShift action_29
action_7 _ = happyReduce_10

action_8 (17) = happyShift action_28
action_8 (8) = happyGoto action_27
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (17) = happyShift action_10
action_9 (19) = happyShift action_26
action_9 (21) = happyShift action_11
action_9 (26) = happyShift action_12
action_9 (36) = happyAccept
action_9 (16) = happyGoto action_25
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (17) = happyShift action_10
action_10 (21) = happyShift action_11
action_10 (26) = happyShift action_12
action_10 (16) = happyGoto action_24
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (26) = happyShift action_23
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (22) = happyShift action_22
action_12 _ = happyReduce_34

action_13 (36) = happyAccept
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (20) = happyShift action_21
action_14 _ = happyReduce_26

action_15 _ = happyReduce_28

action_16 (22) = happyShift action_20
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (17) = happyShift action_5
action_17 (19) = happyShift action_19
action_17 (21) = happyShift action_6
action_17 (26) = happyShift action_7
action_17 (31) = happyShift action_8
action_17 (36) = happyAccept
action_17 (9) = happyGoto action_18
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (19) = happyShift action_19
action_18 (21) = happyShift action_6
action_18 (31) = happyShift action_8
action_18 (9) = happyGoto action_18
action_18 _ = happyReduce_14

action_19 (27) = happyShift action_50
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (17) = happyShift action_37
action_20 (28) = happyShift action_38
action_20 (29) = happyShift action_39
action_20 (30) = happyShift action_40
action_20 (12) = happyGoto action_49
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (25) = happyShift action_15
action_21 (26) = happyShift action_16
action_21 (13) = happyGoto action_48
action_21 (14) = happyGoto action_14
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (17) = happyShift action_37
action_22 (28) = happyShift action_38
action_22 (29) = happyShift action_39
action_22 (30) = happyShift action_40
action_22 (12) = happyGoto action_47
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (19) = happyShift action_46
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (17) = happyShift action_10
action_24 (18) = happyShift action_44
action_24 (19) = happyShift action_26
action_24 (20) = happyShift action_45
action_24 (21) = happyShift action_11
action_24 (26) = happyShift action_12
action_24 (16) = happyGoto action_25
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (19) = happyShift action_26
action_25 (21) = happyShift action_11
action_25 (16) = happyGoto action_25
action_25 _ = happyReduce_38

action_26 (27) = happyShift action_43
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (35) = happyShift action_42
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (32) = happyShift action_41
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (17) = happyShift action_37
action_29 (28) = happyShift action_38
action_29 (29) = happyShift action_39
action_29 (30) = happyShift action_40
action_29 (12) = happyGoto action_36
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (22) = happyShift action_35
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (17) = happyShift action_5
action_31 (18) = happyShift action_33
action_31 (19) = happyShift action_19
action_31 (20) = happyShift action_34
action_31 (21) = happyShift action_6
action_31 (26) = happyShift action_7
action_31 (31) = happyShift action_8
action_31 (9) = happyGoto action_18
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_7

action_33 _ = happyReduce_8

action_34 (17) = happyShift action_5
action_34 (21) = happyShift action_6
action_34 (26) = happyShift action_7
action_34 (31) = happyShift action_8
action_34 (7) = happyGoto action_62
action_34 (9) = happyGoto action_56
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (17) = happyShift action_37
action_35 (28) = happyShift action_38
action_35 (29) = happyShift action_39
action_35 (30) = happyShift action_40
action_35 (12) = happyGoto action_61
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (23) = happyShift action_51
action_36 _ = happyReduce_9

action_37 (17) = happyShift action_37
action_37 (28) = happyShift action_38
action_37 (29) = happyShift action_39
action_37 (30) = happyShift action_40
action_37 (10) = happyGoto action_58
action_37 (11) = happyGoto action_59
action_37 (12) = happyGoto action_60
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_20

action_39 _ = happyReduce_21

action_40 _ = happyReduce_25

action_41 (27) = happyShift action_57
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (17) = happyShift action_5
action_42 (21) = happyShift action_6
action_42 (26) = happyShift action_7
action_42 (31) = happyShift action_8
action_42 (7) = happyGoto action_55
action_42 (9) = happyGoto action_56
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_37

action_44 _ = happyReduce_32

action_45 (17) = happyShift action_10
action_45 (21) = happyShift action_11
action_45 (26) = happyShift action_12
action_45 (15) = happyGoto action_53
action_45 (16) = happyGoto action_54
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (17) = happyShift action_10
action_46 (21) = happyShift action_11
action_46 (26) = happyShift action_12
action_46 (16) = happyGoto action_52
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (23) = happyShift action_51
action_47 _ = happyReduce_33

action_48 _ = happyReduce_27

action_49 (23) = happyShift action_51
action_49 _ = happyReduce_29

action_50 _ = happyReduce_13

action_51 (17) = happyShift action_37
action_51 (28) = happyShift action_38
action_51 (29) = happyShift action_39
action_51 (30) = happyShift action_40
action_51 (12) = happyGoto action_73
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (17) = happyShift action_10
action_52 (19) = happyShift action_26
action_52 (21) = happyShift action_11
action_52 (26) = happyShift action_12
action_52 (16) = happyGoto action_25
action_52 _ = happyReduce_35

action_53 (18) = happyShift action_72
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (17) = happyShift action_10
action_54 (19) = happyShift action_26
action_54 (20) = happyShift action_71
action_54 (21) = happyShift action_11
action_54 (26) = happyShift action_12
action_54 (16) = happyGoto action_25
action_54 _ = happyReduce_30

action_55 _ = happyReduce_15

action_56 (17) = happyShift action_5
action_56 (19) = happyShift action_19
action_56 (20) = happyShift action_70
action_56 (21) = happyShift action_6
action_56 (26) = happyShift action_7
action_56 (31) = happyShift action_8
action_56 (9) = happyGoto action_18
action_56 _ = happyReduce_4

action_57 (34) = happyShift action_69
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (18) = happyShift action_68
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (18) = happyShift action_67
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (18) = happyReduce_18
action_60 (20) = happyShift action_65
action_60 (23) = happyShift action_51
action_60 (24) = happyShift action_66
action_60 _ = happyReduce_18

action_61 (19) = happyShift action_64
action_61 (23) = happyShift action_51
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (18) = happyShift action_63
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_12

action_64 (17) = happyShift action_5
action_64 (21) = happyShift action_6
action_64 (26) = happyShift action_7
action_64 (31) = happyShift action_8
action_64 (9) = happyGoto action_81
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (17) = happyShift action_37
action_65 (28) = happyShift action_38
action_65 (29) = happyShift action_39
action_65 (30) = happyShift action_40
action_65 (10) = happyGoto action_79
action_65 (12) = happyGoto action_80
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (17) = happyShift action_37
action_66 (28) = happyShift action_38
action_66 (29) = happyShift action_39
action_66 (30) = happyShift action_40
action_66 (11) = happyGoto action_77
action_66 (12) = happyGoto action_78
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_24

action_68 _ = happyReduce_23

action_69 (17) = happyShift action_5
action_69 (21) = happyShift action_6
action_69 (26) = happyShift action_7
action_69 (31) = happyShift action_8
action_69 (9) = happyGoto action_76
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (17) = happyShift action_5
action_70 (21) = happyShift action_6
action_70 (26) = happyShift action_7
action_70 (31) = happyShift action_8
action_70 (7) = happyGoto action_75
action_70 (9) = happyGoto action_56
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (17) = happyShift action_10
action_71 (21) = happyShift action_11
action_71 (26) = happyShift action_12
action_71 (15) = happyGoto action_74
action_71 (16) = happyGoto action_54
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_36

action_73 (23) = happyShift action_51
action_73 _ = happyReduce_22

action_74 _ = happyReduce_31

action_75 _ = happyReduce_5

action_76 (17) = happyShift action_5
action_76 (19) = happyShift action_19
action_76 (21) = happyShift action_6
action_76 (26) = happyShift action_7
action_76 (31) = happyShift action_8
action_76 (33) = happyShift action_82
action_76 (9) = happyGoto action_18
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_19

action_78 (23) = happyShift action_51
action_78 (24) = happyShift action_66
action_78 _ = happyReduce_18

action_79 _ = happyReduce_17

action_80 (20) = happyShift action_65
action_80 (23) = happyShift action_51
action_80 _ = happyReduce_16

action_81 (17) = happyShift action_5
action_81 (19) = happyShift action_19
action_81 (21) = happyShift action_6
action_81 (26) = happyShift action_7
action_81 (31) = happyShift action_8
action_81 (9) = happyGoto action_18
action_81 _ = happyReduce_11

action_82 (22) = happyShift action_83
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (17) = happyShift action_37
action_83 (28) = happyShift action_38
action_83 (29) = happyShift action_39
action_83 (30) = happyShift action_40
action_83 (12) = happyGoto action_84
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (18) = happyShift action_85
action_84 (23) = happyShift action_51
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_6

happyReduce_3 = happySpecReduce_1  6 happyReduction_3
happyReduction_3 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  7 happyReduction_4
happyReduction_4 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  7 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happyReduce 9 8 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Num happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Inj happy_var_3 happy_var_5 happy_var_8
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_2  9 happyReduction_7
happyReduction_7 _
	_
	 =  HappyAbsSyn9
		 (U
	)

happyReduce_8 = happySpecReduce_3  9 happyReduction_8
happyReduction_8 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  9 happyReduction_9
happyReduction_9 (HappyAbsSyn12  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn9
		 (C happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  9 happyReduction_10
happyReduction_10 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn9
		 (V happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happyReduce 6 9 happyReduction_11
happyReduction_11 ((HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (L happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 5 9 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (T (happy_var_2 : happy_var_4)
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_3  9 happyReduction_13
happyReduction_13 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (P happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  9 happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (A happy_var_1 happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 4 9 happyReduction_15
happyReduction_15 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Case happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  10 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1 : happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  11 happyReduction_18
happyReduction_18 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  11 happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1 : happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  12 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn12
		 (INT
	)

happyReduce_21 = happySpecReduce_1  12 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn12
		 (BOOL
	)

happyReduce_22 = happySpecReduce_3  12 happyReduction_22
happyReduction_22 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 :=> happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  12 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Prod happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  12 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Variant happy_var_2
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  12 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn12
		 (Unit
	)

happyReduce_26 = happySpecReduce_1  13 happyReduction_26
happyReduction_26 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  13 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  13 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn13
		 ([]
	)

happyReduce_29 = happySpecReduce_3  14 happyReduction_29
happyReduction_29 (HappyAbsSyn12  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn14
		 ((happy_var_1,happy_var_3)
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  15 happyReduction_30
happyReduction_30 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 ([happy_var_1]
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  15 happyReduction_31
happyReduction_31 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 : happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  16 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  16 happyReduction_33
happyReduction_33 (HappyAbsSyn12  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn16
		 (C happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  16 happyReduction_34
happyReduction_34 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn16
		 (V happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happyReduce 4 16 happyReduction_35
happyReduction_35 ((HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (L happy_var_2 INT happy_var_4
	) `HappyStk` happyRest

happyReduce_36 = happyReduce 5 16 happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (T (happy_var_2 : happy_var_4)
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_3  16 happyReduction_37
happyReduction_37 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (P happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  16 happyReduction_38
happyReduction_38 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (A happy_var_1 happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 36 36 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	LPar -> cont 17;
	RPar -> cont 18;
	TDot -> cont 19;
	TCom -> cont 20;
	TLam -> cont 21;
	TCol -> cont 22;
	TArrow -> cont 23;
	TPlus -> cont 24;
	Empty -> cont 25;
	ID happy_dollar_dollar -> cont 26;
	Num happy_dollar_dollar -> cont 27;
	TINT -> cont 28;
	TBOOL -> cont 29;
	TUNIT -> cont 30;
	TCase -> cont 31;
	LAngle -> cont 32;
	RAngle -> cont 33;
	TEqual -> cont 34;
	TOf -> cont 35;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 36 tk tks = happyError' (tks, explist)
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
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn9 z -> happyReturn z; _other -> notHappyAtAll })

happyParseEnv tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn13 z -> happyReturn z; _other -> notHappyAtAll })

happyParseTerm tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn16 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error "Parse error at EOF"
parseError (t:ts) = error $ "Parse error: " ++ show t

parseExp     = happyParseExp . alexScanTokens
parseEnv     = happyParseEnv . alexScanTokens
parseTerm    = happyParseTerm . alexScanTokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}







# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}















{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc8336_0/ghc_2.h" #-}
































































































































































































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

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

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
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

{-# LINE 267 "templates/GenericTemplate.hs" #-}
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

{-# LINE 333 "templates/GenericTemplate.hs" #-}
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
