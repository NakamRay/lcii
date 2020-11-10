{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import DataType
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.11

data HappyAbsSyn t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20
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

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,405) ([0,12624,12416,0,0,16392,0,0,8200,0,4112,8192,0,12624,12416,0,0,0,0,13648,29172,0,12656,12672,0,12624,12416,0,0,8192,0,0,8192,0,0,16384,0,12624,12416,0,0,0,0,16384,0,0,5136,8192,0,4112,8192,0,0,8192,0,16384,0,0,0,0,0,2048,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,2048,0,0,13648,29172,0,0,0,0,32768,0,0,12656,29172,0,12624,29172,0,0,12288,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,16392,0,80,16756,0,0,8200,0,80,16756,0,1024,0,0,7216,8192,0,0,0,0,0,4096,0,80,24948,0,13648,31220,0,1024,0,0,16384,0,0,512,0,0,0,1024,0,128,0,0,15696,29172,0,13680,29172,0,0,0,0,0,8192,0,0,1024,0,0,0,0,12624,12416,0,0,0,0,12624,12416,0,0,0,0,80,16756,0,12624,12416,0,0,8192,0,32768,0,0,80,16756,0,80,16756,0,0,0,0,0,0,0,0,0,0,4112,8192,0,4112,8192,0,32768,0,0,0,0,0,32768,0,0,0,0,0,0,512,0,16384,0,0,1024,0,0,0,0,0,0,0,0,128,0,0,34816,0,0,32800,0,0,0,8192,0,80,16756,0,0,0,0,16384,1024,0,0,0,0,80,16756,0,0,0,0,80,16756,0,80,16756,0,0,0,0,0,0,0,32,0,0,7184,8192,0,0,0,0,0,1,0,0,0,0,33792,0,0,15696,29172,0,0,0,0,12624,12416,0,13648,29684,0,0,8192,0,12624,12416,0,12624,12416,0,4112,8192,0,0,0,0,34816,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,80,16756,0,0,8192,0,0,0,0,0,0,0,32800,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParseExp","%start_happyParseTypeContext","%start_happyParseEnv","%start_happyParseTerm","Start","exps","recExps","caseExps","inj","exp","prod","sum","type","typeContext","env","decl","terms","term","'('","')'","'['","']'","'{'","'}'","'.'","','","'\955'","'\923'","':'","'->'","'=>'","'+'","'\8704'","'Empty'","INT","BOOL","UNIT","'case'","'<'","'>'","'='","'of'","NUM","ID","TyID","%eof"]
        bit_start = st * 48
        bit_end = (st + 1) * 48
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..47]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (21) = happyShift action_7
action_0 (23) = happyShift action_8
action_0 (25) = happyShift action_9
action_0 (29) = happyShift action_10
action_0 (30) = happyShift action_11
action_0 (40) = happyShift action_12
action_0 (45) = happyShift action_13
action_0 (46) = happyShift action_14
action_0 (11) = happyGoto action_5
action_0 (12) = happyGoto action_26
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (36) = happyShift action_24
action_1 (47) = happyShift action_25
action_1 (16) = happyGoto action_23
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (36) = happyShift action_21
action_2 (46) = happyShift action_22
action_2 (17) = happyGoto action_19
action_2 (18) = happyGoto action_20
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (21) = happyShift action_16
action_3 (29) = happyShift action_17
action_3 (46) = happyShift action_18
action_3 (20) = happyGoto action_15
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (21) = happyShift action_7
action_4 (23) = happyShift action_8
action_4 (25) = happyShift action_9
action_4 (29) = happyShift action_10
action_4 (30) = happyShift action_11
action_4 (40) = happyShift action_12
action_4 (45) = happyShift action_13
action_4 (46) = happyShift action_14
action_4 (11) = happyGoto action_5
action_4 (12) = happyGoto action_6
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_24

action_6 (21) = happyShift action_29
action_6 (23) = happyShift action_30
action_6 (25) = happyShift action_9
action_6 (27) = happyShift action_31
action_6 (29) = happyShift action_10
action_6 (30) = happyShift action_11
action_6 (35) = happyShift action_32
action_6 (37) = happyShift action_33
action_6 (38) = happyShift action_34
action_6 (39) = happyShift action_35
action_6 (40) = happyShift action_12
action_6 (41) = happyShift action_36
action_6 (45) = happyShift action_13
action_6 (46) = happyShift action_14
action_6 (47) = happyShift action_37
action_6 (11) = happyGoto action_5
action_6 (12) = happyGoto action_27
action_6 (15) = happyGoto action_28
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (21) = happyShift action_7
action_7 (22) = happyShift action_55
action_7 (23) = happyShift action_8
action_7 (25) = happyShift action_9
action_7 (29) = happyShift action_10
action_7 (30) = happyShift action_11
action_7 (40) = happyShift action_12
action_7 (41) = happyShift action_56
action_7 (45) = happyShift action_13
action_7 (46) = happyShift action_14
action_7 (11) = happyGoto action_5
action_7 (12) = happyGoto action_54
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (21) = happyShift action_7
action_8 (23) = happyShift action_8
action_8 (25) = happyShift action_9
action_8 (29) = happyShift action_10
action_8 (30) = happyShift action_11
action_8 (40) = happyShift action_12
action_8 (45) = happyShift action_13
action_8 (46) = happyShift action_14
action_8 (8) = happyGoto action_52
action_8 (11) = happyGoto action_5
action_8 (12) = happyGoto action_53
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (46) = happyShift action_51
action_9 (9) = happyGoto action_50
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (46) = happyShift action_49
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (47) = happyShift action_48
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (21) = happyShift action_7
action_12 (23) = happyShift action_8
action_12 (25) = happyShift action_9
action_12 (29) = happyShift action_10
action_12 (30) = happyShift action_11
action_12 (40) = happyShift action_12
action_12 (45) = happyShift action_13
action_12 (46) = happyShift action_14
action_12 (11) = happyGoto action_5
action_12 (12) = happyGoto action_47
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_17

action_14 (31) = happyShift action_46
action_14 _ = happyReduce_16

action_15 (21) = happyShift action_16
action_15 (27) = happyShift action_45
action_15 (29) = happyShift action_17
action_15 (46) = happyShift action_18
action_15 (48) = happyAccept
action_15 (20) = happyGoto action_44
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (21) = happyShift action_16
action_16 (29) = happyShift action_17
action_16 (46) = happyShift action_18
action_16 (20) = happyGoto action_43
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (46) = happyShift action_42
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (31) = happyShift action_41
action_18 _ = happyReduce_52

action_19 (48) = happyAccept
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (28) = happyShift action_40
action_20 _ = happyReduce_44

action_21 _ = happyReduce_46

action_22 (31) = happyShift action_39
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (48) = happyAccept
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_43

action_25 (28) = happyShift action_38
action_25 _ = happyReduce_41

action_26 (21) = happyShift action_29
action_26 (23) = happyShift action_30
action_26 (25) = happyShift action_9
action_26 (27) = happyShift action_31
action_26 (29) = happyShift action_10
action_26 (30) = happyShift action_11
action_26 (35) = happyShift action_32
action_26 (37) = happyShift action_33
action_26 (38) = happyShift action_34
action_26 (39) = happyShift action_35
action_26 (40) = happyShift action_12
action_26 (41) = happyShift action_36
action_26 (45) = happyShift action_13
action_26 (46) = happyShift action_14
action_26 (47) = happyShift action_37
action_26 (48) = happyAccept
action_26 (11) = happyGoto action_5
action_26 (12) = happyGoto action_27
action_26 (15) = happyGoto action_28
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (23) = happyShift action_30
action_27 (25) = happyShift action_9
action_27 (27) = happyShift action_31
action_27 (29) = happyShift action_10
action_27 (30) = happyShift action_11
action_27 (35) = happyShift action_32
action_27 (37) = happyShift action_33
action_27 (38) = happyShift action_34
action_27 (39) = happyShift action_35
action_27 (40) = happyShift action_12
action_27 (41) = happyShift action_36
action_27 (45) = happyShift action_13
action_27 (47) = happyShift action_37
action_27 (11) = happyGoto action_5
action_27 (12) = happyGoto action_27
action_27 (15) = happyGoto action_28
action_27 _ = happyReduce_21

action_28 (32) = happyShift action_87
action_28 _ = happyReduce_27

action_29 (21) = happyShift action_29
action_29 (22) = happyShift action_55
action_29 (23) = happyShift action_30
action_29 (25) = happyShift action_9
action_29 (29) = happyShift action_10
action_29 (30) = happyShift action_11
action_29 (35) = happyShift action_32
action_29 (37) = happyShift action_33
action_29 (38) = happyShift action_34
action_29 (39) = happyShift action_35
action_29 (40) = happyShift action_12
action_29 (41) = happyShift action_86
action_29 (45) = happyShift action_13
action_29 (46) = happyShift action_14
action_29 (47) = happyShift action_37
action_29 (11) = happyGoto action_5
action_29 (12) = happyGoto action_54
action_29 (15) = happyGoto action_85
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (21) = happyShift action_29
action_30 (23) = happyShift action_30
action_30 (25) = happyShift action_9
action_30 (29) = happyShift action_10
action_30 (30) = happyShift action_11
action_30 (35) = happyShift action_32
action_30 (37) = happyShift action_33
action_30 (38) = happyShift action_34
action_30 (39) = happyShift action_35
action_30 (40) = happyShift action_12
action_30 (41) = happyShift action_36
action_30 (45) = happyShift action_13
action_30 (46) = happyShift action_14
action_30 (47) = happyShift action_37
action_30 (8) = happyGoto action_52
action_30 (11) = happyGoto action_5
action_30 (12) = happyGoto action_53
action_30 (13) = happyGoto action_83
action_30 (15) = happyGoto action_84
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (45) = happyShift action_81
action_31 (46) = happyShift action_82
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (46) = happyShift action_80
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_33

action_34 _ = happyReduce_34

action_35 _ = happyReduce_40

action_36 (46) = happyShift action_79
action_36 (14) = happyGoto action_78
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_35

action_38 (36) = happyShift action_24
action_38 (47) = happyShift action_25
action_38 (16) = happyGoto action_77
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (21) = happyShift action_67
action_39 (23) = happyShift action_68
action_39 (35) = happyShift action_32
action_39 (37) = happyShift action_33
action_39 (38) = happyShift action_34
action_39 (39) = happyShift action_35
action_39 (41) = happyShift action_36
action_39 (47) = happyShift action_37
action_39 (15) = happyGoto action_76
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (36) = happyShift action_21
action_40 (46) = happyShift action_22
action_40 (17) = happyGoto action_75
action_40 (18) = happyGoto action_20
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (21) = happyShift action_67
action_41 (23) = happyShift action_68
action_41 (35) = happyShift action_32
action_41 (37) = happyShift action_33
action_41 (38) = happyShift action_34
action_41 (39) = happyShift action_35
action_41 (41) = happyShift action_36
action_41 (47) = happyShift action_37
action_41 (15) = happyGoto action_74
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (27) = happyShift action_73
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (21) = happyShift action_16
action_43 (22) = happyShift action_71
action_43 (27) = happyShift action_45
action_43 (28) = happyShift action_72
action_43 (29) = happyShift action_17
action_43 (46) = happyShift action_18
action_43 (20) = happyGoto action_44
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (27) = happyShift action_45
action_44 (29) = happyShift action_17
action_44 (20) = happyGoto action_44
action_44 _ = happyReduce_56

action_45 (45) = happyShift action_70
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (21) = happyShift action_67
action_46 (23) = happyShift action_68
action_46 (35) = happyShift action_32
action_46 (37) = happyShift action_33
action_46 (38) = happyShift action_34
action_46 (39) = happyShift action_35
action_46 (41) = happyShift action_36
action_46 (46) = happyShift action_69
action_46 (47) = happyShift action_37
action_46 (15) = happyGoto action_66
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (21) = happyShift action_29
action_47 (23) = happyShift action_30
action_47 (25) = happyShift action_9
action_47 (27) = happyShift action_31
action_47 (29) = happyShift action_10
action_47 (30) = happyShift action_11
action_47 (35) = happyShift action_32
action_47 (37) = happyShift action_33
action_47 (38) = happyShift action_34
action_47 (39) = happyShift action_35
action_47 (40) = happyShift action_12
action_47 (41) = happyShift action_36
action_47 (44) = happyShift action_65
action_47 (45) = happyShift action_13
action_47 (46) = happyShift action_14
action_47 (47) = happyShift action_37
action_47 (11) = happyGoto action_5
action_47 (12) = happyGoto action_27
action_47 (15) = happyGoto action_28
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (27) = happyShift action_64
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (31) = happyShift action_63
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (26) = happyShift action_62
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (43) = happyShift action_61
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (24) = happyShift action_60
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (21) = happyShift action_29
action_53 (23) = happyShift action_30
action_53 (25) = happyShift action_9
action_53 (27) = happyShift action_31
action_53 (28) = happyShift action_59
action_53 (29) = happyShift action_10
action_53 (30) = happyShift action_11
action_53 (35) = happyShift action_32
action_53 (37) = happyShift action_33
action_53 (38) = happyShift action_34
action_53 (39) = happyShift action_35
action_53 (40) = happyShift action_12
action_53 (41) = happyShift action_36
action_53 (45) = happyShift action_13
action_53 (46) = happyShift action_14
action_53 (47) = happyShift action_37
action_53 (11) = happyGoto action_5
action_53 (12) = happyGoto action_27
action_53 (15) = happyGoto action_28
action_53 _ = happyReduce_5

action_54 (21) = happyShift action_29
action_54 (22) = happyShift action_58
action_54 (23) = happyShift action_30
action_54 (25) = happyShift action_9
action_54 (27) = happyShift action_31
action_54 (29) = happyShift action_10
action_54 (30) = happyShift action_11
action_54 (35) = happyShift action_32
action_54 (37) = happyShift action_33
action_54 (38) = happyShift action_34
action_54 (39) = happyShift action_35
action_54 (40) = happyShift action_12
action_54 (41) = happyShift action_36
action_54 (45) = happyShift action_13
action_54 (46) = happyShift action_14
action_54 (47) = happyShift action_37
action_54 (11) = happyGoto action_5
action_54 (12) = happyGoto action_27
action_54 (15) = happyGoto action_28
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_12

action_56 (46) = happyShift action_57
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (43) = happyShift action_105
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_13

action_59 (21) = happyShift action_7
action_59 (23) = happyShift action_8
action_59 (25) = happyShift action_9
action_59 (29) = happyShift action_10
action_59 (30) = happyShift action_11
action_59 (40) = happyShift action_12
action_59 (45) = happyShift action_13
action_59 (46) = happyShift action_14
action_59 (8) = happyGoto action_104
action_59 (11) = happyGoto action_5
action_59 (12) = happyGoto action_53
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_19

action_61 (21) = happyShift action_7
action_61 (23) = happyShift action_8
action_61 (25) = happyShift action_9
action_61 (29) = happyShift action_10
action_61 (30) = happyShift action_11
action_61 (40) = happyShift action_12
action_61 (45) = happyShift action_13
action_61 (46) = happyShift action_14
action_61 (11) = happyGoto action_5
action_61 (12) = happyGoto action_103
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_22

action_63 (21) = happyShift action_67
action_63 (23) = happyShift action_68
action_63 (35) = happyShift action_32
action_63 (37) = happyShift action_33
action_63 (38) = happyShift action_34
action_63 (39) = happyShift action_35
action_63 (41) = happyShift action_36
action_63 (47) = happyShift action_37
action_63 (15) = happyGoto action_102
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (21) = happyShift action_7
action_64 (23) = happyShift action_8
action_64 (25) = happyShift action_9
action_64 (29) = happyShift action_10
action_64 (30) = happyShift action_11
action_64 (40) = happyShift action_12
action_64 (45) = happyShift action_13
action_64 (46) = happyShift action_14
action_64 (11) = happyGoto action_5
action_64 (12) = happyGoto action_101
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (46) = happyShift action_100
action_65 (10) = happyGoto action_99
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (32) = happyShift action_87
action_66 _ = happyReduce_14

action_67 (21) = happyShift action_67
action_67 (23) = happyShift action_68
action_67 (35) = happyShift action_32
action_67 (37) = happyShift action_33
action_67 (38) = happyShift action_34
action_67 (39) = happyShift action_35
action_67 (41) = happyShift action_36
action_67 (47) = happyShift action_37
action_67 (15) = happyGoto action_85
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (21) = happyShift action_67
action_68 (23) = happyShift action_68
action_68 (35) = happyShift action_32
action_68 (37) = happyShift action_33
action_68 (38) = happyShift action_34
action_68 (39) = happyShift action_35
action_68 (41) = happyShift action_36
action_68 (47) = happyShift action_37
action_68 (13) = happyGoto action_83
action_68 (15) = happyGoto action_84
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_15

action_70 _ = happyReduce_55

action_71 _ = happyReduce_50

action_72 (21) = happyShift action_16
action_72 (29) = happyShift action_17
action_72 (46) = happyShift action_18
action_72 (19) = happyGoto action_97
action_72 (20) = happyGoto action_98
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (21) = happyShift action_16
action_73 (29) = happyShift action_17
action_73 (46) = happyShift action_18
action_73 (20) = happyGoto action_96
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (32) = happyShift action_87
action_74 _ = happyReduce_51

action_75 _ = happyReduce_45

action_76 (32) = happyShift action_87
action_76 _ = happyReduce_47

action_77 _ = happyReduce_42

action_78 (42) = happyShift action_95
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (31) = happyShift action_94
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (27) = happyShift action_93
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_20

action_82 _ = happyReduce_23

action_83 (24) = happyShift action_92
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (28) = happyShift action_91
action_84 (32) = happyShift action_87
action_84 _ = happyReduce_28

action_85 (22) = happyShift action_90
action_85 (32) = happyShift action_87
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (46) = happyShift action_89
action_86 (14) = happyGoto action_78
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (21) = happyShift action_67
action_87 (23) = happyShift action_68
action_87 (35) = happyShift action_32
action_87 (37) = happyShift action_33
action_87 (38) = happyShift action_34
action_87 (39) = happyShift action_35
action_87 (41) = happyShift action_36
action_87 (47) = happyShift action_37
action_87 (15) = happyGoto action_88
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (32) = happyShift action_87
action_88 _ = happyReduce_36

action_89 (31) = happyShift action_94
action_89 (43) = happyShift action_105
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_32

action_91 (21) = happyShift action_67
action_91 (23) = happyShift action_68
action_91 (35) = happyShift action_32
action_91 (37) = happyShift action_33
action_91 (38) = happyShift action_34
action_91 (39) = happyShift action_35
action_91 (41) = happyShift action_36
action_91 (47) = happyShift action_37
action_91 (13) = happyGoto action_114
action_91 (15) = happyGoto action_84
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_37

action_93 (21) = happyShift action_67
action_93 (23) = happyShift action_68
action_93 (35) = happyShift action_32
action_93 (37) = happyShift action_33
action_93 (38) = happyShift action_34
action_93 (39) = happyShift action_35
action_93 (41) = happyShift action_36
action_93 (47) = happyShift action_37
action_93 (15) = happyGoto action_113
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (21) = happyShift action_67
action_94 (23) = happyShift action_68
action_94 (35) = happyShift action_32
action_94 (37) = happyShift action_33
action_94 (38) = happyShift action_34
action_94 (39) = happyShift action_35
action_94 (41) = happyShift action_36
action_94 (47) = happyShift action_37
action_94 (15) = happyGoto action_112
action_94 _ = happyFail (happyExpListPerState 94)

action_95 _ = happyReduce_38

action_96 (21) = happyShift action_16
action_96 (27) = happyShift action_45
action_96 (29) = happyShift action_17
action_96 (46) = happyShift action_18
action_96 (20) = happyGoto action_44
action_96 _ = happyReduce_53

action_97 (22) = happyShift action_111
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (21) = happyShift action_16
action_98 (27) = happyShift action_45
action_98 (28) = happyShift action_110
action_98 (29) = happyShift action_17
action_98 (46) = happyShift action_18
action_98 (20) = happyGoto action_44
action_98 _ = happyReduce_48

action_99 _ = happyReduce_25

action_100 (33) = happyShift action_109
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (21) = happyShift action_29
action_101 (23) = happyShift action_30
action_101 (25) = happyShift action_9
action_101 (27) = happyShift action_31
action_101 (29) = happyShift action_10
action_101 (30) = happyShift action_11
action_101 (35) = happyShift action_32
action_101 (37) = happyShift action_33
action_101 (38) = happyShift action_34
action_101 (39) = happyShift action_35
action_101 (40) = happyShift action_12
action_101 (41) = happyShift action_36
action_101 (45) = happyShift action_13
action_101 (46) = happyShift action_14
action_101 (47) = happyShift action_37
action_101 (11) = happyGoto action_5
action_101 (12) = happyGoto action_27
action_101 (15) = happyGoto action_28
action_101 _ = happyReduce_26

action_102 (27) = happyShift action_108
action_102 (32) = happyShift action_87
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (21) = happyShift action_29
action_103 (23) = happyShift action_30
action_103 (25) = happyShift action_9
action_103 (27) = happyShift action_31
action_103 (28) = happyShift action_107
action_103 (29) = happyShift action_10
action_103 (30) = happyShift action_11
action_103 (35) = happyShift action_32
action_103 (37) = happyShift action_33
action_103 (38) = happyShift action_34
action_103 (39) = happyShift action_35
action_103 (40) = happyShift action_12
action_103 (41) = happyShift action_36
action_103 (45) = happyShift action_13
action_103 (46) = happyShift action_14
action_103 (47) = happyShift action_37
action_103 (11) = happyGoto action_5
action_103 (12) = happyGoto action_27
action_103 (15) = happyGoto action_28
action_103 _ = happyReduce_7

action_104 _ = happyReduce_6

action_105 (21) = happyShift action_7
action_105 (23) = happyShift action_8
action_105 (25) = happyShift action_9
action_105 (29) = happyShift action_10
action_105 (30) = happyShift action_11
action_105 (40) = happyShift action_12
action_105 (45) = happyShift action_13
action_105 (46) = happyShift action_14
action_105 (11) = happyGoto action_5
action_105 (12) = happyGoto action_106
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (21) = happyShift action_29
action_106 (23) = happyShift action_30
action_106 (25) = happyShift action_9
action_106 (27) = happyShift action_31
action_106 (29) = happyShift action_10
action_106 (30) = happyShift action_11
action_106 (35) = happyShift action_32
action_106 (37) = happyShift action_33
action_106 (38) = happyShift action_34
action_106 (39) = happyShift action_35
action_106 (40) = happyShift action_12
action_106 (41) = happyShift action_36
action_106 (42) = happyShift action_120
action_106 (45) = happyShift action_13
action_106 (46) = happyShift action_14
action_106 (47) = happyShift action_37
action_106 (11) = happyGoto action_5
action_106 (12) = happyGoto action_27
action_106 (15) = happyGoto action_28
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (46) = happyShift action_51
action_107 (9) = happyGoto action_119
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (21) = happyShift action_7
action_108 (23) = happyShift action_8
action_108 (25) = happyShift action_9
action_108 (29) = happyShift action_10
action_108 (30) = happyShift action_11
action_108 (40) = happyShift action_12
action_108 (45) = happyShift action_13
action_108 (46) = happyShift action_14
action_108 (11) = happyGoto action_5
action_108 (12) = happyGoto action_118
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (21) = happyShift action_7
action_109 (23) = happyShift action_8
action_109 (25) = happyShift action_9
action_109 (29) = happyShift action_10
action_109 (30) = happyShift action_11
action_109 (40) = happyShift action_12
action_109 (45) = happyShift action_13
action_109 (46) = happyShift action_14
action_109 (11) = happyGoto action_5
action_109 (12) = happyGoto action_117
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (21) = happyShift action_16
action_110 (29) = happyShift action_17
action_110 (46) = happyShift action_18
action_110 (19) = happyGoto action_116
action_110 (20) = happyGoto action_98
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_54

action_112 (28) = happyShift action_115
action_112 (32) = happyShift action_87
action_112 _ = happyReduce_30

action_113 (32) = happyShift action_87
action_113 _ = happyReduce_39

action_114 _ = happyReduce_29

action_115 (46) = happyShift action_79
action_115 (14) = happyGoto action_123
action_115 _ = happyFail (happyExpListPerState 115)

action_116 _ = happyReduce_49

action_117 (21) = happyShift action_29
action_117 (23) = happyShift action_30
action_117 (25) = happyShift action_9
action_117 (27) = happyShift action_31
action_117 (28) = happyShift action_122
action_117 (29) = happyShift action_10
action_117 (30) = happyShift action_11
action_117 (35) = happyShift action_32
action_117 (37) = happyShift action_33
action_117 (38) = happyShift action_34
action_117 (39) = happyShift action_35
action_117 (40) = happyShift action_12
action_117 (41) = happyShift action_36
action_117 (45) = happyShift action_13
action_117 (46) = happyShift action_14
action_117 (47) = happyShift action_37
action_117 (11) = happyGoto action_5
action_117 (12) = happyGoto action_27
action_117 (15) = happyGoto action_28
action_117 _ = happyReduce_9

action_118 (21) = happyShift action_29
action_118 (23) = happyShift action_30
action_118 (25) = happyShift action_9
action_118 (27) = happyShift action_31
action_118 (29) = happyShift action_10
action_118 (30) = happyShift action_11
action_118 (35) = happyShift action_32
action_118 (37) = happyShift action_33
action_118 (38) = happyShift action_34
action_118 (39) = happyShift action_35
action_118 (40) = happyShift action_12
action_118 (41) = happyShift action_36
action_118 (45) = happyShift action_13
action_118 (46) = happyShift action_14
action_118 (47) = happyShift action_37
action_118 (11) = happyGoto action_5
action_118 (12) = happyGoto action_27
action_118 (15) = happyGoto action_28
action_118 _ = happyReduce_18

action_119 _ = happyReduce_8

action_120 (31) = happyShift action_121
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (21) = happyShift action_67
action_121 (23) = happyShift action_68
action_121 (35) = happyShift action_32
action_121 (37) = happyShift action_33
action_121 (38) = happyShift action_34
action_121 (39) = happyShift action_35
action_121 (41) = happyShift action_36
action_121 (47) = happyShift action_37
action_121 (15) = happyGoto action_125
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (46) = happyShift action_100
action_122 (10) = happyGoto action_124
action_122 _ = happyFail (happyExpListPerState 122)

action_123 _ = happyReduce_31

action_124 _ = happyReduce_10

action_125 (22) = happyShift action_126
action_125 (32) = happyShift action_87
action_125 _ = happyFail (happyExpListPerState 125)

action_126 _ = happyReduce_11

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
		 (Var happy_var_2
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happyReduce 4 15 happyReduction_39
happyReduction_39 ((HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Poly happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_40 = happySpecReduce_1  15 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn15
		 (Unit
	)

happyReduce_41 = happySpecReduce_1  16 happyReduction_41
happyReduction_41 (HappyTerminal (TyID happy_var_1))
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  16 happyReduction_42
happyReduction_42 (HappyAbsSyn16  happy_var_3)
	_
	(HappyTerminal (TyID happy_var_1))
	 =  HappyAbsSyn16
		 (happy_var_1 : happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  16 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn16
		 ([]
	)

happyReduce_44 = happySpecReduce_1  17 happyReduction_44
happyReduction_44 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 ([happy_var_1]
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  17 happyReduction_45
happyReduction_45 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1 : happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  17 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn17
		 ([]
	)

happyReduce_47 = happySpecReduce_3  18 happyReduction_47
happyReduction_47 (HappyAbsSyn15  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn18
		 ((happy_var_1,happy_var_3)
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  19 happyReduction_48
happyReduction_48 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 ([happy_var_1]
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  19 happyReduction_49
happyReduction_49 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1 : happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  20 happyReduction_50
happyReduction_50 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  20 happyReduction_51
happyReduction_51 (HappyAbsSyn15  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn20
		 (C happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  20 happyReduction_52
happyReduction_52 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn20
		 (V happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happyReduce 4 20 happyReduction_53
happyReduction_53 ((HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (L happy_var_2 INT happy_var_4
	) `HappyStk` happyRest

happyReduce_54 = happyReduce 5 20 happyReduction_54
happyReduction_54 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (T (happy_var_2 : happy_var_4)
	) `HappyStk` happyRest

happyReduce_55 = happySpecReduce_3  20 happyReduction_55
happyReduction_55 (HappyTerminal (Num happy_var_3))
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (P happy_var_1 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_2  20 happyReduction_56
happyReduction_56 (HappyAbsSyn20  happy_var_2)
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (A happy_var_1 happy_var_2
	)
happyReduction_56 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 48 48 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	LPar -> cont 21;
	RPar -> cont 22;
	LSBracket -> cont 23;
	RSBracket -> cont 24;
	LBrace -> cont 25;
	RBrace -> cont 26;
	TDot -> cont 27;
	TCom -> cont 28;
	TLam -> cont 29;
	TLLam -> cont 30;
	TCol -> cont 31;
	TArrow -> cont 32;
	TLArrow -> cont 33;
	TPlus -> cont 34;
	TAll -> cont 35;
	Empty -> cont 36;
	TINT -> cont 37;
	TBOOL -> cont 38;
	TUNIT -> cont 39;
	TCase -> cont 40;
	LAngle -> cont 41;
	RAngle -> cont 42;
	TEqual -> cont 43;
	TOf -> cont 44;
	Num happy_dollar_dollar -> cont 45;
	ID happy_dollar_dollar -> cont 46;
	TyID happy_dollar_dollar -> cont 47;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 48 tk tks = happyError' (tks, explist)
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
 happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn20 z -> happyReturn z; _other -> notHappyAtAll })

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
