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
happyExpList = Happy_Data_Array.listArray (0,634) ([0,50240,256,3,0,0,66,0,0,544,0,1092,15376,0,50240,256,3,0,0,0,16384,61652,1795,0,3148,12336,0,50240,256,3,0,0,32,0,0,1024,0,3140,12304,0,0,0,0,0,16,0,16384,2132,961,0,1100,15408,0,17472,49408,3,0,0,32,16384,68,961,0,4,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,2,0,16384,61652,1795,0,0,0,0,0,2,0,19456,16140,112,16384,61636,1795,0,0,12288,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,1056,0,68,16431,0,0,8192,2,17408,4100,60,16384,68,961,0,34116,15632,0,4096,0,0,32768,0,0,0,8,0,0,34628,15376,0,0,2048,0,19456,4229,60,0,0,0,0,0,8192,0,0,0,0,0,0,48,16384,68,961,0,68,24623,0,54336,5104,7,0,1,0,0,256,0,0,128,0,0,2048,0,0,17408,16143,112,0,256,8,0,3404,28735,0,0,0,0,0,0,32,0,0,8,0,0,0,0,50240,256,3,17408,4108,48,0,0,0,0,0,0,0,1088,752,4,17408,4108,48,0,0,512,0,8192,0,0,1088,752,4,17408,12032,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,17472,49408,3,17408,4100,60,0,0,0,0,0,0,0,17472,49408,3,0,0,32,49152,2132,961,0,34124,15376,0,0,0,0,0,32,0,0,0,0,0,0,64,0,0,1,0,0,1,0,0,0,0,0,0,0,0,2048,0,0,32768,0,0,0,544,0,0,4096,128,0,128,2,0,0,0,32,16384,61444,1026,0,0,0,0,0,2049,0,0,0,0,16384,61444,1538,0,68,16431,0,0,0,0,0,0,0,16384,61444,1026,0,68,16431,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,34628,15376,0,17472,49408,3,0,0,0,0,1024,0,0,0,0,0,4096,2,0,0,0,0,16384,61684,1795,0,3140,12304,0,54336,2032,7,0,0,32,16384,196,769,0,3140,12304,0,21568,50440,3,0,0,32,16384,68,961,0,8704,0,0,0,0,0,0,0,0,0,512,0,0,0,8192,0,0,0,0,0,0,0,0,0,8,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,1,0,17408,12032,64,0,0,512,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,128,2,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParseExp","%start_happyParseTypeContext","%start_happyParseEnv","%start_happyParseTerm","Start","exps","recExps","caseExps","inj","exp","prod","sum","type","typeContext","env","decl","terms","recTerms","caseTerms","term","'('","')'","'['","']'","'{'","'}'","'.'","','","'\955'","'\923'","':'","'->'","'=>'","'+'","'\8704'","INT","BOOL","UNIT","'case'","'<'","'>'","'='","'of'","'Empty'","'succ'","'pred'","NUM","ID","TyID","%eof"]
        bit_start = st * 52
        bit_end = (st + 1) * 52
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..51]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (23) = happyShift action_7
action_0 (27) = happyShift action_8
action_0 (31) = happyShift action_9
action_0 (32) = happyShift action_10
action_0 (41) = happyShift action_11
action_0 (49) = happyShift action_12
action_0 (50) = happyShift action_13
action_0 (11) = happyGoto action_5
action_0 (12) = happyGoto action_30
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (46) = happyShift action_28
action_1 (51) = happyShift action_29
action_1 (16) = happyGoto action_27
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (46) = happyShift action_25
action_2 (50) = happyShift action_26
action_2 (17) = happyGoto action_23
action_2 (18) = happyGoto action_24
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (23) = happyShift action_15
action_3 (27) = happyShift action_16
action_3 (31) = happyShift action_17
action_3 (41) = happyShift action_18
action_3 (47) = happyShift action_19
action_3 (48) = happyShift action_20
action_3 (49) = happyShift action_21
action_3 (50) = happyShift action_22
action_3 (22) = happyGoto action_14
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (23) = happyShift action_7
action_4 (27) = happyShift action_8
action_4 (31) = happyShift action_9
action_4 (32) = happyShift action_10
action_4 (41) = happyShift action_11
action_4 (49) = happyShift action_12
action_4 (50) = happyShift action_13
action_4 (11) = happyGoto action_5
action_4 (12) = happyGoto action_6
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_24

action_6 (23) = happyShift action_33
action_6 (27) = happyShift action_34
action_6 (29) = happyShift action_35
action_6 (31) = happyShift action_9
action_6 (32) = happyShift action_10
action_6 (37) = happyShift action_36
action_6 (38) = happyShift action_37
action_6 (39) = happyShift action_38
action_6 (40) = happyShift action_39
action_6 (41) = happyShift action_11
action_6 (42) = happyShift action_40
action_6 (49) = happyShift action_12
action_6 (50) = happyShift action_13
action_6 (51) = happyShift action_41
action_6 (11) = happyGoto action_5
action_6 (12) = happyGoto action_31
action_6 (15) = happyGoto action_32
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (23) = happyShift action_7
action_7 (24) = happyShift action_68
action_7 (27) = happyShift action_8
action_7 (31) = happyShift action_9
action_7 (32) = happyShift action_10
action_7 (41) = happyShift action_11
action_7 (42) = happyShift action_69
action_7 (49) = happyShift action_12
action_7 (50) = happyShift action_13
action_7 (11) = happyGoto action_5
action_7 (12) = happyGoto action_67
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (23) = happyShift action_7
action_8 (27) = happyShift action_8
action_8 (31) = happyShift action_9
action_8 (32) = happyShift action_10
action_8 (41) = happyShift action_11
action_8 (49) = happyShift action_12
action_8 (50) = happyShift action_66
action_8 (8) = happyGoto action_63
action_8 (9) = happyGoto action_64
action_8 (11) = happyGoto action_5
action_8 (12) = happyGoto action_65
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (50) = happyShift action_62
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (51) = happyShift action_61
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (23) = happyShift action_7
action_11 (27) = happyShift action_8
action_11 (31) = happyShift action_9
action_11 (32) = happyShift action_10
action_11 (41) = happyShift action_11
action_11 (49) = happyShift action_12
action_11 (50) = happyShift action_13
action_11 (11) = happyGoto action_5
action_11 (12) = happyGoto action_60
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_17

action_13 (33) = happyShift action_59
action_13 _ = happyReduce_16

action_14 (23) = happyShift action_15
action_14 (27) = happyShift action_16
action_14 (29) = happyShift action_57
action_14 (31) = happyShift action_17
action_14 (36) = happyShift action_58
action_14 (41) = happyShift action_18
action_14 (47) = happyShift action_19
action_14 (48) = happyShift action_20
action_14 (49) = happyShift action_21
action_14 (50) = happyShift action_22
action_14 (52) = happyAccept
action_14 (22) = happyGoto action_56
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (23) = happyShift action_15
action_15 (24) = happyShift action_54
action_15 (27) = happyShift action_16
action_15 (31) = happyShift action_17
action_15 (41) = happyShift action_18
action_15 (42) = happyShift action_55
action_15 (47) = happyShift action_19
action_15 (48) = happyShift action_20
action_15 (49) = happyShift action_21
action_15 (50) = happyShift action_22
action_15 (22) = happyGoto action_53
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (23) = happyShift action_15
action_16 (27) = happyShift action_16
action_16 (31) = happyShift action_17
action_16 (41) = happyShift action_18
action_16 (47) = happyShift action_19
action_16 (48) = happyShift action_20
action_16 (49) = happyShift action_21
action_16 (50) = happyShift action_52
action_16 (19) = happyGoto action_49
action_16 (20) = happyGoto action_50
action_16 (22) = happyGoto action_51
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (50) = happyShift action_48
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (23) = happyShift action_15
action_18 (27) = happyShift action_16
action_18 (31) = happyShift action_17
action_18 (41) = happyShift action_18
action_18 (47) = happyShift action_19
action_18 (48) = happyShift action_20
action_18 (49) = happyShift action_21
action_18 (50) = happyShift action_22
action_18 (22) = happyGoto action_47
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (23) = happyShift action_46
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (23) = happyShift action_45
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_58

action_22 _ = happyReduce_57

action_23 (52) = happyAccept
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (30) = happyShift action_44
action_24 _ = happyReduce_45

action_25 _ = happyReduce_47

action_26 (33) = happyShift action_43
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (52) = happyAccept
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_44

action_29 (30) = happyShift action_42
action_29 _ = happyReduce_42

action_30 (23) = happyShift action_33
action_30 (27) = happyShift action_34
action_30 (29) = happyShift action_35
action_30 (31) = happyShift action_9
action_30 (32) = happyShift action_10
action_30 (37) = happyShift action_36
action_30 (38) = happyShift action_37
action_30 (39) = happyShift action_38
action_30 (40) = happyShift action_39
action_30 (41) = happyShift action_11
action_30 (42) = happyShift action_40
action_30 (49) = happyShift action_12
action_30 (50) = happyShift action_13
action_30 (51) = happyShift action_41
action_30 (52) = happyAccept
action_30 (11) = happyGoto action_5
action_30 (12) = happyGoto action_31
action_30 (15) = happyGoto action_32
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (27) = happyShift action_34
action_31 (29) = happyShift action_35
action_31 (31) = happyShift action_9
action_31 (32) = happyShift action_10
action_31 (37) = happyShift action_36
action_31 (38) = happyShift action_37
action_31 (39) = happyShift action_38
action_31 (40) = happyShift action_39
action_31 (41) = happyShift action_11
action_31 (42) = happyShift action_40
action_31 (49) = happyShift action_12
action_31 (51) = happyShift action_41
action_31 (11) = happyGoto action_5
action_31 (12) = happyGoto action_31
action_31 (15) = happyGoto action_32
action_31 _ = happyReduce_21

action_32 (34) = happyShift action_110
action_32 _ = happyReduce_27

action_33 (23) = happyShift action_33
action_33 (24) = happyShift action_68
action_33 (27) = happyShift action_34
action_33 (31) = happyShift action_9
action_33 (32) = happyShift action_10
action_33 (37) = happyShift action_36
action_33 (38) = happyShift action_37
action_33 (39) = happyShift action_38
action_33 (40) = happyShift action_39
action_33 (41) = happyShift action_11
action_33 (42) = happyShift action_109
action_33 (49) = happyShift action_12
action_33 (50) = happyShift action_13
action_33 (51) = happyShift action_41
action_33 (11) = happyGoto action_5
action_33 (12) = happyGoto action_67
action_33 (15) = happyGoto action_108
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (23) = happyShift action_33
action_34 (27) = happyShift action_34
action_34 (31) = happyShift action_9
action_34 (32) = happyShift action_10
action_34 (37) = happyShift action_36
action_34 (38) = happyShift action_37
action_34 (39) = happyShift action_38
action_34 (40) = happyShift action_39
action_34 (41) = happyShift action_11
action_34 (42) = happyShift action_40
action_34 (49) = happyShift action_12
action_34 (50) = happyShift action_107
action_34 (51) = happyShift action_41
action_34 (8) = happyGoto action_63
action_34 (9) = happyGoto action_64
action_34 (11) = happyGoto action_5
action_34 (12) = happyGoto action_65
action_34 (13) = happyGoto action_104
action_34 (14) = happyGoto action_105
action_34 (15) = happyGoto action_106
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (49) = happyShift action_102
action_35 (50) = happyShift action_103
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (50) = happyShift action_101
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_33

action_38 _ = happyReduce_34

action_39 _ = happyReduce_41

action_40 (50) = happyShift action_100
action_40 (14) = happyGoto action_99
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_35

action_42 (46) = happyShift action_28
action_42 (51) = happyShift action_29
action_42 (16) = happyGoto action_98
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (23) = happyShift action_80
action_43 (27) = happyShift action_81
action_43 (37) = happyShift action_36
action_43 (38) = happyShift action_37
action_43 (39) = happyShift action_38
action_43 (40) = happyShift action_39
action_43 (42) = happyShift action_40
action_43 (51) = happyShift action_41
action_43 (15) = happyGoto action_97
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (46) = happyShift action_25
action_44 (50) = happyShift action_26
action_44 (17) = happyGoto action_96
action_44 (18) = happyGoto action_24
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (23) = happyShift action_15
action_45 (27) = happyShift action_16
action_45 (31) = happyShift action_17
action_45 (41) = happyShift action_18
action_45 (47) = happyShift action_19
action_45 (48) = happyShift action_20
action_45 (49) = happyShift action_21
action_45 (50) = happyShift action_22
action_45 (22) = happyGoto action_95
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (23) = happyShift action_15
action_46 (27) = happyShift action_16
action_46 (31) = happyShift action_17
action_46 (41) = happyShift action_18
action_46 (47) = happyShift action_19
action_46 (48) = happyShift action_20
action_46 (49) = happyShift action_21
action_46 (50) = happyShift action_22
action_46 (22) = happyGoto action_94
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (23) = happyShift action_15
action_47 (27) = happyShift action_16
action_47 (29) = happyShift action_57
action_47 (31) = happyShift action_17
action_47 (36) = happyShift action_58
action_47 (41) = happyShift action_18
action_47 (45) = happyShift action_93
action_47 (47) = happyShift action_19
action_47 (48) = happyShift action_20
action_47 (49) = happyShift action_21
action_47 (50) = happyShift action_22
action_47 (22) = happyGoto action_56
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (29) = happyShift action_92
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (28) = happyShift action_91
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (28) = happyShift action_90
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (23) = happyShift action_15
action_51 (27) = happyShift action_16
action_51 (29) = happyShift action_57
action_51 (30) = happyShift action_89
action_51 (31) = happyShift action_17
action_51 (36) = happyShift action_58
action_51 (41) = happyShift action_18
action_51 (47) = happyShift action_19
action_51 (48) = happyShift action_20
action_51 (49) = happyShift action_21
action_51 (50) = happyShift action_22
action_51 (22) = happyGoto action_56
action_51 _ = happyReduce_49

action_52 (44) = happyShift action_88
action_52 _ = happyReduce_57

action_53 (23) = happyShift action_15
action_53 (24) = happyShift action_87
action_53 (27) = happyShift action_16
action_53 (29) = happyShift action_57
action_53 (31) = happyShift action_17
action_53 (36) = happyShift action_58
action_53 (41) = happyShift action_18
action_53 (47) = happyShift action_19
action_53 (48) = happyShift action_20
action_53 (49) = happyShift action_21
action_53 (50) = happyShift action_22
action_53 (22) = happyGoto action_56
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_55

action_55 (50) = happyShift action_86
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (27) = happyShift action_16
action_56 (29) = happyShift action_57
action_56 (31) = happyShift action_17
action_56 (36) = happyShift action_58
action_56 (41) = happyShift action_18
action_56 (47) = happyShift action_19
action_56 (48) = happyShift action_20
action_56 (49) = happyShift action_21
action_56 (22) = happyGoto action_56
action_56 _ = happyReduce_62

action_57 (49) = happyShift action_84
action_57 (50) = happyShift action_85
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (23) = happyShift action_15
action_58 (27) = happyShift action_16
action_58 (31) = happyShift action_17
action_58 (41) = happyShift action_18
action_58 (47) = happyShift action_19
action_58 (48) = happyShift action_20
action_58 (49) = happyShift action_21
action_58 (50) = happyShift action_22
action_58 (22) = happyGoto action_83
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (23) = happyShift action_80
action_59 (27) = happyShift action_81
action_59 (37) = happyShift action_36
action_59 (38) = happyShift action_37
action_59 (39) = happyShift action_38
action_59 (40) = happyShift action_39
action_59 (42) = happyShift action_40
action_59 (50) = happyShift action_82
action_59 (51) = happyShift action_41
action_59 (15) = happyGoto action_79
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (23) = happyShift action_33
action_60 (27) = happyShift action_34
action_60 (29) = happyShift action_35
action_60 (31) = happyShift action_9
action_60 (32) = happyShift action_10
action_60 (37) = happyShift action_36
action_60 (38) = happyShift action_37
action_60 (39) = happyShift action_38
action_60 (40) = happyShift action_39
action_60 (41) = happyShift action_11
action_60 (42) = happyShift action_40
action_60 (45) = happyShift action_78
action_60 (49) = happyShift action_12
action_60 (50) = happyShift action_13
action_60 (51) = happyShift action_41
action_60 (11) = happyGoto action_5
action_60 (12) = happyGoto action_31
action_60 (15) = happyGoto action_32
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (29) = happyShift action_77
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (33) = happyShift action_76
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (28) = happyShift action_75
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (28) = happyShift action_74
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (23) = happyShift action_33
action_65 (27) = happyShift action_34
action_65 (29) = happyShift action_35
action_65 (30) = happyShift action_73
action_65 (31) = happyShift action_9
action_65 (32) = happyShift action_10
action_65 (37) = happyShift action_36
action_65 (38) = happyShift action_37
action_65 (39) = happyShift action_38
action_65 (40) = happyShift action_39
action_65 (41) = happyShift action_11
action_65 (42) = happyShift action_40
action_65 (49) = happyShift action_12
action_65 (50) = happyShift action_13
action_65 (51) = happyShift action_41
action_65 (11) = happyGoto action_5
action_65 (12) = happyGoto action_31
action_65 (15) = happyGoto action_32
action_65 _ = happyReduce_5

action_66 (33) = happyShift action_59
action_66 (44) = happyShift action_72
action_66 _ = happyReduce_16

action_67 (23) = happyShift action_33
action_67 (24) = happyShift action_71
action_67 (27) = happyShift action_34
action_67 (29) = happyShift action_35
action_67 (31) = happyShift action_9
action_67 (32) = happyShift action_10
action_67 (37) = happyShift action_36
action_67 (38) = happyShift action_37
action_67 (39) = happyShift action_38
action_67 (40) = happyShift action_39
action_67 (41) = happyShift action_11
action_67 (42) = happyShift action_40
action_67 (49) = happyShift action_12
action_67 (50) = happyShift action_13
action_67 (51) = happyShift action_41
action_67 (11) = happyGoto action_5
action_67 (12) = happyGoto action_31
action_67 (15) = happyGoto action_32
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_12

action_69 (50) = happyShift action_70
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (44) = happyShift action_135
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_13

action_72 (23) = happyShift action_7
action_72 (27) = happyShift action_8
action_72 (31) = happyShift action_9
action_72 (32) = happyShift action_10
action_72 (41) = happyShift action_11
action_72 (49) = happyShift action_12
action_72 (50) = happyShift action_13
action_72 (11) = happyGoto action_5
action_72 (12) = happyGoto action_134
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (23) = happyShift action_7
action_73 (27) = happyShift action_8
action_73 (31) = happyShift action_9
action_73 (32) = happyShift action_10
action_73 (41) = happyShift action_11
action_73 (49) = happyShift action_12
action_73 (50) = happyShift action_13
action_73 (8) = happyGoto action_133
action_73 (11) = happyGoto action_5
action_73 (12) = happyGoto action_65
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_22

action_75 _ = happyReduce_19

action_76 (23) = happyShift action_80
action_76 (27) = happyShift action_81
action_76 (37) = happyShift action_36
action_76 (38) = happyShift action_37
action_76 (39) = happyShift action_38
action_76 (40) = happyShift action_39
action_76 (42) = happyShift action_40
action_76 (51) = happyShift action_41
action_76 (15) = happyGoto action_132
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (23) = happyShift action_7
action_77 (27) = happyShift action_8
action_77 (31) = happyShift action_9
action_77 (32) = happyShift action_10
action_77 (41) = happyShift action_11
action_77 (49) = happyShift action_12
action_77 (50) = happyShift action_13
action_77 (11) = happyGoto action_5
action_77 (12) = happyGoto action_131
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (50) = happyShift action_130
action_78 (10) = happyGoto action_129
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (34) = happyShift action_110
action_79 _ = happyReduce_14

action_80 (23) = happyShift action_80
action_80 (27) = happyShift action_81
action_80 (37) = happyShift action_36
action_80 (38) = happyShift action_37
action_80 (39) = happyShift action_38
action_80 (40) = happyShift action_39
action_80 (42) = happyShift action_40
action_80 (51) = happyShift action_41
action_80 (15) = happyGoto action_108
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (23) = happyShift action_80
action_81 (27) = happyShift action_81
action_81 (37) = happyShift action_36
action_81 (38) = happyShift action_37
action_81 (39) = happyShift action_38
action_81 (40) = happyShift action_39
action_81 (42) = happyShift action_40
action_81 (50) = happyShift action_100
action_81 (51) = happyShift action_41
action_81 (13) = happyGoto action_104
action_81 (14) = happyGoto action_105
action_81 (15) = happyGoto action_106
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_15

action_83 (23) = happyShift action_15
action_83 (27) = happyShift action_16
action_83 (29) = happyShift action_57
action_83 (31) = happyShift action_17
action_83 (36) = happyShift action_58
action_83 (41) = happyShift action_18
action_83 (47) = happyShift action_19
action_83 (48) = happyShift action_20
action_83 (49) = happyShift action_21
action_83 (50) = happyShift action_22
action_83 (22) = happyGoto action_56
action_83 _ = happyReduce_69

action_84 _ = happyReduce_61

action_85 _ = happyReduce_64

action_86 (44) = happyShift action_128
action_86 _ = happyFail (happyExpListPerState 86)

action_87 _ = happyReduce_56

action_88 (23) = happyShift action_15
action_88 (27) = happyShift action_16
action_88 (31) = happyShift action_17
action_88 (41) = happyShift action_18
action_88 (47) = happyShift action_19
action_88 (48) = happyShift action_20
action_88 (49) = happyShift action_21
action_88 (50) = happyShift action_22
action_88 (22) = happyGoto action_127
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (23) = happyShift action_15
action_89 (27) = happyShift action_16
action_89 (31) = happyShift action_17
action_89 (41) = happyShift action_18
action_89 (47) = happyShift action_19
action_89 (48) = happyShift action_20
action_89 (49) = happyShift action_21
action_89 (50) = happyShift action_22
action_89 (19) = happyGoto action_126
action_89 (22) = happyGoto action_51
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_63

action_91 _ = happyReduce_60

action_92 (23) = happyShift action_15
action_92 (27) = happyShift action_16
action_92 (31) = happyShift action_17
action_92 (41) = happyShift action_18
action_92 (47) = happyShift action_19
action_92 (48) = happyShift action_20
action_92 (49) = happyShift action_21
action_92 (50) = happyShift action_22
action_92 (22) = happyGoto action_125
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (50) = happyShift action_124
action_93 (21) = happyGoto action_123
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (23) = happyShift action_15
action_94 (24) = happyShift action_122
action_94 (27) = happyShift action_16
action_94 (29) = happyShift action_57
action_94 (31) = happyShift action_17
action_94 (36) = happyShift action_58
action_94 (41) = happyShift action_18
action_94 (47) = happyShift action_19
action_94 (48) = happyShift action_20
action_94 (49) = happyShift action_21
action_94 (50) = happyShift action_22
action_94 (22) = happyGoto action_56
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (23) = happyShift action_15
action_95 (24) = happyShift action_121
action_95 (27) = happyShift action_16
action_95 (29) = happyShift action_57
action_95 (31) = happyShift action_17
action_95 (36) = happyShift action_58
action_95 (41) = happyShift action_18
action_95 (47) = happyShift action_19
action_95 (48) = happyShift action_20
action_95 (49) = happyShift action_21
action_95 (50) = happyShift action_22
action_95 (22) = happyGoto action_56
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_46

action_97 (34) = happyShift action_110
action_97 _ = happyReduce_48

action_98 _ = happyReduce_43

action_99 (43) = happyShift action_120
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
action_107 (44) = happyShift action_72
action_107 _ = happyReduce_16

action_108 (24) = happyShift action_113
action_108 (34) = happyShift action_110
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (50) = happyShift action_112
action_109 (14) = happyGoto action_99
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (23) = happyShift action_80
action_110 (27) = happyShift action_81
action_110 (37) = happyShift action_36
action_110 (38) = happyShift action_37
action_110 (39) = happyShift action_38
action_110 (40) = happyShift action_39
action_110 (42) = happyShift action_40
action_110 (51) = happyShift action_41
action_110 (15) = happyGoto action_111
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (34) = happyShift action_110
action_111 _ = happyReduce_36

action_112 (33) = happyShift action_119
action_112 (44) = happyShift action_135
action_112 _ = happyFail (happyExpListPerState 112)

action_113 _ = happyReduce_32

action_114 (23) = happyShift action_80
action_114 (27) = happyShift action_81
action_114 (37) = happyShift action_36
action_114 (38) = happyShift action_37
action_114 (39) = happyShift action_38
action_114 (40) = happyShift action_39
action_114 (42) = happyShift action_40
action_114 (50) = happyShift action_82
action_114 (51) = happyShift action_41
action_114 (15) = happyGoto action_146
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (23) = happyShift action_80
action_115 (27) = happyShift action_81
action_115 (37) = happyShift action_36
action_115 (38) = happyShift action_37
action_115 (39) = happyShift action_38
action_115 (40) = happyShift action_39
action_115 (42) = happyShift action_40
action_115 (51) = happyShift action_41
action_115 (13) = happyGoto action_145
action_115 (15) = happyGoto action_106
action_115 _ = happyFail (happyExpListPerState 115)

action_116 _ = happyReduce_38

action_117 _ = happyReduce_37

action_118 (23) = happyShift action_80
action_118 (27) = happyShift action_81
action_118 (37) = happyShift action_36
action_118 (38) = happyShift action_37
action_118 (39) = happyShift action_38
action_118 (40) = happyShift action_39
action_118 (42) = happyShift action_40
action_118 (51) = happyShift action_41
action_118 (15) = happyGoto action_144
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (23) = happyShift action_80
action_119 (27) = happyShift action_81
action_119 (37) = happyShift action_36
action_119 (38) = happyShift action_37
action_119 (39) = happyShift action_38
action_119 (40) = happyShift action_39
action_119 (42) = happyShift action_40
action_119 (51) = happyShift action_41
action_119 (15) = happyGoto action_143
action_119 _ = happyFail (happyExpListPerState 119)

action_120 _ = happyReduce_39

action_121 _ = happyReduce_68

action_122 _ = happyReduce_67

action_123 _ = happyReduce_66

action_124 (35) = happyShift action_142
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (23) = happyShift action_15
action_125 (27) = happyShift action_16
action_125 (29) = happyShift action_57
action_125 (31) = happyShift action_17
action_125 (36) = happyShift action_58
action_125 (41) = happyShift action_18
action_125 (47) = happyShift action_19
action_125 (48) = happyShift action_20
action_125 (49) = happyShift action_21
action_125 (50) = happyShift action_22
action_125 (22) = happyGoto action_56
action_125 _ = happyReduce_59

action_126 _ = happyReduce_50

action_127 (23) = happyShift action_15
action_127 (27) = happyShift action_16
action_127 (29) = happyShift action_57
action_127 (30) = happyShift action_141
action_127 (31) = happyShift action_17
action_127 (36) = happyShift action_58
action_127 (41) = happyShift action_18
action_127 (47) = happyShift action_19
action_127 (48) = happyShift action_20
action_127 (49) = happyShift action_21
action_127 (50) = happyShift action_22
action_127 (22) = happyGoto action_56
action_127 _ = happyReduce_51

action_128 (23) = happyShift action_15
action_128 (27) = happyShift action_16
action_128 (31) = happyShift action_17
action_128 (41) = happyShift action_18
action_128 (47) = happyShift action_19
action_128 (48) = happyShift action_20
action_128 (49) = happyShift action_21
action_128 (50) = happyShift action_22
action_128 (22) = happyGoto action_140
action_128 _ = happyFail (happyExpListPerState 128)

action_129 _ = happyReduce_25

action_130 (35) = happyShift action_139
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (23) = happyShift action_33
action_131 (27) = happyShift action_34
action_131 (29) = happyShift action_35
action_131 (31) = happyShift action_9
action_131 (32) = happyShift action_10
action_131 (37) = happyShift action_36
action_131 (38) = happyShift action_37
action_131 (39) = happyShift action_38
action_131 (40) = happyShift action_39
action_131 (41) = happyShift action_11
action_131 (42) = happyShift action_40
action_131 (49) = happyShift action_12
action_131 (50) = happyShift action_13
action_131 (51) = happyShift action_41
action_131 (11) = happyGoto action_5
action_131 (12) = happyGoto action_31
action_131 (15) = happyGoto action_32
action_131 _ = happyReduce_26

action_132 (29) = happyShift action_138
action_132 (34) = happyShift action_110
action_132 _ = happyFail (happyExpListPerState 132)

action_133 _ = happyReduce_6

action_134 (23) = happyShift action_33
action_134 (27) = happyShift action_34
action_134 (29) = happyShift action_35
action_134 (30) = happyShift action_137
action_134 (31) = happyShift action_9
action_134 (32) = happyShift action_10
action_134 (37) = happyShift action_36
action_134 (38) = happyShift action_37
action_134 (39) = happyShift action_38
action_134 (40) = happyShift action_39
action_134 (41) = happyShift action_11
action_134 (42) = happyShift action_40
action_134 (49) = happyShift action_12
action_134 (50) = happyShift action_13
action_134 (51) = happyShift action_41
action_134 (11) = happyGoto action_5
action_134 (12) = happyGoto action_31
action_134 (15) = happyGoto action_32
action_134 _ = happyReduce_7

action_135 (23) = happyShift action_7
action_135 (27) = happyShift action_8
action_135 (31) = happyShift action_9
action_135 (32) = happyShift action_10
action_135 (41) = happyShift action_11
action_135 (49) = happyShift action_12
action_135 (50) = happyShift action_13
action_135 (11) = happyGoto action_5
action_135 (12) = happyGoto action_136
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (23) = happyShift action_33
action_136 (27) = happyShift action_34
action_136 (29) = happyShift action_35
action_136 (31) = happyShift action_9
action_136 (32) = happyShift action_10
action_136 (37) = happyShift action_36
action_136 (38) = happyShift action_37
action_136 (39) = happyShift action_38
action_136 (40) = happyShift action_39
action_136 (41) = happyShift action_11
action_136 (42) = happyShift action_40
action_136 (43) = happyShift action_156
action_136 (49) = happyShift action_12
action_136 (50) = happyShift action_13
action_136 (51) = happyShift action_41
action_136 (11) = happyGoto action_5
action_136 (12) = happyGoto action_31
action_136 (15) = happyGoto action_32
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (50) = happyShift action_155
action_137 (9) = happyGoto action_154
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (23) = happyShift action_7
action_138 (27) = happyShift action_8
action_138 (31) = happyShift action_9
action_138 (32) = happyShift action_10
action_138 (41) = happyShift action_11
action_138 (49) = happyShift action_12
action_138 (50) = happyShift action_13
action_138 (11) = happyGoto action_5
action_138 (12) = happyGoto action_153
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (23) = happyShift action_7
action_139 (27) = happyShift action_8
action_139 (31) = happyShift action_9
action_139 (32) = happyShift action_10
action_139 (41) = happyShift action_11
action_139 (49) = happyShift action_12
action_139 (50) = happyShift action_13
action_139 (11) = happyGoto action_5
action_139 (12) = happyGoto action_152
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (23) = happyShift action_15
action_140 (27) = happyShift action_16
action_140 (29) = happyShift action_57
action_140 (31) = happyShift action_17
action_140 (36) = happyShift action_58
action_140 (41) = happyShift action_18
action_140 (43) = happyShift action_151
action_140 (47) = happyShift action_19
action_140 (48) = happyShift action_20
action_140 (49) = happyShift action_21
action_140 (50) = happyShift action_22
action_140 (22) = happyGoto action_56
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (50) = happyShift action_150
action_141 (20) = happyGoto action_149
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (23) = happyShift action_15
action_142 (27) = happyShift action_16
action_142 (31) = happyShift action_17
action_142 (41) = happyShift action_18
action_142 (47) = happyShift action_19
action_142 (48) = happyShift action_20
action_142 (49) = happyShift action_21
action_142 (50) = happyShift action_22
action_142 (22) = happyGoto action_148
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (30) = happyShift action_147
action_143 (34) = happyShift action_110
action_143 _ = happyReduce_30

action_144 (34) = happyShift action_110
action_144 _ = happyReduce_40

action_145 _ = happyReduce_29

action_146 (28) = happyReduce_30
action_146 (30) = happyShift action_147
action_146 (34) = happyShift action_110
action_146 _ = happyReduce_14

action_147 (50) = happyShift action_100
action_147 (14) = happyGoto action_161
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (23) = happyShift action_15
action_148 (27) = happyShift action_16
action_148 (29) = happyShift action_57
action_148 (30) = happyShift action_160
action_148 (31) = happyShift action_17
action_148 (36) = happyShift action_58
action_148 (41) = happyShift action_18
action_148 (47) = happyShift action_19
action_148 (48) = happyShift action_20
action_148 (49) = happyShift action_21
action_148 (50) = happyShift action_22
action_148 (22) = happyGoto action_56
action_148 _ = happyReduce_53

action_149 _ = happyReduce_52

action_150 (44) = happyShift action_88
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (24) = happyShift action_159
action_151 _ = happyFail (happyExpListPerState 151)

action_152 (23) = happyShift action_33
action_152 (27) = happyShift action_34
action_152 (29) = happyShift action_35
action_152 (30) = happyShift action_158
action_152 (31) = happyShift action_9
action_152 (32) = happyShift action_10
action_152 (37) = happyShift action_36
action_152 (38) = happyShift action_37
action_152 (39) = happyShift action_38
action_152 (40) = happyShift action_39
action_152 (41) = happyShift action_11
action_152 (42) = happyShift action_40
action_152 (49) = happyShift action_12
action_152 (50) = happyShift action_13
action_152 (51) = happyShift action_41
action_152 (11) = happyGoto action_5
action_152 (12) = happyGoto action_31
action_152 (15) = happyGoto action_32
action_152 _ = happyReduce_9

action_153 (23) = happyShift action_33
action_153 (27) = happyShift action_34
action_153 (29) = happyShift action_35
action_153 (31) = happyShift action_9
action_153 (32) = happyShift action_10
action_153 (37) = happyShift action_36
action_153 (38) = happyShift action_37
action_153 (39) = happyShift action_38
action_153 (40) = happyShift action_39
action_153 (41) = happyShift action_11
action_153 (42) = happyShift action_40
action_153 (49) = happyShift action_12
action_153 (50) = happyShift action_13
action_153 (51) = happyShift action_41
action_153 (11) = happyGoto action_5
action_153 (12) = happyGoto action_31
action_153 (15) = happyGoto action_32
action_153 _ = happyReduce_18

action_154 _ = happyReduce_8

action_155 (44) = happyShift action_72
action_155 _ = happyFail (happyExpListPerState 155)

action_156 (33) = happyShift action_157
action_156 _ = happyFail (happyExpListPerState 156)

action_157 (23) = happyShift action_80
action_157 (27) = happyShift action_81
action_157 (37) = happyShift action_36
action_157 (38) = happyShift action_37
action_157 (39) = happyShift action_38
action_157 (40) = happyShift action_39
action_157 (42) = happyShift action_40
action_157 (51) = happyShift action_41
action_157 (15) = happyGoto action_164
action_157 _ = happyFail (happyExpListPerState 157)

action_158 (50) = happyShift action_130
action_158 (10) = happyGoto action_163
action_158 _ = happyFail (happyExpListPerState 158)

action_159 _ = happyReduce_65

action_160 (50) = happyShift action_124
action_160 (21) = happyGoto action_162
action_160 _ = happyFail (happyExpListPerState 160)

action_161 _ = happyReduce_31

action_162 _ = happyReduce_54

action_163 _ = happyReduce_10

action_164 (24) = happyShift action_165
action_164 (34) = happyShift action_110
action_164 _ = happyFail (happyExpListPerState 164)

action_165 _ = happyReduce_11

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
		 ((happy_var_2)
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
	(HappyTerminal (ID happy_var_2)) `HappyStk`
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

happyReduce_67 = happyReduce 4 22 happyReduction_67
happyReduction_67 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (A (L "n" Unit (L "f" Unit (L "x" Unit (A (V "f") (A (A (V "n") (V "f")) (V "x")))))) happy_var_3
	) `HappyStk` happyRest

happyReduce_68 = happyReduce 4 22 happyReduction_68
happyReduction_68 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (A (L "n" Unit (L "f" Unit (L "x" Unit (A (A (A (V "n") (L "g" Unit (L "h" Unit (A (V "h") (A (V "g") (V "f")))))) (L "u" Unit (V "x"))) (L "u" Unit (V "u")))))) happy_var_3
	) `HappyStk` happyRest

happyReduce_69 = happySpecReduce_3  22 happyReduction_69
happyReduction_69 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (A (A (L "m" Unit (L "n" Unit (A (A (V "m") (L "n" Unit (L "f" Unit (L "x" Unit (A (V "f") (A (A (V "n") (V "f")) (V "x"))))))) (V "n")))) happy_var_1) happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 52 52 notHappyAtAll (HappyState action) sts stk []

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
	TAll -> cont 37;
	TINT -> cont 38;
	TBOOL -> cont 39;
	TUNIT -> cont 40;
	TCase -> cont 41;
	LAngle -> cont 42;
	RAngle -> cont 43;
	TEqual -> cont 44;
	TOf -> cont 45;
	Empty -> cont 46;
	TSucc -> cont 47;
	TPred -> cont 48;
	Num happy_dollar_dollar -> cont 49;
	ID happy_dollar_dollar -> cont 50;
	TyID happy_dollar_dollar -> cont 51;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 52 tk tks = happyError' (tks, explist)
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
