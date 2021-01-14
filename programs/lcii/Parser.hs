{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import DataType
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.11

data HappyAbsSyn t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22
	= HappyTerminal (Token)
	| HappyErrorToken Int
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
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,692) ([0,50240,512,24,0,0,4128,0,0,4096,4,34816,16392,1008,0,3140,32800,1,0,0,0,0,33617,57375,0,35200,3073,48,16384,196,6146,0,0,0,8,0,0,2048,0,6280,64,3,0,0,0,0,2048,0,0,20736,2145,126,32768,137,16140,0,17472,33280,31,0,0,2048,0,4368,57472,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,64,0,0,54336,2016,56,0,0,0,0,32768,0,0,38912,64536,1792,0,3140,32894,3,0,0,192,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,516,0,34,47,1,0,0,65,32768,12456,16196,0,4096,0,0,0,4,0,0,512,0,0,34816,17166,1008,0,0,256,0,42496,4290,252,0,0,0,0,0,0,32,0,0,0,0,0,0,12,4096,32785,2016,0,2184,61504,3,17408,24064,768,0,1698,49471,1,16384,0,0,0,512,0,0,2048,0,0,0,4,0,0,15632,504,14,0,32,2,0,3404,32894,3,0,0,0,0,0,16384,0,0,8192,0,0,0,0,0,25120,256,12,4096,32817,1536,0,0,0,0,0,0,0,0,34,47,1,4352,2051,96,0,0,8192,0,0,2,0,8192,61442,4098,0,272,376,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,4096,32785,2016,0,2184,61504,3,0,0,0,0,0,0,0,4352,2049,126,0,0,8192,0,0,0,0,0,256,0,0,0,0,0,0,0,1,0,4096,0,0,32768,0,0,0,0,0,0,0,0,0,0,8,0,0,1024,0,0,0,136,0,0,8192,512,0,2048,32,0,0,0,32768,0,4352,6016,128,0,0,0,0,0,4097,0,0,0,0,0,272,376,12,34816,48128,1024,0,0,0,0,0,0,0,0,32785,32791,0,2176,3008,64,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,50082,64528,0,4352,2049,126,0,0,0,0,0,4,0,0,0,0,0,33792,0,0,0,0,0,0,3908,32894,3,8704,4102,192,0,33617,57407,0,0,0,32,16384,196,6146,0,25120,256,12,4096,34325,2018,0,0,0,2,17408,8196,504,0,4352,0,0,0,0,0,0,0,0,0,0,2,0,0,0,2048,0,0,0,0,0,0,0,0,0,256,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,64,0,0,136,188,4,0,0,256,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,32800,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParseExp","%start_happyParseTypeContext","%start_happyParseEnv","%start_happyParseTerm","Start","exps","recExps","caseExps","inj","exp","prod","sum","type","typeContext","env","decl","terms","recTerms","caseTerms","term","'('","')'","'['","']'","'{'","'}'","'.'","','","'\955'","'\923'","':'","'->'","'=>'","'+'","'-'","'\8704'","INT","BOOL","UNIT","'case'","'<'","'>'","'='","'of'","'Empty'","'succ'","'pred'","'true'","'false'","NUM","ID","TyID","%eof"]
        bit_start = st * 55
        bit_end = (st + 1) * 55
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..54]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (23) = happyShift action_7
action_0 (27) = happyShift action_8
action_0 (31) = happyShift action_9
action_0 (32) = happyShift action_10
action_0 (42) = happyShift action_11
action_0 (52) = happyShift action_12
action_0 (53) = happyShift action_13
action_0 (11) = happyGoto action_5
action_0 (12) = happyGoto action_32
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (47) = happyShift action_30
action_1 (54) = happyShift action_31
action_1 (16) = happyGoto action_29
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (47) = happyShift action_27
action_2 (53) = happyShift action_28
action_2 (17) = happyGoto action_25
action_2 (18) = happyGoto action_26
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (23) = happyShift action_15
action_3 (27) = happyShift action_16
action_3 (31) = happyShift action_17
action_3 (42) = happyShift action_18
action_3 (48) = happyShift action_19
action_3 (49) = happyShift action_20
action_3 (50) = happyShift action_21
action_3 (51) = happyShift action_22
action_3 (52) = happyShift action_23
action_3 (53) = happyShift action_24
action_3 (22) = happyGoto action_14
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (23) = happyShift action_7
action_4 (27) = happyShift action_8
action_4 (31) = happyShift action_9
action_4 (32) = happyShift action_10
action_4 (42) = happyShift action_11
action_4 (52) = happyShift action_12
action_4 (53) = happyShift action_13
action_4 (11) = happyGoto action_5
action_4 (12) = happyGoto action_6
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_24

action_6 (23) = happyShift action_35
action_6 (27) = happyShift action_36
action_6 (29) = happyShift action_37
action_6 (31) = happyShift action_9
action_6 (32) = happyShift action_10
action_6 (38) = happyShift action_38
action_6 (39) = happyShift action_39
action_6 (40) = happyShift action_40
action_6 (41) = happyShift action_41
action_6 (42) = happyShift action_11
action_6 (43) = happyShift action_42
action_6 (52) = happyShift action_12
action_6 (53) = happyShift action_13
action_6 (54) = happyShift action_43
action_6 (11) = happyGoto action_5
action_6 (12) = happyGoto action_33
action_6 (15) = happyGoto action_34
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (23) = happyShift action_7
action_7 (24) = happyShift action_69
action_7 (27) = happyShift action_8
action_7 (31) = happyShift action_9
action_7 (32) = happyShift action_10
action_7 (42) = happyShift action_11
action_7 (43) = happyShift action_70
action_7 (52) = happyShift action_12
action_7 (53) = happyShift action_13
action_7 (11) = happyGoto action_5
action_7 (12) = happyGoto action_68
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (23) = happyShift action_7
action_8 (27) = happyShift action_8
action_8 (31) = happyShift action_9
action_8 (32) = happyShift action_10
action_8 (42) = happyShift action_11
action_8 (52) = happyShift action_12
action_8 (53) = happyShift action_67
action_8 (8) = happyGoto action_64
action_8 (9) = happyGoto action_65
action_8 (11) = happyGoto action_5
action_8 (12) = happyGoto action_66
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (53) = happyShift action_63
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (54) = happyShift action_62
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (23) = happyShift action_7
action_11 (27) = happyShift action_8
action_11 (31) = happyShift action_9
action_11 (32) = happyShift action_10
action_11 (42) = happyShift action_11
action_11 (52) = happyShift action_12
action_11 (53) = happyShift action_13
action_11 (11) = happyGoto action_5
action_11 (12) = happyGoto action_61
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_17

action_13 (33) = happyShift action_60
action_13 _ = happyReduce_16

action_14 (23) = happyShift action_15
action_14 (27) = happyShift action_16
action_14 (29) = happyShift action_57
action_14 (31) = happyShift action_17
action_14 (36) = happyShift action_58
action_14 (37) = happyShift action_59
action_14 (42) = happyShift action_18
action_14 (48) = happyShift action_19
action_14 (49) = happyShift action_20
action_14 (50) = happyShift action_21
action_14 (51) = happyShift action_22
action_14 (52) = happyShift action_23
action_14 (53) = happyShift action_24
action_14 (55) = happyAccept
action_14 (22) = happyGoto action_56
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (23) = happyShift action_15
action_15 (24) = happyShift action_54
action_15 (27) = happyShift action_16
action_15 (31) = happyShift action_17
action_15 (42) = happyShift action_18
action_15 (43) = happyShift action_55
action_15 (48) = happyShift action_19
action_15 (49) = happyShift action_20
action_15 (50) = happyShift action_21
action_15 (51) = happyShift action_22
action_15 (52) = happyShift action_23
action_15 (53) = happyShift action_24
action_15 (22) = happyGoto action_53
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (23) = happyShift action_15
action_16 (27) = happyShift action_16
action_16 (31) = happyShift action_17
action_16 (42) = happyShift action_18
action_16 (48) = happyShift action_19
action_16 (49) = happyShift action_20
action_16 (50) = happyShift action_21
action_16 (51) = happyShift action_22
action_16 (52) = happyShift action_23
action_16 (53) = happyShift action_52
action_16 (19) = happyGoto action_49
action_16 (20) = happyGoto action_50
action_16 (22) = happyGoto action_51
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (53) = happyShift action_48
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (23) = happyShift action_15
action_18 (27) = happyShift action_16
action_18 (31) = happyShift action_17
action_18 (42) = happyShift action_18
action_18 (48) = happyShift action_19
action_18 (49) = happyShift action_20
action_18 (50) = happyShift action_21
action_18 (51) = happyShift action_22
action_18 (52) = happyShift action_23
action_18 (53) = happyShift action_24
action_18 (22) = happyGoto action_47
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_67

action_20 _ = happyReduce_68

action_21 _ = happyReduce_71

action_22 _ = happyReduce_72

action_23 _ = happyReduce_58

action_24 _ = happyReduce_57

action_25 (55) = happyAccept
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (30) = happyShift action_46
action_26 _ = happyReduce_45

action_27 _ = happyReduce_47

action_28 (33) = happyShift action_45
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (55) = happyAccept
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_44

action_31 (30) = happyShift action_44
action_31 _ = happyReduce_42

action_32 (23) = happyShift action_35
action_32 (27) = happyShift action_36
action_32 (29) = happyShift action_37
action_32 (31) = happyShift action_9
action_32 (32) = happyShift action_10
action_32 (38) = happyShift action_38
action_32 (39) = happyShift action_39
action_32 (40) = happyShift action_40
action_32 (41) = happyShift action_41
action_32 (42) = happyShift action_11
action_32 (43) = happyShift action_42
action_32 (52) = happyShift action_12
action_32 (53) = happyShift action_13
action_32 (54) = happyShift action_43
action_32 (55) = happyAccept
action_32 (11) = happyGoto action_5
action_32 (12) = happyGoto action_33
action_32 (15) = happyGoto action_34
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (29) = happyShift action_37
action_33 (38) = happyShift action_38
action_33 (39) = happyShift action_39
action_33 (40) = happyShift action_40
action_33 (41) = happyShift action_41
action_33 (43) = happyShift action_42
action_33 (54) = happyShift action_43
action_33 (11) = happyGoto action_5
action_33 (12) = happyGoto action_33
action_33 (15) = happyGoto action_34
action_33 _ = happyReduce_21

action_34 (34) = happyShift action_110
action_34 _ = happyReduce_27

action_35 (23) = happyShift action_35
action_35 (24) = happyShift action_69
action_35 (27) = happyShift action_36
action_35 (31) = happyShift action_9
action_35 (32) = happyShift action_10
action_35 (38) = happyShift action_38
action_35 (39) = happyShift action_39
action_35 (40) = happyShift action_40
action_35 (41) = happyShift action_41
action_35 (42) = happyShift action_11
action_35 (43) = happyShift action_109
action_35 (52) = happyShift action_12
action_35 (53) = happyShift action_13
action_35 (54) = happyShift action_43
action_35 (11) = happyGoto action_5
action_35 (12) = happyGoto action_68
action_35 (15) = happyGoto action_108
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (23) = happyShift action_35
action_36 (27) = happyShift action_36
action_36 (31) = happyShift action_9
action_36 (32) = happyShift action_10
action_36 (38) = happyShift action_38
action_36 (39) = happyShift action_39
action_36 (40) = happyShift action_40
action_36 (41) = happyShift action_41
action_36 (42) = happyShift action_11
action_36 (43) = happyShift action_42
action_36 (52) = happyShift action_12
action_36 (53) = happyShift action_107
action_36 (54) = happyShift action_43
action_36 (8) = happyGoto action_64
action_36 (9) = happyGoto action_65
action_36 (11) = happyGoto action_5
action_36 (12) = happyGoto action_66
action_36 (13) = happyGoto action_104
action_36 (14) = happyGoto action_105
action_36 (15) = happyGoto action_106
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (52) = happyShift action_102
action_37 (53) = happyShift action_103
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (54) = happyShift action_101
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_33

action_40 _ = happyReduce_34

action_41 _ = happyReduce_41

action_42 (53) = happyShift action_100
action_42 (14) = happyGoto action_99
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_35

action_44 (47) = happyShift action_30
action_44 (54) = happyShift action_31
action_44 (16) = happyGoto action_98
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (23) = happyShift action_81
action_45 (27) = happyShift action_82
action_45 (38) = happyShift action_38
action_45 (39) = happyShift action_39
action_45 (40) = happyShift action_40
action_45 (41) = happyShift action_41
action_45 (43) = happyShift action_42
action_45 (54) = happyShift action_43
action_45 (15) = happyGoto action_97
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (47) = happyShift action_27
action_46 (53) = happyShift action_28
action_46 (17) = happyGoto action_96
action_46 (18) = happyGoto action_26
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (23) = happyShift action_15
action_47 (27) = happyShift action_16
action_47 (29) = happyShift action_57
action_47 (31) = happyShift action_17
action_47 (36) = happyShift action_58
action_47 (37) = happyShift action_59
action_47 (42) = happyShift action_18
action_47 (46) = happyShift action_95
action_47 (48) = happyShift action_19
action_47 (49) = happyShift action_20
action_47 (50) = happyShift action_21
action_47 (51) = happyShift action_22
action_47 (52) = happyShift action_23
action_47 (53) = happyShift action_24
action_47 (22) = happyGoto action_56
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (29) = happyShift action_94
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (28) = happyShift action_93
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (28) = happyShift action_92
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (23) = happyShift action_15
action_51 (27) = happyShift action_16
action_51 (29) = happyShift action_57
action_51 (30) = happyShift action_91
action_51 (31) = happyShift action_17
action_51 (36) = happyShift action_58
action_51 (37) = happyShift action_59
action_51 (42) = happyShift action_18
action_51 (48) = happyShift action_19
action_51 (49) = happyShift action_20
action_51 (50) = happyShift action_21
action_51 (51) = happyShift action_22
action_51 (52) = happyShift action_23
action_51 (53) = happyShift action_24
action_51 (22) = happyGoto action_56
action_51 _ = happyReduce_49

action_52 (45) = happyShift action_90
action_52 _ = happyReduce_57

action_53 (23) = happyShift action_15
action_53 (24) = happyShift action_89
action_53 (27) = happyShift action_16
action_53 (29) = happyShift action_57
action_53 (31) = happyShift action_17
action_53 (36) = happyShift action_58
action_53 (37) = happyShift action_59
action_53 (42) = happyShift action_18
action_53 (48) = happyShift action_19
action_53 (49) = happyShift action_20
action_53 (50) = happyShift action_21
action_53 (51) = happyShift action_22
action_53 (52) = happyShift action_23
action_53 (53) = happyShift action_24
action_53 (22) = happyGoto action_56
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_55

action_55 (53) = happyShift action_88
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (29) = happyShift action_57
action_56 (36) = happyShift action_58
action_56 (37) = happyShift action_59
action_56 (48) = happyShift action_19
action_56 (49) = happyShift action_20
action_56 (50) = happyShift action_21
action_56 (51) = happyShift action_22
action_56 (22) = happyGoto action_56
action_56 _ = happyReduce_62

action_57 (52) = happyShift action_86
action_57 (53) = happyShift action_87
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (23) = happyShift action_15
action_58 (27) = happyShift action_16
action_58 (31) = happyShift action_17
action_58 (42) = happyShift action_18
action_58 (48) = happyShift action_19
action_58 (49) = happyShift action_20
action_58 (50) = happyShift action_21
action_58 (51) = happyShift action_22
action_58 (52) = happyShift action_23
action_58 (53) = happyShift action_24
action_58 (22) = happyGoto action_85
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (23) = happyShift action_15
action_59 (27) = happyShift action_16
action_59 (31) = happyShift action_17
action_59 (42) = happyShift action_18
action_59 (48) = happyShift action_19
action_59 (49) = happyShift action_20
action_59 (50) = happyShift action_21
action_59 (51) = happyShift action_22
action_59 (52) = happyShift action_23
action_59 (53) = happyShift action_24
action_59 (22) = happyGoto action_84
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (23) = happyShift action_81
action_60 (27) = happyShift action_82
action_60 (38) = happyShift action_38
action_60 (39) = happyShift action_39
action_60 (40) = happyShift action_40
action_60 (41) = happyShift action_41
action_60 (43) = happyShift action_42
action_60 (53) = happyShift action_83
action_60 (54) = happyShift action_43
action_60 (15) = happyGoto action_80
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (23) = happyShift action_35
action_61 (27) = happyShift action_36
action_61 (29) = happyShift action_37
action_61 (31) = happyShift action_9
action_61 (32) = happyShift action_10
action_61 (38) = happyShift action_38
action_61 (39) = happyShift action_39
action_61 (40) = happyShift action_40
action_61 (41) = happyShift action_41
action_61 (42) = happyShift action_11
action_61 (43) = happyShift action_42
action_61 (46) = happyShift action_79
action_61 (52) = happyShift action_12
action_61 (53) = happyShift action_13
action_61 (54) = happyShift action_43
action_61 (11) = happyGoto action_5
action_61 (12) = happyGoto action_33
action_61 (15) = happyGoto action_34
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (29) = happyShift action_78
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (33) = happyShift action_77
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (28) = happyShift action_76
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (28) = happyShift action_75
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (23) = happyShift action_35
action_66 (27) = happyShift action_36
action_66 (29) = happyShift action_37
action_66 (30) = happyShift action_74
action_66 (31) = happyShift action_9
action_66 (32) = happyShift action_10
action_66 (38) = happyShift action_38
action_66 (39) = happyShift action_39
action_66 (40) = happyShift action_40
action_66 (41) = happyShift action_41
action_66 (42) = happyShift action_11
action_66 (43) = happyShift action_42
action_66 (52) = happyShift action_12
action_66 (53) = happyShift action_13
action_66 (54) = happyShift action_43
action_66 (11) = happyGoto action_5
action_66 (12) = happyGoto action_33
action_66 (15) = happyGoto action_34
action_66 _ = happyReduce_5

action_67 (33) = happyShift action_60
action_67 (45) = happyShift action_73
action_67 _ = happyReduce_16

action_68 (23) = happyShift action_35
action_68 (24) = happyShift action_72
action_68 (27) = happyShift action_36
action_68 (29) = happyShift action_37
action_68 (31) = happyShift action_9
action_68 (32) = happyShift action_10
action_68 (38) = happyShift action_38
action_68 (39) = happyShift action_39
action_68 (40) = happyShift action_40
action_68 (41) = happyShift action_41
action_68 (42) = happyShift action_11
action_68 (43) = happyShift action_42
action_68 (52) = happyShift action_12
action_68 (53) = happyShift action_13
action_68 (54) = happyShift action_43
action_68 (11) = happyGoto action_5
action_68 (12) = happyGoto action_33
action_68 (15) = happyGoto action_34
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_12

action_70 (53) = happyShift action_71
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (45) = happyShift action_133
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_13

action_73 (23) = happyShift action_7
action_73 (27) = happyShift action_8
action_73 (31) = happyShift action_9
action_73 (32) = happyShift action_10
action_73 (42) = happyShift action_11
action_73 (52) = happyShift action_12
action_73 (53) = happyShift action_13
action_73 (11) = happyGoto action_5
action_73 (12) = happyGoto action_132
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (23) = happyShift action_7
action_74 (27) = happyShift action_8
action_74 (31) = happyShift action_9
action_74 (32) = happyShift action_10
action_74 (42) = happyShift action_11
action_74 (52) = happyShift action_12
action_74 (53) = happyShift action_13
action_74 (8) = happyGoto action_131
action_74 (11) = happyGoto action_5
action_74 (12) = happyGoto action_66
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_22

action_76 _ = happyReduce_19

action_77 (23) = happyShift action_81
action_77 (27) = happyShift action_82
action_77 (38) = happyShift action_38
action_77 (39) = happyShift action_39
action_77 (40) = happyShift action_40
action_77 (41) = happyShift action_41
action_77 (43) = happyShift action_42
action_77 (54) = happyShift action_43
action_77 (15) = happyGoto action_130
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (23) = happyShift action_7
action_78 (27) = happyShift action_8
action_78 (31) = happyShift action_9
action_78 (32) = happyShift action_10
action_78 (42) = happyShift action_11
action_78 (52) = happyShift action_12
action_78 (53) = happyShift action_13
action_78 (11) = happyGoto action_5
action_78 (12) = happyGoto action_129
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (53) = happyShift action_128
action_79 (10) = happyGoto action_127
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (34) = happyShift action_110
action_80 _ = happyReduce_14

action_81 (23) = happyShift action_81
action_81 (27) = happyShift action_82
action_81 (38) = happyShift action_38
action_81 (39) = happyShift action_39
action_81 (40) = happyShift action_40
action_81 (41) = happyShift action_41
action_81 (43) = happyShift action_42
action_81 (54) = happyShift action_43
action_81 (15) = happyGoto action_108
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (23) = happyShift action_81
action_82 (27) = happyShift action_82
action_82 (38) = happyShift action_38
action_82 (39) = happyShift action_39
action_82 (40) = happyShift action_40
action_82 (41) = happyShift action_41
action_82 (43) = happyShift action_42
action_82 (53) = happyShift action_100
action_82 (54) = happyShift action_43
action_82 (13) = happyGoto action_104
action_82 (14) = happyGoto action_105
action_82 (15) = happyGoto action_106
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_15

action_84 (23) = happyShift action_15
action_84 (27) = happyShift action_16
action_84 (29) = happyShift action_57
action_84 (31) = happyShift action_17
action_84 (36) = happyShift action_58
action_84 (37) = happyShift action_59
action_84 (42) = happyShift action_18
action_84 (48) = happyShift action_19
action_84 (49) = happyShift action_20
action_84 (50) = happyShift action_21
action_84 (51) = happyShift action_22
action_84 (52) = happyShift action_23
action_84 (53) = happyShift action_24
action_84 (22) = happyGoto action_56
action_84 _ = happyReduce_70

action_85 (23) = happyShift action_15
action_85 (27) = happyShift action_16
action_85 (29) = happyShift action_57
action_85 (31) = happyShift action_17
action_85 (36) = happyShift action_58
action_85 (37) = happyShift action_59
action_85 (42) = happyShift action_18
action_85 (48) = happyShift action_19
action_85 (49) = happyShift action_20
action_85 (50) = happyShift action_21
action_85 (51) = happyShift action_22
action_85 (52) = happyShift action_23
action_85 (53) = happyShift action_24
action_85 (22) = happyGoto action_56
action_85 _ = happyReduce_69

action_86 _ = happyReduce_61

action_87 _ = happyReduce_64

action_88 (45) = happyShift action_126
action_88 _ = happyFail (happyExpListPerState 88)

action_89 _ = happyReduce_56

action_90 (23) = happyShift action_15
action_90 (27) = happyShift action_16
action_90 (31) = happyShift action_17
action_90 (42) = happyShift action_18
action_90 (48) = happyShift action_19
action_90 (49) = happyShift action_20
action_90 (50) = happyShift action_21
action_90 (51) = happyShift action_22
action_90 (52) = happyShift action_23
action_90 (53) = happyShift action_24
action_90 (22) = happyGoto action_125
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (23) = happyShift action_15
action_91 (27) = happyShift action_16
action_91 (31) = happyShift action_17
action_91 (42) = happyShift action_18
action_91 (48) = happyShift action_19
action_91 (49) = happyShift action_20
action_91 (50) = happyShift action_21
action_91 (51) = happyShift action_22
action_91 (52) = happyShift action_23
action_91 (53) = happyShift action_24
action_91 (19) = happyGoto action_124
action_91 (22) = happyGoto action_51
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_63

action_93 _ = happyReduce_60

action_94 (23) = happyShift action_15
action_94 (27) = happyShift action_16
action_94 (31) = happyShift action_17
action_94 (42) = happyShift action_18
action_94 (48) = happyShift action_19
action_94 (49) = happyShift action_20
action_94 (50) = happyShift action_21
action_94 (51) = happyShift action_22
action_94 (52) = happyShift action_23
action_94 (53) = happyShift action_24
action_94 (22) = happyGoto action_123
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (53) = happyShift action_122
action_95 (21) = happyGoto action_121
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_46

action_97 (34) = happyShift action_110
action_97 _ = happyReduce_48

action_98 _ = happyReduce_43

action_99 (44) = happyShift action_120
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (33) = happyShift action_119
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (29) = happyShift action_118
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_20

action_103 _ = happyReduce_23

action_104 (28) = happyShift action_117
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (28) = happyShift action_116
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (30) = happyShift action_115
action_106 (34) = happyShift action_110
action_106 _ = happyReduce_28

action_107 (33) = happyShift action_114
action_107 (45) = happyShift action_73
action_107 _ = happyReduce_16

action_108 (24) = happyShift action_113
action_108 (34) = happyShift action_110
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (53) = happyShift action_112
action_109 (14) = happyGoto action_99
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (23) = happyShift action_81
action_110 (27) = happyShift action_82
action_110 (38) = happyShift action_38
action_110 (39) = happyShift action_39
action_110 (40) = happyShift action_40
action_110 (41) = happyShift action_41
action_110 (43) = happyShift action_42
action_110 (54) = happyShift action_43
action_110 (15) = happyGoto action_111
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (34) = happyShift action_110
action_111 _ = happyReduce_36

action_112 (33) = happyShift action_119
action_112 (45) = happyShift action_133
action_112 _ = happyFail (happyExpListPerState 112)

action_113 _ = happyReduce_32

action_114 (23) = happyShift action_81
action_114 (27) = happyShift action_82
action_114 (38) = happyShift action_38
action_114 (39) = happyShift action_39
action_114 (40) = happyShift action_40
action_114 (41) = happyShift action_41
action_114 (43) = happyShift action_42
action_114 (53) = happyShift action_83
action_114 (54) = happyShift action_43
action_114 (15) = happyGoto action_144
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (23) = happyShift action_81
action_115 (27) = happyShift action_82
action_115 (38) = happyShift action_38
action_115 (39) = happyShift action_39
action_115 (40) = happyShift action_40
action_115 (41) = happyShift action_41
action_115 (43) = happyShift action_42
action_115 (54) = happyShift action_43
action_115 (13) = happyGoto action_143
action_115 (15) = happyGoto action_106
action_115 _ = happyFail (happyExpListPerState 115)

action_116 _ = happyReduce_38

action_117 _ = happyReduce_37

action_118 (23) = happyShift action_81
action_118 (27) = happyShift action_82
action_118 (38) = happyShift action_38
action_118 (39) = happyShift action_39
action_118 (40) = happyShift action_40
action_118 (41) = happyShift action_41
action_118 (43) = happyShift action_42
action_118 (54) = happyShift action_43
action_118 (15) = happyGoto action_142
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (23) = happyShift action_81
action_119 (27) = happyShift action_82
action_119 (38) = happyShift action_38
action_119 (39) = happyShift action_39
action_119 (40) = happyShift action_40
action_119 (41) = happyShift action_41
action_119 (43) = happyShift action_42
action_119 (54) = happyShift action_43
action_119 (15) = happyGoto action_141
action_119 _ = happyFail (happyExpListPerState 119)

action_120 _ = happyReduce_39

action_121 _ = happyReduce_66

action_122 (35) = happyShift action_140
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (23) = happyShift action_15
action_123 (27) = happyShift action_16
action_123 (29) = happyShift action_57
action_123 (31) = happyShift action_17
action_123 (36) = happyShift action_58
action_123 (37) = happyShift action_59
action_123 (42) = happyShift action_18
action_123 (48) = happyShift action_19
action_123 (49) = happyShift action_20
action_123 (50) = happyShift action_21
action_123 (51) = happyShift action_22
action_123 (52) = happyShift action_23
action_123 (53) = happyShift action_24
action_123 (22) = happyGoto action_56
action_123 _ = happyReduce_59

action_124 _ = happyReduce_50

action_125 (23) = happyShift action_15
action_125 (27) = happyShift action_16
action_125 (29) = happyShift action_57
action_125 (30) = happyShift action_139
action_125 (31) = happyShift action_17
action_125 (36) = happyShift action_58
action_125 (37) = happyShift action_59
action_125 (42) = happyShift action_18
action_125 (48) = happyShift action_19
action_125 (49) = happyShift action_20
action_125 (50) = happyShift action_21
action_125 (51) = happyShift action_22
action_125 (52) = happyShift action_23
action_125 (53) = happyShift action_24
action_125 (22) = happyGoto action_56
action_125 _ = happyReduce_51

action_126 (23) = happyShift action_15
action_126 (27) = happyShift action_16
action_126 (31) = happyShift action_17
action_126 (42) = happyShift action_18
action_126 (48) = happyShift action_19
action_126 (49) = happyShift action_20
action_126 (50) = happyShift action_21
action_126 (51) = happyShift action_22
action_126 (52) = happyShift action_23
action_126 (53) = happyShift action_24
action_126 (22) = happyGoto action_138
action_126 _ = happyFail (happyExpListPerState 126)

action_127 _ = happyReduce_25

action_128 (35) = happyShift action_137
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (23) = happyShift action_35
action_129 (27) = happyShift action_36
action_129 (29) = happyShift action_37
action_129 (31) = happyShift action_9
action_129 (32) = happyShift action_10
action_129 (38) = happyShift action_38
action_129 (39) = happyShift action_39
action_129 (40) = happyShift action_40
action_129 (41) = happyShift action_41
action_129 (42) = happyShift action_11
action_129 (43) = happyShift action_42
action_129 (52) = happyShift action_12
action_129 (53) = happyShift action_13
action_129 (54) = happyShift action_43
action_129 (11) = happyGoto action_5
action_129 (12) = happyGoto action_33
action_129 (15) = happyGoto action_34
action_129 _ = happyReduce_26

action_130 (29) = happyShift action_136
action_130 (34) = happyShift action_110
action_130 _ = happyFail (happyExpListPerState 130)

action_131 _ = happyReduce_6

action_132 (23) = happyShift action_35
action_132 (27) = happyShift action_36
action_132 (29) = happyShift action_37
action_132 (30) = happyShift action_135
action_132 (31) = happyShift action_9
action_132 (32) = happyShift action_10
action_132 (38) = happyShift action_38
action_132 (39) = happyShift action_39
action_132 (40) = happyShift action_40
action_132 (41) = happyShift action_41
action_132 (42) = happyShift action_11
action_132 (43) = happyShift action_42
action_132 (52) = happyShift action_12
action_132 (53) = happyShift action_13
action_132 (54) = happyShift action_43
action_132 (11) = happyGoto action_5
action_132 (12) = happyGoto action_33
action_132 (15) = happyGoto action_34
action_132 _ = happyReduce_7

action_133 (23) = happyShift action_7
action_133 (27) = happyShift action_8
action_133 (31) = happyShift action_9
action_133 (32) = happyShift action_10
action_133 (42) = happyShift action_11
action_133 (52) = happyShift action_12
action_133 (53) = happyShift action_13
action_133 (11) = happyGoto action_5
action_133 (12) = happyGoto action_134
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (23) = happyShift action_35
action_134 (27) = happyShift action_36
action_134 (29) = happyShift action_37
action_134 (31) = happyShift action_9
action_134 (32) = happyShift action_10
action_134 (38) = happyShift action_38
action_134 (39) = happyShift action_39
action_134 (40) = happyShift action_40
action_134 (41) = happyShift action_41
action_134 (42) = happyShift action_11
action_134 (43) = happyShift action_42
action_134 (44) = happyShift action_154
action_134 (52) = happyShift action_12
action_134 (53) = happyShift action_13
action_134 (54) = happyShift action_43
action_134 (11) = happyGoto action_5
action_134 (12) = happyGoto action_33
action_134 (15) = happyGoto action_34
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (53) = happyShift action_153
action_135 (9) = happyGoto action_152
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (23) = happyShift action_7
action_136 (27) = happyShift action_8
action_136 (31) = happyShift action_9
action_136 (32) = happyShift action_10
action_136 (42) = happyShift action_11
action_136 (52) = happyShift action_12
action_136 (53) = happyShift action_13
action_136 (11) = happyGoto action_5
action_136 (12) = happyGoto action_151
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (23) = happyShift action_7
action_137 (27) = happyShift action_8
action_137 (31) = happyShift action_9
action_137 (32) = happyShift action_10
action_137 (42) = happyShift action_11
action_137 (52) = happyShift action_12
action_137 (53) = happyShift action_13
action_137 (11) = happyGoto action_5
action_137 (12) = happyGoto action_150
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (23) = happyShift action_15
action_138 (27) = happyShift action_16
action_138 (29) = happyShift action_57
action_138 (31) = happyShift action_17
action_138 (36) = happyShift action_58
action_138 (37) = happyShift action_59
action_138 (42) = happyShift action_18
action_138 (44) = happyShift action_149
action_138 (48) = happyShift action_19
action_138 (49) = happyShift action_20
action_138 (50) = happyShift action_21
action_138 (51) = happyShift action_22
action_138 (52) = happyShift action_23
action_138 (53) = happyShift action_24
action_138 (22) = happyGoto action_56
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (53) = happyShift action_148
action_139 (20) = happyGoto action_147
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (23) = happyShift action_15
action_140 (27) = happyShift action_16
action_140 (31) = happyShift action_17
action_140 (42) = happyShift action_18
action_140 (48) = happyShift action_19
action_140 (49) = happyShift action_20
action_140 (50) = happyShift action_21
action_140 (51) = happyShift action_22
action_140 (52) = happyShift action_23
action_140 (53) = happyShift action_24
action_140 (22) = happyGoto action_146
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (30) = happyShift action_145
action_141 (34) = happyShift action_110
action_141 _ = happyReduce_30

action_142 (34) = happyShift action_110
action_142 _ = happyReduce_40

action_143 _ = happyReduce_29

action_144 (28) = happyReduce_30
action_144 (30) = happyShift action_145
action_144 (34) = happyShift action_110
action_144 _ = happyReduce_14

action_145 (53) = happyShift action_100
action_145 (14) = happyGoto action_159
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (23) = happyShift action_15
action_146 (27) = happyShift action_16
action_146 (29) = happyShift action_57
action_146 (30) = happyShift action_158
action_146 (31) = happyShift action_17
action_146 (36) = happyShift action_58
action_146 (37) = happyShift action_59
action_146 (42) = happyShift action_18
action_146 (48) = happyShift action_19
action_146 (49) = happyShift action_20
action_146 (50) = happyShift action_21
action_146 (51) = happyShift action_22
action_146 (52) = happyShift action_23
action_146 (53) = happyShift action_24
action_146 (22) = happyGoto action_56
action_146 _ = happyReduce_53

action_147 _ = happyReduce_52

action_148 (45) = happyShift action_90
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (24) = happyShift action_157
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (23) = happyShift action_35
action_150 (27) = happyShift action_36
action_150 (29) = happyShift action_37
action_150 (30) = happyShift action_156
action_150 (31) = happyShift action_9
action_150 (32) = happyShift action_10
action_150 (38) = happyShift action_38
action_150 (39) = happyShift action_39
action_150 (40) = happyShift action_40
action_150 (41) = happyShift action_41
action_150 (42) = happyShift action_11
action_150 (43) = happyShift action_42
action_150 (52) = happyShift action_12
action_150 (53) = happyShift action_13
action_150 (54) = happyShift action_43
action_150 (11) = happyGoto action_5
action_150 (12) = happyGoto action_33
action_150 (15) = happyGoto action_34
action_150 _ = happyReduce_9

action_151 (23) = happyShift action_35
action_151 (27) = happyShift action_36
action_151 (29) = happyShift action_37
action_151 (31) = happyShift action_9
action_151 (32) = happyShift action_10
action_151 (38) = happyShift action_38
action_151 (39) = happyShift action_39
action_151 (40) = happyShift action_40
action_151 (41) = happyShift action_41
action_151 (42) = happyShift action_11
action_151 (43) = happyShift action_42
action_151 (52) = happyShift action_12
action_151 (53) = happyShift action_13
action_151 (54) = happyShift action_43
action_151 (11) = happyGoto action_5
action_151 (12) = happyGoto action_33
action_151 (15) = happyGoto action_34
action_151 _ = happyReduce_18

action_152 _ = happyReduce_8

action_153 (45) = happyShift action_73
action_153 _ = happyFail (happyExpListPerState 153)

action_154 (33) = happyShift action_155
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (23) = happyShift action_81
action_155 (27) = happyShift action_82
action_155 (38) = happyShift action_38
action_155 (39) = happyShift action_39
action_155 (40) = happyShift action_40
action_155 (41) = happyShift action_41
action_155 (43) = happyShift action_42
action_155 (54) = happyShift action_43
action_155 (15) = happyGoto action_162
action_155 _ = happyFail (happyExpListPerState 155)

action_156 (53) = happyShift action_128
action_156 (10) = happyGoto action_161
action_156 _ = happyFail (happyExpListPerState 156)

action_157 _ = happyReduce_65

action_158 (53) = happyShift action_122
action_158 (21) = happyGoto action_160
action_158 _ = happyFail (happyExpListPerState 158)

action_159 _ = happyReduce_31

action_160 _ = happyReduce_54

action_161 _ = happyReduce_10

action_162 (24) = happyShift action_163
action_162 (34) = happyShift action_110
action_162 _ = happyFail (happyExpListPerState 162)

action_163 _ = happyReduce_11

happyReduce_4 = happySpecReduce_1  7 happyReduction_4
happyReduction_4 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  8 happyReduction_5
happyReduction_5 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  8 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  9 happyReduction_7
happyReduction_7 (HappyAbsSyn12  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn9
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 5 9 happyReduction_8
happyReduction_8 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_3  10 happyReduction_9
happyReduction_9 (HappyAbsSyn12  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn10
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happyReduce 5 10 happyReduction_10
happyReduction_10 ((HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 9 11 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Inj happy_var_3 happy_var_5 happy_var_8
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_2  12 happyReduction_12
happyReduction_12 _
	_
	 =  HappyAbsSyn12
		 (U
	)

happyReduce_13 = happySpecReduce_3  12 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (happy_var_2
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  12 happyReduction_14
happyReduction_14 (HappyAbsSyn15  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn12
		 (C happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  12 happyReduction_15
happyReduction_15 (HappyTerminal (ID happy_var_3))
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn12
		 (C happy_var_1 (TyVar happy_var_3)
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  12 happyReduction_16
happyReduction_16 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn12
		 (V happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  12 happyReduction_17
happyReduction_17 (HappyTerminal (Num happy_var_1))
	 =  HappyAbsSyn12
		 (N happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happyReduce 6 12 happyReduction_18
happyReduction_18 ((HappyAbsSyn12  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (L happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (T happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  12 happyReduction_20
happyReduction_20 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (P happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  12 happyReduction_21
happyReduction_21 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (A happy_var_1 happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  12 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (R happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  12 happyReduction_23
happyReduction_23 (HappyTerminal (ID happy_var_3))
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (F happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  12 happyReduction_24
happyReduction_24 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happyReduce 4 12 happyReduction_25
happyReduction_25 ((HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Case happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 4 12 happyReduction_26
happyReduction_26 ((HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TyID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (TyL happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_2  12 happyReduction_27
happyReduction_27 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (TyA happy_var_1 happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  13 happyReduction_28
happyReduction_28 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  13 happyReduction_29
happyReduction_29 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 (HappyAbsSyn15  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn14
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happyReduce 5 14 happyReduction_31
happyReduction_31 ((HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_32 = happySpecReduce_3  15 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  15 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn15
		 (INT
	)

happyReduce_34 = happySpecReduce_1  15 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn15
		 (BOOL
	)

happyReduce_35 = happySpecReduce_1  15 happyReduction_35
happyReduction_35 (HappyTerminal (TyID happy_var_1))
	 =  HappyAbsSyn15
		 (TyVar happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  15 happyReduction_36
happyReduction_36 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 :=> happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  15 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Prod happy_var_2
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  15 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Rec happy_var_2
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  15 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Var happy_var_2
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happyReduce 4 15 happyReduction_40
happyReduction_40 ((HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TyID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Poly happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_41 = happySpecReduce_1  15 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn15
		 (Unit
	)

happyReduce_42 = happySpecReduce_1  16 happyReduction_42
happyReduction_42 (HappyTerminal (TyID happy_var_1))
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  16 happyReduction_43
happyReduction_43 (HappyAbsSyn16  happy_var_3)
	_
	(HappyTerminal (TyID happy_var_1))
	 =  HappyAbsSyn16
		 (happy_var_1 : happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  16 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn16
		 ([]
	)

happyReduce_45 = happySpecReduce_1  17 happyReduction_45
happyReduction_45 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 ([happy_var_1]
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  17 happyReduction_46
happyReduction_46 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1 : happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  17 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn17
		 ([]
	)

happyReduce_48 = happySpecReduce_3  18 happyReduction_48
happyReduction_48 (HappyAbsSyn15  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn18
		 ((happy_var_1,happy_var_3)
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  19 happyReduction_49
happyReduction_49 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn19
		 ([happy_var_1]
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  19 happyReduction_50
happyReduction_50 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1 : happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  20 happyReduction_51
happyReduction_51 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn20
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happyReduce 5 20 happyReduction_52
happyReduction_52 ((HappyAbsSyn20  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_53 = happySpecReduce_3  21 happyReduction_53
happyReduction_53 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn21
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happyReduce 5 21 happyReduction_54
happyReduction_54 ((HappyAbsSyn21  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_55 = happySpecReduce_2  22 happyReduction_55
happyReduction_55 _
	_
	 =  HappyAbsSyn22
		 (U
	)

happyReduce_56 = happySpecReduce_3  22 happyReduction_56
happyReduction_56 _
	(HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (happy_var_2
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  22 happyReduction_57
happyReduction_57 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn22
		 (V happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  22 happyReduction_58
happyReduction_58 (HappyTerminal (Num happy_var_1))
	 =  HappyAbsSyn22
		 (N happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happyReduce 4 22 happyReduction_59
happyReduction_59 ((HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (L happy_var_2 Unit happy_var_4
	) `HappyStk` happyRest

happyReduce_60 = happySpecReduce_3  22 happyReduction_60
happyReduction_60 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (T happy_var_2
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  22 happyReduction_61
happyReduction_61 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (P happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_2  22 happyReduction_62
happyReduction_62 (HappyAbsSyn22  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (A happy_var_1 happy_var_2
	)
happyReduction_62 _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  22 happyReduction_63
happyReduction_63 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (R happy_var_2
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  22 happyReduction_64
happyReduction_64 (HappyTerminal (ID happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (F happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happyReduce 7 22 happyReduction_65
happyReduction_65 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (Inj happy_var_3 happy_var_5 Unit
	) `HappyStk` happyRest

happyReduce_66 = happyReduce 4 22 happyReduction_66
happyReduction_66 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (Case happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_67 = happySpecReduce_1  22 happyReduction_67
happyReduction_67 _
	 =  HappyAbsSyn22
		 (L "n" Unit (L "f" Unit (L "x" Unit (A (V "f") (A (A (V "n") (V "f")) (V "x")))))
	)

happyReduce_68 = happySpecReduce_1  22 happyReduction_68
happyReduction_68 _
	 =  HappyAbsSyn22
		 (L "n" Unit (L "f" Unit (L "x" Unit (A (A (A (V "n") (L "g" Unit (L "h" Unit (A (V "h") (A (V "g") (V "f")))))) (L "u" Unit (V "x"))) (L "u" Unit (V "u")))))
	)

happyReduce_69 = happySpecReduce_3  22 happyReduction_69
happyReduction_69 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (A (A (L "m" Unit (L "n" Unit (A (A (V "m") (L "n" Unit (L "f" Unit (L "x" Unit (A (V "f") (A (A (V "n") (V "f")) (V "x"))))))) (V "n")))) happy_var_1) happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  22 happyReduction_70
happyReduction_70 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (A (A (L "m" Unit (L "n" Unit (A (A (V "n") ((L "n" Unit (L "f" Unit (L "x" Unit (A (A (A (V "n") (L "g" Unit (L "h" Unit (A (V "h") (A (V "g") (V "f")))))) (L "u" Unit (V "x"))) (L "u" Unit (V "u")))))))) (V "m")))) happy_var_1) happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  22 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn22
		 ((L "x" Unit (L "y" Unit (V "x")))
	)

happyReduce_72 = happySpecReduce_1  22 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn22
		 ((L "x" Unit (L "y" Unit (V "y")))
	)

happyNewToken action sts stk [] =
	action 55 55 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	LPar -> cont 23;
	RPar -> cont 24;
	LSBracket -> cont 25;
	RSBracket -> cont 26;
	LBrace -> cont 27;
	RBrace -> cont 28;
	TDot -> cont 29;
	TCom -> cont 30;
	TLam -> cont 31;
	TLLam -> cont 32;
	TCol -> cont 33;
	TArrow -> cont 34;
	TLArrow -> cont 35;
	TPlus -> cont 36;
	TMinus -> cont 37;
	TAll -> cont 38;
	TINT -> cont 39;
	TBOOL -> cont 40;
	TUNIT -> cont 41;
	TCase -> cont 42;
	LAngle -> cont 43;
	RAngle -> cont 44;
	TEqual -> cont 45;
	TOf -> cont 46;
	Empty -> cont 47;
	TSucc -> cont 48;
	TPred -> cont 49;
	TTrue -> cont 50;
	TFalse -> cont 51;
	Num happy_dollar_dollar -> cont 52;
	ID happy_dollar_dollar -> cont 53;
	TyID happy_dollar_dollar -> cont 54;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 55 tk tks = happyError' (tks, explist)
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
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn12 z -> happyReturn z; _other -> notHappyAtAll })

happyParseTypeContext tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn16 z -> happyReturn z; _other -> notHappyAtAll })

happyParseEnv tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn17 z -> happyReturn z; _other -> notHappyAtAll })

happyParseTerm tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn22 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error "Parse error at EOF"
parseError (t:ts) = error $ "Parse error: " ++ show t

parseExp         = happyParseExp . alexScanTokens
parseTypeContext = happyParseTypeContext . alexScanTokens
parseEnv         = happyParseEnv . alexScanTokens
parseTerm        = happyParseTerm . alexScanTokens
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
