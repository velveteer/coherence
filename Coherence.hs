{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -Wno-missing-methods #-}

module Coherence where

newtype Months = Months Integer
  deriving (Eq, Show, Num, Integral, Enum, Ord, Real)

newtype Years = Years Integer
  deriving (Eq, Show, Num, Integral, Enum, Ord, Real)
