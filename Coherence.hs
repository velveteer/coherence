{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -Wno-missing-methods #-}

module Coherence where

import Data.Coerce

-- https://github.com/haskell/aeson/blob/master/src/Data/Aeson/Types/ToJSON.hs#L1098

newtype Months = Months Integer
  deriving (Eq, Show, Num, Integral, Enum, Ord, Real)

newtype Years = Years Integer
  deriving (Eq, Show, Num, Integral, Enum, Ord, Real)

-- How to get 5 Years + 12 Months to typecheck in ghci?

