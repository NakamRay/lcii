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
happyExpList = Happy_Data_Array.listArray (0,379) ([0,16580,40,0,768,0,4352,16,0,33160,80,0,0,0,27136,14248,0,816,417,0,2048,0,0,64,0,2048,0,0,4096,0,34816,20609,0,1344,4,0,8226,0,0,256,0,8192,0,0,0,0,0,1,0,0,0,0,512,0,16384,62733,6,0,0,0,2048,0,32768,59929,13,0,192,0,0,2,0,64,0,0,0,0,0,0,0,0,0,0,256,0,128,2282,0,24576,0,8192,14976,2,1024,0,0,33016,0,0,0,0,0,64,0,17232,2493,0,0,2,0,0,1,32800,570,0,4,0,0,2,0,4032,1781,0,0,0,0,256,0,0,8192,0,0,0,8192,16902,1,256,4564,0,33160,80,0,32,0,512,9128,0,0,0,32768,2072,5,0,0,0,0,2,0,0,0,0,0,0,1088,4,0,8226,0,0,8,0,0,0,0,0,0,0,16,0,0,8192,0,512,0,0,1,0,0,0,0,0,0,0,1,0,8192,2,0,0,2,0,54273,17,0,0,0,4096,4096,0,43010,35,0,0,0,128,2282,0,20484,71,0,0,0,0,0,0,16,0,16384,1031,0,0,0,0,4096,0,32768,59934,13,0,0,0,4224,0,0,2,0,59392,56993,0,3136,644,0,43114,119,4096,41219,0,0,0,0,16580,40,0,512,0,12544,2576,0,32904,0,0,0,0,4096,1,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,128,2282,0,16384,0,0,0,0,0,0,0,1040,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParseExp","%start_happyParseEnv","%start_happyParseTerm","Start","exps","recExps","caseExps","inj","exp","prod","sum","type","env","decl","terms","term","'('","')'","'.'","','","'\955'","'\923'","':'","'->'","'=>'","'+'","'\8704'","'Empty'","ID","NUM","INT","BOOL","UNIT","'{'","'}'","'case'","'<'","'>'","'='","'of'","%eof"]
        bit_start = st * 43
        bit_end = (st + 1) * 43
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..42]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (19) = happyShift action_6
action_0 (23) = happyShift action_7
action_0 (24) = happyShift action_8
action_0 (31) = happyShift action_9
action_0 (36) = happyShift action_10
action_0 (38) = happyShift action_11
action_0 (10) = happyGoto action_4
action_0 (11) = happyGoto action_20
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (30) = happyShift action_18
action_1 (31) = happyShift action_19
action_1 (15) = happyGoto action_16
action_1 (16) = happyGoto action_17
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (19) = happyShift action_13
action_2 (23) = happyShift action_14
action_2 (31) = happyShift action_15
action_2 (18) = happyGoto action_12
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (19) = happyShift action_6
action_3 (23) = happyShift action_7
action_3 (24) = happyShift action_8
action_3 (31) = happyShift action_9
action_3 (36) = happyShift action_10
action_3 (38) = happyShift action_11
action_3 (10) = happyGoto action_4
action_3 (11) = happyGoto action_5
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_22

action_5 (19) = happyShift action_23
action_5 (21) = happyShift action_24
action_5 (23) = happyShift action_7
action_5 (24) = happyShift action_8
action_5 (29) = happyShift action_25
action_5 (31) = happyShift action_26
action_5 (33) = happyShift action_27
action_5 (34) = happyShift action_28
action_5 (35) = happyShift action_29
action_5 (36) = happyShift action_10
action_5 (38) = happyShift action_11
action_5 (39) = happyShift action_30
action_5 (10) = happyGoto action_4
action_5 (11) = happyGoto action_21
action_5 (14) = happyGoto action_22
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (19) = happyShift action_6
action_6 (20) = happyShift action_45
action_6 (23) = happyShift action_7
action_6 (24) = happyShift action_8
action_6 (31) = happyShift action_9
action_6 (36) = happyShift action_10
action_6 (38) = happyShift action_11
action_6 (39) = happyShift action_46
action_6 (10) = happyGoto action_4
action_6 (11) = happyGoto action_44
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (31) = happyShift action_43
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (31) = happyShift action_42
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (25) = happyShift action_41
action_9 _ = happyReduce_15

action_10 (31) = happyShift action_40
action_10 (8) = happyGoto action_39
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (19) = happyShift action_6
action_11 (23) = happyShift action_7
action_11 (24) = happyShift action_8
action_11 (31) = happyShift action_9
action_11 (36) = happyShift action_10
action_11 (38) = happyShift action_11
action_11 (10) = happyGoto action_4
action_11 (11) = happyGoto action_38
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (19) = happyShift action_13
action_12 (21) = happyShift action_37
action_12 (23) = happyShift action_14
action_12 (31) = happyShift action_15
action_12 (43) = happyAccept
action_12 (18) = happyGoto action_36
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (19) = happyShift action_13
action_13 (23) = happyShift action_14
action_13 (31) = happyShift action_15
action_13 (18) = happyGoto action_35
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (31) = happyShift action_34
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (25) = happyShift action_33
action_15 _ = happyReduce_46

action_16 (43) = happyAccept
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (22) = happyShift action_32
action_17 _ = happyReduce_38

action_18 _ = happyReduce_40

action_19 (25) = happyShift action_31
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (19) = happyShift action_23
action_20 (21) = happyShift action_24
action_20 (23) = happyShift action_7
action_20 (24) = happyShift action_8
action_20 (29) = happyShift action_25
action_20 (31) = happyShift action_26
action_20 (33) = happyShift action_27
action_20 (34) = happyShift action_28
action_20 (35) = happyShift action_29
action_20 (36) = happyShift action_10
action_20 (38) = happyShift action_11
action_20 (39) = happyShift action_30
action_20 (43) = happyAccept
action_20 (10) = happyGoto action_4
action_20 (11) = happyGoto action_21
action_20 (14) = happyGoto action_22
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (21) = happyShift action_24
action_21 (23) = happyShift action_7
action_21 (24) = happyShift action_8
action_21 (29) = happyShift action_25
action_21 (33) = happyShift action_27
action_21 (34) = happyShift action_28
action_21 (35) = happyShift action_29
action_21 (36) = happyShift action_10
action_21 (38) = happyShift action_11
action_21 (39) = happyShift action_30
action_21 (10) = happyGoto action_4
action_21 (11) = happyGoto action_21
action_21 (14) = happyGoto action_22
action_21 _ = happyReduce_19

action_22 (26) = happyShift action_74
action_22 _ = happyReduce_25

action_23 (19) = happyShift action_23
action_23 (20) = happyShift action_45
action_23 (23) = happyShift action_7
action_23 (24) = happyShift action_8
action_23 (29) = happyShift action_25
action_23 (31) = happyShift action_26
action_23 (33) = happyShift action_27
action_23 (34) = happyShift action_28
action_23 (35) = happyShift action_29
action_23 (36) = happyShift action_10
action_23 (38) = happyShift action_11
action_23 (39) = happyShift action_73
action_23 (10) = happyGoto action_4
action_23 (11) = happyGoto action_44
action_23 (12) = happyGoto action_71
action_23 (14) = happyGoto action_72
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (31) = happyShift action_69
action_24 (32) = happyShift action_70
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (31) = happyShift action_68
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (19) = happyReduce_15
action_26 (20) = happyReduce_15
action_26 (21) = happyReduce_15
action_26 (22) = happyReduce_15
action_26 (23) = happyReduce_15
action_26 (24) = happyReduce_15
action_26 (25) = happyShift action_41
action_26 (29) = happyReduce_15
action_26 (31) = happyReduce_15
action_26 (33) = happyReduce_15
action_26 (34) = happyReduce_15
action_26 (35) = happyReduce_15
action_26 (36) = happyReduce_15
action_26 (37) = happyReduce_15
action_26 (38) = happyReduce_15
action_26 (39) = happyReduce_15
action_26 (40) = happyReduce_15
action_26 (42) = happyReduce_15
action_26 (43) = happyReduce_15
action_26 _ = happyReduce_32

action_27 _ = happyReduce_30

action_28 _ = happyReduce_31

action_29 _ = happyReduce_37

action_30 (31) = happyShift action_67
action_30 (13) = happyGoto action_66
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (19) = happyShift action_53
action_31 (29) = happyShift action_25
action_31 (31) = happyShift action_63
action_31 (33) = happyShift action_27
action_31 (34) = happyShift action_28
action_31 (35) = happyShift action_29
action_31 (39) = happyShift action_30
action_31 (14) = happyGoto action_65
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (30) = happyShift action_18
action_32 (31) = happyShift action_19
action_32 (15) = happyGoto action_64
action_32 (16) = happyGoto action_17
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (19) = happyShift action_53
action_33 (29) = happyShift action_25
action_33 (31) = happyShift action_63
action_33 (33) = happyShift action_27
action_33 (34) = happyShift action_28
action_33 (35) = happyShift action_29
action_33 (39) = happyShift action_30
action_33 (14) = happyGoto action_62
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (21) = happyShift action_61
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (19) = happyShift action_13
action_35 (20) = happyShift action_59
action_35 (21) = happyShift action_37
action_35 (22) = happyShift action_60
action_35 (23) = happyShift action_14
action_35 (31) = happyShift action_15
action_35 (18) = happyGoto action_36
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (21) = happyShift action_37
action_36 (23) = happyShift action_14
action_36 (18) = happyGoto action_36
action_36 _ = happyReduce_50

action_37 (32) = happyShift action_58
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (19) = happyShift action_23
action_38 (21) = happyShift action_24
action_38 (23) = happyShift action_7
action_38 (24) = happyShift action_8
action_38 (29) = happyShift action_25
action_38 (31) = happyShift action_26
action_38 (33) = happyShift action_27
action_38 (34) = happyShift action_28
action_38 (35) = happyShift action_29
action_38 (36) = happyShift action_10
action_38 (38) = happyShift action_11
action_38 (39) = happyShift action_30
action_38 (42) = happyShift action_57
action_38 (10) = happyGoto action_4
action_38 (11) = happyGoto action_21
action_38 (14) = happyGoto action_22
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (37) = happyShift action_56
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (41) = happyShift action_55
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (19) = happyShift action_53
action_41 (29) = happyShift action_25
action_41 (31) = happyShift action_54
action_41 (33) = happyShift action_27
action_41 (34) = happyShift action_28
action_41 (35) = happyShift action_29
action_41 (39) = happyShift action_30
action_41 (14) = happyGoto action_52
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (21) = happyShift action_51
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (25) = happyShift action_50
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (19) = happyShift action_23
action_44 (20) = happyShift action_48
action_44 (21) = happyShift action_24
action_44 (22) = happyShift action_49
action_44 (23) = happyShift action_7
action_44 (24) = happyShift action_8
action_44 (29) = happyShift action_25
action_44 (31) = happyShift action_26
action_44 (33) = happyShift action_27
action_44 (34) = happyShift action_28
action_44 (35) = happyShift action_29
action_44 (36) = happyShift action_10
action_44 (38) = happyShift action_11
action_44 (39) = happyShift action_30
action_44 (10) = happyGoto action_4
action_44 (11) = happyGoto action_21
action_44 (14) = happyGoto action_22
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_11

action_46 (31) = happyShift action_47
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (41) = happyShift action_92
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_12

action_49 (19) = happyShift action_6
action_49 (23) = happyShift action_7
action_49 (24) = happyShift action_8
action_49 (31) = happyShift action_9
action_49 (36) = happyShift action_10
action_49 (38) = happyShift action_11
action_49 (7) = happyGoto action_90
action_49 (10) = happyGoto action_4
action_49 (11) = happyGoto action_91
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (19) = happyShift action_53
action_50 (29) = happyShift action_25
action_50 (31) = happyShift action_63
action_50 (33) = happyShift action_27
action_50 (34) = happyShift action_28
action_50 (35) = happyShift action_29
action_50 (39) = happyShift action_30
action_50 (14) = happyGoto action_89
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (19) = happyShift action_6
action_51 (23) = happyShift action_7
action_51 (24) = happyShift action_8
action_51 (31) = happyShift action_9
action_51 (36) = happyShift action_10
action_51 (38) = happyShift action_11
action_51 (10) = happyGoto action_4
action_51 (11) = happyGoto action_88
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (26) = happyShift action_74
action_52 _ = happyReduce_13

action_53 (19) = happyShift action_53
action_53 (29) = happyShift action_25
action_53 (31) = happyShift action_63
action_53 (33) = happyShift action_27
action_53 (34) = happyShift action_28
action_53 (35) = happyShift action_29
action_53 (39) = happyShift action_30
action_53 (12) = happyGoto action_71
action_53 (14) = happyGoto action_72
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (19) = happyReduce_14
action_54 (20) = happyReduce_14
action_54 (21) = happyReduce_14
action_54 (22) = happyReduce_14
action_54 (23) = happyReduce_14
action_54 (24) = happyReduce_14
action_54 (29) = happyReduce_14
action_54 (31) = happyReduce_14
action_54 (33) = happyReduce_14
action_54 (34) = happyReduce_14
action_54 (35) = happyReduce_14
action_54 (36) = happyReduce_14
action_54 (37) = happyReduce_14
action_54 (38) = happyReduce_14
action_54 (39) = happyReduce_14
action_54 (40) = happyReduce_14
action_54 (42) = happyReduce_14
action_54 (43) = happyReduce_14
action_54 _ = happyReduce_32

action_55 (19) = happyShift action_6
action_55 (23) = happyShift action_7
action_55 (24) = happyShift action_8
action_55 (31) = happyShift action_9
action_55 (36) = happyShift action_10
action_55 (38) = happyShift action_11
action_55 (10) = happyGoto action_4
action_55 (11) = happyGoto action_87
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_20

action_57 (31) = happyShift action_86
action_57 (9) = happyGoto action_85
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_49

action_59 _ = happyReduce_44

action_60 (19) = happyShift action_13
action_60 (23) = happyShift action_14
action_60 (31) = happyShift action_15
action_60 (17) = happyGoto action_83
action_60 (18) = happyGoto action_84
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (19) = happyShift action_13
action_61 (23) = happyShift action_14
action_61 (31) = happyShift action_15
action_61 (18) = happyGoto action_82
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (26) = happyShift action_74
action_62 _ = happyReduce_45

action_63 _ = happyReduce_32

action_64 _ = happyReduce_39

action_65 (26) = happyShift action_74
action_65 _ = happyReduce_41

action_66 (40) = happyShift action_81
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (25) = happyShift action_80
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (21) = happyShift action_79
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_21

action_70 _ = happyReduce_18

action_71 (20) = happyShift action_78
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (22) = happyShift action_77
action_72 (26) = happyShift action_74
action_72 _ = happyReduce_26

action_73 (31) = happyShift action_76
action_73 (13) = happyGoto action_66
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (19) = happyShift action_53
action_74 (29) = happyShift action_25
action_74 (31) = happyShift action_63
action_74 (33) = happyShift action_27
action_74 (34) = happyShift action_28
action_74 (35) = happyShift action_29
action_74 (39) = happyShift action_30
action_74 (14) = happyGoto action_75
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (26) = happyShift action_74
action_75 _ = happyReduce_33

action_76 (25) = happyShift action_80
action_76 (41) = happyShift action_92
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (19) = happyShift action_53
action_77 (29) = happyShift action_25
action_77 (31) = happyShift action_63
action_77 (33) = happyShift action_27
action_77 (34) = happyShift action_28
action_77 (35) = happyShift action_29
action_77 (39) = happyShift action_30
action_77 (12) = happyGoto action_103
action_77 (14) = happyGoto action_72
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_34

action_79 (19) = happyShift action_53
action_79 (29) = happyShift action_25
action_79 (31) = happyShift action_63
action_79 (33) = happyShift action_27
action_79 (34) = happyShift action_28
action_79 (35) = happyShift action_29
action_79 (39) = happyShift action_30
action_79 (14) = happyGoto action_102
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (19) = happyShift action_53
action_80 (29) = happyShift action_25
action_80 (31) = happyShift action_63
action_80 (33) = happyShift action_27
action_80 (34) = happyShift action_28
action_80 (35) = happyShift action_29
action_80 (39) = happyShift action_30
action_80 (14) = happyGoto action_101
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_35

action_82 (19) = happyShift action_13
action_82 (21) = happyShift action_37
action_82 (23) = happyShift action_14
action_82 (31) = happyShift action_15
action_82 (18) = happyGoto action_36
action_82 _ = happyReduce_47

action_83 (20) = happyShift action_100
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (19) = happyShift action_13
action_84 (21) = happyShift action_37
action_84 (22) = happyShift action_99
action_84 (23) = happyShift action_14
action_84 (31) = happyShift action_15
action_84 (18) = happyGoto action_36
action_84 _ = happyReduce_42

action_85 _ = happyReduce_23

action_86 (27) = happyShift action_98
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (19) = happyShift action_23
action_87 (21) = happyShift action_24
action_87 (22) = happyShift action_97
action_87 (23) = happyShift action_7
action_87 (24) = happyShift action_8
action_87 (29) = happyShift action_25
action_87 (31) = happyShift action_26
action_87 (33) = happyShift action_27
action_87 (34) = happyShift action_28
action_87 (35) = happyShift action_29
action_87 (36) = happyShift action_10
action_87 (38) = happyShift action_11
action_87 (39) = happyShift action_30
action_87 (10) = happyGoto action_4
action_87 (11) = happyGoto action_21
action_87 (14) = happyGoto action_22
action_87 _ = happyReduce_6

action_88 (19) = happyShift action_23
action_88 (21) = happyShift action_24
action_88 (23) = happyShift action_7
action_88 (24) = happyShift action_8
action_88 (29) = happyShift action_25
action_88 (31) = happyShift action_26
action_88 (33) = happyShift action_27
action_88 (34) = happyShift action_28
action_88 (35) = happyShift action_29
action_88 (36) = happyShift action_10
action_88 (38) = happyShift action_11
action_88 (39) = happyShift action_30
action_88 (10) = happyGoto action_4
action_88 (11) = happyGoto action_21
action_88 (14) = happyGoto action_22
action_88 _ = happyReduce_24

action_89 (21) = happyShift action_96
action_89 (26) = happyShift action_74
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (20) = happyShift action_95
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (19) = happyShift action_23
action_91 (21) = happyShift action_24
action_91 (22) = happyShift action_94
action_91 (23) = happyShift action_7
action_91 (24) = happyShift action_8
action_91 (29) = happyShift action_25
action_91 (31) = happyShift action_26
action_91 (33) = happyShift action_27
action_91 (34) = happyShift action_28
action_91 (35) = happyShift action_29
action_91 (36) = happyShift action_10
action_91 (38) = happyShift action_11
action_91 (39) = happyShift action_30
action_91 (10) = happyGoto action_4
action_91 (11) = happyGoto action_21
action_91 (14) = happyGoto action_22
action_91 _ = happyReduce_4

action_92 (19) = happyShift action_6
action_92 (23) = happyShift action_7
action_92 (24) = happyShift action_8
action_92 (31) = happyShift action_9
action_92 (36) = happyShift action_10
action_92 (38) = happyShift action_11
action_92 (10) = happyGoto action_4
action_92 (11) = happyGoto action_93
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (19) = happyShift action_23
action_93 (21) = happyShift action_24
action_93 (23) = happyShift action_7
action_93 (24) = happyShift action_8
action_93 (29) = happyShift action_25
action_93 (31) = happyShift action_26
action_93 (33) = happyShift action_27
action_93 (34) = happyShift action_28
action_93 (35) = happyShift action_29
action_93 (36) = happyShift action_10
action_93 (38) = happyShift action_11
action_93 (39) = happyShift action_30
action_93 (40) = happyShift action_110
action_93 (10) = happyGoto action_4
action_93 (11) = happyGoto action_21
action_93 (14) = happyGoto action_22
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (19) = happyShift action_6
action_94 (23) = happyShift action_7
action_94 (24) = happyShift action_8
action_94 (31) = happyShift action_9
action_94 (36) = happyShift action_10
action_94 (38) = happyShift action_11
action_94 (7) = happyGoto action_109
action_94 (10) = happyGoto action_4
action_94 (11) = happyGoto action_91
action_94 _ = happyFail (happyExpListPerState 94)

action_95 _ = happyReduce_17

action_96 (19) = happyShift action_6
action_96 (23) = happyShift action_7
action_96 (24) = happyShift action_8
action_96 (31) = happyShift action_9
action_96 (36) = happyShift action_10
action_96 (38) = happyShift action_11
action_96 (10) = happyGoto action_4
action_96 (11) = happyGoto action_108
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (31) = happyShift action_40
action_97 (8) = happyGoto action_107
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (19) = happyShift action_6
action_98 (23) = happyShift action_7
action_98 (24) = happyShift action_8
action_98 (31) = happyShift action_9
action_98 (36) = happyShift action_10
action_98 (38) = happyShift action_11
action_98 (10) = happyGoto action_4
action_98 (11) = happyGoto action_106
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (19) = happyShift action_13
action_99 (23) = happyShift action_14
action_99 (31) = happyShift action_15
action_99 (17) = happyGoto action_105
action_99 (18) = happyGoto action_84
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_48

action_101 (22) = happyShift action_104
action_101 (26) = happyShift action_74
action_101 _ = happyReduce_28

action_102 (26) = happyShift action_74
action_102 _ = happyReduce_36

action_103 _ = happyReduce_27

action_104 (31) = happyShift action_67
action_104 (13) = happyGoto action_113
action_104 _ = happyFail (happyExpListPerState 104)

action_105 _ = happyReduce_43

action_106 (19) = happyShift action_23
action_106 (21) = happyShift action_24
action_106 (22) = happyShift action_112
action_106 (23) = happyShift action_7
action_106 (24) = happyShift action_8
action_106 (29) = happyShift action_25
action_106 (31) = happyShift action_26
action_106 (33) = happyShift action_27
action_106 (34) = happyShift action_28
action_106 (35) = happyShift action_29
action_106 (36) = happyShift action_10
action_106 (38) = happyShift action_11
action_106 (39) = happyShift action_30
action_106 (10) = happyGoto action_4
action_106 (11) = happyGoto action_21
action_106 (14) = happyGoto action_22
action_106 _ = happyReduce_8

action_107 _ = happyReduce_7

action_108 (19) = happyShift action_23
action_108 (21) = happyShift action_24
action_108 (23) = happyShift action_7
action_108 (24) = happyShift action_8
action_108 (29) = happyShift action_25
action_108 (31) = happyShift action_26
action_108 (33) = happyShift action_27
action_108 (34) = happyShift action_28
action_108 (35) = happyShift action_29
action_108 (36) = happyShift action_10
action_108 (38) = happyShift action_11
action_108 (39) = happyShift action_30
action_108 (10) = happyGoto action_4
action_108 (11) = happyGoto action_21
action_108 (14) = happyGoto action_22
action_108 _ = happyReduce_16

action_109 _ = happyReduce_5

action_110 (25) = happyShift action_111
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (19) = happyShift action_53
action_111 (29) = happyShift action_25
action_111 (31) = happyShift action_63
action_111 (33) = happyShift action_27
action_111 (34) = happyShift action_28
action_111 (35) = happyShift action_29
action_111 (39) = happyShift action_30
action_111 (14) = happyGoto action_115
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (31) = happyShift action_86
action_112 (9) = happyGoto action_114
action_112 _ = happyFail (happyExpListPerState 112)

action_113 _ = happyReduce_29

action_114 _ = happyReduce_9

action_115 (20) = happyShift action_116
action_115 (26) = happyShift action_74
action_115 _ = happyFail (happyExpListPerState 115)

action_116 _ = happyReduce_10

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

happyReduce_14 = happySpecReduce_3  11 happyReduction_14
happyReduction_14 (HappyTerminal (ID happy_var_3))
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn11
		 (C happy_var_1 (TyVar happy_var_3)
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  11 happyReduction_15
happyReduction_15 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn11
		 (V happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happyReduce 6 11 happyReduction_16
happyReduction_16 ((HappyAbsSyn11  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (L happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 5 11 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (T (happy_var_2 : happy_var_4)
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_3  11 happyReduction_18
happyReduction_18 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (P happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  11 happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (A happy_var_1 happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  11 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (R happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  11 happyReduction_21
happyReduction_21 (HappyTerminal (ID happy_var_3))
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (F happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happyReduce 4 11 happyReduction_23
happyReduction_23 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Case happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 4 11 happyReduction_24
happyReduction_24 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (TyL happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_2  11 happyReduction_25
happyReduction_25 (HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (TyA happy_var_1 happy_var_2
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  12 happyReduction_26
happyReduction_26 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  12 happyReduction_27
happyReduction_27 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  13 happyReduction_28
happyReduction_28 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn13
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happyReduce 5 13 happyReduction_29
happyReduction_29 ((HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 ((happy_var_1, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_1  14 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn14
		 (INT
	)

happyReduce_31 = happySpecReduce_1  14 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn14
		 (BOOL
	)

happyReduce_32 = happySpecReduce_1  14 happyReduction_32
happyReduction_32 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn14
		 (TyVar happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  14 happyReduction_33
happyReduction_33 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1 :=> happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  14 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Prod happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  14 happyReduction_35
happyReduction_35 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Var happy_var_2
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happyReduce 4 14 happyReduction_36
happyReduction_36 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Poly happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_1  14 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn14
		 (Unit
	)

happyReduce_38 = happySpecReduce_1  15 happyReduction_38
happyReduction_38 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 ([happy_var_1]
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  15 happyReduction_39
happyReduction_39 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 : happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  15 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn15
		 ([]
	)

happyReduce_41 = happySpecReduce_3  16 happyReduction_41
happyReduction_41 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn16
		 ((happy_var_1,happy_var_3)
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  17 happyReduction_42
happyReduction_42 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 ([happy_var_1]
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  17 happyReduction_43
happyReduction_43 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1 : happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  18 happyReduction_44
happyReduction_44 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  18 happyReduction_45
happyReduction_45 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn18
		 (C happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  18 happyReduction_46
happyReduction_46 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn18
		 (V happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happyReduce 4 18 happyReduction_47
happyReduction_47 ((HappyAbsSyn18  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (L happy_var_2 INT happy_var_4
	) `HappyStk` happyRest

happyReduce_48 = happyReduce 5 18 happyReduction_48
happyReduction_48 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (T (happy_var_2 : happy_var_4)
	) `HappyStk` happyRest

happyReduce_49 = happySpecReduce_3  18 happyReduction_49
happyReduction_49 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (P happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_2  18 happyReduction_50
happyReduction_50 (HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (A happy_var_1 happy_var_2
	)
happyReduction_50 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 43 43 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	LPar -> cont 19;
	RPar -> cont 20;
	TDot -> cont 21;
	TCom -> cont 22;
	TLam -> cont 23;
	TLLam -> cont 24;
	TCol -> cont 25;
	TArrow -> cont 26;
	TLArrow -> cont 27;
	TPlus -> cont 28;
	TAll -> cont 29;
	Empty -> cont 30;
	ID happy_dollar_dollar -> cont 31;
	Num happy_dollar_dollar -> cont 32;
	TINT -> cont 33;
	TBOOL -> cont 34;
	TUNIT -> cont 35;
	LBrace -> cont 36;
	RBrace -> cont 37;
	TCase -> cont 38;
	LAngle -> cont 39;
	RAngle -> cont 40;
	TEqual -> cont 41;
	TOf -> cont 42;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 43 tk tks = happyError' (tks, explist)
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
