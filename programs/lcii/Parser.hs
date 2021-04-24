{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import DataType
import Unbound.LocallyNameless
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.11

data HappyAbsSyn t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23
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
	| HappyAbsSyn23 t23

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,553) ([0,34944,1025,32,0,0,16512,0,0,32768,32,32768,136,12292,0,34944,1025,32,0,0,0,0,0,0,0,32768,49576,24591,0,35200,3073,32,32768,392,8196,0,0,0,32,0,0,16384,0,34944,1025,32,0,512,4096,0,43136,1024,48,32768,137,12300,0,34944,1024,48,0,0,8192,0,34944,1024,48,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,64,0,0,43136,4033,96,0,0,0,0,0,4,0,32768,49545,24591,0,34944,4033,96,0,0,12288,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,32768,64,32768,49160,16395,0,0,32768,32,32768,168,12356,0,8192,0,0,0,16,0,0,4096,0,0,32768,232,12292,0,0,8192,0,32768,169,12292,0,0,0,0,0,0,8192,0,0,0,0,0,0,12288,0,2176,3008,64,0,0,0,0,43136,20417,96,0,32,0,0,0,2,0,0,0,4096,0,4096,0,0,0,16,0,0,59520,4033,96,0,512,4128,0,43392,4033,96,0,0,0,0,0,0,32,0,0,32,0,0,0,0,32768,392,8196,0,34944,1025,32,0,0,0,0,0,0,0,0,0,0,0,2176,3008,64,32768,392,8196,0,0,0,32,0,1024,0,0,2176,3008,64,32768,49160,24587,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,34944,1024,48,32768,136,12292,0,0,0,0,0,0,0,0,34944,1024,48,0,0,8192,0,0,0,0,0,1024,0,0,0,0,0,0,0,16,0,0,2,0,0,32,0,0,0,0,0,0,0,0,0,4096,0,0,0,16,0,0,16384,4,0,0,512,4128,0,256,4,0,0,0,8192,0,2176,3008,64,0,0,0,0,0,8194,0,0,0,0,0,2176,3008,64,32768,49160,16395,0,0,0,0,0,0,0,0,2176,3008,64,32768,49160,16395,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,32768,232,12292,0,34944,1024,48,0,0,0,0,0,8,0,0,0,0,0,8192,4,0,0,0,0,0,59520,4033,96,32768,392,8196,0,43136,8129,96,0,0,8192,0,34944,1025,32,32768,392,8196,0,43136,5120,48,0,0,8192,0,34944,1024,48,0,1088,0,0,0,0,0,0,0,0,0,0,4,0,0,0,8192,0,0,0,0,0,0,0,0,0,8192,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,2,0,32768,49160,16395,0,0,0,32,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,256,4,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParseExp","%start_happyParseTypeContext","%start_happyParseEnv","%start_happyParseTerm","Start","exps","recExps","caseExps","inj","tmVar","exp","prod","sum","type","typeContext","env","decl","terms","recTerms","caseTerms","term","'('","')'","'['","']'","'{'","'}'","'.'","','","'\955'","'\923'","':'","'->'","'=>'","'+'","'-'","'\8704'","INT","BOOL","UNIT","'case'","'<'","'>'","'='","'of'","'Empty'","'succ'","'pred'","'true'","'false'","NUM","ID","TyID","%eof"]
        bit_start = st * 56
        bit_end = (st + 1) * 56
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..55]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (24) = happyShift action_8
action_0 (28) = happyShift action_9
action_0 (32) = happyShift action_10
action_0 (33) = happyShift action_11
action_0 (43) = happyShift action_12
action_0 (54) = happyShift action_13
action_0 (11) = happyGoto action_5
action_0 (12) = happyGoto action_6
action_0 (13) = happyGoto action_28
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (48) = happyShift action_26
action_1 (55) = happyShift action_27
action_1 (17) = happyGoto action_25
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (48) = happyShift action_23
action_2 (54) = happyShift action_24
action_2 (18) = happyGoto action_21
action_2 (19) = happyGoto action_22
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (24) = happyShift action_15
action_3 (28) = happyShift action_16
action_3 (32) = happyShift action_17
action_3 (43) = happyShift action_18
action_3 (53) = happyShift action_19
action_3 (54) = happyShift action_20
action_3 (23) = happyGoto action_14
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (24) = happyShift action_8
action_4 (28) = happyShift action_9
action_4 (32) = happyShift action_10
action_4 (33) = happyShift action_11
action_4 (43) = happyShift action_12
action_4 (54) = happyShift action_13
action_4 (11) = happyGoto action_5
action_4 (12) = happyGoto action_6
action_4 (13) = happyGoto action_7
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_25

action_6 _ = happyReduce_18

action_7 (24) = happyShift action_31
action_7 (28) = happyShift action_32
action_7 (30) = happyShift action_33
action_7 (32) = happyShift action_10
action_7 (33) = happyShift action_11
action_7 (39) = happyShift action_34
action_7 (40) = happyShift action_35
action_7 (41) = happyShift action_36
action_7 (42) = happyShift action_37
action_7 (43) = happyShift action_12
action_7 (44) = happyShift action_38
action_7 (54) = happyShift action_13
action_7 (55) = happyShift action_39
action_7 (11) = happyGoto action_5
action_7 (12) = happyGoto action_6
action_7 (13) = happyGoto action_29
action_7 (16) = happyGoto action_30
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (24) = happyShift action_8
action_8 (25) = happyShift action_65
action_8 (28) = happyShift action_9
action_8 (32) = happyShift action_10
action_8 (33) = happyShift action_11
action_8 (43) = happyShift action_12
action_8 (44) = happyShift action_66
action_8 (54) = happyShift action_13
action_8 (11) = happyGoto action_5
action_8 (12) = happyGoto action_6
action_8 (13) = happyGoto action_64
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (24) = happyShift action_8
action_9 (28) = happyShift action_9
action_9 (32) = happyShift action_10
action_9 (33) = happyShift action_11
action_9 (43) = happyShift action_12
action_9 (54) = happyShift action_63
action_9 (8) = happyGoto action_60
action_9 (9) = happyGoto action_61
action_9 (11) = happyGoto action_5
action_9 (12) = happyGoto action_6
action_9 (13) = happyGoto action_62
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (54) = happyShift action_59
action_10 (12) = happyGoto action_58
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (55) = happyShift action_57
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (24) = happyShift action_8
action_12 (28) = happyShift action_9
action_12 (32) = happyShift action_10
action_12 (33) = happyShift action_11
action_12 (43) = happyShift action_12
action_12 (54) = happyShift action_13
action_12 (11) = happyGoto action_5
action_12 (12) = happyGoto action_6
action_12 (13) = happyGoto action_56
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (34) = happyShift action_54
action_13 (53) = happyShift action_55
action_13 _ = happyReduce_12

action_14 (24) = happyShift action_15
action_14 (28) = happyShift action_16
action_14 (30) = happyShift action_53
action_14 (32) = happyShift action_17
action_14 (43) = happyShift action_18
action_14 (53) = happyShift action_19
action_14 (54) = happyShift action_20
action_14 (56) = happyAccept
action_14 (23) = happyGoto action_52
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (24) = happyShift action_15
action_15 (25) = happyShift action_50
action_15 (28) = happyShift action_16
action_15 (32) = happyShift action_17
action_15 (43) = happyShift action_18
action_15 (44) = happyShift action_51
action_15 (53) = happyShift action_19
action_15 (54) = happyShift action_20
action_15 (23) = happyGoto action_49
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (24) = happyShift action_15
action_16 (28) = happyShift action_16
action_16 (32) = happyShift action_17
action_16 (43) = happyShift action_18
action_16 (53) = happyShift action_19
action_16 (54) = happyShift action_48
action_16 (20) = happyGoto action_45
action_16 (21) = happyGoto action_46
action_16 (23) = happyGoto action_47
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (54) = happyShift action_44
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (24) = happyShift action_15
action_18 (28) = happyShift action_16
action_18 (32) = happyShift action_17
action_18 (43) = happyShift action_18
action_18 (53) = happyShift action_19
action_18 (54) = happyShift action_20
action_18 (23) = happyGoto action_43
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_59

action_20 _ = happyReduce_58

action_21 (56) = happyAccept
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (31) = happyShift action_42
action_22 _ = happyReduce_46

action_23 _ = happyReduce_48

action_24 (34) = happyShift action_41
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (56) = happyAccept
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_45

action_27 (31) = happyShift action_40
action_27 _ = happyReduce_43

action_28 (24) = happyShift action_31
action_28 (28) = happyShift action_32
action_28 (30) = happyShift action_33
action_28 (32) = happyShift action_10
action_28 (33) = happyShift action_11
action_28 (39) = happyShift action_34
action_28 (40) = happyShift action_35
action_28 (41) = happyShift action_36
action_28 (42) = happyShift action_37
action_28 (43) = happyShift action_12
action_28 (44) = happyShift action_38
action_28 (54) = happyShift action_13
action_28 (55) = happyShift action_39
action_28 (56) = happyAccept
action_28 (11) = happyGoto action_5
action_28 (12) = happyGoto action_6
action_28 (13) = happyGoto action_29
action_28 (16) = happyGoto action_30
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (30) = happyShift action_33
action_29 (39) = happyShift action_34
action_29 (40) = happyShift action_35
action_29 (41) = happyShift action_36
action_29 (42) = happyShift action_37
action_29 (44) = happyShift action_38
action_29 (55) = happyShift action_39
action_29 (11) = happyGoto action_5
action_29 (12) = happyGoto action_6
action_29 (13) = happyGoto action_29
action_29 (16) = happyGoto action_30
action_29 _ = happyReduce_22

action_30 (35) = happyShift action_104
action_30 _ = happyReduce_28

action_31 (24) = happyShift action_31
action_31 (25) = happyShift action_65
action_31 (28) = happyShift action_32
action_31 (32) = happyShift action_10
action_31 (33) = happyShift action_11
action_31 (39) = happyShift action_34
action_31 (40) = happyShift action_35
action_31 (41) = happyShift action_36
action_31 (42) = happyShift action_37
action_31 (43) = happyShift action_12
action_31 (44) = happyShift action_103
action_31 (54) = happyShift action_13
action_31 (55) = happyShift action_39
action_31 (11) = happyGoto action_5
action_31 (12) = happyGoto action_6
action_31 (13) = happyGoto action_64
action_31 (16) = happyGoto action_102
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (24) = happyShift action_31
action_32 (28) = happyShift action_32
action_32 (32) = happyShift action_10
action_32 (33) = happyShift action_11
action_32 (39) = happyShift action_34
action_32 (40) = happyShift action_35
action_32 (41) = happyShift action_36
action_32 (42) = happyShift action_37
action_32 (43) = happyShift action_12
action_32 (44) = happyShift action_38
action_32 (54) = happyShift action_101
action_32 (55) = happyShift action_39
action_32 (8) = happyGoto action_60
action_32 (9) = happyGoto action_61
action_32 (11) = happyGoto action_5
action_32 (12) = happyGoto action_6
action_32 (13) = happyGoto action_62
action_32 (14) = happyGoto action_98
action_32 (15) = happyGoto action_99
action_32 (16) = happyGoto action_100
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (53) = happyShift action_96
action_33 (54) = happyShift action_97
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (55) = happyShift action_95
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_34

action_36 _ = happyReduce_35

action_37 _ = happyReduce_42

action_38 (54) = happyShift action_94
action_38 (15) = happyGoto action_93
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_36

action_40 (48) = happyShift action_26
action_40 (55) = happyShift action_27
action_40 (17) = happyGoto action_92
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (24) = happyShift action_78
action_41 (28) = happyShift action_79
action_41 (39) = happyShift action_34
action_41 (40) = happyShift action_35
action_41 (41) = happyShift action_36
action_41 (42) = happyShift action_37
action_41 (44) = happyShift action_38
action_41 (55) = happyShift action_39
action_41 (16) = happyGoto action_91
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (48) = happyShift action_23
action_42 (54) = happyShift action_24
action_42 (18) = happyGoto action_90
action_42 (19) = happyGoto action_22
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (24) = happyShift action_15
action_43 (28) = happyShift action_16
action_43 (30) = happyShift action_53
action_43 (32) = happyShift action_17
action_43 (43) = happyShift action_18
action_43 (47) = happyShift action_89
action_43 (53) = happyShift action_19
action_43 (54) = happyShift action_20
action_43 (23) = happyGoto action_52
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (30) = happyShift action_88
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (29) = happyShift action_87
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (29) = happyShift action_86
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (24) = happyShift action_15
action_47 (28) = happyShift action_16
action_47 (30) = happyShift action_53
action_47 (31) = happyShift action_85
action_47 (32) = happyShift action_17
action_47 (43) = happyShift action_18
action_47 (53) = happyShift action_19
action_47 (54) = happyShift action_20
action_47 (23) = happyGoto action_52
action_47 _ = happyReduce_50

action_48 (46) = happyShift action_84
action_48 _ = happyReduce_58

action_49 (24) = happyShift action_15
action_49 (25) = happyShift action_83
action_49 (28) = happyShift action_16
action_49 (30) = happyShift action_53
action_49 (32) = happyShift action_17
action_49 (43) = happyShift action_18
action_49 (53) = happyShift action_19
action_49 (54) = happyShift action_20
action_49 (23) = happyGoto action_52
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_56

action_51 (54) = happyShift action_82
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (30) = happyShift action_53
action_52 (23) = happyGoto action_52
action_52 _ = happyReduce_63

action_53 (53) = happyShift action_80
action_53 (54) = happyShift action_81
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (24) = happyShift action_78
action_54 (28) = happyShift action_79
action_54 (39) = happyShift action_34
action_54 (40) = happyShift action_35
action_54 (41) = happyShift action_36
action_54 (42) = happyShift action_37
action_54 (44) = happyShift action_38
action_54 (55) = happyShift action_39
action_54 (16) = happyGoto action_77
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (24) = happyReduce_13
action_55 (25) = happyReduce_13
action_55 (28) = happyReduce_13
action_55 (29) = happyReduce_13
action_55 (30) = happyReduce_13
action_55 (31) = happyReduce_13
action_55 (32) = happyReduce_13
action_55 (33) = happyReduce_13
action_55 (39) = happyReduce_13
action_55 (40) = happyReduce_13
action_55 (41) = happyReduce_13
action_55 (42) = happyReduce_13
action_55 (43) = happyReduce_13
action_55 (44) = happyReduce_13
action_55 (45) = happyReduce_13
action_55 (47) = happyReduce_13
action_55 (54) = happyReduce_13
action_55 (55) = happyReduce_13
action_55 (56) = happyReduce_13
action_55 _ = happyReduce_13

action_56 (24) = happyShift action_31
action_56 (28) = happyShift action_32
action_56 (30) = happyShift action_33
action_56 (32) = happyShift action_10
action_56 (33) = happyShift action_11
action_56 (39) = happyShift action_34
action_56 (40) = happyShift action_35
action_56 (41) = happyShift action_36
action_56 (42) = happyShift action_37
action_56 (43) = happyShift action_12
action_56 (44) = happyShift action_38
action_56 (47) = happyShift action_76
action_56 (54) = happyShift action_13
action_56 (55) = happyShift action_39
action_56 (11) = happyGoto action_5
action_56 (12) = happyGoto action_6
action_56 (13) = happyGoto action_29
action_56 (16) = happyGoto action_30
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (30) = happyShift action_75
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (34) = happyShift action_74
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (53) = happyShift action_73
action_59 _ = happyReduce_12

action_60 (29) = happyShift action_72
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (29) = happyShift action_71
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (24) = happyShift action_31
action_62 (28) = happyShift action_32
action_62 (30) = happyShift action_33
action_62 (31) = happyShift action_70
action_62 (32) = happyShift action_10
action_62 (33) = happyShift action_11
action_62 (39) = happyShift action_34
action_62 (40) = happyShift action_35
action_62 (41) = happyShift action_36
action_62 (42) = happyShift action_37
action_62 (43) = happyShift action_12
action_62 (44) = happyShift action_38
action_62 (54) = happyShift action_13
action_62 (55) = happyShift action_39
action_62 (11) = happyGoto action_5
action_62 (12) = happyGoto action_6
action_62 (13) = happyGoto action_29
action_62 (16) = happyGoto action_30
action_62 _ = happyReduce_5

action_63 (34) = happyShift action_54
action_63 (46) = happyShift action_69
action_63 (53) = happyShift action_55
action_63 _ = happyReduce_12

action_64 (24) = happyShift action_31
action_64 (25) = happyShift action_68
action_64 (28) = happyShift action_32
action_64 (30) = happyShift action_33
action_64 (32) = happyShift action_10
action_64 (33) = happyShift action_11
action_64 (39) = happyShift action_34
action_64 (40) = happyShift action_35
action_64 (41) = happyShift action_36
action_64 (42) = happyShift action_37
action_64 (43) = happyShift action_12
action_64 (44) = happyShift action_38
action_64 (54) = happyShift action_13
action_64 (55) = happyShift action_39
action_64 (11) = happyGoto action_5
action_64 (12) = happyGoto action_6
action_64 (13) = happyGoto action_29
action_64 (16) = happyGoto action_30
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_14

action_66 (54) = happyShift action_67
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (46) = happyShift action_127
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_15

action_69 (24) = happyShift action_8
action_69 (28) = happyShift action_9
action_69 (32) = happyShift action_10
action_69 (33) = happyShift action_11
action_69 (43) = happyShift action_12
action_69 (54) = happyShift action_13
action_69 (11) = happyGoto action_5
action_69 (12) = happyGoto action_6
action_69 (13) = happyGoto action_126
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (24) = happyShift action_8
action_70 (28) = happyShift action_9
action_70 (32) = happyShift action_10
action_70 (33) = happyShift action_11
action_70 (43) = happyShift action_12
action_70 (54) = happyShift action_13
action_70 (8) = happyGoto action_125
action_70 (11) = happyGoto action_5
action_70 (12) = happyGoto action_6
action_70 (13) = happyGoto action_62
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_23

action_72 _ = happyReduce_20

action_73 _ = happyReduce_13

action_74 (24) = happyShift action_78
action_74 (28) = happyShift action_79
action_74 (39) = happyShift action_34
action_74 (40) = happyShift action_35
action_74 (41) = happyShift action_36
action_74 (42) = happyShift action_37
action_74 (44) = happyShift action_38
action_74 (55) = happyShift action_39
action_74 (16) = happyGoto action_124
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (24) = happyShift action_8
action_75 (28) = happyShift action_9
action_75 (32) = happyShift action_10
action_75 (33) = happyShift action_11
action_75 (43) = happyShift action_12
action_75 (54) = happyShift action_13
action_75 (11) = happyGoto action_5
action_75 (12) = happyGoto action_6
action_75 (13) = happyGoto action_123
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (54) = happyShift action_122
action_76 (10) = happyGoto action_121
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (35) = happyShift action_104
action_77 _ = happyReduce_16

action_78 (24) = happyShift action_78
action_78 (28) = happyShift action_79
action_78 (39) = happyShift action_34
action_78 (40) = happyShift action_35
action_78 (41) = happyShift action_36
action_78 (42) = happyShift action_37
action_78 (44) = happyShift action_38
action_78 (55) = happyShift action_39
action_78 (16) = happyGoto action_102
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (24) = happyShift action_78
action_79 (28) = happyShift action_79
action_79 (39) = happyShift action_34
action_79 (40) = happyShift action_35
action_79 (41) = happyShift action_36
action_79 (42) = happyShift action_37
action_79 (44) = happyShift action_38
action_79 (54) = happyShift action_94
action_79 (55) = happyShift action_39
action_79 (14) = happyGoto action_98
action_79 (15) = happyGoto action_99
action_79 (16) = happyGoto action_100
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_62

action_81 _ = happyReduce_65

action_82 (46) = happyShift action_120
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_57

action_84 (24) = happyShift action_15
action_84 (28) = happyShift action_16
action_84 (32) = happyShift action_17
action_84 (43) = happyShift action_18
action_84 (53) = happyShift action_19
action_84 (54) = happyShift action_20
action_84 (23) = happyGoto action_119
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (24) = happyShift action_15
action_85 (28) = happyShift action_16
action_85 (32) = happyShift action_17
action_85 (43) = happyShift action_18
action_85 (53) = happyShift action_19
action_85 (54) = happyShift action_20
action_85 (20) = happyGoto action_118
action_85 (23) = happyGoto action_47
action_85 _ = happyFail (happyExpListPerState 85)

action_86 _ = happyReduce_64

action_87 _ = happyReduce_61

action_88 (24) = happyShift action_15
action_88 (28) = happyShift action_16
action_88 (32) = happyShift action_17
action_88 (43) = happyShift action_18
action_88 (53) = happyShift action_19
action_88 (54) = happyShift action_20
action_88 (23) = happyGoto action_117
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (54) = happyShift action_116
action_89 (22) = happyGoto action_115
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_47

action_91 (35) = happyShift action_104
action_91 _ = happyReduce_49

action_92 _ = happyReduce_44

action_93 (45) = happyShift action_114
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (34) = happyShift action_113
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (30) = happyShift action_112
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_21

action_97 _ = happyReduce_24

action_98 (29) = happyShift action_111
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (29) = happyShift action_110
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (31) = happyShift action_109
action_100 (35) = happyShift action_104
action_100 _ = happyReduce_29

action_101 (34) = happyShift action_108
action_101 (46) = happyShift action_69
action_101 (53) = happyShift action_55
action_101 _ = happyReduce_12

action_102 (25) = happyShift action_107
action_102 (35) = happyShift action_104
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (54) = happyShift action_106
action_103 (15) = happyGoto action_93
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (24) = happyShift action_78
action_104 (28) = happyShift action_79
action_104 (39) = happyShift action_34
action_104 (40) = happyShift action_35
action_104 (41) = happyShift action_36
action_104 (42) = happyShift action_37
action_104 (44) = happyShift action_38
action_104 (55) = happyShift action_39
action_104 (16) = happyGoto action_105
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (35) = happyShift action_104
action_105 _ = happyReduce_37

action_106 (34) = happyShift action_113
action_106 (46) = happyShift action_127
action_106 _ = happyFail (happyExpListPerState 106)

action_107 _ = happyReduce_33

action_108 (24) = happyShift action_78
action_108 (28) = happyShift action_79
action_108 (39) = happyShift action_34
action_108 (40) = happyShift action_35
action_108 (41) = happyShift action_36
action_108 (42) = happyShift action_37
action_108 (44) = happyShift action_38
action_108 (55) = happyShift action_39
action_108 (16) = happyGoto action_138
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (24) = happyShift action_78
action_109 (28) = happyShift action_79
action_109 (39) = happyShift action_34
action_109 (40) = happyShift action_35
action_109 (41) = happyShift action_36
action_109 (42) = happyShift action_37
action_109 (44) = happyShift action_38
action_109 (55) = happyShift action_39
action_109 (14) = happyGoto action_137
action_109 (16) = happyGoto action_100
action_109 _ = happyFail (happyExpListPerState 109)

action_110 _ = happyReduce_39

action_111 _ = happyReduce_38

action_112 (24) = happyShift action_78
action_112 (28) = happyShift action_79
action_112 (39) = happyShift action_34
action_112 (40) = happyShift action_35
action_112 (41) = happyShift action_36
action_112 (42) = happyShift action_37
action_112 (44) = happyShift action_38
action_112 (55) = happyShift action_39
action_112 (16) = happyGoto action_136
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (24) = happyShift action_78
action_113 (28) = happyShift action_79
action_113 (39) = happyShift action_34
action_113 (40) = happyShift action_35
action_113 (41) = happyShift action_36
action_113 (42) = happyShift action_37
action_113 (44) = happyShift action_38
action_113 (55) = happyShift action_39
action_113 (16) = happyGoto action_135
action_113 _ = happyFail (happyExpListPerState 113)

action_114 _ = happyReduce_40

action_115 _ = happyReduce_67

action_116 (36) = happyShift action_134
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (24) = happyShift action_15
action_117 (28) = happyShift action_16
action_117 (30) = happyShift action_53
action_117 (32) = happyShift action_17
action_117 (43) = happyShift action_18
action_117 (53) = happyShift action_19
action_117 (54) = happyShift action_20
action_117 (23) = happyGoto action_52
action_117 _ = happyReduce_60

action_118 _ = happyReduce_51

action_119 (24) = happyShift action_15
action_119 (28) = happyShift action_16
action_119 (30) = happyShift action_53
action_119 (31) = happyShift action_133
action_119 (32) = happyShift action_17
action_119 (43) = happyShift action_18
action_119 (53) = happyShift action_19
action_119 (54) = happyShift action_20
action_119 (23) = happyGoto action_52
action_119 _ = happyReduce_52

action_120 (24) = happyShift action_15
action_120 (28) = happyShift action_16
action_120 (32) = happyShift action_17
action_120 (43) = happyShift action_18
action_120 (53) = happyShift action_19
action_120 (54) = happyShift action_20
action_120 (23) = happyGoto action_132
action_120 _ = happyFail (happyExpListPerState 120)

action_121 _ = happyReduce_26

action_122 (36) = happyShift action_131
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (24) = happyShift action_31
action_123 (28) = happyShift action_32
action_123 (30) = happyShift action_33
action_123 (32) = happyShift action_10
action_123 (33) = happyShift action_11
action_123 (39) = happyShift action_34
action_123 (40) = happyShift action_35
action_123 (41) = happyShift action_36
action_123 (42) = happyShift action_37
action_123 (43) = happyShift action_12
action_123 (44) = happyShift action_38
action_123 (54) = happyShift action_13
action_123 (55) = happyShift action_39
action_123 (11) = happyGoto action_5
action_123 (12) = happyGoto action_6
action_123 (13) = happyGoto action_29
action_123 (16) = happyGoto action_30
action_123 _ = happyReduce_27

action_124 (30) = happyShift action_130
action_124 (35) = happyShift action_104
action_124 _ = happyFail (happyExpListPerState 124)

action_125 _ = happyReduce_6

action_126 (24) = happyShift action_31
action_126 (28) = happyShift action_32
action_126 (30) = happyShift action_33
action_126 (31) = happyShift action_129
action_126 (32) = happyShift action_10
action_126 (33) = happyShift action_11
action_126 (39) = happyShift action_34
action_126 (40) = happyShift action_35
action_126 (41) = happyShift action_36
action_126 (42) = happyShift action_37
action_126 (43) = happyShift action_12
action_126 (44) = happyShift action_38
action_126 (54) = happyShift action_13
action_126 (55) = happyShift action_39
action_126 (11) = happyGoto action_5
action_126 (12) = happyGoto action_6
action_126 (13) = happyGoto action_29
action_126 (16) = happyGoto action_30
action_126 _ = happyReduce_7

action_127 (24) = happyShift action_8
action_127 (28) = happyShift action_9
action_127 (32) = happyShift action_10
action_127 (33) = happyShift action_11
action_127 (43) = happyShift action_12
action_127 (54) = happyShift action_13
action_127 (11) = happyGoto action_5
action_127 (12) = happyGoto action_6
action_127 (13) = happyGoto action_128
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (24) = happyShift action_31
action_128 (28) = happyShift action_32
action_128 (30) = happyShift action_33
action_128 (32) = happyShift action_10
action_128 (33) = happyShift action_11
action_128 (39) = happyShift action_34
action_128 (40) = happyShift action_35
action_128 (41) = happyShift action_36
action_128 (42) = happyShift action_37
action_128 (43) = happyShift action_12
action_128 (44) = happyShift action_38
action_128 (45) = happyShift action_148
action_128 (54) = happyShift action_13
action_128 (55) = happyShift action_39
action_128 (11) = happyGoto action_5
action_128 (12) = happyGoto action_6
action_128 (13) = happyGoto action_29
action_128 (16) = happyGoto action_30
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (54) = happyShift action_147
action_129 (9) = happyGoto action_146
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (24) = happyShift action_8
action_130 (28) = happyShift action_9
action_130 (32) = happyShift action_10
action_130 (33) = happyShift action_11
action_130 (43) = happyShift action_12
action_130 (54) = happyShift action_13
action_130 (11) = happyGoto action_5
action_130 (12) = happyGoto action_6
action_130 (13) = happyGoto action_145
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (24) = happyShift action_8
action_131 (28) = happyShift action_9
action_131 (32) = happyShift action_10
action_131 (33) = happyShift action_11
action_131 (43) = happyShift action_12
action_131 (54) = happyShift action_13
action_131 (11) = happyGoto action_5
action_131 (12) = happyGoto action_6
action_131 (13) = happyGoto action_144
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (24) = happyShift action_15
action_132 (28) = happyShift action_16
action_132 (30) = happyShift action_53
action_132 (32) = happyShift action_17
action_132 (43) = happyShift action_18
action_132 (45) = happyShift action_143
action_132 (53) = happyShift action_19
action_132 (54) = happyShift action_20
action_132 (23) = happyGoto action_52
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (54) = happyShift action_142
action_133 (21) = happyGoto action_141
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (24) = happyShift action_15
action_134 (28) = happyShift action_16
action_134 (32) = happyShift action_17
action_134 (43) = happyShift action_18
action_134 (53) = happyShift action_19
action_134 (54) = happyShift action_20
action_134 (23) = happyGoto action_140
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (31) = happyShift action_139
action_135 (35) = happyShift action_104
action_135 _ = happyReduce_31

action_136 (35) = happyShift action_104
action_136 _ = happyReduce_41

action_137 _ = happyReduce_30

action_138 (29) = happyReduce_31
action_138 (31) = happyShift action_139
action_138 (35) = happyShift action_104
action_138 _ = happyReduce_16

action_139 (54) = happyShift action_94
action_139 (15) = happyGoto action_153
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (24) = happyShift action_15
action_140 (28) = happyShift action_16
action_140 (30) = happyShift action_53
action_140 (31) = happyShift action_152
action_140 (32) = happyShift action_17
action_140 (43) = happyShift action_18
action_140 (53) = happyShift action_19
action_140 (54) = happyShift action_20
action_140 (23) = happyGoto action_52
action_140 _ = happyReduce_54

action_141 _ = happyReduce_53

action_142 (46) = happyShift action_84
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (25) = happyShift action_151
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (24) = happyShift action_31
action_144 (28) = happyShift action_32
action_144 (30) = happyShift action_33
action_144 (31) = happyShift action_150
action_144 (32) = happyShift action_10
action_144 (33) = happyShift action_11
action_144 (39) = happyShift action_34
action_144 (40) = happyShift action_35
action_144 (41) = happyShift action_36
action_144 (42) = happyShift action_37
action_144 (43) = happyShift action_12
action_144 (44) = happyShift action_38
action_144 (54) = happyShift action_13
action_144 (55) = happyShift action_39
action_144 (11) = happyGoto action_5
action_144 (12) = happyGoto action_6
action_144 (13) = happyGoto action_29
action_144 (16) = happyGoto action_30
action_144 _ = happyReduce_9

action_145 (24) = happyShift action_31
action_145 (28) = happyShift action_32
action_145 (30) = happyShift action_33
action_145 (32) = happyShift action_10
action_145 (33) = happyShift action_11
action_145 (39) = happyShift action_34
action_145 (40) = happyShift action_35
action_145 (41) = happyShift action_36
action_145 (42) = happyShift action_37
action_145 (43) = happyShift action_12
action_145 (44) = happyShift action_38
action_145 (54) = happyShift action_13
action_145 (55) = happyShift action_39
action_145 (11) = happyGoto action_5
action_145 (12) = happyGoto action_6
action_145 (13) = happyGoto action_29
action_145 (16) = happyGoto action_30
action_145 _ = happyReduce_19

action_146 _ = happyReduce_8

action_147 (46) = happyShift action_69
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (34) = happyShift action_149
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (24) = happyShift action_78
action_149 (28) = happyShift action_79
action_149 (39) = happyShift action_34
action_149 (40) = happyShift action_35
action_149 (41) = happyShift action_36
action_149 (42) = happyShift action_37
action_149 (44) = happyShift action_38
action_149 (55) = happyShift action_39
action_149 (16) = happyGoto action_156
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (54) = happyShift action_122
action_150 (10) = happyGoto action_155
action_150 _ = happyFail (happyExpListPerState 150)

action_151 _ = happyReduce_66

action_152 (54) = happyShift action_116
action_152 (22) = happyGoto action_154
action_152 _ = happyFail (happyExpListPerState 152)

action_153 _ = happyReduce_32

action_154 _ = happyReduce_55

action_155 _ = happyReduce_10

action_156 (25) = happyShift action_157
action_156 (35) = happyShift action_104
action_156 _ = happyFail (happyExpListPerState 156)

action_157 _ = happyReduce_11

happyReduce_4 = happySpecReduce_1  7 happyReduction_4
happyReduction_4 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  8 happyReduction_5
happyReduction_5 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  8 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  9 happyReduction_7
happyReduction_7 (HappyAbsSyn13  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn9
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 5 9 happyReduction_8
happyReduction_8 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_3  10 happyReduction_9
happyReduction_9 (HappyAbsSyn13  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn10
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happyReduce 5 10 happyReduction_10
happyReduction_10 ((HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 9 11 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Inj happy_var_3 happy_var_5 happy_var_8
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_1  12 happyReduction_12
happyReduction_12 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn12
		 (string2Name happy_var_1 :: TmName
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  12 happyReduction_13
happyReduction_13 (HappyTerminal (Num happy_var_2))
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn12
		 (makeName happy_var_1 (toInteger happy_var_2) :: TmName
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  13 happyReduction_14
happyReduction_14 _
	_
	 =  HappyAbsSyn13
		 (U
	)

happyReduce_15 = happySpecReduce_3  13 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  13 happyReduction_16
happyReduction_16 (HappyAbsSyn16  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn13
		 (C happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  13 happyReduction_17
happyReduction_17 (HappyTerminal (Num happy_var_2))
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn13
		 (V (makeName happy_var_1 (toInteger happy_var_2) :: TmName)
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  13 happyReduction_18
happyReduction_18 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn13
		 (V happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happyReduce 6 13 happyReduction_19
happyReduction_19 ((HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (L (bind (happy_var_2, Embed happy_var_4) happy_var_6)
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_3  13 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (T happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  13 happyReduction_21
happyReduction_21 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (P happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_2  13 happyReduction_22
happyReduction_22 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (A happy_var_1 happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  13 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (R happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  13 happyReduction_24
happyReduction_24 (HappyTerminal (ID happy_var_3))
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (F happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  13 happyReduction_25
happyReduction_25 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happyReduce 4 13 happyReduction_26
happyReduction_26 ((HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Case happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 4 13 happyReduction_27
happyReduction_27 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TyID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (TyL (bind (string2Name happy_var_2 :: TyName) happy_var_4)
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_2  13 happyReduction_28
happyReduction_28 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (TyA happy_var_1 happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  14 happyReduction_29
happyReduction_29 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn14
		 ([happy_var_1]
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1 : happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  15 happyReduction_31
happyReduction_31 (HappyAbsSyn16  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn15
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 5 15 happyReduction_32
happyReduction_32 ((HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_33 = happySpecReduce_3  16 happyReduction_33
happyReduction_33 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  16 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn16
		 (INT
	)

happyReduce_35 = happySpecReduce_1  16 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn16
		 (BOOL
	)

happyReduce_36 = happySpecReduce_1  16 happyReduction_36
happyReduction_36 (HappyTerminal (TyID happy_var_1))
	 =  HappyAbsSyn16
		 (TyVar (string2Name happy_var_1 :: TyName)
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  16 happyReduction_37
happyReduction_37 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Arr happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  16 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Prod happy_var_2
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  16 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Rec happy_var_2
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  16 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Var happy_var_2
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happyReduce 4 16 happyReduction_41
happyReduction_41 ((HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TyID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Poly (bind (string2Name happy_var_2 :: TyName) happy_var_4)
	) `HappyStk` happyRest

happyReduce_42 = happySpecReduce_1  16 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn16
		 (Unit
	)

happyReduce_43 = happySpecReduce_1  17 happyReduction_43
happyReduction_43 (HappyTerminal (TyID happy_var_1))
	 =  HappyAbsSyn17
		 ([(string2Name happy_var_1 :: TyName)]
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  17 happyReduction_44
happyReduction_44 (HappyAbsSyn17  happy_var_3)
	_
	(HappyTerminal (TyID happy_var_1))
	 =  HappyAbsSyn17
		 ((string2Name happy_var_1 :: TyName) : happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  17 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn17
		 ([]
	)

happyReduce_46 = happySpecReduce_1  18 happyReduction_46
happyReduction_46 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 ([happy_var_1]
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  18 happyReduction_47
happyReduction_47 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1 : happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  18 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn18
		 ([]
	)

happyReduce_49 = happySpecReduce_3  19 happyReduction_49
happyReduction_49 (HappyAbsSyn16  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn19
		 (((string2Name happy_var_1 :: TmName),happy_var_3)
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  20 happyReduction_50
happyReduction_50 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn20
		 ([happy_var_1]
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  20 happyReduction_51
happyReduction_51 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_1 : happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  21 happyReduction_52
happyReduction_52 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn21
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happyReduce 5 21 happyReduction_53
happyReduction_53 ((HappyAbsSyn21  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_54 = happySpecReduce_3  22 happyReduction_54
happyReduction_54 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn22
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happyReduce 5 22 happyReduction_55
happyReduction_55 ((HappyAbsSyn22  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_56 = happySpecReduce_2  23 happyReduction_56
happyReduction_56 _
	_
	 =  HappyAbsSyn23
		 (U
	)

happyReduce_57 = happySpecReduce_3  23 happyReduction_57
happyReduction_57 _
	(HappyAbsSyn23  happy_var_2)
	_
	 =  HappyAbsSyn23
		 (happy_var_2
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  23 happyReduction_58
happyReduction_58 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn23
		 (V (string2Name happy_var_1 :: TmName)
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  23 happyReduction_59
happyReduction_59 (HappyTerminal (Num happy_var_1))
	 =  HappyAbsSyn23
		 (N happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happyReduce 4 23 happyReduction_60
happyReduction_60 ((HappyAbsSyn23  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (L (bind ((string2Name happy_var_2 :: TmName), Embed Unit) happy_var_4)
	) `HappyStk` happyRest

happyReduce_61 = happySpecReduce_3  23 happyReduction_61
happyReduction_61 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn23
		 (T happy_var_2
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  23 happyReduction_62
happyReduction_62 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (P happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_2  23 happyReduction_63
happyReduction_63 (HappyAbsSyn23  happy_var_2)
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (A happy_var_1 happy_var_2
	)
happyReduction_63 _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  23 happyReduction_64
happyReduction_64 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn23
		 (R happy_var_2
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  23 happyReduction_65
happyReduction_65 (HappyTerminal (ID happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (F happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happyReduce 7 23 happyReduction_66
happyReduction_66 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (Inj happy_var_3 happy_var_5 Unit
	) `HappyStk` happyRest

happyReduce_67 = happyReduce 4 23 happyReduction_67
happyReduction_67 ((HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (Case happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 56 56 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	LPar -> cont 24;
	RPar -> cont 25;
	LSBracket -> cont 26;
	RSBracket -> cont 27;
	LBrace -> cont 28;
	RBrace -> cont 29;
	TDot -> cont 30;
	TCom -> cont 31;
	TLam -> cont 32;
	TLLam -> cont 33;
	TCol -> cont 34;
	TArrow -> cont 35;
	TLArrow -> cont 36;
	TPlus -> cont 37;
	TMinus -> cont 38;
	TAll -> cont 39;
	TINT -> cont 40;
	TBOOL -> cont 41;
	TUNIT -> cont 42;
	TCase -> cont 43;
	LAngle -> cont 44;
	RAngle -> cont 45;
	TEqual -> cont 46;
	TOf -> cont 47;
	Empty -> cont 48;
	TSucc -> cont 49;
	TPred -> cont 50;
	TTrue -> cont 51;
	TFalse -> cont 52;
	Num happy_dollar_dollar -> cont 53;
	ID happy_dollar_dollar -> cont 54;
	TyID happy_dollar_dollar -> cont 55;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 56 tk tks = happyError' (tks, explist)
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
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn13 z -> happyReturn z; _other -> notHappyAtAll })

happyParseTypeContext tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn17 z -> happyReturn z; _other -> notHappyAtAll })

happyParseEnv tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn18 z -> happyReturn z; _other -> notHappyAtAll })

happyParseTerm tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn23 z -> happyReturn z; _other -> notHappyAtAll })

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
