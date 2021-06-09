{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingVia   #-}

module Aeson where

import           Data.Aeson
import           Deriving.Aeson
import           GHC.Generics   (Generic)

-- https://github.com/haskell/aeson/blob/550b03d62021c93da58d40014280486d1c82726e/Data/Aeson/Types/ToJSON.hs#L1020

-- Aeson uses incoherent instances to implement omitNothingFields

data RecordA a =
  RecordA
    { aField1 :: a
    , aField2 :: a
    , aField3 :: a
    } deriving stock (Eq, Show, Generic)
      deriving (ToJSON) via CustomJSON '[OmitNothingFields] (RecordA a)

testRecordA :: RecordA (Maybe ())
testRecordA = RecordA Nothing Nothing Nothing

data RecordB =
  RecordB
    { bField1 :: Maybe ()
    , bField2 :: Maybe ()
    , bField3 :: Maybe ()
    } deriving stock (Eq, Show, Generic)
      deriving (ToJSON) via CustomJSON '[OmitNothingFields] RecordB

testRecordB :: RecordB
testRecordB = RecordB Nothing Nothing Nothing
