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
happyExpList = Happy_Data_Array.listArray (0,760) ([0,50240,33280,24,0,0,4128,0,0,4096,4,34816,16392,1008,0,3140,34848,1,0,0,0,0,33617,57887,0,35200,3073,49,16384,196,6274,0,0,0,8,0,0,2048,0,6280,4160,3,0,0,0,0,0,0,0,0,4,0,32768,12456,16132,0,17600,34304,31,8192,34,4033,0,0,0,4,34816,16392,1008,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,8192,0,0,8192,61546,7235,0,0,0,0,0,64,0,0,3148,34942,3,8704,16134,452,0,0,24576,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,512,1,4352,6016,128,0,0,8320,0,21568,41496,31,0,8,0,0,512,0,0,0,1,0,0,34628,63521,1,0,32768,0,0,24915,32264,0,0,0,0,0,0,4096,0,0,0,0,0,0,1536,0,2184,61504,3,17408,8196,504,0,34,32815,1,20736,40835,226,0,32,0,0,0,1,0,0,4,0,0,512,0,0,34816,64542,1808,0,4096,256,0,42496,16134,452,0,0,0,0,0,0,32,0,0,16,0,0,0,0,4096,32817,1568,0,6280,4160,3,0,0,0,0,0,0,0,4352,6016,128,32768,392,12548,0,0,0,16,0,256,0,0,272,376,8,34816,48128,1536,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,2184,61504,3,17408,8196,504,0,0,0,0,0,0,0,32768,136,16132,0,0,0,16,0,0,0,0,32768,0,0,0,0,0,0,0,128,0,0,8,0,0,64,0,0,0,0,0,0,0,0,0,1024,0,0,0,2,0,0,17408,0,0,0,16,1,0,4100,0,0,0,0,64,32768,49160,16395,0,0,0,0,0,128,8,0,0,0,0,34816,48128,1536,0,68,94,2,0,0,0,0,0,0,0,2176,3008,64,16384,57348,8197,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,53504,2145,126,32768,136,16132,0,0,0,0,0,512,0,0,0,0,0,0,66,0,0,0,0,0,41472,16135,452,0,785,25096,0,43136,8129,113,0,0,4096,0,25120,16640,12,4096,32817,1568,0,2696,61763,3,0,0,256,0,546,64528,0,32768,8,0,0,0,0,0,0,0,0,0,256,0,0,0,0,4,0,0,0,0,0,0,0,0,32768,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,8192,0,0,17408,24064,512,0,0,32768,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,4096,64,0,0,0,0,0,0
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
action_0 (48) = happyShift action_12
action_0 (52) = happyShift action_13
action_0 (53) = happyShift action_14
action_0 (11) = happyGoto action_5
action_0 (12) = happyGoto action_33
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (47) = happyShift action_31
action_1 (54) = happyShift action_32
action_1 (16) = happyGoto action_30
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (47) = happyShift action_28
action_2 (53) = happyShift action_29
action_2 (17) = happyGoto action_26
action_2 (18) = happyGoto action_27
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (23) = happyShift action_16
action_3 (27) = happyShift action_17
action_3 (31) = happyShift action_18
action_3 (42) = happyShift action_19
action_3 (48) = happyShift action_20
action_3 (49) = happyShift action_21
action_3 (50) = happyShift action_22
action_3 (51) = happyShift action_23
action_3 (52) = happyShift action_24
action_3 (53) = happyShift action_25
action_3 (22) = happyGoto action_15
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (23) = happyShift action_7
action_4 (27) = happyShift action_8
action_4 (31) = happyShift action_9
action_4 (32) = happyShift action_10
action_4 (42) = happyShift action_11
action_4 (48) = happyShift action_12
action_4 (52) = happyShift action_13
action_4 (53) = happyShift action_14
action_4 (11) = happyGoto action_5
action_4 (12) = happyGoto action_6
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_24

action_6 (23) = happyShift action_36
action_6 (27) = happyShift action_37
action_6 (29) = happyShift action_38
action_6 (31) = happyShift action_9
action_6 (32) = happyShift action_10
action_6 (38) = happyShift action_39
action_6 (39) = happyShift action_40
action_6 (40) = happyShift action_41
action_6 (41) = happyShift action_42
action_6 (42) = happyShift action_11
action_6 (43) = happyShift action_43
action_6 (48) = happyShift action_12
action_6 (52) = happyShift action_13
action_6 (53) = happyShift action_14
action_6 (54) = happyShift action_44
action_6 (11) = happyGoto action_5
action_6 (12) = happyGoto action_34
action_6 (15) = happyGoto action_35
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (23) = happyShift action_7
action_7 (24) = happyShift action_70
action_7 (27) = happyShift action_8
action_7 (31) = happyShift action_9
action_7 (32) = happyShift action_10
action_7 (42) = happyShift action_11
action_7 (43) = happyShift action_71
action_7 (48) = happyShift action_12
action_7 (52) = happyShift action_13
action_7 (53) = happyShift action_14
action_7 (11) = happyGoto action_5
action_7 (12) = happyGoto action_69
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (23) = happyShift action_7
action_8 (27) = happyShift action_8
action_8 (31) = happyShift action_9
action_8 (32) = happyShift action_10
action_8 (42) = happyShift action_11
action_8 (48) = happyShift action_12
action_8 (52) = happyShift action_13
action_8 (53) = happyShift action_68
action_8 (8) = happyGoto action_65
action_8 (9) = happyGoto action_66
action_8 (11) = happyGoto action_5
action_8 (12) = happyGoto action_67
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (53) = happyShift action_64
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (54) = happyShift action_63
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (23) = happyShift action_7
action_11 (27) = happyShift action_8
action_11 (31) = happyShift action_9
action_11 (32) = happyShift action_10
action_11 (42) = happyShift action_11
action_11 (48) = happyShift action_12
action_11 (52) = happyShift action_13
action_11 (53) = happyShift action_14
action_11 (11) = happyGoto action_5
action_11 (12) = happyGoto action_62
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_28

action_13 _ = happyReduce_17

action_14 (33) = happyShift action_61
action_14 _ = happyReduce_16

action_15 (23) = happyShift action_16
action_15 (27) = happyShift action_17
action_15 (29) = happyShift action_58
action_15 (31) = happyShift action_18
action_15 (36) = happyShift action_59
action_15 (37) = happyShift action_60
action_15 (42) = happyShift action_19
action_15 (48) = happyShift action_20
action_15 (49) = happyShift action_21
action_15 (50) = happyShift action_22
action_15 (51) = happyShift action_23
action_15 (52) = happyShift action_24
action_15 (53) = happyShift action_25
action_15 (55) = happyAccept
action_15 (22) = happyGoto action_57
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (23) = happyShift action_16
action_16 (24) = happyShift action_55
action_16 (27) = happyShift action_17
action_16 (31) = happyShift action_18
action_16 (42) = happyShift action_19
action_16 (43) = happyShift action_56
action_16 (48) = happyShift action_20
action_16 (49) = happyShift action_21
action_16 (50) = happyShift action_22
action_16 (51) = happyShift action_23
action_16 (52) = happyShift action_24
action_16 (53) = happyShift action_25
action_16 (22) = happyGoto action_54
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (23) = happyShift action_16
action_17 (27) = happyShift action_17
action_17 (31) = happyShift action_18
action_17 (42) = happyShift action_19
action_17 (48) = happyShift action_20
action_17 (49) = happyShift action_21
action_17 (50) = happyShift action_22
action_17 (51) = happyShift action_23
action_17 (52) = happyShift action_24
action_17 (53) = happyShift action_53
action_17 (19) = happyGoto action_50
action_17 (20) = happyGoto action_51
action_17 (22) = happyGoto action_52
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (53) = happyShift action_49
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (23) = happyShift action_16
action_19 (27) = happyShift action_17
action_19 (31) = happyShift action_18
action_19 (42) = happyShift action_19
action_19 (48) = happyShift action_20
action_19 (49) = happyShift action_21
action_19 (50) = happyShift action_22
action_19 (51) = happyShift action_23
action_19 (52) = happyShift action_24
action_19 (53) = happyShift action_25
action_19 (22) = happyGoto action_48
action_19 _ = happyFail (happyExpListPerState 19)

action_20 _ = happyReduce_68

action_21 _ = happyReduce_69

action_22 _ = happyReduce_72

action_23 _ = happyReduce_73

action_24 _ = happyReduce_59

action_25 _ = happyReduce_58

action_26 (55) = happyAccept
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (30) = happyShift action_47
action_27 _ = happyReduce_46

action_28 _ = happyReduce_48

action_29 (33) = happyShift action_46
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (55) = happyAccept
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_45

action_32 (30) = happyShift action_45
action_32 _ = happyReduce_43

action_33 (23) = happyShift action_36
action_33 (27) = happyShift action_37
action_33 (29) = happyShift action_38
action_33 (31) = happyShift action_9
action_33 (32) = happyShift action_10
action_33 (38) = happyShift action_39
action_33 (39) = happyShift action_40
action_33 (40) = happyShift action_41
action_33 (41) = happyShift action_42
action_33 (42) = happyShift action_11
action_33 (43) = happyShift action_43
action_33 (48) = happyShift action_12
action_33 (52) = happyShift action_13
action_33 (53) = happyShift action_14
action_33 (54) = happyShift action_44
action_33 (55) = happyAccept
action_33 (11) = happyGoto action_5
action_33 (12) = happyGoto action_34
action_33 (15) = happyGoto action_35
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (29) = happyShift action_38
action_34 (38) = happyShift action_39
action_34 (39) = happyShift action_40
action_34 (40) = happyShift action_41
action_34 (41) = happyShift action_42
action_34 (43) = happyShift action_43
action_34 (48) = happyShift action_12
action_34 (54) = happyShift action_44
action_34 (11) = happyGoto action_5
action_34 (12) = happyGoto action_34
action_34 (15) = happyGoto action_35
action_34 _ = happyReduce_21

action_35 (34) = happyShift action_111
action_35 _ = happyReduce_27

action_36 (23) = happyShift action_36
action_36 (24) = happyShift action_70
action_36 (27) = happyShift action_37
action_36 (31) = happyShift action_9
action_36 (32) = happyShift action_10
action_36 (38) = happyShift action_39
action_36 (39) = happyShift action_40
action_36 (40) = happyShift action_41
action_36 (41) = happyShift action_42
action_36 (42) = happyShift action_11
action_36 (43) = happyShift action_110
action_36 (48) = happyShift action_12
action_36 (52) = happyShift action_13
action_36 (53) = happyShift action_14
action_36 (54) = happyShift action_44
action_36 (11) = happyGoto action_5
action_36 (12) = happyGoto action_69
action_36 (15) = happyGoto action_109
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (23) = happyShift action_36
action_37 (27) = happyShift action_37
action_37 (31) = happyShift action_9
action_37 (32) = happyShift action_10
action_37 (38) = happyShift action_39
action_37 (39) = happyShift action_40
action_37 (40) = happyShift action_41
action_37 (41) = happyShift action_42
action_37 (42) = happyShift action_11
action_37 (43) = happyShift action_43
action_37 (48) = happyShift action_12
action_37 (52) = happyShift action_13
action_37 (53) = happyShift action_108
action_37 (54) = happyShift action_44
action_37 (8) = happyGoto action_65
action_37 (9) = happyGoto action_66
action_37 (11) = happyGoto action_5
action_37 (12) = happyGoto action_67
action_37 (13) = happyGoto action_105
action_37 (14) = happyGoto action_106
action_37 (15) = happyGoto action_107
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (52) = happyShift action_103
action_38 (53) = happyShift action_104
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (54) = happyShift action_102
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_34

action_41 _ = happyReduce_35

action_42 _ = happyReduce_42

action_43 (53) = happyShift action_101
action_43 (14) = happyGoto action_100
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_36

action_45 (47) = happyShift action_31
action_45 (54) = happyShift action_32
action_45 (16) = happyGoto action_99
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (23) = happyShift action_82
action_46 (27) = happyShift action_83
action_46 (38) = happyShift action_39
action_46 (39) = happyShift action_40
action_46 (40) = happyShift action_41
action_46 (41) = happyShift action_42
action_46 (43) = happyShift action_43
action_46 (54) = happyShift action_44
action_46 (15) = happyGoto action_98
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (47) = happyShift action_28
action_47 (53) = happyShift action_29
action_47 (17) = happyGoto action_97
action_47 (18) = happyGoto action_27
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (23) = happyShift action_16
action_48 (27) = happyShift action_17
action_48 (29) = happyShift action_58
action_48 (31) = happyShift action_18
action_48 (36) = happyShift action_59
action_48 (37) = happyShift action_60
action_48 (42) = happyShift action_19
action_48 (46) = happyShift action_96
action_48 (48) = happyShift action_20
action_48 (49) = happyShift action_21
action_48 (50) = happyShift action_22
action_48 (51) = happyShift action_23
action_48 (52) = happyShift action_24
action_48 (53) = happyShift action_25
action_48 (22) = happyGoto action_57
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (29) = happyShift action_95
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (28) = happyShift action_94
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (28) = happyShift action_93
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (23) = happyShift action_16
action_52 (27) = happyShift action_17
action_52 (29) = happyShift action_58
action_52 (30) = happyShift action_92
action_52 (31) = happyShift action_18
action_52 (36) = happyShift action_59
action_52 (37) = happyShift action_60
action_52 (42) = happyShift action_19
action_52 (48) = happyShift action_20
action_52 (49) = happyShift action_21
action_52 (50) = happyShift action_22
action_52 (51) = happyShift action_23
action_52 (52) = happyShift action_24
action_52 (53) = happyShift action_25
action_52 (22) = happyGoto action_57
action_52 _ = happyReduce_50

action_53 (45) = happyShift action_91
action_53 _ = happyReduce_58

action_54 (23) = happyShift action_16
action_54 (24) = happyShift action_90
action_54 (27) = happyShift action_17
action_54 (29) = happyShift action_58
action_54 (31) = happyShift action_18
action_54 (36) = happyShift action_59
action_54 (37) = happyShift action_60
action_54 (42) = happyShift action_19
action_54 (48) = happyShift action_20
action_54 (49) = happyShift action_21
action_54 (50) = happyShift action_22
action_54 (51) = happyShift action_23
action_54 (52) = happyShift action_24
action_54 (53) = happyShift action_25
action_54 (22) = happyGoto action_57
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_56

action_56 (53) = happyShift action_89
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (29) = happyShift action_58
action_57 (36) = happyShift action_59
action_57 (37) = happyShift action_60
action_57 (48) = happyShift action_20
action_57 (49) = happyShift action_21
action_57 (50) = happyShift action_22
action_57 (51) = happyShift action_23
action_57 (22) = happyGoto action_57
action_57 _ = happyReduce_63

action_58 (52) = happyShift action_87
action_58 (53) = happyShift action_88
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (23) = happyShift action_16
action_59 (27) = happyShift action_17
action_59 (31) = happyShift action_18
action_59 (42) = happyShift action_19
action_59 (48) = happyShift action_20
action_59 (49) = happyShift action_21
action_59 (50) = happyShift action_22
action_59 (51) = happyShift action_23
action_59 (52) = happyShift action_24
action_59 (53) = happyShift action_25
action_59 (22) = happyGoto action_86
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (23) = happyShift action_16
action_60 (27) = happyShift action_17
action_60 (31) = happyShift action_18
action_60 (42) = happyShift action_19
action_60 (48) = happyShift action_20
action_60 (49) = happyShift action_21
action_60 (50) = happyShift action_22
action_60 (51) = happyShift action_23
action_60 (52) = happyShift action_24
action_60 (53) = happyShift action_25
action_60 (22) = happyGoto action_85
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (23) = happyShift action_82
action_61 (27) = happyShift action_83
action_61 (38) = happyShift action_39
action_61 (39) = happyShift action_40
action_61 (40) = happyShift action_41
action_61 (41) = happyShift action_42
action_61 (43) = happyShift action_43
action_61 (53) = happyShift action_84
action_61 (54) = happyShift action_44
action_61 (15) = happyGoto action_81
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (23) = happyShift action_36
action_62 (27) = happyShift action_37
action_62 (29) = happyShift action_38
action_62 (31) = happyShift action_9
action_62 (32) = happyShift action_10
action_62 (38) = happyShift action_39
action_62 (39) = happyShift action_40
action_62 (40) = happyShift action_41
action_62 (41) = happyShift action_42
action_62 (42) = happyShift action_11
action_62 (43) = happyShift action_43
action_62 (46) = happyShift action_80
action_62 (48) = happyShift action_12
action_62 (52) = happyShift action_13
action_62 (53) = happyShift action_14
action_62 (54) = happyShift action_44
action_62 (11) = happyGoto action_5
action_62 (12) = happyGoto action_34
action_62 (15) = happyGoto action_35
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (29) = happyShift action_79
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (33) = happyShift action_78
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (28) = happyShift action_77
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (28) = happyShift action_76
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (23) = happyShift action_36
action_67 (27) = happyShift action_37
action_67 (29) = happyShift action_38
action_67 (30) = happyShift action_75
action_67 (31) = happyShift action_9
action_67 (32) = happyShift action_10
action_67 (38) = happyShift action_39
action_67 (39) = happyShift action_40
action_67 (40) = happyShift action_41
action_67 (41) = happyShift action_42
action_67 (42) = happyShift action_11
action_67 (43) = happyShift action_43
action_67 (48) = happyShift action_12
action_67 (52) = happyShift action_13
action_67 (53) = happyShift action_14
action_67 (54) = happyShift action_44
action_67 (11) = happyGoto action_5
action_67 (12) = happyGoto action_34
action_67 (15) = happyGoto action_35
action_67 _ = happyReduce_5

action_68 (33) = happyShift action_61
action_68 (45) = happyShift action_74
action_68 _ = happyReduce_16

action_69 (23) = happyShift action_36
action_69 (24) = happyShift action_73
action_69 (27) = happyShift action_37
action_69 (29) = happyShift action_38
action_69 (31) = happyShift action_9
action_69 (32) = happyShift action_10
action_69 (38) = happyShift action_39
action_69 (39) = happyShift action_40
action_69 (40) = happyShift action_41
action_69 (41) = happyShift action_42
action_69 (42) = happyShift action_11
action_69 (43) = happyShift action_43
action_69 (48) = happyShift action_12
action_69 (52) = happyShift action_13
action_69 (53) = happyShift action_14
action_69 (54) = happyShift action_44
action_69 (11) = happyGoto action_5
action_69 (12) = happyGoto action_34
action_69 (15) = happyGoto action_35
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_12

action_71 (53) = happyShift action_72
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (45) = happyShift action_134
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_13

action_74 (23) = happyShift action_7
action_74 (27) = happyShift action_8
action_74 (31) = happyShift action_9
action_74 (32) = happyShift action_10
action_74 (42) = happyShift action_11
action_74 (48) = happyShift action_12
action_74 (52) = happyShift action_13
action_74 (53) = happyShift action_14
action_74 (11) = happyGoto action_5
action_74 (12) = happyGoto action_133
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (23) = happyShift action_7
action_75 (27) = happyShift action_8
action_75 (31) = happyShift action_9
action_75 (32) = happyShift action_10
action_75 (42) = happyShift action_11
action_75 (48) = happyShift action_12
action_75 (52) = happyShift action_13
action_75 (53) = happyShift action_14
action_75 (8) = happyGoto action_132
action_75 (11) = happyGoto action_5
action_75 (12) = happyGoto action_67
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_22

action_77 _ = happyReduce_19

action_78 (23) = happyShift action_82
action_78 (27) = happyShift action_83
action_78 (38) = happyShift action_39
action_78 (39) = happyShift action_40
action_78 (40) = happyShift action_41
action_78 (41) = happyShift action_42
action_78 (43) = happyShift action_43
action_78 (54) = happyShift action_44
action_78 (15) = happyGoto action_131
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (23) = happyShift action_7
action_79 (27) = happyShift action_8
action_79 (31) = happyShift action_9
action_79 (32) = happyShift action_10
action_79 (42) = happyShift action_11
action_79 (48) = happyShift action_12
action_79 (52) = happyShift action_13
action_79 (53) = happyShift action_14
action_79 (11) = happyGoto action_5
action_79 (12) = happyGoto action_130
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (53) = happyShift action_129
action_80 (10) = happyGoto action_128
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (34) = happyShift action_111
action_81 _ = happyReduce_14

action_82 (23) = happyShift action_82
action_82 (27) = happyShift action_83
action_82 (38) = happyShift action_39
action_82 (39) = happyShift action_40
action_82 (40) = happyShift action_41
action_82 (41) = happyShift action_42
action_82 (43) = happyShift action_43
action_82 (54) = happyShift action_44
action_82 (15) = happyGoto action_109
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (23) = happyShift action_82
action_83 (27) = happyShift action_83
action_83 (38) = happyShift action_39
action_83 (39) = happyShift action_40
action_83 (40) = happyShift action_41
action_83 (41) = happyShift action_42
action_83 (43) = happyShift action_43
action_83 (53) = happyShift action_101
action_83 (54) = happyShift action_44
action_83 (13) = happyGoto action_105
action_83 (14) = happyGoto action_106
action_83 (15) = happyGoto action_107
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_15

action_85 (23) = happyShift action_16
action_85 (27) = happyShift action_17
action_85 (29) = happyShift action_58
action_85 (31) = happyShift action_18
action_85 (36) = happyShift action_59
action_85 (37) = happyShift action_60
action_85 (42) = happyShift action_19
action_85 (48) = happyShift action_20
action_85 (49) = happyShift action_21
action_85 (50) = happyShift action_22
action_85 (51) = happyShift action_23
action_85 (52) = happyShift action_24
action_85 (53) = happyShift action_25
action_85 (22) = happyGoto action_57
action_85 _ = happyReduce_71

action_86 (23) = happyShift action_16
action_86 (27) = happyShift action_17
action_86 (29) = happyShift action_58
action_86 (31) = happyShift action_18
action_86 (36) = happyShift action_59
action_86 (37) = happyShift action_60
action_86 (42) = happyShift action_19
action_86 (48) = happyShift action_20
action_86 (49) = happyShift action_21
action_86 (50) = happyShift action_22
action_86 (51) = happyShift action_23
action_86 (52) = happyShift action_24
action_86 (53) = happyShift action_25
action_86 (22) = happyGoto action_57
action_86 _ = happyReduce_70

action_87 _ = happyReduce_62

action_88 _ = happyReduce_65

action_89 (45) = happyShift action_127
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_57

action_91 (23) = happyShift action_16
action_91 (27) = happyShift action_17
action_91 (31) = happyShift action_18
action_91 (42) = happyShift action_19
action_91 (48) = happyShift action_20
action_91 (49) = happyShift action_21
action_91 (50) = happyShift action_22
action_91 (51) = happyShift action_23
action_91 (52) = happyShift action_24
action_91 (53) = happyShift action_25
action_91 (22) = happyGoto action_126
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (23) = happyShift action_16
action_92 (27) = happyShift action_17
action_92 (31) = happyShift action_18
action_92 (42) = happyShift action_19
action_92 (48) = happyShift action_20
action_92 (49) = happyShift action_21
action_92 (50) = happyShift action_22
action_92 (51) = happyShift action_23
action_92 (52) = happyShift action_24
action_92 (53) = happyShift action_25
action_92 (19) = happyGoto action_125
action_92 (22) = happyGoto action_52
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_64

action_94 _ = happyReduce_61

action_95 (23) = happyShift action_16
action_95 (27) = happyShift action_17
action_95 (31) = happyShift action_18
action_95 (42) = happyShift action_19
action_95 (48) = happyShift action_20
action_95 (49) = happyShift action_21
action_95 (50) = happyShift action_22
action_95 (51) = happyShift action_23
action_95 (52) = happyShift action_24
action_95 (53) = happyShift action_25
action_95 (22) = happyGoto action_124
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (53) = happyShift action_123
action_96 (21) = happyGoto action_122
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_47

action_98 (34) = happyShift action_111
action_98 _ = happyReduce_49

action_99 _ = happyReduce_44

action_100 (44) = happyShift action_121
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (33) = happyShift action_120
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (29) = happyShift action_119
action_102 _ = happyFail (happyExpListPerState 102)

action_103 _ = happyReduce_20

action_104 _ = happyReduce_23

action_105 (28) = happyShift action_118
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (28) = happyShift action_117
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (30) = happyShift action_116
action_107 (34) = happyShift action_111
action_107 _ = happyReduce_29

action_108 (33) = happyShift action_115
action_108 (45) = happyShift action_74
action_108 _ = happyReduce_16

action_109 (24) = happyShift action_114
action_109 (34) = happyShift action_111
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (53) = happyShift action_113
action_110 (14) = happyGoto action_100
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (23) = happyShift action_82
action_111 (27) = happyShift action_83
action_111 (38) = happyShift action_39
action_111 (39) = happyShift action_40
action_111 (40) = happyShift action_41
action_111 (41) = happyShift action_42
action_111 (43) = happyShift action_43
action_111 (54) = happyShift action_44
action_111 (15) = happyGoto action_112
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (34) = happyShift action_111
action_112 _ = happyReduce_37

action_113 (33) = happyShift action_120
action_113 (45) = happyShift action_134
action_113 _ = happyFail (happyExpListPerState 113)

action_114 _ = happyReduce_33

action_115 (23) = happyShift action_82
action_115 (27) = happyShift action_83
action_115 (38) = happyShift action_39
action_115 (39) = happyShift action_40
action_115 (40) = happyShift action_41
action_115 (41) = happyShift action_42
action_115 (43) = happyShift action_43
action_115 (53) = happyShift action_84
action_115 (54) = happyShift action_44
action_115 (15) = happyGoto action_145
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (23) = happyShift action_82
action_116 (27) = happyShift action_83
action_116 (38) = happyShift action_39
action_116 (39) = happyShift action_40
action_116 (40) = happyShift action_41
action_116 (41) = happyShift action_42
action_116 (43) = happyShift action_43
action_116 (54) = happyShift action_44
action_116 (13) = happyGoto action_144
action_116 (15) = happyGoto action_107
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_39

action_118 _ = happyReduce_38

action_119 (23) = happyShift action_82
action_119 (27) = happyShift action_83
action_119 (38) = happyShift action_39
action_119 (39) = happyShift action_40
action_119 (40) = happyShift action_41
action_119 (41) = happyShift action_42
action_119 (43) = happyShift action_43
action_119 (54) = happyShift action_44
action_119 (15) = happyGoto action_143
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (23) = happyShift action_82
action_120 (27) = happyShift action_83
action_120 (38) = happyShift action_39
action_120 (39) = happyShift action_40
action_120 (40) = happyShift action_41
action_120 (41) = happyShift action_42
action_120 (43) = happyShift action_43
action_120 (54) = happyShift action_44
action_120 (15) = happyGoto action_142
action_120 _ = happyFail (happyExpListPerState 120)

action_121 _ = happyReduce_40

action_122 _ = happyReduce_67

action_123 (35) = happyShift action_141
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (23) = happyShift action_16
action_124 (27) = happyShift action_17
action_124 (29) = happyShift action_58
action_124 (31) = happyShift action_18
action_124 (36) = happyShift action_59
action_124 (37) = happyShift action_60
action_124 (42) = happyShift action_19
action_124 (48) = happyShift action_20
action_124 (49) = happyShift action_21
action_124 (50) = happyShift action_22
action_124 (51) = happyShift action_23
action_124 (52) = happyShift action_24
action_124 (53) = happyShift action_25
action_124 (22) = happyGoto action_57
action_124 _ = happyReduce_60

action_125 _ = happyReduce_51

action_126 (23) = happyShift action_16
action_126 (27) = happyShift action_17
action_126 (29) = happyShift action_58
action_126 (30) = happyShift action_140
action_126 (31) = happyShift action_18
action_126 (36) = happyShift action_59
action_126 (37) = happyShift action_60
action_126 (42) = happyShift action_19
action_126 (48) = happyShift action_20
action_126 (49) = happyShift action_21
action_126 (50) = happyShift action_22
action_126 (51) = happyShift action_23
action_126 (52) = happyShift action_24
action_126 (53) = happyShift action_25
action_126 (22) = happyGoto action_57
action_126 _ = happyReduce_52

action_127 (23) = happyShift action_16
action_127 (27) = happyShift action_17
action_127 (31) = happyShift action_18
action_127 (42) = happyShift action_19
action_127 (48) = happyShift action_20
action_127 (49) = happyShift action_21
action_127 (50) = happyShift action_22
action_127 (51) = happyShift action_23
action_127 (52) = happyShift action_24
action_127 (53) = happyShift action_25
action_127 (22) = happyGoto action_139
action_127 _ = happyFail (happyExpListPerState 127)

action_128 _ = happyReduce_25

action_129 (35) = happyShift action_138
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (23) = happyShift action_36
action_130 (27) = happyShift action_37
action_130 (29) = happyShift action_38
action_130 (31) = happyShift action_9
action_130 (32) = happyShift action_10
action_130 (38) = happyShift action_39
action_130 (39) = happyShift action_40
action_130 (40) = happyShift action_41
action_130 (41) = happyShift action_42
action_130 (42) = happyShift action_11
action_130 (43) = happyShift action_43
action_130 (48) = happyShift action_12
action_130 (52) = happyShift action_13
action_130 (53) = happyShift action_14
action_130 (54) = happyShift action_44
action_130 (11) = happyGoto action_5
action_130 (12) = happyGoto action_34
action_130 (15) = happyGoto action_35
action_130 _ = happyReduce_26

action_131 (29) = happyShift action_137
action_131 (34) = happyShift action_111
action_131 _ = happyFail (happyExpListPerState 131)

action_132 _ = happyReduce_6

action_133 (23) = happyShift action_36
action_133 (27) = happyShift action_37
action_133 (29) = happyShift action_38
action_133 (30) = happyShift action_136
action_133 (31) = happyShift action_9
action_133 (32) = happyShift action_10
action_133 (38) = happyShift action_39
action_133 (39) = happyShift action_40
action_133 (40) = happyShift action_41
action_133 (41) = happyShift action_42
action_133 (42) = happyShift action_11
action_133 (43) = happyShift action_43
action_133 (48) = happyShift action_12
action_133 (52) = happyShift action_13
action_133 (53) = happyShift action_14
action_133 (54) = happyShift action_44
action_133 (11) = happyGoto action_5
action_133 (12) = happyGoto action_34
action_133 (15) = happyGoto action_35
action_133 _ = happyReduce_7

action_134 (23) = happyShift action_7
action_134 (27) = happyShift action_8
action_134 (31) = happyShift action_9
action_134 (32) = happyShift action_10
action_134 (42) = happyShift action_11
action_134 (48) = happyShift action_12
action_134 (52) = happyShift action_13
action_134 (53) = happyShift action_14
action_134 (11) = happyGoto action_5
action_134 (12) = happyGoto action_135
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (23) = happyShift action_36
action_135 (27) = happyShift action_37
action_135 (29) = happyShift action_38
action_135 (31) = happyShift action_9
action_135 (32) = happyShift action_10
action_135 (38) = happyShift action_39
action_135 (39) = happyShift action_40
action_135 (40) = happyShift action_41
action_135 (41) = happyShift action_42
action_135 (42) = happyShift action_11
action_135 (43) = happyShift action_43
action_135 (44) = happyShift action_155
action_135 (48) = happyShift action_12
action_135 (52) = happyShift action_13
action_135 (53) = happyShift action_14
action_135 (54) = happyShift action_44
action_135 (11) = happyGoto action_5
action_135 (12) = happyGoto action_34
action_135 (15) = happyGoto action_35
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (53) = happyShift action_154
action_136 (9) = happyGoto action_153
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (23) = happyShift action_7
action_137 (27) = happyShift action_8
action_137 (31) = happyShift action_9
action_137 (32) = happyShift action_10
action_137 (42) = happyShift action_11
action_137 (48) = happyShift action_12
action_137 (52) = happyShift action_13
action_137 (53) = happyShift action_14
action_137 (11) = happyGoto action_5
action_137 (12) = happyGoto action_152
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (23) = happyShift action_7
action_138 (27) = happyShift action_8
action_138 (31) = happyShift action_9
action_138 (32) = happyShift action_10
action_138 (42) = happyShift action_11
action_138 (48) = happyShift action_12
action_138 (52) = happyShift action_13
action_138 (53) = happyShift action_14
action_138 (11) = happyGoto action_5
action_138 (12) = happyGoto action_151
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (23) = happyShift action_16
action_139 (27) = happyShift action_17
action_139 (29) = happyShift action_58
action_139 (31) = happyShift action_18
action_139 (36) = happyShift action_59
action_139 (37) = happyShift action_60
action_139 (42) = happyShift action_19
action_139 (44) = happyShift action_150
action_139 (48) = happyShift action_20
action_139 (49) = happyShift action_21
action_139 (50) = happyShift action_22
action_139 (51) = happyShift action_23
action_139 (52) = happyShift action_24
action_139 (53) = happyShift action_25
action_139 (22) = happyGoto action_57
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (53) = happyShift action_149
action_140 (20) = happyGoto action_148
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (23) = happyShift action_16
action_141 (27) = happyShift action_17
action_141 (31) = happyShift action_18
action_141 (42) = happyShift action_19
action_141 (48) = happyShift action_20
action_141 (49) = happyShift action_21
action_141 (50) = happyShift action_22
action_141 (51) = happyShift action_23
action_141 (52) = happyShift action_24
action_141 (53) = happyShift action_25
action_141 (22) = happyGoto action_147
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (30) = happyShift action_146
action_142 (34) = happyShift action_111
action_142 _ = happyReduce_31

action_143 (34) = happyShift action_111
action_143 _ = happyReduce_41

action_144 _ = happyReduce_30

action_145 (28) = happyReduce_31
action_145 (30) = happyShift action_146
action_145 (34) = happyShift action_111
action_145 _ = happyReduce_14

action_146 (53) = happyShift action_101
action_146 (14) = happyGoto action_160
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (23) = happyShift action_16
action_147 (27) = happyShift action_17
action_147 (29) = happyShift action_58
action_147 (30) = happyShift action_159
action_147 (31) = happyShift action_18
action_147 (36) = happyShift action_59
action_147 (37) = happyShift action_60
action_147 (42) = happyShift action_19
action_147 (48) = happyShift action_20
action_147 (49) = happyShift action_21
action_147 (50) = happyShift action_22
action_147 (51) = happyShift action_23
action_147 (52) = happyShift action_24
action_147 (53) = happyShift action_25
action_147 (22) = happyGoto action_57
action_147 _ = happyReduce_54

action_148 _ = happyReduce_53

action_149 (45) = happyShift action_91
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (24) = happyShift action_158
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (23) = happyShift action_36
action_151 (27) = happyShift action_37
action_151 (29) = happyShift action_38
action_151 (30) = happyShift action_157
action_151 (31) = happyShift action_9
action_151 (32) = happyShift action_10
action_151 (38) = happyShift action_39
action_151 (39) = happyShift action_40
action_151 (40) = happyShift action_41
action_151 (41) = happyShift action_42
action_151 (42) = happyShift action_11
action_151 (43) = happyShift action_43
action_151 (48) = happyShift action_12
action_151 (52) = happyShift action_13
action_151 (53) = happyShift action_14
action_151 (54) = happyShift action_44
action_151 (11) = happyGoto action_5
action_151 (12) = happyGoto action_34
action_151 (15) = happyGoto action_35
action_151 _ = happyReduce_9

action_152 (23) = happyShift action_36
action_152 (27) = happyShift action_37
action_152 (29) = happyShift action_38
action_152 (31) = happyShift action_9
action_152 (32) = happyShift action_10
action_152 (38) = happyShift action_39
action_152 (39) = happyShift action_40
action_152 (40) = happyShift action_41
action_152 (41) = happyShift action_42
action_152 (42) = happyShift action_11
action_152 (43) = happyShift action_43
action_152 (48) = happyShift action_12
action_152 (52) = happyShift action_13
action_152 (53) = happyShift action_14
action_152 (54) = happyShift action_44
action_152 (11) = happyGoto action_5
action_152 (12) = happyGoto action_34
action_152 (15) = happyGoto action_35
action_152 _ = happyReduce_18

action_153 _ = happyReduce_8

action_154 (45) = happyShift action_74
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (33) = happyShift action_156
action_155 _ = happyFail (happyExpListPerState 155)

action_156 (23) = happyShift action_82
action_156 (27) = happyShift action_83
action_156 (38) = happyShift action_39
action_156 (39) = happyShift action_40
action_156 (40) = happyShift action_41
action_156 (41) = happyShift action_42
action_156 (43) = happyShift action_43
action_156 (54) = happyShift action_44
action_156 (15) = happyGoto action_163
action_156 _ = happyFail (happyExpListPerState 156)

action_157 (53) = happyShift action_129
action_157 (10) = happyGoto action_162
action_157 _ = happyFail (happyExpListPerState 157)

action_158 _ = happyReduce_66

action_159 (53) = happyShift action_123
action_159 (21) = happyGoto action_161
action_159 _ = happyFail (happyExpListPerState 159)

action_160 _ = happyReduce_32

action_161 _ = happyReduce_55

action_162 _ = happyReduce_10

action_163 (24) = happyShift action_164
action_163 (34) = happyShift action_111
action_163 _ = happyFail (happyExpListPerState 163)

action_164 _ = happyReduce_11

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

happyReduce_28 = happySpecReduce_1  12 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn12
		 (TyL "T1" (TyL "T2" (TyL "T3" (L "n" (((TyVar "T1") :=> (TyVar "T2")) :=> ((TyVar "T3") :=> (TyVar "T1"))) (L "f" ((TyVar "T1") :=> (TyVar "T2")) (L "x" (TyVar "T3") (A (V "f") (A (A (V "n") (V "f")) (V "x"))))))))
	)

happyReduce_29 = happySpecReduce_1  13 happyReduction_29
happyReduction_29 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  13 happyReduction_30
happyReduction_30 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  14 happyReduction_31
happyReduction_31 (HappyAbsSyn15  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn14
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 5 14 happyReduction_32
happyReduction_32 ((HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_33 = happySpecReduce_3  15 happyReduction_33
happyReduction_33 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  15 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn15
		 (INT
	)

happyReduce_35 = happySpecReduce_1  15 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn15
		 (BOOL
	)

happyReduce_36 = happySpecReduce_1  15 happyReduction_36
happyReduction_36 (HappyTerminal (TyID happy_var_1))
	 =  HappyAbsSyn15
		 (TyVar happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  15 happyReduction_37
happyReduction_37 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 :=> happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  15 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Prod happy_var_2
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  15 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Rec happy_var_2
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  15 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Var happy_var_2
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happyReduce 4 15 happyReduction_41
happyReduction_41 ((HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TyID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Poly happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_42 = happySpecReduce_1  15 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn15
		 (Unit
	)

happyReduce_43 = happySpecReduce_1  16 happyReduction_43
happyReduction_43 (HappyTerminal (TyID happy_var_1))
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  16 happyReduction_44
happyReduction_44 (HappyAbsSyn16  happy_var_3)
	_
	(HappyTerminal (TyID happy_var_1))
	 =  HappyAbsSyn16
		 (happy_var_1 : happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  16 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn16
		 ([]
	)

happyReduce_46 = happySpecReduce_1  17 happyReduction_46
happyReduction_46 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 ([happy_var_1]
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  17 happyReduction_47
happyReduction_47 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1 : happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  17 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn17
		 ([]
	)

happyReduce_49 = happySpecReduce_3  18 happyReduction_49
happyReduction_49 (HappyAbsSyn15  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn18
		 ((happy_var_1,happy_var_3)
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  19 happyReduction_50
happyReduction_50 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn19
		 ([happy_var_1]
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  19 happyReduction_51
happyReduction_51 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1 : happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  20 happyReduction_52
happyReduction_52 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn20
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happyReduce 5 20 happyReduction_53
happyReduction_53 ((HappyAbsSyn20  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_54 = happySpecReduce_3  21 happyReduction_54
happyReduction_54 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn21
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happyReduce 5 21 happyReduction_55
happyReduction_55 ((HappyAbsSyn21  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_56 = happySpecReduce_2  22 happyReduction_56
happyReduction_56 _
	_
	 =  HappyAbsSyn22
		 (U
	)

happyReduce_57 = happySpecReduce_3  22 happyReduction_57
happyReduction_57 _
	(HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (happy_var_2
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  22 happyReduction_58
happyReduction_58 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn22
		 (V happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  22 happyReduction_59
happyReduction_59 (HappyTerminal (Num happy_var_1))
	 =  HappyAbsSyn22
		 (N happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happyReduce 4 22 happyReduction_60
happyReduction_60 ((HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (L happy_var_2 Unit happy_var_4
	) `HappyStk` happyRest

happyReduce_61 = happySpecReduce_3  22 happyReduction_61
happyReduction_61 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (T happy_var_2
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  22 happyReduction_62
happyReduction_62 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (P happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_2  22 happyReduction_63
happyReduction_63 (HappyAbsSyn22  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (A happy_var_1 happy_var_2
	)
happyReduction_63 _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  22 happyReduction_64
happyReduction_64 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (R happy_var_2
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  22 happyReduction_65
happyReduction_65 (HappyTerminal (ID happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (F happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happyReduce 7 22 happyReduction_66
happyReduction_66 (_ `HappyStk`
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

happyReduce_67 = happyReduce 4 22 happyReduction_67
happyReduction_67 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (Case happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_68 = happySpecReduce_1  22 happyReduction_68
happyReduction_68 _
	 =  HappyAbsSyn22
		 (L "n" Unit (L "f" Unit (L "x" Unit (A (V "f") (A (A (V "n") (V "f")) (V "x")))))
	)

happyReduce_69 = happySpecReduce_1  22 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn22
		 (L "n" Unit (L "f" Unit (L "x" Unit (A (A (A (V "n") (L "g" Unit (L "h" Unit (A (V "h") (A (V "g") (V "f")))))) (L "u" Unit (V "x"))) (L "u" Unit (V "u")))))
	)

happyReduce_70 = happySpecReduce_3  22 happyReduction_70
happyReduction_70 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (A (A (L "m" Unit (L "n" Unit (A (A (V "m") (L "n" Unit (L "f" Unit (L "x" Unit (A (V "f") (A (A (V "n") (V "f")) (V "x"))))))) (V "n")))) happy_var_1) happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_3  22 happyReduction_71
happyReduction_71 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (A (A (L "m" Unit (L "n" Unit (A (A (V "n") ((L "n" Unit (L "f" Unit (L "x" Unit (A (A (A (V "n") (L "g" Unit (L "h" Unit (A (V "h") (A (V "g") (V "f")))))) (L "u" Unit (V "x"))) (L "u" Unit (V "u")))))))) (V "m")))) happy_var_1) happy_var_3
	)
happyReduction_71 _ _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_1  22 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn22
		 ((L "x" Unit (L "y" Unit (V "x")))
	)

happyReduce_73 = happySpecReduce_1  22 happyReduction_73
happyReduction_73 _
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
