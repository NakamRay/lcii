{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import DataType
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.11

data HappyAbsSyn t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18
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
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,229) ([0,4164,10,0,48,0,16656,0,8192,20610,0,0,0,32768,16906,1,4864,1668,0,2048,0,32768,0,0,8192,0,4096,10305,0,33440,0,16384,260,0,0,2,0,32,0,0,0,0,32,0,0,0,0,512,0,40960,20610,0,0,0,0,1536,0,256,1136,0,3072,0,1024,4544,0,32,0,61440,65,0,0,0,0,512,0,2688,4418,0,0,1,0,8192,0,49156,17,0,1,0,16880,40,0,0,0,0,1,0,0,8,0,0,0,2082,5,1024,4544,0,512,0,4096,18176,0,0,0,0,0,0,0,0,0,1024,0,8704,1288,0,0,0,0,32,0,0,0,0,0,0,1088,1,32768,520,0,16384,0,0,0,0,0,1,0,0,0,0,0,0,32,142,0,0,0,256,0,0,1053,0,0,0,0,512,0,59392,5152,0,0,128,0,4,0,128,0,0,36,0,17408,0,0,4,0,29696,2576,0,8328,20,20480,43073,0,33312,80,0,0,0,2176,322,0,28673,4,0,0,0,49156,17,0,0,0,16384,0,8192,20610,0,1088,1,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,4,0,0,0,0,0,0,0,0,0,32,0,512,2272,0,4096,0,0,32,0,0,0,0,0,0,4224,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParseExp","%start_happyParseEnv","%start_happyParseTerm","Start","exps","recExps","caseExps","inj","exp","prod","sum","type","env","decl","terms","term","'('","')'","'.'","','","'\955'","':'","'->'","'=>'","'+'","'Empty'","ID","NUM","INT","BOOL","UNIT","'{'","'}'","'case'","'<'","'>'","'='","'of'","%eof"]
        bit_start = st * 41
        bit_end = (st + 1) * 41
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..40]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (19) = happyShift action_6
action_0 (23) = happyShift action_7
action_0 (29) = happyShift action_8
action_0 (34) = happyShift action_9
action_0 (36) = happyShift action_10
action_0 (10) = happyGoto action_4
action_0 (11) = happyGoto action_19
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (28) = happyShift action_17
action_1 (29) = happyShift action_18
action_1 (15) = happyGoto action_15
action_1 (16) = happyGoto action_16
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (19) = happyShift action_12
action_2 (23) = happyShift action_13
action_2 (29) = happyShift action_14
action_2 (18) = happyGoto action_11
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (19) = happyShift action_6
action_3 (23) = happyShift action_7
action_3 (29) = happyShift action_8
action_3 (34) = happyShift action_9
action_3 (36) = happyShift action_10
action_3 (10) = happyGoto action_4
action_3 (11) = happyGoto action_5
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_21

action_5 (19) = happyShift action_6
action_5 (21) = happyShift action_21
action_5 (23) = happyShift action_7
action_5 (29) = happyShift action_8
action_5 (34) = happyShift action_9
action_5 (36) = happyShift action_10
action_5 (10) = happyGoto action_4
action_5 (11) = happyGoto action_20
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (19) = happyShift action_6
action_6 (20) = happyShift action_35
action_6 (23) = happyShift action_7
action_6 (29) = happyShift action_8
action_6 (34) = happyShift action_9
action_6 (36) = happyShift action_10
action_6 (37) = happyShift action_36
action_6 (10) = happyGoto action_4
action_6 (11) = happyGoto action_34
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (29) = happyShift action_33
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (24) = happyShift action_32
action_8 _ = happyReduce_14

action_9 (29) = happyShift action_31
action_9 (8) = happyGoto action_30
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (19) = happyShift action_6
action_10 (23) = happyShift action_7
action_10 (29) = happyShift action_8
action_10 (34) = happyShift action_9
action_10 (36) = happyShift action_10
action_10 (10) = happyGoto action_4
action_10 (11) = happyGoto action_29
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (19) = happyShift action_12
action_11 (21) = happyShift action_28
action_11 (23) = happyShift action_13
action_11 (29) = happyShift action_14
action_11 (41) = happyAccept
action_11 (18) = happyGoto action_27
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (19) = happyShift action_12
action_12 (23) = happyShift action_13
action_12 (29) = happyShift action_14
action_12 (18) = happyGoto action_26
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (29) = happyShift action_25
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (24) = happyShift action_24
action_14 _ = happyReduce_41

action_15 (41) = happyAccept
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (22) = happyShift action_23
action_16 _ = happyReduce_33

action_17 _ = happyReduce_35

action_18 (24) = happyShift action_22
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (19) = happyShift action_6
action_19 (21) = happyShift action_21
action_19 (23) = happyShift action_7
action_19 (29) = happyShift action_8
action_19 (34) = happyShift action_9
action_19 (36) = happyShift action_10
action_19 (41) = happyAccept
action_19 (10) = happyGoto action_4
action_19 (11) = happyGoto action_20
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (21) = happyShift action_21
action_20 (23) = happyShift action_7
action_20 (34) = happyShift action_9
action_20 (36) = happyShift action_10
action_20 (10) = happyGoto action_4
action_20 (11) = happyGoto action_20
action_20 _ = happyReduce_18

action_21 (29) = happyShift action_57
action_21 (30) = happyShift action_58
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (19) = happyShift action_42
action_22 (31) = happyShift action_43
action_22 (32) = happyShift action_44
action_22 (33) = happyShift action_45
action_22 (37) = happyShift action_46
action_22 (14) = happyGoto action_56
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (28) = happyShift action_17
action_23 (29) = happyShift action_18
action_23 (15) = happyGoto action_55
action_23 (16) = happyGoto action_16
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (19) = happyShift action_42
action_24 (31) = happyShift action_43
action_24 (32) = happyShift action_44
action_24 (33) = happyShift action_45
action_24 (37) = happyShift action_46
action_24 (14) = happyGoto action_54
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (21) = happyShift action_53
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (19) = happyShift action_12
action_26 (20) = happyShift action_51
action_26 (21) = happyShift action_28
action_26 (22) = happyShift action_52
action_26 (23) = happyShift action_13
action_26 (29) = happyShift action_14
action_26 (18) = happyGoto action_27
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (21) = happyShift action_28
action_27 (23) = happyShift action_13
action_27 (18) = happyGoto action_27
action_27 _ = happyReduce_45

action_28 (30) = happyShift action_50
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (19) = happyShift action_6
action_29 (21) = happyShift action_21
action_29 (23) = happyShift action_7
action_29 (29) = happyShift action_8
action_29 (34) = happyShift action_9
action_29 (36) = happyShift action_10
action_29 (40) = happyShift action_49
action_29 (10) = happyGoto action_4
action_29 (11) = happyGoto action_20
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (35) = happyShift action_48
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (39) = happyShift action_47
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (19) = happyShift action_42
action_32 (31) = happyShift action_43
action_32 (32) = happyShift action_44
action_32 (33) = happyShift action_45
action_32 (37) = happyShift action_46
action_32 (14) = happyGoto action_41
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (24) = happyShift action_40
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (19) = happyShift action_6
action_34 (20) = happyShift action_38
action_34 (21) = happyShift action_21
action_34 (22) = happyShift action_39
action_34 (23) = happyShift action_7
action_34 (29) = happyShift action_8
action_34 (34) = happyShift action_9
action_34 (36) = happyShift action_10
action_34 (10) = happyGoto action_4
action_34 (11) = happyGoto action_20
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_11

action_36 (29) = happyShift action_37
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (39) = happyShift action_73
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_12

action_39 (19) = happyShift action_6
action_39 (23) = happyShift action_7
action_39 (29) = happyShift action_8
action_39 (34) = happyShift action_9
action_39 (36) = happyShift action_10
action_39 (7) = happyGoto action_71
action_39 (10) = happyGoto action_4
action_39 (11) = happyGoto action_72
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (19) = happyShift action_42
action_40 (31) = happyShift action_43
action_40 (32) = happyShift action_44
action_40 (33) = happyShift action_45
action_40 (37) = happyShift action_46
action_40 (14) = happyGoto action_70
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (25) = happyShift action_59
action_41 _ = happyReduce_13

action_42 (19) = happyShift action_42
action_42 (31) = happyShift action_43
action_42 (32) = happyShift action_44
action_42 (33) = happyShift action_45
action_42 (37) = happyShift action_46
action_42 (12) = happyGoto action_68
action_42 (14) = happyGoto action_69
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_27

action_44 _ = happyReduce_28

action_45 _ = happyReduce_32

action_46 (29) = happyShift action_67
action_46 (13) = happyGoto action_66
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (19) = happyShift action_6
action_47 (23) = happyShift action_7
action_47 (29) = happyShift action_8
action_47 (34) = happyShift action_9
action_47 (36) = happyShift action_10
action_47 (10) = happyGoto action_4
action_47 (11) = happyGoto action_65
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_19

action_49 (29) = happyShift action_64
action_49 (9) = happyGoto action_63
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_44

action_51 _ = happyReduce_39

action_52 (19) = happyShift action_12
action_52 (23) = happyShift action_13
action_52 (29) = happyShift action_14
action_52 (17) = happyGoto action_61
action_52 (18) = happyGoto action_62
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (19) = happyShift action_12
action_53 (23) = happyShift action_13
action_53 (29) = happyShift action_14
action_53 (18) = happyGoto action_60
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (25) = happyShift action_59
action_54 _ = happyReduce_40

action_55 _ = happyReduce_34

action_56 (25) = happyShift action_59
action_56 _ = happyReduce_36

action_57 _ = happyReduce_20

action_58 _ = happyReduce_17

action_59 (19) = happyShift action_42
action_59 (31) = happyShift action_43
action_59 (32) = happyShift action_44
action_59 (33) = happyShift action_45
action_59 (37) = happyShift action_46
action_59 (14) = happyGoto action_86
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (19) = happyShift action_12
action_60 (21) = happyShift action_28
action_60 (23) = happyShift action_13
action_60 (29) = happyShift action_14
action_60 (18) = happyGoto action_27
action_60 _ = happyReduce_42

action_61 (20) = happyShift action_85
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (19) = happyShift action_12
action_62 (21) = happyShift action_28
action_62 (22) = happyShift action_84
action_62 (23) = happyShift action_13
action_62 (29) = happyShift action_14
action_62 (18) = happyGoto action_27
action_62 _ = happyReduce_37

action_63 _ = happyReduce_22

action_64 (26) = happyShift action_83
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (19) = happyShift action_6
action_65 (21) = happyShift action_21
action_65 (22) = happyShift action_82
action_65 (23) = happyShift action_7
action_65 (29) = happyShift action_8
action_65 (34) = happyShift action_9
action_65 (36) = happyShift action_10
action_65 (10) = happyGoto action_4
action_65 (11) = happyGoto action_20
action_65 _ = happyReduce_6

action_66 (38) = happyShift action_81
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (24) = happyShift action_80
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (20) = happyShift action_79
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (22) = happyShift action_78
action_69 (25) = happyShift action_59
action_69 _ = happyReduce_23

action_70 (21) = happyShift action_77
action_70 (25) = happyShift action_59
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (20) = happyShift action_76
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (19) = happyShift action_6
action_72 (21) = happyShift action_21
action_72 (22) = happyShift action_75
action_72 (23) = happyShift action_7
action_72 (29) = happyShift action_8
action_72 (34) = happyShift action_9
action_72 (36) = happyShift action_10
action_72 (10) = happyGoto action_4
action_72 (11) = happyGoto action_20
action_72 _ = happyReduce_4

action_73 (19) = happyShift action_6
action_73 (23) = happyShift action_7
action_73 (29) = happyShift action_8
action_73 (34) = happyShift action_9
action_73 (36) = happyShift action_10
action_73 (10) = happyGoto action_4
action_73 (11) = happyGoto action_74
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (19) = happyShift action_6
action_74 (21) = happyShift action_21
action_74 (23) = happyShift action_7
action_74 (29) = happyShift action_8
action_74 (34) = happyShift action_9
action_74 (36) = happyShift action_10
action_74 (38) = happyShift action_94
action_74 (10) = happyGoto action_4
action_74 (11) = happyGoto action_20
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (19) = happyShift action_6
action_75 (23) = happyShift action_7
action_75 (29) = happyShift action_8
action_75 (34) = happyShift action_9
action_75 (36) = happyShift action_10
action_75 (7) = happyGoto action_93
action_75 (10) = happyGoto action_4
action_75 (11) = happyGoto action_72
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_16

action_77 (19) = happyShift action_6
action_77 (23) = happyShift action_7
action_77 (29) = happyShift action_8
action_77 (34) = happyShift action_9
action_77 (36) = happyShift action_10
action_77 (10) = happyGoto action_4
action_77 (11) = happyGoto action_92
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (19) = happyShift action_42
action_78 (31) = happyShift action_43
action_78 (32) = happyShift action_44
action_78 (33) = happyShift action_45
action_78 (37) = happyShift action_46
action_78 (12) = happyGoto action_91
action_78 (14) = happyGoto action_69
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_30

action_80 (19) = happyShift action_42
action_80 (31) = happyShift action_43
action_80 (32) = happyShift action_44
action_80 (33) = happyShift action_45
action_80 (37) = happyShift action_46
action_80 (14) = happyGoto action_90
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_31

action_82 (29) = happyShift action_31
action_82 (8) = happyGoto action_89
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (19) = happyShift action_6
action_83 (23) = happyShift action_7
action_83 (29) = happyShift action_8
action_83 (34) = happyShift action_9
action_83 (36) = happyShift action_10
action_83 (10) = happyGoto action_4
action_83 (11) = happyGoto action_88
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (19) = happyShift action_12
action_84 (23) = happyShift action_13
action_84 (29) = happyShift action_14
action_84 (17) = happyGoto action_87
action_84 (18) = happyGoto action_62
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_43

action_86 (25) = happyShift action_59
action_86 _ = happyReduce_29

action_87 _ = happyReduce_38

action_88 (19) = happyShift action_6
action_88 (21) = happyShift action_21
action_88 (22) = happyShift action_97
action_88 (23) = happyShift action_7
action_88 (29) = happyShift action_8
action_88 (34) = happyShift action_9
action_88 (36) = happyShift action_10
action_88 (10) = happyGoto action_4
action_88 (11) = happyGoto action_20
action_88 _ = happyReduce_8

action_89 _ = happyReduce_7

action_90 (22) = happyShift action_96
action_90 (25) = happyShift action_59
action_90 _ = happyReduce_25

action_91 _ = happyReduce_24

action_92 (19) = happyShift action_6
action_92 (21) = happyShift action_21
action_92 (23) = happyShift action_7
action_92 (29) = happyShift action_8
action_92 (34) = happyShift action_9
action_92 (36) = happyShift action_10
action_92 (10) = happyGoto action_4
action_92 (11) = happyGoto action_20
action_92 _ = happyReduce_15

action_93 _ = happyReduce_5

action_94 (24) = happyShift action_95
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (19) = happyShift action_42
action_95 (31) = happyShift action_43
action_95 (32) = happyShift action_44
action_95 (33) = happyShift action_45
action_95 (37) = happyShift action_46
action_95 (14) = happyGoto action_100
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (29) = happyShift action_67
action_96 (13) = happyGoto action_99
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (29) = happyShift action_64
action_97 (9) = happyGoto action_98
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_9

action_99 _ = happyReduce_26

action_100 (20) = happyShift action_101
action_100 (25) = happyShift action_59
action_100 _ = happyFail (happyExpListPerState 100)

action_101 _ = happyReduce_10

happyReduce_3 = happySpecReduce_1  6 happyReduction_3
happyReduction_3 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  7 happyReduction_4
happyReduction_4 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  7 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  8 happyReduction_6
happyReduction_6 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn8
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 5 8 happyReduction_7
happyReduction_7 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  9 happyReduction_8
happyReduction_8 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn9
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happyReduce 5 9 happyReduction_9
happyReduction_9 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 9 10 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Inj happy_var_3 happy_var_5 happy_var_8
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_2  11 happyReduction_11
happyReduction_11 _
	_
	 =  HappyAbsSyn11
		 (U
	)

happyReduce_12 = happySpecReduce_3  11 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  11 happyReduction_13
happyReduction_13 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn11
		 (C happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  11 happyReduction_14
happyReduction_14 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn11
		 (V happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happyReduce 6 11 happyReduction_15
happyReduction_15 ((HappyAbsSyn11  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (L happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 5 11 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (T (happy_var_2 : happy_var_4)
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_3  11 happyReduction_17
happyReduction_17 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (P happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  11 happyReduction_18
happyReduction_18 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (A happy_var_1 happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  11 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (R happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  11 happyReduction_20
happyReduction_20 (HappyTerminal (ID happy_var_3))
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (F happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 11 happyReduction_22
happyReduction_22 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Case happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_1  12 happyReduction_23
happyReduction_23 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  12 happyReduction_24
happyReduction_24 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  13 happyReduction_25
happyReduction_25 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn13
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happyReduce 5 13 happyReduction_26
happyReduction_26 ((HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_1  14 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn14
		 (INT
	)

happyReduce_28 = happySpecReduce_1  14 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn14
		 (BOOL
	)

happyReduce_29 = happySpecReduce_3  14 happyReduction_29
happyReduction_29 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1 :=> happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Prod happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  14 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Var happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  14 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn14
		 (Unit
	)

happyReduce_33 = happySpecReduce_1  15 happyReduction_33
happyReduction_33 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 ([happy_var_1]
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  15 happyReduction_34
happyReduction_34 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 : happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  15 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn15
		 ([]
	)

happyReduce_36 = happySpecReduce_3  16 happyReduction_36
happyReduction_36 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn16
		 ((happy_var_1,happy_var_3)
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  17 happyReduction_37
happyReduction_37 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 ([happy_var_1]
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  17 happyReduction_38
happyReduction_38 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1 : happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  18 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  18 happyReduction_40
happyReduction_40 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn18
		 (C happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  18 happyReduction_41
happyReduction_41 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn18
		 (V happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happyReduce 4 18 happyReduction_42
happyReduction_42 ((HappyAbsSyn18  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (L happy_var_2 INT happy_var_4
	) `HappyStk` happyRest

happyReduce_43 = happyReduce 5 18 happyReduction_43
happyReduction_43 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (T (happy_var_2 : happy_var_4)
	) `HappyStk` happyRest

happyReduce_44 = happySpecReduce_3  18 happyReduction_44
happyReduction_44 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (P happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_2  18 happyReduction_45
happyReduction_45 (HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (A happy_var_1 happy_var_2
	)
happyReduction_45 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 41 41 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	LPar -> cont 19;
	RPar -> cont 20;
	TDot -> cont 21;
	TCom -> cont 22;
	TLam -> cont 23;
	TCol -> cont 24;
	TArrow -> cont 25;
	TLArrow -> cont 26;
	TPlus -> cont 27;
	Empty -> cont 28;
	ID happy_dollar_dollar -> cont 29;
	Num happy_dollar_dollar -> cont 30;
	TINT -> cont 31;
	TBOOL -> cont 32;
	TUNIT -> cont 33;
	LBrace -> cont 34;
	RBrace -> cont 35;
	TCase -> cont 36;
	LAngle -> cont 37;
	RAngle -> cont 38;
	TEqual -> cont 39;
	TOf -> cont 40;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 41 tk tks = happyError' (tks, explist)
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
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn11 z -> happyReturn z; _other -> notHappyAtAll })

happyParseEnv tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn15 z -> happyReturn z; _other -> notHappyAtAll })

happyParseTerm tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn18 z -> happyReturn z; _other -> notHappyAtAll })

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
